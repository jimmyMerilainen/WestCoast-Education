//
//  AccountViewController.swift
//  Labb2
//
//  Created by Jimmy Meriläinen on 2021-03-05.
//

import UIKit

class AccountViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func LoginButton(_ sender: UIButton) {
        
    }
    
    @IBAction func CreateAccountButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "CreateAccountSegue", sender: self)
    }

}
