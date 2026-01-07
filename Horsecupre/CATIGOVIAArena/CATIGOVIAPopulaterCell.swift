import UIKit

class CATIGOVIAPopulaterCell: UICollectionViewCell {

    let CATIGOVIAjumpOxer: UIImageView = {
        let CATIGOVIAView = UIImageView()
        CATIGOVIAView.contentMode = .scaleAspectFill
        CATIGOVIAView.backgroundColor = UIColor(red: 190/255, green: 190/255, blue: 190/255, alpha: 1)
        CATIGOVIAView.layer.cornerRadius = 22
        CATIGOVIAView.layer.masksToBounds = true
        CATIGOVIAView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAView
    }()
    
    let CATIGOVIAfeedRoom: UIImageView = {
        let CATIGOVIAView = UIImageView()
        CATIGOVIAView.contentMode = .scaleAspectFill
        CATIGOVIAView.backgroundColor = UIColor(red: 172/255, green: 247/255, blue: 0, alpha: 1)
        CATIGOVIAView.layer.cornerRadius = 22
        CATIGOVIAView.layer.masksToBounds = true
        CATIGOVIAView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAView
    }()
    
    let CATIGOVIAwashRack: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.font = .systemFont(ofSize: 15, weight: .semibold)
        CATIGOVIALabel.textColor = .white
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    let CATIGOVIAhotWalker: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.font = .systemFont(ofSize: 12)
        CATIGOVIALabel.textColor = UIColor.white.withAlphaComponent(0.8)
        CATIGOVIALabel.numberOfLines = 2
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    let CATIGOVIAroundPen: UIImageView = {
        let CATIGOVIAView = UIImageView()
        CATIGOVIAView.contentMode = .scaleAspectFit
        CATIGOVIAView.image = UIImage(named: "CATIGOVIAriding")
        CATIGOVIAView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAView
    }()
    
    let CATIGOVIAjumpCup: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.font = .systemFont(ofSize: 10)
        CATIGOVIALabel.textColor = UIColor.white.withAlphaComponent(0.8)
        CATIGOVIALabel.textAlignment = .center
        CATIGOVIALabel.numberOfLines = 2
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    let CATIGOVIAhorsebackIcon: UIImageView = {
        let CATIGOVIAView = UIImageView()
        CATIGOVIAView.contentMode = .scaleAspectFit
        CATIGOVIAView.image = UIImage(named: "CATIGOVIAhorseback")
        CATIGOVIAView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAView
    }()
    
    let CATIGOVIAjumpPole: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.font = .systemFont(ofSize: 10)
        CATIGOVIALabel.textColor = UIColor.white.withAlphaComponent(0.8)
        CATIGOVIALabel.textAlignment = .center
        CATIGOVIALabel.numberOfLines = 2
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    let CATIGOVIAhayIcon: UIImageView = {
        let CATIGOVIAView = UIImageView()
        CATIGOVIAView.contentMode = .scaleAspectFit
        CATIGOVIAView.image = UIImage(named: "CATIGOVIAhay")
        CATIGOVIAView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAView
    }()
    
    let CATIGOVIAjumpStandard: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.font = .systemFont(ofSize: 15)
        CATIGOVIALabel.textColor = .white
        CATIGOVIALabel.numberOfLines = 2
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    let CATIGOVIAeventingShowJumping: UIButton = {
        let CATIGOVIAButton = UIButton(type: .custom)
        CATIGOVIAButton.setImage(UIImage(named: "CATIGOVIAequestrian"), for: .normal)
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        CATIGOVIAAssembleArenaSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        CATIGOVIAAssembleArenaSubviews()
    }
    
