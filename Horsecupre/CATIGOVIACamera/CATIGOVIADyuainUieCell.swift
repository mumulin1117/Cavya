import UIKit

class CATIGOVIADyuainUieCell: UICollectionViewCell {

    let CATIGOVIAlegYield: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.contentMode = .scaleAspectFill
        CATIGOVIAImageView.backgroundColor = UIColor(red: 172/255, green: 247/255, blue: 0, alpha: 1)
        CATIGOVIAImageView.layer.cornerRadius = 23
        CATIGOVIAImageView.layer.masksToBounds = true
        CATIGOVIAImageView.layer.borderColor = UIColor.systemGreen.cgColor
        CATIGOVIAImageView.layer.borderWidth = 2
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
    }()
    
    let CATIGOVIAhalfPass: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.textAlignment = .center
        CATIGOVIALabel.font = .systemFont(ofSize: 14)
        CATIGOVIALabel.textColor = UIColor.white.withAlphaComponent(0.7)
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        CATIGOVIASetupStableElement()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        CATIGOVIASetupStableElement()
    }
    
    private func CATIGOVIASetupStableElement() {
        backgroundColor = .clear
        contentView.addSubview(CATIGOVIAlegYield)
        contentView.addSubview(CATIGOVIAhalfPass)
        
        NSLayoutConstraint.activate([
            CATIGOVIAlegYield.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            CATIGOVIAlegYield.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            CATIGOVIAlegYield.widthAnchor.constraint(equalToConstant: 46),
            CATIGOVIAlegYield.heightAnchor.constraint(equalToConstant: 46),
            
            CATIGOVIAhalfPass.topAnchor.constraint(equalTo: CATIGOVIAlegYield.bottomAnchor, constant: 7),
            CATIGOVIAhalfPass.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            CATIGOVIAhalfPass.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 4),
            CATIGOVIAhalfPass.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -4)
        ])
    }
}
