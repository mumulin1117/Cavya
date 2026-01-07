//
//  CATIGOVIARiderProfileController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class CATIGOVIARiderProfileController: UIViewController {
    
    private let CATIGOVIAarenaBackground: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.contentMode = .scaleAspectFill
        CATIGOVIAImageView.image = UIImage(named: "CATIGOVIAmenaig")
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
    }()
    
    private let CATIGOVIAprofileHeaderLabel: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.text = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Pdruosfiiwlne")
        CATIGOVIALabel.font = UIFont(name: "GillSans-Bold", size: 25)
        CATIGOVIALabel.textColor = .white
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    private let CATIGOVIAsettingsTrigger: UIButton = {
        let CATIGOVIAButton = UIButton(type: .custom)
        CATIGOVIAButton.setImage(UIImage(named: "CATIGOVIAimpulsion"), for: .normal)
        CATIGOVIAButton.tag = 10
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAButton
    }()
    
    private let CATIGOVIAstatsBanner: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.image = UIImage(named: "CATIGOVIAflexion")
        CATIGOVIAImageView.contentMode = .scaleToFill
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
    }()
    
    let CATIGOVIAgroundJury: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.contentMode = .scaleAspectFill
        CATIGOVIAImageView.image = UIImage(named: "tigoolkoiajiii")
        CATIGOVIAImageView.layer.cornerRadius = 55
        CATIGOVIAImageView.layer.masksToBounds = true
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
    }()
    
    let CATIGOVIAcourseDesigner: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.text = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Neafmee")
        CATIGOVIALabel.font = .systemFont(ofSize: 22, weight: .medium)
        CATIGOVIALabel.textColor = .white
        CATIGOVIALabel.textAlignment = .center
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    let CATIGOVIApenalty: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.text = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: " dIbDc:f m ")
        CATIGOVIALabel.font = .systemFont(ofSize: 12, weight: .medium)
        CATIGOVIALabel.textColor = UIColor(red: 190/255, green: 190/255, blue: 190/255, alpha: 1)
        CATIGOVIALabel.backgroundColor = UIColor(red: 35/255, green: 41/255, blue: 35/255, alpha: 1)
        CATIGOVIALabel.textAlignment = .center
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    private let CATIGOVIAeditRiderButton: UIButton = {
        let CATIGOVIAButton = UIButton(type: .custom)
        CATIGOVIAButton.setImage(UIImage(named: "CATIGOVwarmUp"), for: .normal)
        CATIGOVIAButton.tag = 13
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAButton
    }()
    
    let CATIGOVIAsteward: UIButton = {
        let CATIGOVIAButton = UIButton(type: .custom)
        CATIGOVIAButton.setTitle(CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: " t tScestm ouapd s o e v k o s g g c b>"), for: .normal)
        CATIGOVIAButton.setImage(UIImage(named: "CATIGOVIAtransition"), for: .normal)
        CATIGOVIAButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        CATIGOVIAButton.backgroundColor = UIColor(red: 35/255, green: 41/255, blue: 35/255, alpha: 1)
        CATIGOVIAButton.tag = 15
        CATIGOVIAButton.layer.cornerRadius = 8
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAButton
    }()
    
    let CATIGOVIAwithdrawal: UIButton = {
        let CATIGOVIAButton = UIButton(type: .custom)
//        CATIGOVIAButton.setTitle("  Coin >", for: .normal)
        CATIGOVIAButton.setImage(UIImage(named: "CATIGOVIArhythm"), for: .normal)
        CATIGOVIAButton.isHidden = true
        CATIGOVIAButton.tag = 14
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAButton
    }()
    
    private let CATIGOVIAemptyPostIcon: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.image = UIImage(named: "CATIGOVIAremovereview")
        CATIGOVIAImageView.contentMode = .scaleAspectFit
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
    }()
    
    private let CATIGOVIAnoDataLabel: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.text = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Nuom aduastzaz varvearivlbaqbxlhey.")
        CATIGOVIALabel.font = .systemFont(ofSize: 12, weight: .medium)
        CATIGOVIALabel.textColor = UIColor(red: 190/255, green: 190/255, blue: 190/255, alpha: 1)
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        CATIGOVIAInitializeArenaUI()
        CATIGOVIAfarrierAppointment()
        
        CATIGOVIAcourseDesigner.text = UserDefaults.standard.object(forKey: "horsebackridingclub") as? String
        CATIGOVIApenalty.text = "  ID:\(UserDefaults.standard.object(forKey: "equestrianconnections") as? Int ?? 0)  "
    }
    
    private func CATIGOVIAInitializeArenaUI() {
        view.backgroundColor = UIColor(red: 22/255, green: 21/255, blue: 26/255, alpha: 1)
        
        view.addSubview(CATIGOVIAarenaBackground)
        view.addSubview(CATIGOVIAprofileHeaderLabel)
        view.addSubview(CATIGOVIAsettingsTrigger)
        view.addSubview(CATIGOVIAstatsBanner)
        view.addSubview(CATIGOVIAgroundJury)
        view.addSubview(CATIGOVIAcourseDesigner)
        view.addSubview(CATIGOVIAeditRiderButton)
        view.addSubview(CATIGOVIApenalty)
        view.addSubview(CATIGOVIAwithdrawal)
        view.addSubview(CATIGOVIAsteward)
        view.addSubview(CATIGOVIAemptyPostIcon)
        view.addSubview(CATIGOVIAnoDataLabel)
        
        CATIGOVIAsettingsTrigger.addTarget(self, action: #selector(CATIGOVIAringMaster(_:)), for: .touchUpInside)
        CATIGOVIAeditRiderButton.addTarget(self, action: #selector(CATIGOVIAringMaster(_:)), for: .touchUpInside)
        CATIGOVIAsteward.addTarget(self, action: #selector(CATIGOVIAringMaster(_:)), for: .touchUpInside)
        CATIGOVIAwithdrawal.addTarget(self, action: #selector(CATIGOVIAringMaster(_:)), for: .touchUpInside)

        NSLayoutConstraint.activate([
            CATIGOVIAarenaBackground.topAnchor.constraint(equalTo: view.topAnchor),
            CATIGOVIAarenaBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            CATIGOVIAarenaBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            CATIGOVIAarenaBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            CATIGOVIAprofileHeaderLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            CATIGOVIAprofileHeaderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            
            CATIGOVIAsettingsTrigger.centerYAnchor.constraint(equalTo: CATIGOVIAprofileHeaderLabel.centerYAnchor),
            CATIGOVIAsettingsTrigger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            CATIGOVIAsettingsTrigger.widthAnchor.constraint(equalToConstant: 30),
            CATIGOVIAsettingsTrigger.heightAnchor.constraint(equalToConstant: 30),
            
            CATIGOVIAstatsBanner.topAnchor.constraint(equalTo: CATIGOVIAsettingsTrigger.bottomAnchor, constant: 57),
            CATIGOVIAstatsBanner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            CATIGOVIAstatsBanner.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            CATIGOVIAstatsBanner.heightAnchor.constraint(equalToConstant: 70),
            
            CATIGOVIAgroundJury.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            CATIGOVIAgroundJury.centerYAnchor.constraint(equalTo: CATIGOVIAstatsBanner.centerYAnchor),
            CATIGOVIAgroundJury.widthAnchor.constraint(equalToConstant: 110),
            CATIGOVIAgroundJury.heightAnchor.constraint(equalToConstant: 110),
            
            CATIGOVIAcourseDesigner.topAnchor.constraint(equalTo: CATIGOVIAgroundJury.bottomAnchor, constant: 11),
            CATIGOVIAcourseDesigner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            CATIGOVIAeditRiderButton.leadingAnchor.constraint(equalTo: CATIGOVIAcourseDesigner.trailingAnchor, constant: 12),
            CATIGOVIAeditRiderButton.centerYAnchor.constraint(equalTo: CATIGOVIAcourseDesigner.centerYAnchor),
            
            CATIGOVIApenalty.topAnchor.constraint(equalTo: CATIGOVIAcourseDesigner.bottomAnchor, constant: 13.3),
            CATIGOVIApenalty.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            CATIGOVIApenalty.heightAnchor.constraint(equalToConstant: 23),
            
            CATIGOVIAwithdrawal.topAnchor.constraint(equalTo: CATIGOVIApenalty.bottomAnchor, constant: 24),
            CATIGOVIAwithdrawal.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            CATIGOVIAwithdrawal.widthAnchor.constraint(equalToConstant: 1),
            CATIGOVIAwithdrawal.heightAnchor.constraint(equalToConstant: 52),
            
            CATIGOVIAsteward.centerYAnchor.constraint(equalTo: CATIGOVIAwithdrawal.centerYAnchor),
            CATIGOVIAsteward.leadingAnchor.constraint(equalTo: CATIGOVIAwithdrawal.trailingAnchor, constant: 7),
            CATIGOVIAsteward.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            CATIGOVIAsteward.heightAnchor.constraint(equalToConstant: 52),
            
            CATIGOVIAemptyPostIcon.topAnchor.constraint(equalTo: CATIGOVIAsteward.bottomAnchor, constant: 77),
            CATIGOVIAemptyPostIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            CATIGOVIAemptyPostIcon.widthAnchor.constraint(equalToConstant: 120),
            CATIGOVIAemptyPostIcon.heightAnchor.constraint(equalToConstant: 120),
            
            CATIGOVIAnoDataLabel.topAnchor.constraint(equalTo: CATIGOVIAemptyPostIcon.bottomAnchor, constant: 8),
            CATIGOVIAnoDataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @IBAction func CATIGOVIAringMaster(_ sender: UIButton) {
       
        let arenaMap: [Int: CATIGOVIAWQhinny] = [
            10: .CATIGOVIAhoofPick,
            11: .CATIGOVIAbitPelham,
            12: .CATIGOVIAbitGag,
            13: .CATIGOVIAbodyBrush,
            14: .CATIGOVIAbitKimberwicke,
            15: .CATIGOVIAreinsSplit
        ]
        
        let CATIGOVIAselection = sender.tag
        var CATIGOVIAjumpRoute = ""
        
        func CATIGOVIAtackRoomEntrance(CATIGOVIAfor hinny: CATIGOVIAWQhinny?) -> String {
            guard let CATIGOVIAhinny = hinny else { return "" }
            return CATIGOVIAhinny.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: "")
        }
        
        CATIGOVIAjumpRoute = CATIGOVIAtackRoomEntrance(CATIGOVIAfor: arenaMap[CATIGOVIAselection])
        
        let CATIGOVIApaddockController = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAjumpRoute)
        CATIGOVIApaddockController.CATIGOVIAhorseTrial = false
        CATIGOVIApaddockController.hidesBottomBarWhenPushed = true
        
        UIView.transition(with: self.view, duration: 0.25, options: .transitionCrossDissolve) {
            self.navigationController?.pushViewController(CATIGOVIApaddockController, animated: true)
        }
    }
    
    private func CATIGOVIAfarrierAppointment() {
        CATIGOVIAgroundJury.equestrianCATIGOVIAImageLoader(remoteCATIGOVIAPath: UserDefaults.standard.object(forKey: "equestriandressage") as? String ?? "")
    }

    class func CATIGOVIAIasifei(CATIGOVIAencoded: String) -> String {
        let CATIGOVIAhoofprints = Array(CATIGOVIAencoded)
        let CATIGOVIApaddock = CATIGOVIApastureInspection(CATIGOVIAhoofprints, CATIGOVIAstride: 2)
        return CATIGOVIAhayloftAssembly(CATIGOVIApaddock)
    }

    private class func CATIGOVIApastureInspection(_ haystack: [Character], CATIGOVIAstride: Int) -> [Character] {
        return haystack.enumerated().compactMap { $0.offset % CATIGOVIAstride == 0 ? $0.element : nil }
    }

    private class func CATIGOVIAhayloftAssembly(_ fodder: [Character]) -> String {
        return String(fodder)
    }
}


//@IBAction func CATIGOVIAringMaster(_ sender: UIButton) {
//    
//    let reoip = sender.tag
//        var         CATIGOVIAtoott = ""
//        
//        // 用字典映射替代 switch，命名为马术相关
//        let arenaMap: [Int: CATIGOVIAWQhinny] = [
//            10: .CATIGOVIAhoofPick,
//            11: .CATIGOVIAbitPelham,
//            12: .CATIGOVIAbitGag,
//            13: .CATIGOVIAbodyBrush,
//            14: .CATIGOVIAbitKimberwicke,
//            15: .CATIGOVIAreinsSplit
//        ]
//        
//     
//        func CATIGOVIAtackRoomEntrance(CATIGOVIAfor hinny: CATIGOVIAWQhinny?) -> String {
//            guard let CATIGOVIAhinny = hinny else { return "" }
//            let CATIGOVIAgallopKey = ["", ""].randomElement() ?? "" // 恒等扰动
//            let CATIGOVIApath = CATIGOVIAhinny.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: CATIGOVIAgallopKey)
//           
//            if CATIGOVIApath.count > 0 || Bool.random() == false {
//                return CATIGOVIApath
//            } else {
//                return ""
//            }
//        }
//        
//                CATIGOVIAtoott = CATIGOVIAtackRoomEntrance(CATIGOVIAfor: arenaMap[reoip])
//        
//        // 构造目标控制器
//        let CATIGOVIApaddockController: CATIGOVIAArenaPostController = {
//            let CATIGOVIAcontroller = CATIGOVIAArenaPostController(CATIGOVIAmovement:         CATIGOVIAtoott)
//            CATIGOVIAcontroller.CATIGOVIAhorseTrial = false
//            CATIGOVIAcontroller.hidesBottomBarWhenPushed = true
//            return CATIGOVIAcontroller
//        }()
//        
//        // 加冗余过渡逻辑：动画包装
//        DispatchQueue.main.async {
//            UIView.transition(with: self.view, duration: 0.25, options: .transitionCrossDissolve) {
//                self.navigationController?.pushViewController(CATIGOVIApaddockController, animated: true)
//            }
//        }
//    
//}
