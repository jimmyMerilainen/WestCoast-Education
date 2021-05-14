//
//  FavoriteListViewController.swift
//  Labb2
//
//  Created by Jimmy Meriläinen on 2021-03-07.
//

import UIKit
import CoreData

class FavoriteListViewController: UITableViewController {
    
    var favoriteCourseArray: [CourseModel] = [CourseModel]()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)!.persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //viewDidAppear(true)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        
        navigationItem.backButtonTitle = ""
        
        setUp()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.refreshControl?.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        
    }
    @objc func refresh(sender:AnyObject)
    {
        setUp()
        reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    
    func reloadData() {
        tableView.reloadData()
        
    }
    @objc func editTapped() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        
        if tableView.isEditing {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editTapped))
        }else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTapped))
        }
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        UISwipeActionsConfiguration(actions: [deleteValuationAction(forRowAt: indexPath)])
    }
    func deleteValuationAction(forRowAt indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Radera") {
            (contextualAction, swipeButton, completionHandler: (Bool) -> Void) in
            
            let favoriteCourseDb = try? self.context.fetch(FavoriteCourse.fetchRequest()) as? [FavoriteCourse]
            self.context.delete(favoriteCourseDb![indexPath.row])
            do {
                try self.context.save()
            }catch {
                print("Inte bra alls!!!!!!!!")
            }
            self.favoriteCourseArray.remove(at: indexPath.row)
            self.reloadData()
        }
        return action
    }
    func setUp() {
        favoriteCourseArray.removeAll()
        if let favoriteCourseDb = try? context.fetch(FavoriteCourse.fetchRequest()) as? [FavoriteCourse] {
            for course in favoriteCourseDb {
                let c = CourseModel(courseName: course.courseName ?? "",
                                    courseInfo: course.courseInfo ?? "",
                                    status: StatusEnum(rawValue: course.status ?? "")!,
                                    addedToFav: course.addedToFav,
                                    interested: course.interested)
                favoriteCourseArray.append(c)
                reloadData()
            }
            
        }
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favoriteCourseArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = favoriteCourseArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteItem", for: indexPath)
        
        var status: String = ""
        
        switch favoriteCourseArray[indexPath.row].status {
        case .null:
            status = ""
        case .Completed:
            status = "Avslutad"
        case .Buy:
            status = "Påbörjad"
        default:
            status = ""
            
        }

        // Configure the cell...
        cell.textLabel?.text = "\(course.courseName)"
        cell.detailTextLabel?.text = "\(status)"

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favCourse = favoriteCourseArray[indexPath.row]
        let courseTuple = (indexPath.row, favCourse)
        
        
        performSegue(withIdentifier: "detailSegue2", sender: courseTuple)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue2" {
            guard let vc = segue.destination as? DetailViewController else {return}
            guard let course = sender as? (Int, CourseModel) else {return}
            
            vc.course = course.1
            vc.courseIndex = course.0
            vc.deligate2 = self
            
        }
        
    }

}
extension FavoriteListViewController: AddFavoriteDeligate {
    func updateFavorite(task: CourseModel, index: Int) {
        favoriteCourseArray[index] = task
    
        let favoriteCourseDb = try? self.context.fetch(FavoriteCourse.fetchRequest()) as? [FavoriteCourse]
        let test = favoriteCourseDb![index]
        test.status = task.status.rawValue
        test.interested = task.interested
    
        try? context.save()
        
        reloadData()
    }
}
