//
//  CATIGOVIAStableTabBarController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class CATIGOVIAStableTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private let CATIGOVIASaddleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        CATIGOVIAsetupStableAppearance()
        CATIGOVIAsetupStableRings()
        CATIGOVIAsetupSaddleButton()
    }
    private func CATIGOVIAsetupStableAppearance() {
        let CATIGOVIAappearance = UITabBarAppearance()
        CATIGOVIAappearance.configureWithTransparentBackground()
        CATIGOVIAappearance.backgroundColor = UIColor.black
        
        tabBar.standardAppearance = CATIGOVIAappearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = CATIGOVIAappearance
        }
    }
    private func CATIGOVIAsetupStableRings() {
        let CATIGOVIAarenaVC = UINavigationController(rootViewController: CATIGOVIAArenaViewController())
        CATIGOVIAarenaVC.navigationBar.isHidden = true
        CATIGOVIAarenaVC.tabBarItem = UITabBarItem(title: nil,
                                          image: UIImage.init(named: "CATIGOVIApasture")?.withRenderingMode(.alwaysOriginal),
                                          selectedImage: UIImage.init(named: "CATIGOVIApirodduette")?.withRenderingMode(.alwaysOriginal))
        
        let CATIGOVIAcameraVC = UINavigationController(rootViewController: CATIGOVIACameraViewController())
        CATIGOVIAcameraVC.navigationBar.isHidden = true
        CATIGOVIAcameraVC.tabBarItem = UITabBarItem(title: nil,
                                           image: UIImage.init(named: "CATIGOVIAoats")?.withRenderingMode(.alwaysOriginal),
                                           selectedImage:UIImage.init(named: "CATIGOVIApirouette")?.withRenderingMode(.alwaysOriginal))
        
        
        let CATIGOVIAsaddlePlaceholder = UIViewController()
            CATIGOVIAsaddlePlaceholder.tabBarItem = UITabBarItem(title: nil,
                                                        image: nil,
                                                        selectedImage: nil)
        
        let CATIGOVIAfavoritesVC = UINavigationController(rootViewController:CATIGOVIAFavoritesViewController())
        CATIGOVIAfavoritesVC.navigationBar.isHidden = true
        CATIGOVIAfavoritesVC.tabBarItem = UITabBarItem(title: nil,
                                              image: UIImage.init(named: "CATIGOVIAgroom")?.withRenderingMode(.alwaysOriginal),
                                              selectedImage: UIImage.init(named: "CATIGOVIAfarrier")?.withRenderingMode(.alwaysOriginal))
        
        let CATIGOVIAriderProfileVC = UINavigationController(rootViewController:CATIGOVIARiderProfileController())
        CATIGOVIAriderProfileVC.navigationBar.isHidden = true
        CATIGOVIAriderProfileVC.view.backgroundColor = .systemBackground
        CATIGOVIAriderProfileVC.tabBarItem = UITabBarItem(title: nil,
                                                 image: UIImage.init(named: "CATIGOVIAhoof")?.withRenderingMode(.alwaysOriginal),
                                                 selectedImage: UIImage.init(named: "CATIGOVveterinarian")?.withRenderingMode(.alwaysOriginal))
        
        viewControllers = [CATIGOVIAarenaVC, CATIGOVIAcameraVC,CATIGOVIAsaddlePlaceholder, CATIGOVIAfavoritesVC, CATIGOVIAriderProfileVC]
    }
    
    private func CATIGOVIAsetupSaddleButton() {
        CATIGOVIASaddleButton.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
       
        CATIGOVIASaddleButton.center = CGPoint(x: tabBar.bounds.midX, y: tabBar.bounds.minY + 10)
        
       
        CATIGOVIASaddleButton.setBackgroundImage(UIImage.init(named: "CATIGOVIAgallop"), for: .normal)
       
        CATIGOVIASaddleButton.addTarget(self, action: #selector(CATIGOVIAopenSaddleGate), for: .touchUpInside)
        
        tabBar.addSubview(CATIGOVIASaddleButton)
    }
    
    @objc private func CATIGOVIAopenSaddleGate() {
        let CATIGOVIAringMasterVconter = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAWQhinny.CATIGOVIAshavings.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: ""))
        CATIGOVIAringMasterVconter.CATIGOVIAhorseTrial = true
        CATIGOVIAringMasterVconter.modalPresentationStyle = .fullScreen
        present(CATIGOVIAringMasterVconter, animated: true)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is UIViewController && viewController.tabBarItem.image == nil {
            return false
        }
        return true
    }
}

