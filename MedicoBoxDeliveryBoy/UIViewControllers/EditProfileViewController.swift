//
//  EditProfileViewController.swift
//  MedicoBoxDeliveryBoy
//
//  Created by NCORD LLP on 09/10/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tblEditProfile: UITableView!
    
    let arrayofText:NSArray = ["First name","Last name","Mobile number", "Email ID","Gender", "Vehicle"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell for tableview
        tblEditProfile.register(UINib(nibName: "AddressTableViewCell", bundle: nil), forCellReuseIdentifier: "AddressTableViewCell")
        tblEditProfile.estimatedRowHeight = 65
        tblEditProfile.separatorStyle = .none
        
        
        //show navigationbar with back button
        self.title = "Edit Profile"
        self.setNavigationBarItemBackButton()
        self.navigationController?.isNavigationBarHidden = false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:- Table View Delegate And DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayofText.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cellObj = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell") as! AddressTableViewCell
        cellObj.textField.text = ""
        cellObj.textField.placeholder = arrayofText[indexPath.row] as? String
        
        cellObj.selectionStyle = .none
        return cellObj
    }
    
    //MARK: - tableview delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 65
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
        @IBAction func btnSaveAction(_ sender: Any) {
            self.navigationController?.popViewController(animated: true)
            
    }
}

