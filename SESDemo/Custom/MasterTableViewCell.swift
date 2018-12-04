//
//  MasterTableViewCell.swift
//  SESTest08
//
//  Created by Tamas Szuhanszky on 2018. 02. 09..
//  Copyright © 2018. SAP. All rights reserved.
//

// MARK: Custom Documentation
// Class for the Main Screen's cells
// Reference for every label which needs to appear on the main screen
// Being used in the MasterTableViewController's TableViewCell
// Identifier of object: SesHeaderCell

import UIKit

class MasterTableViewCell: UITableViewCell {
    @IBOutlet weak var lbl_shorttext: UILabel!
    @IBOutlet weak var lbl_lwert: UILabel!
    @IBOutlet weak var lbl_netcurr: UILabel!
    @IBOutlet weak var lbl_lbldt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
