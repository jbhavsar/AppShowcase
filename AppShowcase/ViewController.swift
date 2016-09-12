//
//  ViewController.swift
//  AppShowcase
//
//  Created by Jay Bhavsar on 2016-08-29.
//  Copyright © 2016 zeroxp. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth

//class ViewController: UIViewController, FBSDKLoginButtonDelegate {
class ViewController: UIViewController {

    
     var loginButton = FBSDKLoginButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Optional: Place the button in the center of your view.
        /*
        self.loginButton.center = self.view.center
        self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        self.loginButton.delegate = self;
        self.view.addSubview(loginButton)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fbBtnPressed(sender: UIButton!) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!) -> Void in
            if facebookError != nil{
                print ("Facebook login failed. Error \(facebookError)")
            }
            else{
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("Successfully logged in with Facebook \(accessToken)")
                let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
                //DataService.ds
                FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
                    print("User Logged Into Firebase App")
                }
            }

        }
    }
    
    /*
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In!")
    }
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("user Did Logout!")
    }
    */
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}

