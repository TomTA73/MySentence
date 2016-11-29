//
//  sentenceTableViewCell.swift
//  MySentence
//
//  Created by Tom geri on 22/11/2016.
//  Copyright © 2016 Tom geri. All rights reserved.
//

import UIKit

class sentenceTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var sentenceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
