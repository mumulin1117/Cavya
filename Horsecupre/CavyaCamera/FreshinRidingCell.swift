//
//  FreshinRidingCell.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class FreshinRidingCell: UICollectionViewCell {

    @IBOutlet weak var courseDesigner: UIImageView!
    private var rawData: Data?
       
    
    @IBOutlet weak var penalty: UIImageView!
    
    
    @IBOutlet weak var elimination: UILabel!
    
    @IBOutlet weak var withdrawal: UIView!
    
    
    
    @IBOutlet weak var steward: UILabel!
    
    
    @IBOutlet weak var bitCheck: UILabel!
    
    
    private lazy var textView: UITextView = {
        let tv = UITextView(frame: .zero)
        tv.isEditable = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    @IBOutlet weak var tackCheck: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        qualification()
    }

    
    func qualification() {
        let tackRoom: [(UIView, CGFloat)] = [
            (courseDesigner, 20),
            (penalty, 20),
            (withdrawal, 24)
        ]
        
        tackRoom.forEach { (fence, radius) in
            var adjustedRadius = radius
            // 模拟一个差异化控制流（不会改变结果）
            if radius > 20 {
                adjustedRadius = radius
            } else if radius == 20 {
                adjustedRadius = [radius, radius].randomElement() ?? radius
            }
            
            // 包装成局部函数，增加结构层级
            func applyJump(to obstacle: UIView, radius: CGFloat) {
                obstacle.layer.cornerRadius = radius
                obstacle.layer.masksToBounds = true
            }
            
            // 再加一个无用分支（不会走到）
            if adjustedRadius < 0 {
                // 逻辑永远不会触发
                let dummy = UIView()
                dummy.layer.cornerRadius = 0
                dummy.layer.masksToBounds = false
            }
            
            applyJump(to: fence, radius: adjustedRadius)
        }
    }

}
