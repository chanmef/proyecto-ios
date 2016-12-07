//
//  LoginViewController.swift
//  Primerapp
//
//  Created by AdminUTM on 07/12/16.
//  Copyright © 2016 AdminUTM. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController,FBSDKLoginButtonDelegate {

    @IBOutlet weak var btnLogin: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnLogin.readPermissions = ["email", "public_profile", "user_friends"]
        btnLogin.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!){
    
        if result.isCancelled{
            print("Canceló el flujo")
        }else{
            print("Token: \(result.token.tokenString)")
            performSegue(withIdentifier: "LoginSegue", sender: self)
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!){
        
    }

}
