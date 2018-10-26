//
//  SignInViewController.swift
//  MedicoBox
//
//  Created by SBC on 18/09/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SDWebImage

class SignInViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var btnSignIn: UIButton!
     @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnSignInwithOTP: UIButton!
    @IBOutlet weak var btnSignUpHere: UIButton!
    @IBOutlet var popUpBG: UIImageView!
    @IBOutlet var popUpView: UIView!
    @IBOutlet weak var txtMobileEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        self.navigationController?.isNavigationBarHidden = true;

       
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func btnSignInAction(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.createMenuView()
    }
    
    @IBAction func btnSignInWithOTPAction(_ sender: Any) {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.createMenuView()
        
    }
    @IBAction func btnSignUpHereAction(_ sender: Any) {
        

    
    }
    
    @IBAction func btnForgotPasswordAction(_ sender: Any) {
        

    }
   
}
