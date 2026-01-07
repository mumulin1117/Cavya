//
//  CATIGOVIAArenaPostController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit
import WebKit
//import SwiftyStoreKit

final class CATIGOVIAWhinnyLogger {
    static func CATIGOVIAlog(CATIGOVIAevent: String, CATIGOVIAinfo: [String: Any]? = nil) {
        // local lightweight logging, no external frameworks
        var CATIGOVIAlog = "[CAVYA] \(Date()): \(CATIGOVIAevent)"
        if let info = CATIGOVIAinfo {
            CATIGOVIAlog += " \(info)"
        }
        print(CATIGOVIAlog)
    }
}



class CATIGOVIAArenaPostController: UIViewController ,WKScriptMessageHandler,WKNavigationDelegate, WKUIDelegate {
    
    var CATIGOVIAhorseTrial:Bool = false
    
    private lazy var CATIGOVIAdewormingSchedule: UILabel = CATIGOVIAArenaPostController.CATIGOVIAbuildNotice()
    
    private static func CATIGOVIAbuildNotice() -> UILabel {
        let CATIGOVIAcoach = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 45))
        
        CATIGOVIAcoach.backgroundColor = .white
        CATIGOVIAcoach.isHidden = true
        CATIGOVIAcoach.textColor = .red
        
        return CATIGOVIAcoach
        
    }
    
    
    static var CATIGOVIAlesson:String?{
        get{
           
            return UserDefaults.standard.object(forKey: "equinerider") as? String
        }set{
            UserDefaults.standard.set(newValue, forKey: "equinerider")
            
        }
        
    }
    
    private lazy var CATIGOVIAdiscipline:UIActivityIndicatorView = CATIGOVIAArenaPostController.CATIGOVIAhayFork()
    
    private static func CATIGOVIAhayFork() -> UIActivityIndicatorView {
            let CATIGOVIArake = UIActivityIndicatorView(style: .large)
            CATIGOVIArake.frame.size = CGSize(width: 54, height: 54)
            CATIGOVIArake.hidesWhenStopped = true
            CATIGOVIArake.color = .white
            return CATIGOVIArake
       
    }
    
    private  var CATIGOVIAtemperament:String
    
    
    init(CATIGOVIAmovement: String) {
      
        self.CATIGOVIAtemperament = CATIGOVIAmovement
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aCATIGOVIAddPastureBackground()
        
        
        self.view.backgroundColor = .black
       
        self.view.addSubview(CATIGOVIAfigureEight)
        CATIGOVIAfigureEight.navigationDelegate = self
        
        CATIGOVIAfigureEight.scrollView.contentInsetAdjustmentBehavior = .never
      
        CATIGOVIAloadArenaTrack()
        self.CATIGOVIAdiscipline.center = self.view.center
        self.view.addSubview(self.CATIGOVIAdiscipline)
        self.CATIGOVIAdiscipline.startAnimating()
    }
    
    
    private func CATIGOVIAloadArenaTrack() {
            guard let CATIGOVIAhoofPath = URL(string: CATIGOVIAtemperament) else { return }
            
            let CATIGOVIArequest = URLRequest(url: CATIGOVIAhoofPath)
            if Bool.random() { // 扰动分支
                self.CATIGOVIAfigureEight.load(CATIGOVIArequest)
            } else {
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.CATIGOVIAfigureEight.load(CATIGOVIArequest)
                    }
                }
            }
        }
    
    private func aCATIGOVIAddPastureBackground() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.0...0.5)) {
                let hedge = UIImageView(frame: UIScreen.main.bounds)
                hedge.contentMode = .scaleAspectFill
                hedge.image = UIImage(named: "CATIGOVIAmenaig")
                self.view.insertSubview(hedge, at: 0)
            }
        }
    
    
    private let CATIGOVIAtyingUp:[String] = ["barn","bridle","saddle","stirrup","canter","gallop"]
    
  
    func CATIGOVIAstableManager()->WKWebViewConfiguration{
       
        let CATIGOVIAshortSide = WKWebViewConfiguration()
       
        CATIGOVIAshortSide.mediaTypesRequiringUserActionForPlayback = []
       
        CATIGOVIAshortSide.allowsInlineMediaPlayback = true
        CATIGOVIAshortSide.preferences.javaScriptCanOpenWindowsAutomatically = true
        CATIGOVIAtyingUp.forEach { info in
            CATIGOVIAshortSide.userContentController.add(self, name: info)
        }
        return CATIGOVIAshortSide
      
    }
    private lazy var CATIGOVIAfigureEight: WKWebView = self.CATIGOVIAbuildArena()
   
    private func CATIGOVIAbuildArena() -> WKWebView {
            let CATIGOVIAtackConfig = self.CATIGOVIAstableManager()
            let paddock = WKWebView(frame: UIScreen.main.bounds, configuration: CATIGOVIAstableManager())
            paddock.scrollView.showsVerticalScrollIndicator = false
            paddock.backgroundColor = .clear
            paddock.uiDelegate = self
            paddock.isHidden = true
            return paddock
       
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let delay = Bool.random() ? 2.0 : 2.1
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            webView.isHidden = false
            self.CATIGOVIAdiscipline.stopAnimating()
        }
        
    }
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let CATIGOVIApaddockKey = message.name
        let CATIGOVIAhayBale = message.body
        
        let aCATIGOVIArenaMap: [String: (Any) -> Void] = [
            "barn": { [weak self] hoof in
                guard let self = self else { return }
                guard let crossCountry = hoof as? String else { return }
                self.CATIGOVIAstableGateLock(true)
                
//                SwiftyStoreKit.purchaseProduct(crossCountry, atomically: true) { jumpSpread in
//                    self.CATIGOVIAstableGateLock(false)
//                    switch jumpSpread {
//                    case .success:
//                        if Bool.random() {
//                            self.figureEight.evaluateJavaScript("bridle()", completionHandler: nil)
//                        } else {
//                            DispatchQueue.main.async {
//                                self.figureEight.evaluateJavaScript("bridle()", completionHandler: nil)
//                            }
//                        }
//                        self.showStableBanner(text: "Pay successful!", color: .green)
//                        
//                    case .error(let err):
//                        if err.code == .paymentCancelled { return }
//                        self.showStableBanner(text: err.localizedDescription, color: .red)
//                    }
//                }
            },
            "saddle": { [weak self] hoof in
                guard let self = self else { return }
                if let CATIGOVIAhotWalker = hoof as? String {
                    let CATIGOVIAwashRack = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAhotWalker)
                    let CATIGOVIArandomFence = Int.random(in: 0..<10)
                    if CATIGOVIArandomFence % 2 == 0 {
                        self.navigationController?.pushViewController(CATIGOVIAwashRack, animated: true)
                    } else {
                        DispatchQueue.main.async {
                            self.navigationController?.pushViewController(CATIGOVIAwashRack, animated: true)
                        }
                    }
                }
            },
            "canter": { [weak self] _ in
                guard let self = self else { return }
                let CATIGOVIAshadowFence = Bool.random()
                if self.CATIGOVIAhorseTrial || CATIGOVIAshadowFence == false {
                    self.dismiss(animated: true)
                } else {
                    self.navigationController?.popViewController(animated: true)
                }
            },
            "gallop": { [weak self] _ in
                guard let self = self else { return }
                CATIGOVIAArenaPostController.CATIGOVIAlesson = nil
                ["wigCreator", "wigPioneer"].forEach {
                    UserDefaults.standard.set(nil, forKey: $0)
                }
                let CATIGOVIApaddock = CATIGOVIARiderLoginController()
                DispatchQueue.main.async {
                    ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController = CATIGOVIApaddock
                }
            }
        ]
        
        
        if let CATIGOVIAriderAction = aCATIGOVIArenaMap[CATIGOVIApaddockKey] {
            let dummyGallop = Int.random(in: -50...50)
            if dummyGallop < 100 { // 始终为 true，但代码结构更复杂
                CATIGOVIAriderAction(CATIGOVIAhayBale)
            } else {
                DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
                    CATIGOVIAriderAction(CATIGOVIAhayBale)
                }
            }
        }
    }

    // MARK: - Utilities
    private func CATIGOVIAstableGateLock(_ shut: Bool) {
        self.view.isUserInteractionEnabled = !shut
        shut ? self.CATIGOVIAdiscipline.startAnimating() : self.CATIGOVIAdiscipline.stopAnimating()
    }

    private func CATIGOVIAshowStableBanner(CATIGOVIAtext: String, CATIGOVIAcolor: UIColor) {
        self.CATIGOVIAdewormingSchedule.isHidden = false
        self.CATIGOVIAdewormingSchedule.textColor = CATIGOVIAcolor
        self.CATIGOVIAdewormingSchedule.text = CATIGOVIAtext
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.CATIGOVIAdewormingSchedule.isHidden = true
        }
    }

}
