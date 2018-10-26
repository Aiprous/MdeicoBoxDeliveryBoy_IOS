//
//  PendingOrdersViewController.swift
//  MedicoBoxDeliveryBoy
//
//  Created by NCORD LLP on 10/10/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit
import Foundation
import MessageUI

class PendingOrdersViewController: UIViewController , UITableViewDelegate, UITableViewDataSource ,MFMailComposeViewControllerDelegate{
    
    @IBOutlet weak var tblOrderItems: UITableView!
    @IBOutlet weak var lblBillingAddressView: UILabel!
    @IBOutlet weak var lblDeliveryAddressView: UILabel!
    @IBOutlet weak var lblPriceOrder: UILabel!
    @IBOutlet weak var lblMrpTotalOrder: UILabel!
    @IBOutlet weak var lblPriceDiscountOrder: UILabel!
    @IBOutlet weak var lblShippingChargesOrder: UILabel!
    @IBOutlet weak var lblAmountPaidOrder: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //show navigationbar with back button
        self.title = "Order Details"
        self.setNavigationBackButtonOnly()
        self.navigationController?.isNavigationBarHidden = false;
        
        lblPriceOrder.text = "\u{20B9}" + " 350.00" + " (2 items)"
        lblMrpTotalOrder.text = "\u{20B9}" + " 350.00"
        lblPriceDiscountOrder.text = "- "  + "\u{20B9}" + " 35.00"
        lblShippingChargesOrder.text =  "0"
        lblAmountPaidOrder.text = "\u{20B9}" + " 350.00"
        lblBillingAddressView.text = "Flat No 104, A Wing \nGreen Olive Apartments,\nHinjawadi \nPune - 411057\nMaharashtra \nIndia"
        
        lblDeliveryAddressView.text = "Flat No 104, A Wing \nGreen Olive Apartments,\nHinjawadi \nPune - 411057\nMaharashtra \nIndia"
        
        self.tblOrderItems.register(UINib(nibName: "OrderItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderItemsTableViewCell")
        tblOrderItems.delegate = self
        tblOrderItems.dataSource = self
        tblOrderItems.estimatedRowHeight = 130
        
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItemBackButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Table View Delegate And DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int{
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cellObj = tableView.dequeueReusableCell(withIdentifier: "OrderItemsTableViewCell") as! OrderItemsTableViewCell
        
        //        cellObj.lblOrderPrice.text = "\u{20B9}" + " 278.00"
        
        if(indexPath.row == 0){
            
            cellObj.lblTitleOrderItems.text = "Horicks Lite Badam Jar 450 gm"
            cellObj.lblSubTitleOrderItems.text = "box of 450 gm Powder"
            cellObj.lblPriceOrderItems.text = "\u{20B9}" + " 200.00"
            //            cellObj.imgOrderItems.image = #imageLiteral(resourceName: "capsules-icon")
            cellObj.lblTrasOrderItems.isHidden = true;
            
            //            cellObj.logoOrderItems.image = #imageLiteral(resourceName: "rx_logo")
            
        }
        else if(indexPath.row == 1){
            
            cellObj.lblTitleOrderItems.text = "Combiflam Lcy Hot Fast Pain Relief Spray"
            cellObj.lblSubTitleOrderItems.text = "bottle of 35 gm Spray"
            cellObj.lblPriceOrderItems.text = "\u{20B9}" + " 92.00"
            //            cellObj.imgOrderItems.image = #imageLiteral(resourceName: "capsules-icon")
            cellObj.lblTrasOrderItems.isHidden = true;
            
            //            cellObj.logoOrderItems.image = #imageLiteral(resourceName: "rx_logo")
            
        }
        else if(indexPath.row == 2){
            
            cellObj.lblTitleOrderItems.text = "Horicks Lite Badam Jar 450 gm"
            cellObj.lblSubTitleOrderItems.text = "box of 450 gm Powder"
            cellObj.lblPriceOrderItems.text = "\u{20B9}" + " 200.00"
            //            cellObj.imgOrderItems.image = #imageLiteral(resourceName: "capsules-icon")
            //            cellObj.logoOrderItems.image = #imageLiteral(resourceName: "rx_logo")
            cellObj.lblTrasOrderItems.isHidden = true;
            
        }
        
        cellObj.selectionStyle = .none
        return cellObj
    }
    
    //MARK: - tableview delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 98
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell:OrderItemsTableViewCell = tableView.cellForRow(at: indexPath) as! OrderItemsTableViewCell
        
        //        let Controller = self.storyboard?.instantiateViewController(withIdentifier: kOrderCancelVC)
        //        self.navigationController?.pushViewController(Controller!, animated: true)
        //
    }
   
    
    @IBAction func btnCallAction(_ sender: Any) {
        
        let phoneNumber = 7584882272;
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
        
    }
    @IBAction func btnEmailAction(_ sender: Any) {

        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.setToRecipients(["support@medicobox.com"])
        composeVC.setSubject("Message Subject")
        composeVC.setMessageBody("Welcome MedicoBox.", isHTML: false)
        
        // Present the view controller modally.
        guard MFMailComposeViewController.canSendMail() else {
            print("Mail services are not available")
            return
        }
//        sendEmail()
        self.present(composeVC, animated: true, completion: nil)
    }
}
