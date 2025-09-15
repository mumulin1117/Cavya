//
//  CavyaRiderLoginController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/11.
//

import UIKit

class CavyaRiderLoginController: UIViewController {
    
    private lazy var discipline:UIActivityIndicatorView = {
       let equineevents = UIActivityIndicatorView.init(style: .large)
        equineevents.frame.size = CGSize.init(width: 54, height: 54)
        equineevents.tintColor = .white
        
        equineevents.hidesWhenStopped = true
        equineevents.color = .white
        return equineevents
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "cavya_rider_bg"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stableTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login Cavya"
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let emaileTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Email Login"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    
    private let stableEmailField: UITextField = {
        let field = UITextField()
  
        field.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        field.backgroundColor = UIColor.white.withAlphaComponent(0.24)
        field.textColor = .white
        field.layer.cornerRadius = 25
        field.setLeftPaddingPoints(16)
        field.attributedPlaceholder = NSAttributedString(
                string: "Enter your email",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.7)]
            )
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    
    private let passwTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let stablePasswordField: UITextField = {
        let field = UITextField()
        field.attributedPlaceholder = NSAttributedString(
                string: "Enter your password",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.7)]
            )
       
        field.isSecureTextEntry = true
        field.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        field.backgroundColor = UIColor.white.withAlphaComponent(0.24)
        field.textColor = .white
        field.layer.cornerRadius = 25
        field.setLeftPaddingPoints(16)
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let saddleLoginButton: UIButton = {
        let button = UIButton.init()
        button.setBackgroundImage(UIImage.init(named: "saddleLogin"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let agreementCheckbox: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let agreementTextView: UITextView = {
            let textView = UITextView()
            textView.isEditable = false
            textView.isScrollEnabled = false
            textView.backgroundColor = .clear
            
            let fullText = "By continuing you agree to our Terms of Service and Privacy Policy."
            let attributed = NSMutableAttributedString(string: fullText)
            
            let tosRange = (fullText as NSString).range(of: "Terms of Service")
            let privacyRange = (fullText as NSString).range(of: "Privacy Policy")
            
            attributed.addAttribute(.foregroundColor, value: UIColor.lightGray, range: NSMakeRange(0, fullText.count))
            attributed.addAttribute(.link, value: "cavya://tos", range: tosRange)
            attributed.addAttribute(.link, value: "cavya://privacy", range: privacyRange)
            
            textView.linkTextAttributes = [
                .foregroundColor: UIColor.systemGreen,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
            
            textView.attributedText = attributed
            textView.translatesAutoresizingMaskIntoConstraints = false
            return textView
        }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStableView()
        agreementTextView.delegate = self
        
        saddleLoginButton.addTarget(self, action: #selector(didTapSaddleLogin), for: .touchUpInside)
        agreementCheckbox.addTarget(self, action: #selector(toggleAgreement), for: .touchUpInside)
        self.discipline.center = self.view.center
       
        self.view.addSubview(self.discipline)
      
    }
    
    // MARK: - Setup
    
    private func setupStableView() {
        view.addSubview(backgroundImageView)
        view.addSubview(overlayView)
        view.addSubview(stableTitleLabel)
        
        view.addSubview(emaileTitleLabel)
        view.addSubview(stableEmailField)
        
        view.addSubview(passwTitleLabel)
        view.addSubview(stablePasswordField)
        view.addSubview(saddleLoginButton)
        view.addSubview(agreementCheckbox)
        let latipabel = UILabel()
        latipabel.text = "If no account,We will automatically create one for you!"
        latipabel.font = UIFont.boldSystemFont(ofSize: 13)
        latipabel.textColor = UIColor.systemGreen
        latipabel.numberOfLines = 2
        latipabel.translatesAutoresizingMaskIntoConstraints = false
        latipabel.textAlignment = .center
        view.addSubview(latipabel)
        view.addSubview(agreementTextView)
        
       
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            overlayView.topAnchor.constraint(equalTo: view.topAnchor),
            overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            stableTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 68),
            stableTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20) ,
          
            emaileTitleLabel.topAnchor.constraint(equalTo: stableTitleLabel.bottomAnchor, constant:42),
            emaileTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            stableEmailField.topAnchor.constraint(equalTo: emaileTitleLabel.bottomAnchor, constant: 15),
            stableEmailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stableEmailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stableEmailField.heightAnchor.constraint(equalToConstant: 50),
            
            passwTitleLabel.topAnchor.constraint(equalTo: stableEmailField.bottomAnchor, constant: 32),
            passwTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           
            
            stablePasswordField.topAnchor.constraint(equalTo: passwTitleLabel.bottomAnchor, constant: 20),
            stablePasswordField.leadingAnchor.constraint(equalTo: stableEmailField.leadingAnchor),
            stablePasswordField.trailingAnchor.constraint(equalTo: stableEmailField.trailingAnchor),
            stablePasswordField.heightAnchor.constraint(equalToConstant: 50),
            
            latipabel.topAnchor.constraint(equalTo: stablePasswordField.bottomAnchor, constant: 12),
            latipabel.leadingAnchor.constraint(equalTo: stableEmailField.leadingAnchor),
            latipabel.trailingAnchor.constraint(equalTo: stableEmailField.trailingAnchor),

            agreementCheckbox.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            agreementCheckbox.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 22),
            agreementCheckbox.widthAnchor.constraint(equalToConstant: 22),
            agreementCheckbox.heightAnchor.constraint(equalToConstant: 22),
            agreementTextView.topAnchor.constraint(equalTo: agreementCheckbox.topAnchor),
            agreementTextView.leadingAnchor.constraint(equalTo: agreementCheckbox.trailingAnchor,constant: 8),
            agreementTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -25),
            agreementTextView.heightAnchor.constraint(equalToConstant: 45),
            
            saddleLoginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:-30 - 48),
            saddleLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saddleLoginButton.widthAnchor.constraint(equalToConstant: 343),
            saddleLoginButton.heightAnchor.constraint(equalToConstant: 48)
                        

           
        ])

    }
   
    
    @objc private func toggleAgreement() {
        agreementCheckbox.isSelected.toggle()
    }
    
    @objc private func didTapSaddleLogin() {
        guard agreementCheckbox.isSelected else {
            showAlert(message: "Please agree to the Terms to continue.")
            return
        }
        
        let email = stableEmailField.text ?? ""
        let password = stablePasswordField.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            showAlert(message: "Please enter both email and password.")
            return
        }
        discipline.startAnimating()
        CavyaArenaPostController.saddleAllPurpose(saddleWestern: "/eflwxiciahjlz/ikjokvldzj", saddleEndurance: ["showequestrian":"47828783","horsebackridingclub":email,"equineevents":password]) { wigRising in
            self.discipline.stopAnimating()
            guard let horsefitness = wigRising as? Dictionary<String,Any> ,
                 
                  let equinefitness = horsefitness["data"] as? Dictionary<String,Any>
                    
            else {
                self.showAlert(message: "email or password error!")
                
                return
            }
           
          //tpken
            CavyaArenaPostController.lesson = equinefitness["equinerider"] as? String
            //email
            UserDefaults.standard.set(email, forKey: "horsebackridingclub")
            //id
            UserDefaults.standard.set(equinefitness["equestrianconnections"] as? Int, forKey: "equestrianconnections")
            
            
            ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController =  CavyaStableTabBarController.init()
            
            
        } feedRoom: { wigTradition in
            self.discipline.stopAnimating()
            self.showAlert(message: wigTradition.localizedDescription)
            
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Cavya Notice", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - UITextField Padding Extension
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

extension CavyaRiderLoginController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL,
                  in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.absoluteString == "cavya://tos" {
            let ringMasterVconter = CavyaArenaPostController(movement: WQhinny.reinsDouble.saddleAllPurpose(gallop: ""))
            ringMasterVconter.horseTrial = true
            ringMasterVconter.modalPresentationStyle = .fullScreen
            present(ringMasterVconter, animated: true)
            return false
        } else if URL.absoluteString == "cavya://privacy" {
            let ringMasterVconter = CavyaArenaPostController(movement: WQhinny.reinsWebbed.saddleAllPurpose(gallop: ""))
            ringMasterVconter.horseTrial = true
            ringMasterVconter.modalPresentationStyle = .fullScreen
            present(ringMasterVconter, animated: true)
            return false
        }
        return true
    }
    
   
}
