//
//  RequestTableViewCell.swift
//  PG&EApp
//
//  Created by Nghia Phan on 5/31/20.
//  Copyright © 2020 Infosys. All rights reserved.
//

import UIKit

class RequestTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var lanIdLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusBar: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
