//
//  strategyCell.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class strategyCell: UICollectionViewCell {

    @IBOutlet weak var bitSnaffle: UIImageView!
    
    @IBOutlet weak var reinsSplit: UILabel!
    
    @IBOutlet weak var reinsDouble: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bitSnaffle.layer.cornerRadius = 13
        
        bitSnaffle.layer.masksToBounds = true
    }

}
