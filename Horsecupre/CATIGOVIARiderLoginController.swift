//
//  CATIGOVIARiderLoginController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/11.
//

import UIKit

class CATIGOVIARiderLoginController: UIViewController {
    
    private lazy var CATIGOVIAdiscipline: UIActivityIndicatorView = {
 
        func CATIGOVIAforgeArena(CATIGOVIAstyle: UIActivityIndicatorView.Style) -> UIActivityIndicatorView {
            let CATIGOVIAgear = UIActivityIndicatorView(style: CATIGOVIAstyle)
            CATIGOVIAgear.hidesWhenStopped = true
            return CATIGOVIAgear
        }
        
        let CATIGOVIAequineSpinner = CATIGOVIAforgeArena(CATIGOVIAstyle: .large)
     
        CATIGOVIAequineSpinner.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
      
        if Bool.random() {
            CATIGOVIAequineSpinner.color = .white
        } else {
            CATIGOVIAequineSpinner.color = UIColor(white: 1.0, alpha: 1.0)
        }
        CATIGOVIAequineSpinner.frame.size = CGSize(width: 45, height: 45)
        return CATIGOVIAequineSpinner
    }()

    
    private let CATIGOVIAbackgroundImageView: UIImageView = {
        let CATIGOVIAView = UIImageView(image: UIImage(named: "CATIGOVIAcavya_rider_bg"))
        CATIGOVIAView.contentMode = .scaleAspectFill
        CATIGOVIAView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAView
    }()
    
    private let CATIGOVIAoverlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let CATIGOVIAstableTitleLabel: UILabel = {
        let CATIGOVIAlabel = UILabel()
        CATIGOVIAlabel.text = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Ljodgbirna jCwapvoypa")
        CATIGOVIAlabel.font = UIFont.boldSystemFont(ofSize: 36)
        CATIGOVIAlabel.textColor = .white
        CATIGOVIAlabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAlabel
    }()
    
    
    private let CATIGOVIAemaileTitleLabel: UILabel = {
        let CATIGOVIAlabel = UILabel()
        CATIGOVIAlabel.text = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Exmyatixlp iLfotghixn")
        CATIGOVIAlabel.font = UIFont.boldSystemFont(ofSize: 18)
        CATIGOVIAlabel.textColor = .white
        CATIGOVIAlabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAlabel
    }()
   
    
    private let CATIGOVIAstableEmailField: UITextField = {
        let CATIGOVIAfield = UITextField()
  
        CATIGOVIAfield.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        CATIGOVIAfield.backgroundColor = UIColor.white.withAlphaComponent(0.24)
        CATIGOVIAfield.textColor = .white
        CATIGOVIAfield.layer.cornerRadius = 25
        CATIGOVIAfield.CATIGOVIAsetLeftPaddingPoints(16)
        CATIGOVIAfield.attributedPlaceholder = NSAttributedString(
                string: CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Eonutcesrr byioquhrl hevmjajidl"),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.7)]
            )
        CATIGOVIAfield.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAfield
    }()
    
    
    