    private func CATIGOVIAAssembleArenaSubviews() {
        contentView.addSubview(CATIGOVIAjumpOxer)
        contentView.addSubview(CATIGOVIAfeedRoom)
        contentView.addSubview(CATIGOVIAwashRack)
        contentView.addSubview(CATIGOVIAhotWalker)
        contentView.addSubview(CATIGOVIAroundPen)
        contentView.addSubview(CATIGOVIAjumpCup)
        contentView.addSubview(CATIGOVIAhorsebackIcon)
        contentView.addSubview(CATIGOVIAjumpPole)
        contentView.addSubview(CATIGOVIAhayIcon)
        contentView.addSubview(CATIGOVIAjumpStandard)
        contentView.addSubview(CATIGOVIAeventingShowJumping)
        
        NSLayoutConstraint.activate([
            CATIGOVIAjumpOxer.topAnchor.constraint(equalTo: contentView.topAnchor),
            CATIGOVIAjumpOxer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            CATIGOVIAjumpOxer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            CATIGOVIAjumpOxer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            CATIGOVIAfeedRoom.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            CATIGOVIAfeedRoom.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            CATIGOVIAfeedRoom.widthAnchor.constraint(equalToConstant: 44),
            CATIGOVIAfeedRoom.heightAnchor.constraint(equalToConstant: 44),
            
            CATIGOVIAwashRack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21),
            CATIGOVIAwashRack.leadingAnchor.constraint(equalTo: CATIGOVIAfeedRoom.trailingAnchor, constant: 8),
            
            CATIGOVIAhotWalker.topAnchor.constraint(equalTo: CATIGOVIAwashRack.bottomAnchor, constant: 7),
            CATIGOVIAhotWalker.leadingAnchor.constraint(equalTo: CATIGOVIAwashRack.leadingAnchor),
            CATIGOVIAhotWalker.trailingAnchor.constraint(equalTo: CATIGOVIAeventingShowJumping.leadingAnchor, constant: -12),
            
            CATIGOVIAeventingShowJumping.centerYAnchor.constraint(equalTo: CATIGOVIAfeedRoom.centerYAnchor),
            CATIGOVIAeventingShowJumping.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            CATIGOVIAeventingShowJumping.widthAnchor.constraint(equalToConstant: 28),
            CATIGOVIAeventingShowJumping.heightAnchor.constraint(equalToConstant: 28),
            
            CATIGOVIAroundPen.topAnchor.constraint(equalTo: CATIGOVIAfeedRoom.bottomAnchor, constant: 20),
            CATIGOVIAroundPen.centerXAnchor.constraint(equalTo: CATIGOVIAfeedRoom.centerXAnchor),
            CATIGOVIAroundPen.widthAnchor.constraint(equalToConstant: 28),
            CATIGOVIAroundPen.heightAnchor.constraint(equalToConstant: 28),
            
            CATIGOVIAjumpCup.topAnchor.constraint(equalTo: CATIGOVIAroundPen.bottomAnchor, constant: 4),
            CATIGOVIAjumpCup.centerXAnchor.constraint(equalTo: CATIGOVIAroundPen.centerXAnchor),
            
            CATIGOVIAhorsebackIcon.topAnchor.constraint(equalTo: CATIGOVIAjumpCup.bottomAnchor, constant: 12),
            CATIGOVIAhorsebackIcon.centerXAnchor.constraint(equalTo: CATIGOVIAfeedRoom.centerXAnchor),
            CATIGOVIAhorsebackIcon.widthAnchor.constraint(equalToConstant: 28),
            CATIGOVIAhorsebackIcon.heightAnchor.constraint(equalToConstant: 28),
            
            CATIGOVIAjumpPole.topAnchor.constraint(equalTo: CATIGOVIAhorsebackIcon.bottomAnchor, constant: 4),
            CATIGOVIAjumpPole.centerXAnchor.constraint(equalTo: CATIGOVIAhorsebackIcon.centerXAnchor),
            
            CATIGOVIAhayIcon.topAnchor.constraint(equalTo: CATIGOVIAjumpPole.bottomAnchor, constant: 24),
            CATIGOVIAhayIcon.centerXAnchor.constraint(equalTo: CATIGOVIAfeedRoom.centerXAnchor),
            CATIGOVIAhayIcon.widthAnchor.constraint(equalToConstant: 40),
            CATIGOVIAhayIcon.heightAnchor.constraint(equalToConstant: 40),
            
            CATIGOVIAjumpStandard.centerYAnchor.constraint(equalTo: CATIGOVIAhayIcon.centerYAnchor),
            CATIGOVIAjumpStandard.leadingAnchor.constraint(equalTo: CATIGOVIAhayIcon.trailingAnchor, constant: 12),
            CATIGOVIAjumpStandard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
}
