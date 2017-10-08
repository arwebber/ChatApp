//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Andrew Webber on 10/8/17.
//  Copyright © 2017 Andrew Webber. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBAction func btnLogin_TouchUpInside(_ sender: Any) {
        if let email = txtEmail.text, let password = txtPassword.text{
            FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
                if(user != nil){
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "welcome")
                    self.present(vc!, animated: true, completion: nil)
                }else{
                    let alertController = UIAlertController(title: "Login Failed", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                    
                    let okAction = UIAlertAction(title: "OKAY" , style: UIAlertActionStyle.default){
                        (result : UIAlertAction) -> Void in
                        print("Okay")
                    }
                    alertController.addAction(okAction)
                    self.present(alertController, animated:true, completion: nil)
                }
            }
        }
        
    }
    
    
    
    
    
    

}