    private let CATIGOVIApasswTitleLabel: UILabel = {
        let CATIGOVIAbel = UILabel()
        CATIGOVIAbel.text = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Psasskslwnolrjd")
        CATIGOVIAbel.font = UIFont.boldSystemFont(ofSize: 18)
        CATIGOVIAbel.textColor = .white
        CATIGOVIAbel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAbel
    }()
    private let CATIGOVIAstablePasswordField: UITextField = {
        let CATIGOVIAfield = UITextField()
        CATIGOVIAfield.attributedPlaceholder = NSAttributedString(
                string: CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Efnytzeirt mynokugrh opqazsjsawdolrkd"),
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.7)]
            )
       
        CATIGOVIAfield.isSecureTextEntry = true
        CATIGOVIAfield.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        CATIGOVIAfield.backgroundColor = UIColor.white.withAlphaComponent(0.24)
        CATIGOVIAfield.textColor = .white
        CATIGOVIAfield.layer.cornerRadius = 25
        CATIGOVIAfield.CATIGOVIAsetLeftPaddingPoints(16)
        CATIGOVIAfield.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAfield
    }()
    
    private let CATIGOVIAsaddleLoginButton: UIButton = {
        let CATIGOVIAbutton = UIButton.init()
        CATIGOVIAbutton.setBackgroundImage(UIImage.init(named: "CATIGOVIAsaddleLogin"), for: .normal)
        CATIGOVIAbutton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAbutton
    }()
    
    private let CATIGOVIAagreementCheckbox: UIButton = {
        let CATIGOVIAbutton = UIButton(type: .custom)
        CATIGOVIAbutton.setImage(UIImage(named:"CATIGOVIAcircle"), for: .normal)
        CATIGOVIAbutton.setImage(UIImage(named: "CATIGOVIAcheckmark.circle.fill"), for: .selected)
        CATIGOVIAbutton.tintColor = .white
        CATIGOVIAbutton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAbutton
    }()
    
    private let CATIGOVIAagreementTextView: UITextView = {
            let CATIGOVIAtextView = UITextView()
            CATIGOVIAtextView.isEditable = false
            CATIGOVIAtextView.isScrollEnabled = false
            CATIGOVIAtextView.backgroundColor = .clear
            
            let fullText = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Bhyw acuownptjijnnubilnrgl gyhoiux caugmrbeiel qtcoh fosumrv oTyejrdmtsh cokff kSyegrtvfihcoer qaenhds yPgrcipvmaeckyp oPvorljijclyh.")
            let attributed = NSMutableAttributedString(string: fullText)
            
            let tosRange = (fullText as NSString).range(of: CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Tkegrymxsc loqfp iSuekraviiwche"))
            let privacyRange = (fullText as NSString).range(of: CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Pbreikvlaccfyg lPtohluilcby"))
            
            attributed.addAttribute(.foregroundColor, value: UIColor.lightGray, range: NSMakeRange(0, fullText.count))
            attributed.addAttribute(.link, value: "cavya://tos", range: tosRange)
            attributed.addAttribute(.link, value: "cavya://privacy", range: privacyRange)
            
            CATIGOVIAtextView.linkTextAttributes = [
                .foregroundColor: UIColor.systemGreen,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
            
            CATIGOVIAtextView.attributedText = attributed
            CATIGOVIAtextView.translatesAutoresizingMaskIntoConstraints = false
            return CATIGOVIAtextView
        }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CATIGOVIAsetupStableView()
        CATIGOVIAagreementTextView.delegate = self
        
        CATIGOVIAsaddleLoginButton.addTarget(self, action: #selector(CATIGOVIAdidTapSaddleLogin), for: .touchUpInside)
        CATIGOVIAagreementCheckbox.addTarget(self, action: #selector(CATIGOVIAtoggleAgreement), for: .touchUpInside)
        self.CATIGOVIAdiscipline.center = self.view.center
       
        self.view.addSubview(self.CATIGOVIAdiscipline)
      
    }
    
    // MARK: - Setup
    
    private func CATIGOVIAsetupStableView() {
        view.addSubview(CATIGOVIAbackgroundImageView)
        view.addSubview(CATIGOVIAoverlayView)
        view.addSubview(CATIGOVIAstableTitleLabel)
        
        view.addSubview(CATIGOVIAemaileTitleLabel)
        view.addSubview(CATIGOVIAstableEmailField)
        
        view.addSubview(CATIGOVIApasswTitleLabel)
        view.addSubview(CATIGOVIAstablePasswordField)
        view.addSubview(CATIGOVIAsaddleLoginButton)
        view.addSubview(CATIGOVIAagreementCheckbox)
        let CATIGOVIAlatipabel = UILabel()
        CATIGOVIAlatipabel.text = "If no account,We will automatically create one for you!"
        CATIGOVIAlatipabel.font = UIFont.boldSystemFont(ofSize: 13)
        CATIGOVIAlatipabel.textColor = UIColor.systemGreen
        CATIGOVIAlatipabel.numberOfLines = 2
        CATIGOVIAlatipabel.translatesAutoresizingMaskIntoConstraints = false
        CATIGOVIAlatipabel.textAlignment = .center
        view.addSubview(CATIGOVIAlatipabel)
        view.addSubview(CATIGOVIAagreementTextView)
        
       
        NSLayoutConstraint.activate([
            CATIGOVIAbackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            CATIGOVIAbackgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            CATIGOVIAbackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            CATIGOVIAbackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            CATIGOVIAoverlayView.topAnchor.constraint(equalTo: view.topAnchor),
            CATIGOVIAoverlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            CATIGOVIAoverlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            CATIGOVIAoverlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            CATIGOVIAstableTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 68),
            CATIGOVIAstableTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20) ,
          
            CATIGOVIAemaileTitleLabel.topAnchor.constraint(equalTo: CATIGOVIAstableTitleLabel.bottomAnchor, constant:42),
            CATIGOVIAemaileTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            CATIGOVIAstableEmailField.topAnchor.constraint(equalTo: CATIGOVIAemaileTitleLabel.bottomAnchor, constant: 15),
            CATIGOVIAstableEmailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            CATIGOVIAstableEmailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            CATIGOVIAstableEmailField.heightAnchor.constraint(equalToConstant: 50),
            
            CATIGOVIApasswTitleLabel.topAnchor.constraint(equalTo: CATIGOVIAstableEmailField.bottomAnchor, constant: 32),
            CATIGOVIApasswTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           
            
            CATIGOVIAstablePasswordField.topAnchor.constraint(equalTo: CATIGOVIApasswTitleLabel.bottomAnchor, constant: 20),
            CATIGOVIAstablePasswordField.leadingAnchor.constraint(equalTo: CATIGOVIAstableEmailField.leadingAnchor),
            CATIGOVIAstablePasswordField.trailingAnchor.constraint(equalTo: CATIGOVIAstableEmailField.trailingAnchor),
            CATIGOVIAstablePasswordField.heightAnchor.constraint(equalToConstant: 50),
            
            CATIGOVIAlatipabel.topAnchor.constraint(equalTo: CATIGOVIAstablePasswordField.bottomAnchor, constant: 12),
            CATIGOVIAlatipabel.leadingAnchor.constraint(equalTo: CATIGOVIAstableEmailField.leadingAnchor),
            CATIGOVIAlatipabel.trailingAnchor.constraint(equalTo: CATIGOVIAstableEmailField.trailingAnchor),

            CATIGOVIAagreementCheckbox.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            CATIGOVIAagreementCheckbox.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 22),
            CATIGOVIAagreementCheckbox.widthAnchor.constraint(equalToConstant: 22),
            CATIGOVIAagreementCheckbox.heightAnchor.constraint(equalToConstant: 22),
            CATIGOVIAagreementTextView.topAnchor.constraint(equalTo: CATIGOVIAagreementCheckbox.topAnchor),
            CATIGOVIAagreementTextView.leadingAnchor.constraint(equalTo: CATIGOVIAagreementCheckbox.trailingAnchor,constant: 8),
            CATIGOVIAagreementTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
            CATIGOVIAagreementTextView.heightAnchor.constraint(equalToConstant: 45),
            
            CATIGOVIAsaddleLoginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:-30 - 48),
            CATIGOVIAsaddleLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            CATIGOVIAsaddleLoginButton.widthAnchor.constraint(equalToConstant: 343),
            CATIGOVIAsaddleLoginButton.heightAnchor.constraint(equalToConstant: 48)
                        

           
        ])

    }
   
    
    @objc private func CATIGOVIAtoggleAgreement() {
        CATIGOVIAagreementCheckbox.isSelected.toggle()
    }
    
    @objc private func CATIGOVIAdidTapSaddleLogin() {
        guard CATIGOVIAagreementCheckbox.isSelected else {
            CATIGOVIAshowAlert(CATIGOVIAmessage: CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Pglnemakswey eabgkrqecem htdok dthhuew rTvebrvmgsr ctqos fcdojnmtiisnruieu."))
            return
        }
        
        let CATIGOVIAemail = CATIGOVIAstableEmailField.text ?? ""
        let CATIGOVIApassword = CATIGOVIAstablePasswordField.text ?? ""
        
        if CATIGOVIAemail.isEmpty || CATIGOVIApassword.isEmpty {
            CATIGOVIAshowAlert(CATIGOVIAmessage: CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Pxlaeaaksgev iemnttfegrn pbloetghl geamwacialb aapnxdo gpiassnsuwaobrsdq."))
            return
        }
        CATIGOVIAdiscipline.startAnimating()
        CATIGOVIAStableNetwork.CATIGOVIAsaddleAllPurpose(        CATIGOVIAsaddleWestern: "/pefcyqolzdz/oqwjsn",         CATIGOVIAsaddleEndurance: ["momentumControl":"47828783","balancePoint":CATIGOVIAemail,"centerOfGravity":CATIGOVIApassword]) { wigRising in
            let ffsdf = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "deaatfa")
            self.CATIGOVIAdiscipline.stopAnimating()
            guard let CATIGOVIAhorsefitness = wigRising as? Dictionary<String,Any> ,
                 
                  let CATIGOVIAequinefitness = CATIGOVIAhorsefitness[ffsdf] as? Dictionary<String,Any>
                    
            else {
                self.CATIGOVIAshowAlert(CATIGOVIAmessage:CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "ecmtajiwlm toird dpoagsbsfwuoqrqdb eerrhrvoyrw!") )
                
                return
            }
           
          //tpken
            CATIGOVIAArenaPostController.CATIGOVIAlesson = CATIGOVIAequinefitness["neckExtension"] as? String
            //email
            UserDefaults.standard.set(CATIGOVIAemail, forKey: "horsebackridingclub")
            //id handContact
            UserDefaults.standard.set(CATIGOVIAequinefitness["handContact"] as? Int, forKey: "equestrianconnections")
            
            
            ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController =  CATIGOVIAStableTabBarController.init()
            
            
        }         CATIGOVIAfeedRoom: { wigTradition in
            self.CATIGOVIAdiscipline.stopAnimating()
            self.CATIGOVIAshowAlert(CATIGOVIAmessage: wigTradition.localizedDescription)
            
        }
    }
    
    private func CATIGOVIAshowAlert(CATIGOVIAmessage: String) {
        let CATIGOVIAalert = UIAlertController(title: "Cavya Notice", message: CATIGOVIAmessage, preferredStyle: .alert)
        CATIGOVIAalert.addAction(UIAlertAction(title: CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "OxK"), style: .default))
        present(CATIGOVIAalert, animated: true)
    }
}

// MARK: - UITextField Padding Extension
extension UITextField {
    func CATIGOVIAsetLeftPaddingPoints(_ amount:CGFloat){
        let paddingCATIGOVIAView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingCATIGOVIAView
        self.leftViewMode = .always
    }
}

extension CATIGOVIARiderLoginController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL,
                  in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.absoluteString == "cavya://tos" {
            let ringCATIGOVIAMasterVconter = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAWQhinny.CATIGOVIAreinsDouble.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: ""))
            ringCATIGOVIAMasterVconter.CATIGOVIAhorseTrial = true
            ringCATIGOVIAMasterVconter.modalPresentationStyle = .fullScreen
            present(ringCATIGOVIAMasterVconter, animated: true)
            return false
        } else if URL.absoluteString == "cavya://privacy" {
            let ringCATIGOVIAMasterVconter = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAWQhinny.CATIGOVIAreinsWebbed.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: ""))
            ringCATIGOVIAMasterVconter.CATIGOVIAhorseTrial = true
            ringCATIGOVIAMasterVconter.modalPresentationStyle = .fullScreen
            present(ringCATIGOVIAMasterVconter, animated: true)
            return false
        }
        return true
    }
    
   
}
