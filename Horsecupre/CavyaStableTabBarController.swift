//
//  CavyaStableTabBarController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class CavyaStableTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    private let cavyaSaddleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setupStableAppearance()
        setupStableRings()
        setupSaddleButton()
    }
    private func setupStableAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor.black
        
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        }
    }
    private func setupStableRings() {
        let arenaVC = UINavigationController(rootViewController: CavyaArenaViewController())
        arenaVC.navigationBar.isHidden = true
        arenaVC.tabBarItem = UITabBarItem(title: nil,
                                          image: UIImage.init(named: "pasture")?.withRenderingMode(.alwaysOriginal),
                                          selectedImage: UIImage.init(named: "pirodduette")?.withRenderingMode(.alwaysOriginal))
        
        let cameraVC = UINavigationController(rootViewController: CavyaCameraViewController())
        cameraVC.navigationBar.isHidden = true
        cameraVC.tabBarItem = UITabBarItem(title: nil,
                                           image: UIImage.init(named: "oats")?.withRenderingMode(.alwaysOriginal),
                                           selectedImage:UIImage.init(named: "pirouette")?.withRenderingMode(.alwaysOriginal))
        
        
        let saddlePlaceholder = UIViewController()
            saddlePlaceholder.tabBarItem = UITabBarItem(title: nil,
                                                        image: nil,
                                                        selectedImage: nil)
        
        let favoritesVC = UINavigationController(rootViewController:CavyaFavoritesViewController())
        favoritesVC.navigationBar.isHidden = true
        favoritesVC.tabBarItem = UITabBarItem(title: nil,
                                              image: UIImage.init(named: "groom")?.withRenderingMode(.alwaysOriginal),
                                              selectedImage: UIImage.init(named: "farrier")?.withRenderingMode(.alwaysOriginal))
        
        let riderProfileVC = UINavigationController(rootViewController:CavyaRiderProfileController())
        riderProfileVC.navigationBar.isHidden = true
        riderProfileVC.view.backgroundColor = .systemBackground
        riderProfileVC.tabBarItem = UITabBarItem(title: nil,
                                                 image: UIImage.init(named: "hoof")?.withRenderingMode(.alwaysOriginal),
                                                 selectedImage: UIImage.init(named: "veterinarian")?.withRenderingMode(.alwaysOriginal))
        
        viewControllers = [arenaVC, cameraVC,saddlePlaceholder, favoritesVC, riderProfileVC]
    }
    
    private func setupSaddleButton() {
        cavyaSaddleButton.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
       
        cavyaSaddleButton.center = CGPoint(x: tabBar.bounds.midX, y: tabBar.bounds.minY + 10)
        
       
        cavyaSaddleButton.setBackgroundImage(UIImage.init(named: "gallop"), for: .normal)
       
        cavyaSaddleButton.addTarget(self, action: #selector(openSaddleGate), for: .touchUpInside)
        
        tabBar.addSubview(cavyaSaddleButton)
    }
    
    @objc private func openSaddleGate() {
        let publishVC = CavyaArenaPostController(movement: WQhinny.shavings.saddleAllPurpose(gallop: ""))
        publishVC.horseTrial = true
        publishVC.modalPresentationStyle = .fullScreen
        present(publishVC, animated: true)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is UIViewController && viewController.tabBarItem.image == nil {
            return false
        }
        return true
    }
}

