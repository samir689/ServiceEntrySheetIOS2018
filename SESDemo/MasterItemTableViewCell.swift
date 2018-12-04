//
//  MasterItemTableViewCell.swift
//  SESTest08
//
//  Created by Tamas Szuhanszky on 2018. 02. 15..
//  Copyright © 2018. SAP. All rights reserved.
//

// MARK: Custom Documentation
// Class for the Item Screen's cells
// Reference for every label which needs to appear on the main screen
// Being used in the MasterItemsTableViewController's TableViewCell
// Identifier of object: SESItemCell

import UIKit

class MasterItemTableViewCell: UITableViewCell {
    @IBOutlet weak var lbl_extrow: UILabel!
    @IBOutlet weak var lbl_menge: UILabel!
    @IBOutlet weak var lbl_ktext1: UILabel!
    @IBOutlet weak var lbl_tbtwr: UILabel!
    @IBOutlet weak var lbl_netwr: UILabel!
    @IBOutlet weak var lbl_waers: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
