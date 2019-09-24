//
//  HelpingMethods.swift
//  My School App_1
//
//  Created by Afnan on 7/12/19.
//

import Foundation
import UIKit

class HelpingMethods {
    
    static let shared = HelpingMethods()
    
    func showActivityIndicator (onView: UIView) {
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.center = onView.center
        activityIndicator.tag = 1234
        activityIndicator.color = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        activityIndicator.startAnimating()
        
        onView.addSubview(activityIndicator)
    }
    
    func hideActivityIndicator (onView:UIView) {
        if let activityIndicator = onView.viewWithTag(1234) as? UIActivityIndicatorView {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
    
}
