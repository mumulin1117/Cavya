//
//  DyuainUieCell.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class DyuainUieCell: UICollectionViewCell {

    @IBOutlet weak var legYield: UIImageView!
    
    
    @IBOutlet weak var halfPass: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        legYield.layer.cornerRadius = 23
        legYield.layer.masksToBounds = true
        
        legYield.layer.borderColor = UIColor.systemGreen.cgColor
        legYield.layer.borderWidth = 2
    }

}
