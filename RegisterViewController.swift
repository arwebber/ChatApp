//
//  RegisterViewController.swift
//  ChatApp
//
//  Created by Andrew Webber on 10/8/17.
//  Copyright © 2017 Andrew Webber. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

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
        txtName.resignFirstResponder()
    }

    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnRegister: UIButton!

    @IBAction func btnRegister_TouchUpInside(_ sender: Any) {
        
        if let email = txtEmail.text, let password = txtPassword.text{//, let name = txtName.text{
            
            FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
                if(user != nil){
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "welcome")
                    self.present(vc!, animated: true, completion: nil)
                    
                }else{
                    let alertController = UIAlertController(title: "Registration Failed", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                    
                    let okAction = UIAlertAction(title: "Okay" , style: UIAlertActionStyle.default){
                        (result : UIAlertAction) -> Void in
                        print("Okay")
                    }
                    
                    alertController.addAction(okAction)
                    self.present(alertController, animated:true, completion: nil)
                    
                }
                
                
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
