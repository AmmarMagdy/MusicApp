//
//  RegisterViewController.swift
//  Music App
//
//  Created by Afnan on 7/12/19.
//  Copyright © 2019 Afnan. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet var userInfo: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBtnTapped(_ sender: UIBarButtonItem) {
        
        let parm:[String:String] = ["name" : userInfo[0].text!,
                    "email" : userInfo[1].text!,
                    "agency":userInfo[2].text!,
                    "loc":userInfo[3].text!,
                    "regcod":userInfo[4].text!,
                    "password":userInfo[5].text!,
                    "password_confirmation":userInfo[6].text!]
        HelpingMethods.shared.showActivityIndicator(onView: view)
        NetworkManger.shared.registerNewUser(onView: view, param: parm) { [weak self] (success, model, error) in
            if error != nil {
                print(error)
            } else {
                print(model?.id ?? 0)
                self?.navigationController?.popViewController(animated: true)
                
            }
        }
        print("I'm here after calling network reequest")
        
        // do network request
    }
}
