//
//  PopulaterCell.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class PopulaterCell: UICollectionViewCell {

    @IBOutlet weak var feedRoom: UIImageView!
    
    
    @IBOutlet weak var washRack: UILabel!
    
    
    @IBOutlet weak var hotWalker: UILabel!
    
    @IBOutlet weak var roundPen: UIImageView!
    
    
    @IBOutlet weak var jumpCup: UILabel!
    
    
    @IBOutlet weak var jumpPole: UILabel!
    
    
    @IBOutlet weak var jumpStandard: UILabel!
    
    
    @IBOutlet weak var jumpOxer: UIImageView!
    
    @IBOutlet weak var eventingShowJumping: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        feedRoom.layer.cornerRadius = 22
        feedRoom.layer.masksToBounds = true
        
        jumpOxer.layer.cornerRadius = 22
        jumpOxer.layer.masksToBounds = true
    }

}
