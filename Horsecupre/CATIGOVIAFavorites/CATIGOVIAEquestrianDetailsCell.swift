//
//  CATIGOVIAEquestrianDetailsCell.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class CATIGOVIAEquestrianDetailsCell: UICollectionViewCell {

    let CATIGOVIAcenterLine: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.contentMode = .scaleAspectFill
        CATIGOVIAImageView.backgroundColor = UIColor(red: 190/255, green: 190/255, blue: 190/255, alpha: 1)
        CATIGOVIAImageView.layer.cornerRadius = 20
        CATIGOVIAImageView.layer.masksToBounds = true
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
    }()
    
    let CATIGOVIAhaunchesIn: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.contentMode = .scaleAspectFit
        CATIGOVIAImageView.image = UIImage(named: "CATIGOVIAhaunchesIn")
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
    }()
    
    let CATIGOVIAlongSide: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.textAlignment = .left
        CATIGOVIALabel.numberOfLines = 2
        CATIGOVIALabel.font = .systemFont(ofSize: 15)
        CATIGOVIALabel.textColor = .white
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        CATIGOVIAInitializeArenaLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        CATIGOVIAInitializeArenaLayout()
    }
    
    private func CATIGOVIAInitializeArenaLayout() {
        contentView.addSubview(CATIGOVIAcenterLine)
        contentView.addSubview(CATIGOVIAhaunchesIn)
        contentView.addSubview(CATIGOVIAlongSide)
        
        NSLayoutConstraint.activate([
            CATIGOVIAcenterLine.topAnchor.constraint(equalTo: contentView.topAnchor),
            CATIGOVIAcenterLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            CATIGOVIAcenterLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            CATIGOVIAcenterLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            CATIGOVIAhaunchesIn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            CATIGOVIAhaunchesIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            CATIGOVIAhaunchesIn.widthAnchor.constraint(equalToConstant: 52),
            CATIGOVIAhaunchesIn.heightAnchor.constraint(equalToConstant: 52),
            
            CATIGOVIAlongSide.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            CATIGOVIAlongSide.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -48),
            CATIGOVIAlongSide.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}
