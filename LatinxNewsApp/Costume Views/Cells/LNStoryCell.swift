//
//  LNStoryCellTableViewCell.swift
//  LatinxNewsApp
//
//  Created by Bryan Gomez on 2/7/22.
//

import UIKit

class LNStoryCell: UITableViewCell {
    
    static let reuseIdentifier = "LNStoryCell"
    
    let titleLabel = LNTitleLabel(textAlignment: .left, fontSize: 16)
    let authorLabel = LNBodyLabel(textAlignment: .left)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
