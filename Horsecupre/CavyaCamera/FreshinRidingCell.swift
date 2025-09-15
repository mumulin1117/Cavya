//
//  FreshinRidingCell.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class FreshinRidingCell: UICollectionViewCell {

    @IBOutlet weak var courseDesigner: UIImageView!
    
    
    @IBOutlet weak var penalty: UIImageView!
    
    
    @IBOutlet weak var elimination: UILabel!
    
    @IBOutlet weak var withdrawal: UIView!
    
    
    
    @IBOutlet weak var steward: UILabel!
    
    
    @IBOutlet weak var bitCheck: UILabel!
    
    
    
    
    @IBOutlet weak var tackCheck: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        qualification()
    }

    
    func qualification()  {
        courseDesigner.layer.cornerRadius = 20
        courseDesigner.layer.masksToBounds = true
        
        penalty.layer.cornerRadius = 20
        penalty.layer.masksToBounds = true
        
        withdrawal.layer.cornerRadius = 24
        withdrawal.layer.masksToBounds = true
    }
}
