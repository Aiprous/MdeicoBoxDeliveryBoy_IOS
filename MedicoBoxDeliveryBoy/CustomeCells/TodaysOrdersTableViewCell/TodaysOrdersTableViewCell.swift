//
//  TodaysOrdersTableViewCell.swift
//  MedicoBoxDeliveryBoy
//
//  Created by NCORD LLP on 09/10/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit

class TodaysOrdersTableViewCell: UITableViewCell {
    @IBOutlet weak var btnTodaysOrders: UIButton!
    
    @IBOutlet weak var lblTodaysOrdersTitle: UILabel!
    @IBOutlet weak var imgTodaysOrders: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
