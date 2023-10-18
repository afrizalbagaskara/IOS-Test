//
//  DetailTrxTableViewCell.swift
//  portofolio
//
//  Created by Renotech ID on 18/10/23.
//

import UIKit

class DetailTrxTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var nominalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
