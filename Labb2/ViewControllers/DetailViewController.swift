//
//  DetailViewController.swift
//  Labb2
//
//  Created by Jimmy Meriläinen on 2021-02-25.
//

import UIKit

class DetailViewController: UIViewController {
    
    weak var deligate: FavoriteCourseDeligate?
    weak var deligate2: AddFavoriteDeligate?
    
    @IBOutlet weak var InterestedButtonTitle: UIButton!
    
    @IBOutlet weak var BuyButtonTitle: UIButton!
    @IBOutlet weak var AddToFavoriteTitle: UIButton!
    
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var courseInfoTextField: UITextView!
    @IBOutlet weak var tipsLabel: UILabel!
    
    var course: CourseModel!
    var courseIndex: Int!
    var courseIndex1: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startView()

    }
    func startView() {
        if course.status == .null {
            BuyButtonTitle.setTitle("Köp on-demand kurs", for: .normal)
        }
        else if course.status == .Buy {
            BuyButtonTitle.setTitle("Klicka för att avsluta kurs", for: .normal)
            BuyButtonTitle.backgroundColor = UIColor.systemRed
        }
        else if course.status == .Completed {
            BuyButtonTitle.setTitle("Avslutad", for: .normal)
            BuyButtonTitle.isEnabled = false
            BuyButtonTitle.backgroundColor = UIColor.gray
        }
        
        if course.addedToFav == false {
            BuyButtonTitle.isEnabled = false
            BuyButtonTitle.setTitle("", for: .normal)
            InterestedButtonTitle.isEnabled = false
            InterestedButtonTitle.setTitle("", for: .normal)
        }
        
        else if course.addedToFav == true {
            AddToFavoriteTitle.isEnabled = false
            AddToFavoriteTitle.backgroundColor = UIColor.gray
            tipsLabel.text = ""
            
        }
        if course.interested == true {
            InterestedButtonTitle.setTitle("Intresseanmälan skickad", for: .normal)
            InterestedButtonTitle.backgroundColor = UIColor.systemGreen
            InterestedButtonTitle.isEnabled = false
        }
        
        self.courseLabel.text = course.courseName
        self.courseInfoTextField.text = course.courseInfo
    }
    func delegateMetod() {
        deligate?.update(task: course, index: courseIndex, index1: courseIndex1)
        deligate2?.updateFavorite(task: course, index: courseIndex)
    }
    
    @IBAction func InterestedButton(_ sender: UIButton) {
        if course.interested == false {
            course.interested = true
            delegateMetod()
            sender.setTitle("Intresseanmälan skickad", for: .normal)
            sender.backgroundColor = UIColor.systemGreen
            sender.isEnabled = false
        }
        
    }
    
    @IBAction func BuyButton(_ sender: UIButton) {
        if course.status == .null {
            course.status = .Buy
            delegateMetod()
            sender.setTitle("Klicka för att avsluta kurs", for: .normal)
            sender.backgroundColor = UIColor.systemRed
        }
        else if course.status == .Buy {
            course.status = .Completed
            delegateMetod()
            sender.isEnabled = false
            sender.backgroundColor = UIColor.gray
            sender.setTitle("Avslutad", for: .normal)
        }
        
    }
    
    @IBAction func AddToFavorite(_ sender: UIButton) {
        if course.addedToFav == false {
            course.addedToFav = true
            deligate?.save(course: course)
            sender.isEnabled = false
            sender.backgroundColor = UIColor.gray
        }
        
    }

}
