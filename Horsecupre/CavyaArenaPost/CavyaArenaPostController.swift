//
//  CavyaArenaPostController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit
import WebKit
import SwiftyStoreKit
class CavyaArenaPostController: UIViewController ,WKScriptMessageHandler,WKNavigationDelegate, WKUIDelegate {
    
    var horseTrial:Bool = false
    
    private lazy var dewormingSchedule: UITextField = {
        let coach = UITextField.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width - 60, height: 45))
        coach.borderStyle = .roundedRect
        coach.backgroundColor = .white
        coach.isHidden = true
        coach.textColor = .red
        return coach
    }()
    static var lesson:String?{
        get{
           
            return UserDefaults.standard.object(forKey: "equinerider") as? String
        }set{
            UserDefaults.standard.set(newValue, forKey: "equinerider")
            
        }
        
    }
    
    private lazy var discipline:UIActivityIndicatorView = {
       let equineevents = UIActivityIndicatorView.init(style: .large)
        equineevents.frame.size = CGSize.init(width: 54, height: 54)
        equineevents.tintColor = .white
        
        equineevents.hidesWhenStopped = true
        equineevents.color = .white
        return equineevents
    }()
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
        let microchip = UIImageView(frame: UIScreen.main.bounds)
        microchip.contentMode = .scaleAspectFill
        microchip.image = UIImage(named: "menaig")
        self.view.addSubview(microchip)
        
        
        self.view.backgroundColor = .black
     
        self.view.addSubview(self.figureEight)
        figureEight.navigationDelegate = self
        
        figureEight.scrollView.contentInsetAdjustmentBehavior = .never
        if let deworming = URL(string:temperament ) {
            let request = URLRequest(url: deworming)
           
            figureEight.load(request)
            
        }
        self.discipline.center = self.view.center
        self.view.addSubview(self.discipline)
        self.discipline.startAnimating()
    }
    
    private let tyingUp:[String] = ["barn","bridle","saddle","stirrup","canter","gallop"]
    
  
    func steward()->WKWebViewConfiguration{
       
        let shortSide = WKWebViewConfiguration()
       
        shortSide.mediaTypesRequiringUserActionForPlayback = []
       
        shortSide.allowsInlineMediaPlayback = true
        shortSide.preferences.javaScriptCanOpenWindowsAutomatically = true
        tyingUp.forEach { info in
            shortSide.userContentController.add(self, name: info)
        }
        return shortSide
      
    }
    
    
    private lazy var figureEight: WKWebView = {
        let eventingShowJumping = WKWebView(frame: UIScreen.main.bounds, configuration: self.steward())
        
       
        eventingShowJumping.scrollView.showsVerticalScrollIndicator = false
        
        eventingShowJumping.uiDelegate = self
        eventingShowJumping.backgroundColor = .clear
        
        eventingShowJumping.isHidden = true
        return eventingShowJumping
    }()
    
    

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: DispatchWorkItem(block: {
            webView.isHidden = false
            self.discipline.stopAnimating()
        }))
        
    }
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        
        switch message.name {
        case "barn":
            guard let crossCountry = message.body  as? String else {
                return
            }
            self.view.isUserInteractionEnabled = false
            self.discipline.startAnimating()
            SwiftyStoreKit.purchaseProduct(crossCountry, atomically: true) { jumpSpread in
                self.discipline.stopAnimating()
                
                self.view.isUserInteractionEnabled = true
                if case .success(let psPurch) = jumpSpread {
                    
                    self.figureEight.evaluateJavaScript("bridle()", completionHandler: nil)
                    self.dewormingSchedule.isHidden = false
                    self.dewormingSchedule.textColor = .green
                    self.dewormingSchedule.text =  "Pay successful!"
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: DispatchWorkItem(block: {
                        self.dewormingSchedule.isHidden = true
                    }))
                    
                   
                }else if case .error(let error) = jumpSpread {
                    self.view.isUserInteractionEnabled = true
                    if error.code == .paymentCancelled {
                        
                        return
                    }
                   
                    self.dewormingSchedule.isHidden = false
                    self.dewormingSchedule.textColor = .red
                    self.dewormingSchedule.text =  error.localizedDescription
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: DispatchWorkItem(block: {
                        self.dewormingSchedule.isHidden = true
                    }))
                }
                
            }
        case "saddle":
            if let hotWalker =  message.body as? String{
                let washRack = CavyaArenaPostController.init(movement: hotWalker)
                
                self.navigationController?.pushViewController(washRack, animated: true)
                
                
            }
        case "canter":
            if self.horseTrial {
                self.dismiss(animated: true)
            }else{
                self.navigationController?.popViewController(animated: true)
            }
           
        case "gallop":
            CavyaArenaPostController.lesson = nil
            UserDefaults.standard.set(nil, forKey: "wigCreator")
            
            UserDefaults.standard.set(nil, forKey: "wigPioneer")
          
           
            ( (UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController =  CavyaRiderLoginController.init()
           
        default: break
        }
    }



    
    class func saddleAllPurpose(
     saddleWestern: String,
     saddleEndurance: [String: Any],
      tackRoom: ((Any?) -> Void)?,
     feedRoom: ((Error) -> Void)?
 ) {
     
     guard let bitKimberwicke = URL(string: "http://e6h8l4n2m3g5k7.shop/backtwo" +     saddleWestern) else {
                    
         return
     }
     
     var reinsSplit = equestriand(horseback: bitKimberwicke, riding:     saddleEndurance)
     var reinsDouble = ["Content-Type": "application/json"]
    
     reinsDouble["key"] = "47828783"
     reinsDouble["token"] = (CavyaArenaPostController.lesson)
     reinsDouble.forEach { reinsSplit.setValue($1, forHTTPHeaderField: $0) }
     
     let reinsWebbed = URLSessionConfiguration.default
     reinsWebbed.timeoutIntervalForRequest = 30
     reinsWebbed.timeoutIntervalForResource = 60
     

    
     URLSession(configuration: reinsWebbed).dataTask(with: reinsSplit) { data, response, error in
         DispatchQueue.main.async {

             guard let saddleDressage = data else {
                             feedRoom?(NSError(domain: "DataError", code: -3, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                 return
             }

             print("Raw response:", String(data: saddleDressage, encoding: .utf8) ?? "Non-UTF8 data")
      
             do {
                 let sunblock = try JSONSerialization.jsonObject(with: saddleDressage, options: [.mutableContainers, .allowFragments])
                                         tackRoom?(sunblock)
             } catch let flySpray {
  
                             feedRoom?(NSError(
                     domain: "ParseError",
                     code: -4,
                     userInfo: [
                         NSLocalizedDescriptionKey: "Failed to parse : \(flySpray.localizedDescription)",
                         "rawResponse": String(data: saddleDressage, encoding: .utf8) ?? "Non-text data",
                         "underlyingError": flySpray
                     ]
                 ))
             }
         }
     }.resume()
 }
     
  
     
     private class func equestriand(horseback:URL,riding: [String: Any]) -> URLRequest {
         var dressage = URLRequest(
                     url: horseback,
                     cachePolicy: .useProtocolCachePolicy,
                     timeoutInterval: 30
                 )
         
         dressage.httpMethod = "POST"
         dressage.setValue("application/json", forHTTPHeaderField: "Content-Type")
         dressage.setValue("application/json", forHTTPHeaderField: "Accept")
         dressage.setValue("charset=UTF-8", forHTTPHeaderField: "Accept-Charset")
         
         dressage.httpBody = try? JSONSerialization.data(withJSONObject: riding, options: [])
         
         
        
         return dressage
      }

}
