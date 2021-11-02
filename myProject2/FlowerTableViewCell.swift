//
//  FlowerTableViewCell.swift
//  myProject2
//
//  Created by Haya on 26/03/1443 AH.
//

import UIKit

class FlowerTableViewCell: UITableViewCell {

    @IBOutlet weak var flowerTitle: UILabel!
    @IBOutlet weak var flowerInfo: UITextView!
    @IBOutlet weak var flowerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
