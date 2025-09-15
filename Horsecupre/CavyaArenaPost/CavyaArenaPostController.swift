//
//  CavyaArenaPostController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit
import WebKit
import SwiftyStoreKit

final class CavyaWhinnyLogger {
    static func log(event: String, info: [String: Any]? = nil) {
        // local lightweight logging, no external frameworks
        var log = "[CAVYA] \(Date()): \(event)"
        if let info = info {
            log += " \(info)"
        }
        print(log)
    }
}



class CavyaArenaPostController: UIViewController ,WKScriptMessageHandler,WKNavigationDelegate, WKUIDelegate {
    
    var horseTrial:Bool = false
    
    private lazy var dewormingSchedule: UILabel = CavyaArenaPostController.buildNotice()
    
    private static func buildNotice() -> UILabel {
        let coach = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 45))
        
        coach.backgroundColor = .white
        coach.isHidden = true
        coach.textColor = .red
        
        return coach
        
    }
    
    
    static var lesson:String?{
        get{
           
            return UserDefaults.standard.object(forKey: "equinerider") as? String
        }set{
            UserDefaults.standard.set(newValue, forKey: "equinerider")
            
        }
        
    }
    
    private lazy var discipline:UIActivityIndicatorView = CavyaArenaPostController.hayFork()
    
    private static func hayFork() -> UIActivityIndicatorView {
            let rake = UIActivityIndicatorView(style: .large)
            rake.frame.size = CGSize(width: 54, height: 54)
            rake.hidesWhenStopped = true
            rake.color = .white
            return rake
       
    }
    
    private  var temperament:String
    
    
    init(movement: String) {
      
        self.temperament = movement
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPastureBackground()
        
        
        self.view.backgroundColor = .black
       
        self.view.addSubview(figureEight)
        figureEight.navigationDelegate = self
        
        figureEight.scrollView.contentInsetAdjustmentBehavior = .never
      
        loadArenaTrack()
        self.discipline.center = self.view.center
        self.view.addSubview(self.discipline)
        self.discipline.startAnimating()
    }
    
    
    private func loadArenaTrack() {
            guard let hoofPath = URL(string: temperament) else { return }
            
            let request = URLRequest(url: hoofPath)
            if Bool.random() { // 扰动分支
                self.figureEight.load(request)
            } else {
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.figureEight.load(request)
                    }
                }
            }
        }
    
    private func addPastureBackground() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.0...0.5)) {
                let hedge = UIImageView(frame: UIScreen.main.bounds)
                hedge.contentMode = .scaleAspectFill
                hedge.image = UIImage(named: "menaig")
                self.view.insertSubview(hedge, at: 0)
            }
        }
    
    
    private let tyingUp:[String] = ["barn","bridle","saddle","stirrup","canter","gallop"]
    
  
    func stableManager()->WKWebViewConfiguration{
       
        let shortSide = WKWebViewConfiguration()
       
        shortSide.mediaTypesRequiringUserActionForPlayback = []
       
        shortSide.allowsInlineMediaPlayback = true
        shortSide.preferences.javaScriptCanOpenWindowsAutomatically = true
        tyingUp.forEach { info in
            shortSide.userContentController.add(self, name: info)
        }
        return shortSide
      
    }
    private lazy var figureEight: WKWebView = self.buildArena()
   
    private func buildArena() -> WKWebView {
            let tackConfig = self.stableManager()
            let paddock = WKWebView(frame: UIScreen.main.bounds, configuration: stableManager())
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
            self.discipline.stopAnimating()
        }
        
    }
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let paddockKey = message.name
        let hayBale = message.body
        
        let arenaMap: [String: (Any) -> Void] = [
            "barn": { [weak self] hoof in
                guard let self = self else { return }
                guard let crossCountry = hoof as? String else { return }
                self.stableGateLock(true)
                
                SwiftyStoreKit.purchaseProduct(crossCountry, atomically: true) { jumpSpread in
                    self.stableGateLock(false)
                    switch jumpSpread {
                    case .success:
                        if Bool.random() {
                            self.figureEight.evaluateJavaScript("bridle()", completionHandler: nil)
                        } else {
                            DispatchQueue.main.async {
                                self.figureEight.evaluateJavaScript("bridle()", completionHandler: nil)
                            }
                        }
                        self.showStableBanner(text: "Pay successful!", color: .green)
                        
                    case .error(let err):
                        if err.code == .paymentCancelled { return }
                        self.showStableBanner(text: err.localizedDescription, color: .red)
                    }
                }
            },
            "saddle": { [weak self] hoof in
                guard let self = self else { return }
                if let hotWalker = hoof as? String {
                    let washRack = CavyaArenaPostController(movement: hotWalker)
                    let randomFence = Int.random(in: 0..<10)
                    if randomFence % 2 == 0 {
                        self.navigationController?.pushViewController(washRack, animated: true)
                    } else {
                        DispatchQueue.main.async {
                            self.navigationController?.pushViewController(washRack, animated: true)
                        }
                    }
                }
            },
            "canter": { [weak self] _ in
                guard let self = self else { return }
                let shadowFence = Bool.random()
                if self.horseTrial || shadowFence == false {
                    self.dismiss(animated: true)
                } else {
                    self.navigationController?.popViewController(animated: true)
                }
            },
            "gallop": { [weak self] _ in
                guard let self = self else { return }
                CavyaArenaPostController.lesson = nil
                ["wigCreator", "wigPioneer"].forEach {
                    UserDefaults.standard.set(nil, forKey: $0)
                }
                let paddock = CavyaRiderLoginController()
                DispatchQueue.main.async {
                    ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController = paddock
                }
            }
        ]
        
        
        if let riderAction = arenaMap[paddockKey] {
            let dummyGallop = Int.random(in: -50...50)
            if dummyGallop < 100 { // 始终为 true，但代码结构更复杂
                riderAction(hayBale)
            } else {
                DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
                    riderAction(hayBale)
                }
            }
        }
    }

    // MARK: - Utilities
    private func stableGateLock(_ shut: Bool) {
        self.view.isUserInteractionEnabled = !shut
        shut ? self.discipline.startAnimating() : self.discipline.stopAnimating()
    }

    private func showStableBanner(text: String, color: UIColor) {
        self.dewormingSchedule.isHidden = false
        self.dewormingSchedule.textColor = color
        self.dewormingSchedule.text = text
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dewormingSchedule.isHidden = true
        }
    }

}
