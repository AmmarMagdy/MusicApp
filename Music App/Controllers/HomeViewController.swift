//
//  HomeViewController.swift
//  Music App
//
//  Created by Afnan on 7/16/19.
//  Copyright © 2019 Afnan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var logoutBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Home"
        logoutBtn.layer.cornerRadius = logoutBtn.frame.height / 2
        logoutBtn.layer.borderWidth = 2
        logoutBtn.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func didTapLogout(_ sender: UIButton) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginNavigationController")
        appDelegate.window?.rootViewController = loginVC
        LocalData.shared.deleteAccessToken()
    }
    
}
