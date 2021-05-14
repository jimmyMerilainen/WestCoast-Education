//
//  CategoryListViewController.swift
//  Labb2
//
//  Created by Jimmy Meriläinen on 2021-02-25.
//

import UIKit
import CoreData

class CategoryListViewController: UITableViewController {
    
    let start = StartModel()
    
    weak var deligate: AddFavoriteDeligate?

    let vc = FavoriteListViewController()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext
    
    var categoryArray = ["Webbutveckling", "Programmering för mobila enheter", "Backend programmering", "Databaser"]
    
    var twoDimArray = StartModel().AllCoursesArray

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.backButtonTitle = ""
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return twoDimArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return twoDimArray[section].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryItem", for: indexPath)

        cell.textLabel?.text = "\(twoDimArray[indexPath.section][indexPath.row].courseName)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categoryArray[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let course = twoDimArray[indexPath.section][indexPath.row]
        let courseTuple = (indexPath.section, indexPath.row, course)
                
        performSegue(withIdentifier: "detailSegue", sender: courseTuple)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            guard let vc = segue.destination as? DetailViewController else {return}
            guard let course = sender as? (Int,Int, CourseModel) else {return}
            
            vc.course = course.2
            vc.courseIndex1 = course.1
            vc.courseIndex = course.0
            vc.deligate = self
            
        }
        
    }

    func showResult() {
        
        let alert = UIAlertController(title: "Min lista", message: "Denna kurs ligger redan i min lista", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
       
    }

}
extension CategoryListViewController: FavoriteCourseDeligate {
    func save(course: CourseModel) {
        let adding = course
        
        if let  favoriteCourseDB = try? context.fetch(FavoriteCourse.fetchRequest()) as? [FavoriteCourse] {
            for course in favoriteCourseDB {
                let i = CourseModel(courseName: course.courseName ?? "",
                                    courseInfo: course.courseInfo ?? "",
                                    status: StatusEnum(rawValue: course.status ?? "")!,
                                    addedToFav: course.addedToFav,
                                    interested: course.interested)
                if adding.courseName == i.courseName {
                    showResult()
                    return
                }
                
            }
        }
        let c = FavoriteCourse(context: context)
        c.courseName = course.courseName
        c.courseInfo = course.courseInfo
        c.status = course.status.rawValue
        c.addedToFav = course.addedToFav
        c.interested = course.interested

        if self.context.hasChanges {
            try? context.save()
        }
       
    }
    func update(task: CourseModel, index: Int, index1: Int) {
        twoDimArray[index][index1] = task
        tableView.reloadData()
        
    }
    
}
