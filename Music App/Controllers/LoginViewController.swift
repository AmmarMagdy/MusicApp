//
//  ViewController.swift
//  Music App
//
//  Created by Afnan on 7/12/19.
//  Copyright © 2019 Afnan. All rights reserved.
//

import UIKit
import FontAwesome_swift

class LoginViewController: UIViewController {


    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.font = UIFont.fontAwesome(ofSize: 50, style: .brands)
        label.text = String.fontAwesomeIcon(name: .facebookF)
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapLogin(_ sender: UIButton) {
        let parameters = ["grant_type":"password",
                          "client_id":"4",
                          "client_secret":"LrbVj77cLHzm2IYgWs1pNVv261hjmQIjZyUeybHE",
                          "username": emailTxt.text ?? "",
                          "password": passwordTxt.text ?? "",
                          "scope" : "*"]
        
        HelpingMethods.shared.showActivityIndicator(onView: view)
        NetworkManger.shared.signInUser(onView: view, param: parameters) { [weak self](success, model, error) in
            if success && error == nil {
               
                guard let homeVC = self?.storyboard?.instantiateViewController(withIdentifier:       "HomeNavigationController") else {
                    return
                }
                let appdelegate = UIApplication.shared.delegate as! AppDelegate
                appdelegate.window?.rootViewController = homeVC
                
//                self?.navigationController?.pushViewController(homeVC, animated: true)
            }
        }
    }
    
    
    
}

