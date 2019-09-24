//
//  NetworkManger.swift
//  Music App
//
//  Created by Afnan on 7/12/19.
//  Copyright © 2019 Afnan. All rights reserved.
//

import Foundation
import Alamofire
import FirebaseAuth
import Firebase

class NetworkManger {
    
    let jsonDecoder = JSONDecoder()
    static let shared = NetworkManger()
    
    func registerNewUser (onView:UIView,param:Parameters, completion:@escaping(_ success:Bool,_ registerModel:RegisterModel?, _ error:Error?) -> Void ) {
        
        let headers:HTTPHeaders = ["Accept" : "application/json"]
        Alamofire.request(registerURL, method: .post, parameters: param, encoding: URLEncoding.default, headers: headers).responseJSON { [weak self](response) in
            debugPrint(response)
            HelpingMethods.shared.hideActivityIndicator(onView: onView)
            switch response.result {
            case .success :
                do {
                    if let responseModel = try self?.jsonDecoder.decode(RegisterModel.self, from: response.data!) {
                        print(responseModel.id ?? 0)
                        completion(true,responseModel,nil)
                    }
                } catch (let error) {
                    print(error.localizedDescription)
                    completion(false,nil,error)

                }
                
            case .failure(let error):
                print(error.localizedDescription)
                completion(false,nil,error)
            }
            
            
        }
        
        print("Here i'm after the request")
    }
    
    //MARK: - sign in method
    func signInUser (onView:UIView,param:Parameters, completion:@escaping(_ success:Bool,_ registerModel:SignInModel?, _ error:Error?) -> Void ) {
        
        let headers:HTTPHeaders = ["Accept" : "application/json",
                                   "content-type": "application/json"]
        Alamofire.request(loginURL, method: .post, parameters: param, encoding: JSONEncoding.default, headers: headers).responseJSON { [weak self](response) in
            debugPrint(response)
            HelpingMethods.shared.hideActivityIndicator(onView: onView)
            switch response.result {
            case .success :
                do {
                    if let responseModel = try self?.jsonDecoder.decode(SignInModel.self, from: response.data!) {
                        print(responseModel.access_token ?? "")
                        LocalData.shared.saveAccessToken(accessToken: responseModel.access_token ?? "")
                        completion(true,responseModel,nil)
                    }
                } catch (let error) {
                    print(error.localizedDescription)
                    completion(false,nil,error)
                    
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                completion(false,nil,error)
            }
            
            
        }
        
        print("Here i'm after the request")
    }
    
    
    func signInWithFirebase (email:String, password:String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            // ...
        }

    }
}
