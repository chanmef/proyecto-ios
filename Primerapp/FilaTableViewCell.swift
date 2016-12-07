//
//  FilaTableViewCell.swift
//  Primerapp
//
//  Created by AdminUTM on 05/12/16.
//  Copyright © 2016 AdminUTM. All rights reserved.
//

import UIKit

class FilaTableViewCell: UITableViewCell {

    @IBOutlet weak var lblIzq: UILabel!
    @IBOutlet weak var lblDer: UILabel!
    @IBOutlet weak var imgFotoFila: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
