//
//  OrdersViewController.swift
//  MedicoBoxDeliveryBoy
//
//  Created by NCORD LLP on 09/10/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController  , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblOrders: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tblOrders.register(UINib(nibName: "OrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "OrdersTableViewCell")
        tblOrders.delegate = self
        tblOrders.dataSource = self
        tblOrders.estimatedRowHeight = 130
        tblOrders.separatorStyle = .none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.setNavigationBarItem()
        self.setNavigationBackButtonOnly()
        self.title = "Orders"
    }
    
    //MARK:- Table View Delegate And DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int{
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 9;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cellObj = tableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell") as! OrdersTableViewCell
        
        if(indexPath.row == 0){
            
            cellObj.imgOrders.image = #imageLiteral(resourceName: "check-1")
            cellObj.lblOrderStatus.text = "Completed"
            cellObj.lblOrderStatus.textColor = #colorLiteral(red: 0, green: 0.7450980392, blue: 0.2392156863, alpha: 1)
            
        }else if(indexPath.row == 1){
            
            cellObj.imgOrders.image = #imageLiteral(resourceName: "pending")
            cellObj.lblOrderStatus.text = "Pending"
            cellObj.lblOrderStatus.textColor = #colorLiteral(red: 0.8666666667, green: 0.2901960784, blue: 0, alpha: 1)
            
        }else  if(indexPath.row == 2){
            
            cellObj.imgOrders.image = #imageLiteral(resourceName: "processing")
            cellObj.lblOrderStatus.text = "Processing"
            cellObj.lblOrderStatus.textColor = #colorLiteral(red: 0, green: 0.7529411765, blue: 0.9803921569, alpha: 1)

        }else  if(indexPath.row == 3){
            
            cellObj.imgOrders.image = #imageLiteral(resourceName: "check-1")
            cellObj.lblOrderStatus.text = "Completed"
            cellObj.lblOrderStatus.textColor = #colorLiteral(red: 0, green: 0.7450980392, blue: 0.2392156863, alpha: 1)
            
        }else if(indexPath.row == 4){
            
            cellObj.imgOrders.image = #imageLiteral(resourceName: "pending")
            cellObj.lblOrderStatus.text = "Pending"
            cellObj.lblOrderStatus.textColor = #colorLiteral(red: 0.8666666667, green: 0.2901960784, blue: 0, alpha: 1)
            
        }else if(indexPath.row == 5){
            
            cellObj.imgOrders.image = #imageLiteral(resourceName: "processing")
            cellObj.lblOrderStatus.text = "Processing"
            cellObj.lblOrderStatus.textColor = #colorLiteral(red: 0, green: 0.7529411765, blue: 0.9803921569, alpha: 1)
            
        }else  if(indexPath.row == 6){
            
            cellObj.imgOrders.image = #imageLiteral(resourceName: "check-1")
            cellObj.lblOrderStatus.text = "Completed"
            cellObj.lblOrderStatus.textColor = #colorLiteral(red: 0, green: 0.7450980392, blue: 0.2392156863, alpha: 1)
            
        }else if(indexPath.row == 7){
            
            cellObj.imgOrders.image = #imageLiteral(resourceName: "pending")
            cellObj.lblOrderStatus.text = "Pending"
            cellObj.lblOrderStatus.textColor = #colorLiteral(red: 0.8666666667, green: 0.2901960784, blue: 0, alpha: 1)
            
        }else if(indexPath.row == 8){
            
            cellObj.imgOrders.image = #imageLiteral(resourceName: "processing")
            cellObj.lblOrderStatus.text = "Processing"
            cellObj.lblOrderStatus.textColor = #colorLiteral(red: 0, green: 0.7529411765, blue: 0.9803921569, alpha: 1)
            
        }
        
        cellObj.selectionStyle = .none
        return cellObj
    }
    
    //MARK: - tableview delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 97
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell:OrdersTableViewCell = tableView.cellForRow(at: indexPath) as! OrdersTableViewCell
        
        if indexPath.row % 2 == 0 {
             let Controller = kMainStoryboard.instantiateViewController(withIdentifier: kCompletedOrdersVC)
            self.navigationController?.pushViewController(Controller, animated: true)
        }else{
            let Controller = kMainStoryboard.instantiateViewController(withIdentifier: kPendingOrdersVC)
            self.navigationController?.pushViewController(Controller, animated: true)
        }
       
        
    }
    
    @IBAction func btnSortByAction(_ sender: Any) {
        
        
    }
    
    @IBAction func btnFilterAction(_ sender: Any) {
        
        
    }
}
