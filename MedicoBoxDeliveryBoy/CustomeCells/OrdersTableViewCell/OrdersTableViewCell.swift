//
//  OrdersTableViewCell.swift
//  MedicoBoxDeliveryBoy
//
//  Created by NCORD LLP on 09/10/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {

    @IBOutlet weak var lblOrderStatus: UILabel!
    @IBOutlet weak var lblOrderDate: UILabel!
    @IBOutlet weak var lblOrderAmount: UILabel!
    @IBOutlet weak var lblOrderAddress: UILabel!
    @IBOutlet weak var imgOrders: UIImageView!
    @IBOutlet weak var lblOrderID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
