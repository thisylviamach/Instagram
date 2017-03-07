//
//  LoginViewController.swift
//  Instagram
//
//  Created by Sylvia Mach on 3/7/17.
//  Copyright © 2017 Sylvia Mach. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var pwdField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: userNameField.text!, password: pwdField.text!) { (user: PFUser?, error: Error?) in
            if user != nil{
                print ("You've logged in")
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }
        }
    }
    
    @IBAction func onSIgnUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = userNameField.text
        newUser.password = pwdField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success{
                print ("Yay, you create a new account")
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }
            else{
                print ("error:\(error?.localizedDescription)")
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
