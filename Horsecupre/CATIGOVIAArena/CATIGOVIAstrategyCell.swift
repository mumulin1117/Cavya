import UIKit

class CATIGOVIAstrategyCell: UICollectionViewCell {

    let CATIGOVIAbitSnaffle: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.contentMode = .scaleAspectFill
        CATIGOVIAImageView.backgroundColor = UIColor(red: 172/255, green: 247/255, blue: 0, alpha: 1)
        CATIGOVIAImageView.layer.cornerRadius = 13
        CATIGOVIAImageView.layer.masksToBounds = true
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
    }()
    
    let CATIGOVIACellreinsSplit: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.font = .systemFont(ofSize: 18, weight: .medium)
        CATIGOVIALabel.textColor = .white
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    let CATIGOVIAreinsDouble: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.font = .systemFont(ofSize: 14, weight: .medium)
        CATIGOVIALabel.textColor = UIColor.white.withAlphaComponent(0.7)
        CATIGOVIALabel.numberOfLines = 2
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    let CATIGOVIAtrotIcon: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.contentMode = .scaleAspectFit
        CATIGOVIAImageView.image = UIImage(named: "CATIGOVIAtrot")
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
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
        backgroundColor = .clear
        contentView.addSubview(CATIGOVIAbitSnaffle)
        contentView.addSubview(CATIGOVIACellreinsSplit)
        contentView.addSubview(CATIGOVIAreinsDouble)
        contentView.addSubview(CATIGOVIAtrotIcon)
        
        NSLayoutConstraint.activate([
            CATIGOVIAbitSnaffle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            CATIGOVIAbitSnaffle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            CATIGOVIAbitSnaffle.widthAnchor.constraint(equalToConstant: 125),
            CATIGOVIAbitSnaffle.heightAnchor.constraint(equalToConstant: 123),
            
            CATIGOVIACellreinsSplit.topAnchor.constraint(equalTo: CATIGOVIAbitSnaffle.topAnchor),
            CATIGOVIACellreinsSplit.leadingAnchor.constraint(equalTo: CATIGOVIAbitSnaffle.trailingAnchor, constant: 8),
            CATIGOVIACellreinsSplit.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            CATIGOVIAreinsDouble.topAnchor.constraint(equalTo: CATIGOVIACellreinsSplit.bottomAnchor, constant: 7),
            CATIGOVIAreinsDouble.leadingAnchor.constraint(equalTo: CATIGOVIACellreinsSplit.leadingAnchor),
            CATIGOVIAreinsDouble.trailingAnchor.constraint(equalTo: CATIGOVIACellreinsSplit.trailingAnchor),
            
            CATIGOVIAtrotIcon.bottomAnchor.constraint(equalTo: CATIGOVIAbitSnaffle.bottomAnchor),
            CATIGOVIAtrotIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            CATIGOVIAtrotIcon.widthAnchor.constraint(equalToConstant: 94),
            CATIGOVIAtrotIcon.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
}
