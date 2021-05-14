//
//  CreateAccountViewController.swift
//  Labb2
//
//  Created by Jimmy Meriläinen on 2021-03-05.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var NavigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
        let item = UINavigationItem()
        item.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backTapped))
        NavigationBar.items = [item]
        
    }
    @objc func backTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SaveAccountButton(_ sender: UIButton) {
        backTapped()
    }

}
