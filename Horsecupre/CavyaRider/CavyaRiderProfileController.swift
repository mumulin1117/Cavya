//
//  CavyaRiderProfileController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class CavyaRiderProfileController: UIViewController {
    
    private lazy var discipline:UIActivityIndicatorView = {
       let equineevents = UIActivityIndicatorView.init(style: .large)
        equineevents.frame.size = CGSize.init(width: 54, height: 54)
        equineevents.tintColor = .white
        
        equineevents.hidesWhenStopped = true
        equineevents.color = .white
        return equineevents
    }()
    
    

    @IBOutlet weak var groundJury: UIImageView!
    
    
    @IBOutlet weak var courseDesigner: UILabel!
    
    @IBOutlet weak var penalty: UILabel!
    
    
    @IBOutlet weak var withdrawal: UIButton!
    
    
    @IBOutlet weak var steward: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        farrierAppointment()
        self.discipline.center = self.view.center
       
        self.view.addSubview(self.discipline)
     
        courseDesigner.text = UserDefaults.standard.object(forKey: "horsebackridingclub") as? String
        
        penalty.text = "  ID:\(UserDefaults.standard.object(forKey: "equestrianconnections") as? Int ?? 0)  "
    }

    
    private func farrierAppointment() {
        groundJury.layer.cornerRadius = 55
        groundJury.layer.masksToBounds = true
        
        withdrawal.layer.cornerRadius = 26
        withdrawal.layer.masksToBounds = true
        
        steward.layer.cornerRadius = 26
        steward.layer.masksToBounds = true
        
        penalty.layer.cornerRadius = 10
        penalty.layer.masksToBounds = true
    }

    @IBAction func ringMaster(_ sender: UIButton) {
        
        let reoip = sender.tag
        var toott = ""
        
        switch reoip {
        case 10:
            toott = WQhinny.hoofPick.saddleAllPurpose(gallop: "")
        case 11:
            toott = WQhinny.bitPelham.saddleAllPurpose(gallop: "")
        case 12:
            toott = WQhinny.bitGag.saddleAllPurpose(gallop: "")
        case 13:
            toott = WQhinny.bodyBrush.saddleAllPurpose(gallop: "")
        case 14:
            toott = WQhinny.bitKimberwicke.saddleAllPurpose(gallop: "")
            
        case 15:
            toott = WQhinny.reinsSplit.saddleAllPurpose(gallop: "")
        default:
            break
        }
        
        let ringMasterVconter = CavyaArenaPostController(movement: toott)
        ringMasterVconter.horseTrial = false
            ringMasterVconter.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ringMasterVconter, animated: true)
        
    }
    
}
