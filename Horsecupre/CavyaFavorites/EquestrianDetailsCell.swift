//
//  EquestrianDetailsCell.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class EquestrianDetailsCell: UICollectionViewCell {

    @IBOutlet weak var centerLine: UIImageView!
    
    @IBOutlet weak var longSide: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        centerLine.layer.cornerRadius = 20
        centerLine.layer.masksToBounds = true
    }

}
