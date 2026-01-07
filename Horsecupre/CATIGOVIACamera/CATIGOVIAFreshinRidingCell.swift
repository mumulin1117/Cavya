import UIKit

class CATIGOVIAFreshinRidingCell: UICollectionViewCell {

    let CATIGOVIAcourseDesigner: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.contentMode = .scaleAspectFill
        CATIGOVIAImageView.backgroundColor = UIColor(red: 190/255, green: 190/255, blue: 190/255, alpha: 1)
        CATIGOVIAImageView.layer.cornerRadius = 20
        CATIGOVIAImageView.layer.masksToBounds = true
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
    }()
    
    let CATIGOVIAsteward: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.textAlignment = .center
        CATIGOVIALabel.numberOfLines = 2
        CATIGOVIALabel.font = .systemFont(ofSize: 10)
        CATIGOVIALabel.textColor = UIColor.white.withAlphaComponent(0.8)
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    let CATIGOVIAbitCheck: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.textAlignment = .center
        CATIGOVIALabel.numberOfLines = 2
        CATIGOVIALabel.font = .systemFont(ofSize: 10)
        CATIGOVIALabel.textColor = UIColor.white.withAlphaComponent(0.8)
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    let CATIGOVIAridingIcon: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.contentMode = .scaleAspectFit
        CATIGOVIAImageView.image = UIImage(named: "CATIGOVIAriding")
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
    }()
    
    let CATIGOVIAhorsebackIcon: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.contentMode = .scaleAspectFit
        CATIGOVIAImageView.image = UIImage(named: "CATIGOVIAhorseback")
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
    }()
    
    let CATIGOVIAtackCheck: UIButton = {
        let CATIGOVIAButton = UIButton(type: .custom)
        CATIGOVIAButton.setImage(UIImage(named: "CATIGOVIAequestrian"), for: .normal)
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAButton
    }()
    
    let CATIGOVIAwithdrawal: UIView = {
        let CATIGOVIAView = UIView()
        CATIGOVIAView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        CATIGOVIAView.layer.cornerRadius = 24
        CATIGOVIAView.layer.masksToBounds = true
        CATIGOVIAView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAView
    }()
    
    let CATIGOVIApenalty: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.contentMode = .scaleAspectFill
        CATIGOVIAImageView.layer.cornerRadius = 20
        CATIGOVIAImageView.layer.masksToBounds = true
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
    }()
    
    let CATIGOVIAelimination: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.textAlignment = .center
        CATIGOVIALabel.numberOfLines = 2
        CATIGOVIALabel.font = .systemFont(ofSize: 10)
        CATIGOVIALabel.textColor = UIColor.white.withAlphaComponent(0.8)
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        CATIGOVIAInitializeStableUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        CATIGOVIAInitializeStableUI()
    }
    
    private func CATIGOVIAInitializeStableUI() {
        backgroundColor = .clear
        
        contentView.addSubview(CATIGOVIAcourseDesigner)
        contentView.addSubview(CATIGOVIAridingIcon)
        contentView.addSubview(CATIGOVIAsteward)
        contentView.addSubview(CATIGOVIAhorsebackIcon)
        contentView.addSubview(CATIGOVIAbitCheck)
        contentView.addSubview(CATIGOVIAtackCheck)
        contentView.addSubview(CATIGOVIAwithdrawal)
        
        CATIGOVIAwithdrawal.addSubview(CATIGOVIApenalty)
        CATIGOVIAwithdrawal.addSubview(CATIGOVIAelimination)
        
        NSLayoutConstraint.activate([
            CATIGOVIAcourseDesigner.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            CATIGOVIAcourseDesigner.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            CATIGOVIAcourseDesigner.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 55),
            CATIGOVIAcourseDesigner.heightAnchor.constraint(equalToConstant: 387),
            
            CATIGOVIAhorsebackIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            CATIGOVIAhorsebackIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            CATIGOVIAhorsebackIcon.widthAnchor.constraint(equalToConstant: 28),
            CATIGOVIAhorsebackIcon.heightAnchor.constraint(equalToConstant: 28),
            
            CATIGOVIAridingIcon.centerXAnchor.constraint(equalTo: CATIGOVIAhorsebackIcon.centerXAnchor),
            CATIGOVIAridingIcon.bottomAnchor.constraint(equalTo: CATIGOVIAsteward.topAnchor, constant: -4),
            CATIGOVIAridingIcon.widthAnchor.constraint(equalToConstant: 28),
            CATIGOVIAridingIcon.heightAnchor.constraint(equalToConstant: 28),
            
            CATIGOVIAsteward.centerXAnchor.constraint(equalTo: CATIGOVIAhorsebackIcon.centerXAnchor),
            CATIGOVIAsteward.bottomAnchor.constraint(equalTo: CATIGOVIAhorsebackIcon.topAnchor, constant: -28),
            
            CATIGOVIAbitCheck.topAnchor.constraint(equalTo: CATIGOVIAhorsebackIcon.bottomAnchor, constant: 4),
            CATIGOVIAbitCheck.centerXAnchor.constraint(equalTo: CATIGOVIAhorsebackIcon.centerXAnchor),
            
            CATIGOVIAtackCheck.topAnchor.constraint(equalTo: CATIGOVIAbitCheck.bottomAnchor, constant: 28),
            CATIGOVIAtackCheck.centerXAnchor.constraint(equalTo: CATIGOVIAhorsebackIcon.centerXAnchor),
            CATIGOVIAtackCheck.widthAnchor.constraint(equalToConstant: 28),
            CATIGOVIAtackCheck.heightAnchor.constraint(equalToConstant: 28),
            
            CATIGOVIAwithdrawal.bottomAnchor.constraint(equalTo: CATIGOVIAcourseDesigner.bottomAnchor, constant: -10),
            CATIGOVIAwithdrawal.leadingAnchor.constraint(equalTo: CATIGOVIAcourseDesigner.leadingAnchor, constant: 10),
            CATIGOVIAwithdrawal.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            CATIGOVIAwithdrawal.heightAnchor.constraint(equalToConstant: 48),
            
            CATIGOVIApenalty.leadingAnchor.constraint(equalTo: CATIGOVIAwithdrawal.leadingAnchor, constant: 3),
            CATIGOVIApenalty.centerYAnchor.constraint(equalTo: CATIGOVIAwithdrawal.centerYAnchor),
            CATIGOVIApenalty.widthAnchor.constraint(equalToConstant: 40),
            CATIGOVIApenalty.heightAnchor.constraint(equalToConstant: 40),
            
            CATIGOVIAelimination.leadingAnchor.constraint(equalTo: CATIGOVIApenalty.trailingAnchor, constant: 6),
            CATIGOVIAelimination.centerYAnchor.constraint(equalTo: CATIGOVIAwithdrawal.centerYAnchor),
            CATIGOVIAelimination.widthAnchor.constraint(equalToConstant: 190)
        ])
    }
}
