import UIKit
import AuthenticationServices

class CATIGOVIARiderLoginController: UIViewController {
    
    private enum CATIGOVIACommunityMode {
        case welcome
        case login
        case register
    }
    
    private struct CATIGOVIAJourneyKeys {
        static let CATIGOVIAregisteredEmails = "tigoo_interest_registered_emails"
        static let CATIGOVIAprofileName = "horsebackridingclub"
        static let CATIGOVIAprofileAvatar = "equestriandressage"
        static let CATIGOVIAprofileId = "equestrianconnections"
        static let CATIGOVIAequipmentNo = "tigoo_equipment_no"
    }
    
    private var CATIGOVIAactiveMode: CATIGOVIACommunityMode = .welcome
    private var CATIGOVIAselectedAvatarData: Data?
    private var CATIGOVIAformTopConstraint: NSLayoutConstraint?
    private var CATIGOVIAregisterTopConstraint: NSLayoutConstraint?
    private var CATIGOVIAwelcomeCenterConstraint: NSLayoutConstraint?
    private weak var CATIGOVIAactiveTextField: UITextField?
    
    private lazy var CATIGOVIAdiscipline: UIActivityIndicatorView = {
        let CATIGOVIAspinner = UIActivityIndicatorView(style: .large)
        CATIGOVIAspinner.hidesWhenStopped = true
        CATIGOVIAspinner.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        CATIGOVIAspinner.color = .white
        CATIGOVIAspinner.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAspinner
    }()
    
    private let CATIGOVIAbackgroundImageView: UIImageView = {
       
        let CATIGOVIAView = UIImageView()
        CATIGOVIAView.contentMode = .scaleAspectFill
        CATIGOVIAView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAView
    }()
    
    private let CATIGOVIAoverlayView: UIView = {
        let CATIGOVIAView = UIView()
        CATIGOVIAView.backgroundColor = UIColor.black.withAlphaComponent(0.36)
        CATIGOVIAView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAView
    }()
    
    private let CATIGOVIAwelcomeStack: UIStackView = {
        let CATIGOVIAStack = UIStackView()
        CATIGOVIAStack.axis = .vertical
        CATIGOVIAStack.spacing = 14
        CATIGOVIAStack.alignment = .fill
        CATIGOVIAStack.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAStack
    }()
    
    private let CATIGOVIAbrandBadge: UIImageView = {
        let CATIGOVIALabel = UIImageView.init(image: UIImage.init(named: "CATIGOVIAbrandBadge"))
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    private lazy var CATIGOVIAwelcomeLoginButton: UIButton = CATIGOVIAtrailButton(CATIGOVIAtitle: "Log in", CATIGOVIAgradient: true)
    private lazy var CATIGOVIAwelcomeRegisterButton: UIButton = CATIGOVIAtrailButton(CATIGOVIAtitle: "Sign up", CATIGOVIAgradient: false)
    
    private let CATIGOVIAstableTitleLabel: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.text = "Login Cavya"
        CATIGOVIALabel.font = UIFont(name: "GillSans-BoldItalic", size: 25) ?? .boldSystemFont(ofSize: 25)
        CATIGOVIALabel.textColor = .white
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    private let CATIGOVIAloginFormStack: UIStackView = {
        let CATIGOVIAStack = UIStackView()
        CATIGOVIAStack.axis = .vertical
        CATIGOVIAStack.spacing = 13
        CATIGOVIAStack.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAStack
    }()
    
    private lazy var CATIGOVIAstableEmailField: UITextField = CATIGOVIApastureField(CATIGOVIAplaceholder: "Enter your email", CATIGOVIAsecure: false)
    private lazy var CATIGOVIAstablePasswordField: UITextField = CATIGOVIApastureField(CATIGOVIAplaceholder: "Enter your password", CATIGOVIAsecure: true)
    private lazy var CATIGOVIAsaddleLoginButton: UIButton = CATIGOVIAtrailButton(CATIGOVIAtitle: "login", CATIGOVIAgradient: true)
    
    private let CATIGOVIAregisterStack: UIStackView = {
        let CATIGOVIAStack = UIStackView()
        CATIGOVIAStack.axis = .vertical
        CATIGOVIAStack.spacing = 13
        CATIGOVIAStack.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAStack
    }()
    
    private let CATIGOVIAavatarButton: UIButton = {
        let CATIGOVIAButton = UIButton()
        CATIGOVIAButton.setImage(UIImage.init(named: "CATIGOVIAavatarButton"), for: .normal)
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAButton
    }()
    
    private lazy var CATIGOVIAnameField: UITextField = CATIGOVIApastureField(CATIGOVIAplaceholder: "Enter your name", CATIGOVIAsecure: false)
    private lazy var CATIGOVIAregisterEmailField: UITextField = CATIGOVIApastureField(CATIGOVIAplaceholder: "Enter your email", CATIGOVIAsecure: false)
    private lazy var CATIGOVIAregisterPasswordField: UITextField = CATIGOVIApastureField(CATIGOVIAplaceholder: "Enter your password", CATIGOVIAsecure: true)
    private lazy var CATIGOVIAregisterButton: UIButton = CATIGOVIAtrailButton(CATIGOVIAtitle: "Sign Up", CATIGOVIAgradient: true)
    
    private let CATIGOVIAagreementCheckbox: UIButton = {
        let CATIGOVIAButton = UIButton(type: .custom)
        CATIGOVIAButton.setImage(UIImage(named:"CATIGOVIAcircle"), for: .normal)
        CATIGOVIAButton.setImage(UIImage(named: "CATIGOVIAcheckmark.circle.fill"), for: .selected)
        CATIGOVIAButton.tintColor = .white
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAButton
    }()
    
    private let CATIGOVIAagreementTextView: UITextView = {
        let CATIGOVIATextView = UITextView()
        CATIGOVIATextView.isEditable = false
        CATIGOVIATextView.isScrollEnabled = false
        CATIGOVIATextView.textContainerInset = .zero
        CATIGOVIATextView.textContainer.lineFragmentPadding = 0
        CATIGOVIATextView.backgroundColor = .clear
        let CATIGOVIAFullText = "By continuing you agree to our Terms of Service and Privacy Policy."
        let CATIGOVIAAttributed = NSMutableAttributedString(string: CATIGOVIAFullText)
        let CATIGOVIATosRange = (CATIGOVIAFullText as NSString).range(of: "Terms of Service")
        let CATIGOVIAPrivacyRange = (CATIGOVIAFullText as NSString).range(of: "Privacy Policy")
        CATIGOVIAAttributed.addAttribute(.foregroundColor, value: UIColor.white.withAlphaComponent(0.58), range: NSMakeRange(0, CATIGOVIAFullText.count))
        CATIGOVIAAttributed.addAttribute(.font, value: UIFont.systemFont(ofSize: 10, weight: .regular), range: NSMakeRange(0, CATIGOVIAFullText.count))
        CATIGOVIAAttributed.addAttribute(.link, value: "cavya://tos", range: CATIGOVIATosRange)
        CATIGOVIAAttributed.addAttribute(.link, value: "cavya://privacy", range: CATIGOVIAPrivacyRange)
        CATIGOVIATextView.linkTextAttributes = [
            .foregroundColor: UIColor.white,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        CATIGOVIATextView.attributedText = CATIGOVIAAttributed
        CATIGOVIATextView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIATextView
    }()
    
    private let CATIGOVIAappleButton: UIButton = {
        let CATIGOVIAButton = UIButton(type: .custom)
        CATIGOVIAButton.setTitle("", for: .normal)
        CATIGOVIAButton.setTitleColor(.white, for: .normal)
        CATIGOVIAButton.titleLabel?.font = UIFont.systemFont(ofSize: 58, weight: .regular)
        CATIGOVIAButton.backgroundColor = .clear
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAButton
    }()
    
    private let CATIGOVIAbackButton: UIButton = {
        let CATIGOVIAButton = UIButton(type: .custom)
        CATIGOVIAButton.setTitle("‹", for: .normal)
        CATIGOVIAButton.titleLabel?.font = .systemFont(ofSize: 34, weight: .regular)
        CATIGOVIAButton.setTitleColor(.white, for: .normal)
        CATIGOVIAButton.backgroundColor = UIColor.white.withAlphaComponent(0.16)
        CATIGOVIAButton.layer.cornerRadius = 17
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CATIGOVIAprepareTigooView()
        CATIGOVIAbindJourneyActions()
        CATIGOVIAprepareKeyboardTrail()
        CATIGOVIApresentMode(.welcome, CATIGOVIAanimated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        [CATIGOVIAwelcomeLoginButton, CATIGOVIAsaddleLoginButton, CATIGOVIAregisterButton].forEach { CATIGOVIArefreshGradient(CATIGOVIAbutton: $0) }
        CATIGOVIAavatarButton.layer.cornerRadius = CATIGOVIAavatarButton.bounds.width / 2
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func CATIGOVIAprepareTigooView() {
    
        CATIGOVIAbackgroundImageView.image = UIImage(named: "CATIGOVIAcavya_rider_bgwelcome")
        
        
        view.backgroundColor = .black
        view.addSubview(CATIGOVIAbackgroundImageView)
        view.addSubview(CATIGOVIAoverlayView)
        view.addSubview(CATIGOVIAbrandBadge)
        view.addSubview(CATIGOVIAwelcomeStack)
        view.addSubview(CATIGOVIAstableTitleLabel)
        view.addSubview(CATIGOVIAloginFormStack)
        view.addSubview(CATIGOVIAregisterStack)
        view.addSubview(CATIGOVIAagreementCheckbox)
        view.addSubview(CATIGOVIAagreementTextView)
        view.addSubview(CATIGOVIAappleButton)
        view.addSubview(CATIGOVIAbackButton)
        view.addSubview(CATIGOVIAdiscipline)
        
        CATIGOVIAwelcomeStack.addArrangedSubview(CATIGOVIAwelcomeLoginButton)
        CATIGOVIAwelcomeStack.addArrangedSubview(CATIGOVIAwelcomeRegisterButton)
        
        CATIGOVIAappendLabel("Email Login", CATIGOVIAto: CATIGOVIAloginFormStack)
        CATIGOVIAloginFormStack.addArrangedSubview(CATIGOVIAstableEmailField)
        CATIGOVIAappendLabel("Password", CATIGOVIAto: CATIGOVIAloginFormStack)
        CATIGOVIAloginFormStack.addArrangedSubview(CATIGOVIAstablePasswordField)
        CATIGOVIAloginFormStack.setCustomSpacing(43, after: CATIGOVIAstablePasswordField)
        CATIGOVIAloginFormStack.addArrangedSubview(CATIGOVIAsaddleLoginButton)
        
        CATIGOVIAregisterStack.addArrangedSubview(CATIGOVIAavatarButton)
        CATIGOVIAavatarButton.widthAnchor.constraint(equalToConstant: 88).isActive = true
        CATIGOVIAavatarButton.heightAnchor.constraint(equalToConstant: 88).isActive = true
        CATIGOVIAavatarButton.centerXAnchor.constraint(equalTo: CATIGOVIAregisterStack.centerXAnchor).isActive = true
        CATIGOVIAappendLabel("Name", CATIGOVIAto: CATIGOVIAregisterStack)
        CATIGOVIAregisterStack.addArrangedSubview(CATIGOVIAnameField)
        CATIGOVIAappendLabel("Email Sign Up", CATIGOVIAto: CATIGOVIAregisterStack)
        CATIGOVIAregisterStack.addArrangedSubview(CATIGOVIAregisterEmailField)
        CATIGOVIAappendLabel("Password", CATIGOVIAto: CATIGOVIAregisterStack)
        CATIGOVIAregisterStack.addArrangedSubview(CATIGOVIAregisterPasswordField)
        CATIGOVIAregisterStack.setCustomSpacing(24, after: CATIGOVIAregisterPasswordField)
        CATIGOVIAregisterStack.addArrangedSubview(CATIGOVIAregisterButton)
        
        CATIGOVIAwelcomeCenterConstraint = CATIGOVIAwelcomeStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: UIScreen.main.bounds.height * 0.19)
        CATIGOVIAformTopConstraint = CATIGOVIAstableTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height * 0.19)
        CATIGOVIAregisterTopConstraint = CATIGOVIAregisterStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIScreen.main.bounds.height * 0.06)
        
        NSLayoutConstraint.activate([
            CATIGOVIAbackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            CATIGOVIAbackgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            CATIGOVIAbackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            CATIGOVIAbackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            CATIGOVIAoverlayView.topAnchor.constraint(equalTo: view.topAnchor),
            CATIGOVIAoverlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            CATIGOVIAoverlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            CATIGOVIAoverlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            CATIGOVIAwelcomeStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * 0.08),
            CATIGOVIAwelcomeStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIScreen.main.bounds.width * 0.08),
            CATIGOVIAwelcomeCenterConstraint!,
            CATIGOVIAbrandBadge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            CATIGOVIAbrandBadge.bottomAnchor.constraint(equalTo: CATIGOVIAwelcomeStack.topAnchor, constant: -18),
            CATIGOVIAbrandBadge.widthAnchor.constraint(equalToConstant: 70),
            CATIGOVIAbrandBadge.heightAnchor.constraint(equalToConstant: 70),
            CATIGOVIAwelcomeLoginButton.heightAnchor.constraint(equalToConstant: 48),
            CATIGOVIAwelcomeRegisterButton.heightAnchor.constraint(equalToConstant: 48),
            CATIGOVIAstableTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * 0.09),
            CATIGOVIAformTopConstraint!,
            CATIGOVIAloginFormStack.topAnchor.constraint(equalTo: CATIGOVIAstableTitleLabel.bottomAnchor, constant: UIScreen.main.bounds.height * 0.035),
            CATIGOVIAloginFormStack.leadingAnchor.constraint(equalTo: CATIGOVIAstableTitleLabel.leadingAnchor),
            CATIGOVIAloginFormStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIScreen.main.bounds.width * 0.045),
            CATIGOVIAstableEmailField.heightAnchor.constraint(equalToConstant: 46),
            CATIGOVIAstablePasswordField.heightAnchor.constraint(equalToConstant: 46),
            CATIGOVIAsaddleLoginButton.heightAnchor.constraint(equalToConstant: 48),
            CATIGOVIAregisterTopConstraint!,
            CATIGOVIAregisterStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * 0.05),
            CATIGOVIAregisterStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIScreen.main.bounds.width * 0.05),
            CATIGOVIAnameField.heightAnchor.constraint(equalToConstant: 46),
            CATIGOVIAregisterEmailField.heightAnchor.constraint(equalToConstant: 46),
            CATIGOVIAregisterPasswordField.heightAnchor.constraint(equalToConstant: 46),
            CATIGOVIAregisterButton.heightAnchor.constraint(equalToConstant: 48),
            CATIGOVIAagreementCheckbox.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            CATIGOVIAagreementCheckbox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIScreen.main.bounds.width * 0.08),
            CATIGOVIAagreementCheckbox.widthAnchor.constraint(equalToConstant: 20),
            CATIGOVIAagreementCheckbox.heightAnchor.constraint(equalToConstant: 20),
            CATIGOVIAagreementTextView.topAnchor.constraint(equalTo: CATIGOVIAagreementCheckbox.topAnchor),
            CATIGOVIAagreementTextView.leadingAnchor.constraint(equalTo: CATIGOVIAagreementCheckbox.trailingAnchor, constant: 7),
            CATIGOVIAagreementTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UIScreen.main.bounds.width * 0.08),
            CATIGOVIAagreementTextView.heightAnchor.constraint(equalToConstant: 38),
            CATIGOVIAappleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            CATIGOVIAappleButton.bottomAnchor.constraint(equalTo: CATIGOVIAagreementCheckbox.topAnchor, constant: -22),
            CATIGOVIAappleButton.widthAnchor.constraint(equalToConstant: 64),
            CATIGOVIAappleButton.heightAnchor.constraint(equalToConstant: 64),
            CATIGOVIAbackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            CATIGOVIAbackButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            CATIGOVIAbackButton.widthAnchor.constraint(equalToConstant: 34),
            CATIGOVIAbackButton.heightAnchor.constraint(equalToConstant: 34),
            CATIGOVIAdiscipline.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            CATIGOVIAdiscipline.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func CATIGOVIAbindJourneyActions() {
        CATIGOVIAagreementTextView.delegate = self
        CATIGOVIAstableEmailField.keyboardType = .emailAddress
        CATIGOVIAregisterEmailField.keyboardType = .emailAddress
        CATIGOVIAstableEmailField.autocapitalizationType = .none
        CATIGOVIAregisterEmailField.autocapitalizationType = .none
        CATIGOVIAstableEmailField.textContentType = .emailAddress
        CATIGOVIAregisterEmailField.textContentType = .emailAddress
        CATIGOVIAstablePasswordField.textContentType = .password
        CATIGOVIAregisterPasswordField.textContentType = .newPassword
        [CATIGOVIAstableEmailField, CATIGOVIAstablePasswordField, CATIGOVIAnameField, CATIGOVIAregisterEmailField, CATIGOVIAregisterPasswordField].forEach { CATIGOVIAField in
            CATIGOVIAField.delegate = self
            CATIGOVIAField.returnKeyType = .done
        }
        CATIGOVIAwelcomeLoginButton.addTarget(self, action: #selector(CATIGOVIAopenLoginPasture), for: .touchUpInside)
        CATIGOVIAwelcomeRegisterButton.addTarget(self, action: #selector(CATIGOVIAopenRegisterPasture), for: .touchUpInside)
        CATIGOVIAsaddleLoginButton.addTarget(self, action: #selector(CATIGOVIAdidTapSaddleLogin), for: .touchUpInside)
        CATIGOVIAregisterButton.addTarget(self, action: #selector(CATIGOVIAdidTapSignUpTrail), for: .touchUpInside)
        CATIGOVIAagreementCheckbox.addTarget(self, action: #selector(CATIGOVIAtoggleAgreement), for: .touchUpInside)
        CATIGOVIAavatarButton.addTarget(self, action: #selector(CATIGOVIAchooseAvatarSource), for: .touchUpInside)
        CATIGOVIAbackButton.addTarget(self, action: #selector(CATIGOVIAreturnWelcomeStable), for: .touchUpInside)
        CATIGOVIAappleButton.addTarget(self, action: #selector(CATIGOVIAbeginAppleConnection), for: .touchUpInside)
    }
    
    private func CATIGOVIAprepareKeyboardTrail() {
        let CATIGOVIATap = UITapGestureRecognizer(target: self, action: #selector(CATIGOVIAhideKeyboardTrail))
        CATIGOVIATap.cancelsTouchesInView = false
        view.addGestureRecognizer(CATIGOVIATap)
        NotificationCenter.default.addObserver(self, selector: #selector(CATIGOVIAkeyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CATIGOVIAkeyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func CATIGOVIAappendLabel(_ CATIGOVIAtext: String, CATIGOVIAto CATIGOVIAStack: UIStackView) {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.text = CATIGOVIAtext
        CATIGOVIALabel.font = UIFont(name: "GillSans-BoldItalic", size: 14) ?? .boldSystemFont(ofSize: 14)
        CATIGOVIALabel.textColor = .white
        CATIGOVIALabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        CATIGOVIAStack.addArrangedSubview(CATIGOVIALabel)
    }
    
    private func CATIGOVIApastureField(CATIGOVIAplaceholder: String, CATIGOVIAsecure: Bool) -> UITextField {
        let CATIGOVIAField = UITextField()
        CATIGOVIAField.GATIGOVIAinsertDoneButton()
        CATIGOVIAField.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        CATIGOVIAField.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        CATIGOVIAField.textColor = .white
        CATIGOVIAField.tintColor = UIColor(red: 105/255, green: 255/255, blue: 116/255, alpha: 1)
        CATIGOVIAField.layer.cornerRadius = 23
        CATIGOVIAField.layer.masksToBounds = true
        CATIGOVIAField.isSecureTextEntry = CATIGOVIAsecure
        CATIGOVIAField.CATIGOVIAsetLeftPaddingPoints(16)
        CATIGOVIAField.attributedPlaceholder = NSAttributedString(
            string: CATIGOVIAplaceholder,
            attributes: [.foregroundColor: UIColor.white.withAlphaComponent(0.45)]
        )
        CATIGOVIAField.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAField
    }
    
    private func CATIGOVIAtrailButton(CATIGOVIAtitle: String, CATIGOVIAgradient: Bool) -> UIButton {
        let CATIGOVIAButton = UIButton(type: .custom)
        CATIGOVIAButton.setTitle(CATIGOVIAtitle, for: .normal)
        CATIGOVIAButton.setTitleColor(.black, for: .normal)
        CATIGOVIAButton.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 13) ?? .boldSystemFont(ofSize: 13)
        CATIGOVIAButton.backgroundColor = CATIGOVIAgradient ? .clear : UIColor.white.withAlphaComponent(0.16)
        CATIGOVIAButton.layer.cornerRadius = 24
        CATIGOVIAButton.layer.masksToBounds = true
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        if CATIGOVIAgradient {
            CATIGOVIAButton.setTitleColor(.black, for: .normal)
        } else {
            CATIGOVIAButton.setTitleColor(.white, for: .normal)
        }
        return CATIGOVIAButton
    }
    
    private func CATIGOVIArefreshGradient(CATIGOVIAbutton: UIButton) {
        CATIGOVIAbutton.layer.sublayers?.filter { $0.name == "TigooOutdoorGradient" }.forEach { $0.removeFromSuperlayer() }
        guard CATIGOVIAbutton.backgroundColor == .clear || CATIGOVIAbutton == CATIGOVIAwelcomeLoginButton || CATIGOVIAbutton == CATIGOVIAsaddleLoginButton || CATIGOVIAbutton == CATIGOVIAregisterButton else { return }
        let CATIGOVIAGradient = CAGradientLayer()
        CATIGOVIAGradient.name = "TigooOutdoorGradient"
        CATIGOVIAGradient.frame = CATIGOVIAbutton.bounds
        CATIGOVIAGradient.colors = [
            UIColor(red: 159/255, green: 174/255, blue: 255/255, alpha: 1).cgColor,
            UIColor(red: 91/255, green: 255/255, blue: 104/255, alpha: 1).cgColor
        ]
        CATIGOVIAGradient.startPoint = CGPoint(x: 0, y: 0.5)
        CATIGOVIAGradient.endPoint = CGPoint(x: 1, y: 0.5)
        CATIGOVIAbutton.layer.insertSublayer(CATIGOVIAGradient, at: 0)
    }
    
    private func CATIGOVIApresentMode(_ CATIGOVIAMode: CATIGOVIACommunityMode, CATIGOVIAanimated: Bool) {
        CATIGOVIAactiveMode = CATIGOVIAMode
        CATIGOVIAhideKeyboardTrail()
        let CATIGOVIAChanges = {
            
            
                var imgstr = "CATIGOVIAcavya_rider_bgwelcome"
                switch CATIGOVIAMode {
                case .welcome:
                    imgstr = "CATIGOVIAcavya_rider_bgwelcome"
                case .login:
                    imgstr = "CATIGOVIAcavya_rider_bg"
                case .register:
                    imgstr = "CATIGOVIAmenaig"
                default:
                    break
                }
            self.CATIGOVIAbackgroundImageView.image = UIImage(named: imgstr)
            self.CATIGOVIAwelcomeStack.alpha = CATIGOVIAMode == .welcome ? 1 : 0
            self.CATIGOVIAbrandBadge.alpha = CATIGOVIAMode == .welcome ? 1 : 0
            self.CATIGOVIAstableTitleLabel.alpha = CATIGOVIAMode == .login ? 1 : 0
            self.CATIGOVIAloginFormStack.alpha = CATIGOVIAMode == .login ? 1 : 0
            self.CATIGOVIAregisterStack.alpha = CATIGOVIAMode == .register ? 1 : 0
            self.CATIGOVIAbackButton.alpha = CATIGOVIAMode == .welcome ? 0 : 1
            self.CATIGOVIAappleButton.alpha = CATIGOVIAMode == .welcome ? 1 : 0
            self.CATIGOVIAwelcomeStack.isUserInteractionEnabled = CATIGOVIAMode == .welcome
            self.CATIGOVIAloginFormStack.isUserInteractionEnabled = CATIGOVIAMode == .login
            self.CATIGOVIAregisterStack.isUserInteractionEnabled = CATIGOVIAMode == .register
            self.CATIGOVIAappleButton.isUserInteractionEnabled = CATIGOVIAMode == .welcome
            self.CATIGOVIAbackButton.isUserInteractionEnabled = CATIGOVIAMode != .welcome
        }
        if CATIGOVIAanimated {
            UIView.animate(withDuration: 0.25, animations: CATIGOVIAChanges)
        } else {
            CATIGOVIAChanges()
        }
    }
    
    @objc private func CATIGOVIAopenLoginPasture() {
        CATIGOVIApresentMode(.login, CATIGOVIAanimated: true)
    }
    
    @objc private func CATIGOVIAopenRegisterPasture() {
        CATIGOVIApresentMode(.register, CATIGOVIAanimated: true)
    }
    
    @objc private func CATIGOVIAreturnWelcomeStable() {
        CATIGOVIApresentMode(.welcome, CATIGOVIAanimated: true)
    }
    
    @objc private func CATIGOVIAtoggleAgreement() {
        CATIGOVIAagreementCheckbox.isSelected.toggle()
    }
    
    @objc private func CATIGOVIAdidTapSaddleLogin() {
        guard CATIGOVIAagreementCheckbox.isSelected else {
            CATIGOVIAshowAlert(CATIGOVIAmessage: "Please agree to the Terms to continue.")
            return
        }
        let CATIGOVIAemail = CATIGOVIAstableEmailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let CATIGOVIApassword = CATIGOVIAstablePasswordField.text ?? ""
        guard CATIGOVIAemail.isEmpty == false, CATIGOVIApassword.isEmpty == false else {
            CATIGOVIAshowAlert(CATIGOVIAmessage: "Please enter both email and password.")
            return
        }
        if CATIGOVIAemail.lowercased() == "tigoo@gmail.com", CATIGOVIApassword == "12345678" {
            CATIGOVIAstoreLocalRider(CATIGOVIAemail: CATIGOVIAemail, CATIGOVIAname: "Tigoo Rider", CATIGOVIAavatar: nil)
            CATIGOVIAperformOriginalLogin(CATIGOVIAemail: CATIGOVIAemail, CATIGOVIApassword: CATIGOVIApassword)
            return
        }
        if CATIGOVIAregisteredEmails().contains(CATIGOVIAemail.lowercased()) {
            CATIGOVIAperformOriginalLogin(CATIGOVIAemail: CATIGOVIAemail, CATIGOVIApassword: CATIGOVIApassword)
        } else {
            CATIGOVIAregisterEmailField.text = CATIGOVIAemail
            CATIGOVIAregisterPasswordField.text = CATIGOVIApassword
            CATIGOVIApresentMode(.register, CATIGOVIAanimated: true)
        }
    }
    
    @objc private func CATIGOVIAdidTapSignUpTrail() {
        guard CATIGOVIAagreementCheckbox.isSelected else {
            CATIGOVIAshowAlert(CATIGOVIAmessage: "Please agree to the Terms to continue.")
            return
        }
        let CATIGOVIAname = CATIGOVIAnameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let CATIGOVIAemail = CATIGOVIAregisterEmailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let CATIGOVIApassword = CATIGOVIAregisterPasswordField.text ?? ""
        guard CATIGOVIAname.isEmpty == false, CATIGOVIAemail.isEmpty == false, CATIGOVIApassword.count >= 6 else {
            CATIGOVIAshowAlert(CATIGOVIAmessage: "Please complete name, email and password.")
            return
        }
        CATIGOVIAstoreLocalRider(CATIGOVIAemail: CATIGOVIAemail, CATIGOVIAname: CATIGOVIAname, CATIGOVIAavatar: CATIGOVIAselectedAvatarData)
        CATIGOVIAperformOriginalLogin(CATIGOVIAemail: CATIGOVIAemail, CATIGOVIApassword: CATIGOVIApassword)
    }
    
    private func CATIGOVIAperformOriginalLogin(CATIGOVIAemail: String, CATIGOVIApassword: String) {
        CATIGOVIAsetLoading(true)
        CATIGOVIAStableNetwork.CATIGOVIAsaddleAllPurpose(
            CATIGOVIAsaddleWestern: "/pefcyqolzdz/oqwjsn",
            CATIGOVIAsaddleEndurance: ["momentumControl":"47828783","balancePoint":CATIGOVIAemail,"centerOfGravity":CATIGOVIApassword]
        ) { [weak self] CATIGOVIAResponse in
            guard let self = self else { return }
            self.CATIGOVIAsetLoading(false)
            let CATIGOVIADataKey = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "deaatfa")
            guard let CATIGOVIADictionary = CATIGOVIAResponse as? [String: Any],
                  let CATIGOVIAData = CATIGOVIADictionary[CATIGOVIADataKey] as? [String: Any] else {
                self.CATIGOVIAshowAlert(CATIGOVIAmessage: "email or password error!")
                return
            }
            self.CATIGOVIAcompleteRiderSession(CATIGOVIAData: CATIGOVIAData, CATIGOVIAfallbackEmail: CATIGOVIAemail)
        } CATIGOVIAfeedRoom: { [weak self] CATIGOVIAError in
            self?.CATIGOVIAsetLoading(false)
            self?.CATIGOVIAshowAlert(CATIGOVIAmessage: CATIGOVIAError.localizedDescription)
        }
    }
    
    @objc private func CATIGOVIAbeginAppleConnection() {
        guard CATIGOVIAagreementCheckbox.isSelected else {
            CATIGOVIAshowAlert(CATIGOVIAmessage: "Please agree to the Terms to continue.")
            return
        }
        let CATIGOVIAProvider = ASAuthorizationAppleIDProvider()
        let CATIGOVIARequest = CATIGOVIAProvider.createRequest()
        CATIGOVIARequest.requestedScopes = [.fullName, .email]
        let CATIGOVIAController = ASAuthorizationController(authorizationRequests: [CATIGOVIARequest])
        CATIGOVIAController.delegate = self
        CATIGOVIAController.presentationContextProvider = self
        CATIGOVIAController.performRequests()
    }
    
    private func CATIGOVIArequestAppleBridge(CATIGOVIAidentityToken: String) {
        CATIGOVIAsetLoading(true)
        let CATIGOVIABody: [String: Any] = [
            "kneeBoot": CATIGOVIAidentityToken,
            "hoofPick": "47828783",
            "bridlePath": CATIGOVIAequipmentNo()
        ]
        CATIGOVIAStableNetwork.CATIGOVIAsaddleAllPurpose(
            CATIGOVIAsaddleWestern: "/pefcyqolzaadz/oqwjsn",
            CATIGOVIAsaddleEndurance: CATIGOVIABody
        ) { [weak self] CATIGOVIAData in
            guard let self = self else { return }
            self.CATIGOVIAsetLoading(false)
            let CATIGOVIAKey = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "deaatfa")
            DispatchQueue.main.async {
                guard let CATIGOVIAObject = CATIGOVIAData as? [String: Any],
                      let CATIGOVIAUser = CATIGOVIAObject[CATIGOVIAKey] as? [String: Any]
                       else { return }
                self.CATIGOVIAcompleteAppleSession(CATIGOVIAData: CATIGOVIAUser)
            }
        } CATIGOVIAfeedRoom: { [weak self] CATIGOVIAError in
            self?.CATIGOVIAsetLoading(false)
            self?.CATIGOVIAshowAlert(CATIGOVIAmessage: "Apple login failed.")
        }
    }
    
    private func CATIGOVIAcompleteAppleSession(CATIGOVIAData: [String: Any]) {
        let CATIGOVIAEmail = CATIGOVIAData["naturalAid"] as? String ?? CATIGOVIAData["email"] as? String ?? "apple@tigoo.local"
        let CATIGOVIAName = CATIGOVIAData["legPressure"] as? String ?? CATIGOVIAEmail
        CATIGOVIAArenaPostController.CATIGOVIAlesson = CATIGOVIAData["neckExtension"] as? String
        UserDefaults.standard.set(CATIGOVIAName, forKey: CATIGOVIAJourneyKeys.CATIGOVIAprofileName)
        UserDefaults.standard.set(CATIGOVIAData["handContact"] as? Int ?? CATIGOVIAData["Id"] as? Int ?? 0, forKey: CATIGOVIAJourneyKeys.CATIGOVIAprofileId)
        if let CATIGOVIAAvatar = CATIGOVIAData["userImgUrl"] as? String, CATIGOVIAAvatar.isEmpty == false {
            UserDefaults.standard.set(CATIGOVIAAvatar, forKey: CATIGOVIAJourneyKeys.CATIGOVIAprofileAvatar)
        }
        CATIGOVIArememberEmail(CATIGOVIAEmail)
        CATIGOVIArideIntoMainStable()
    }
    
    private func CATIGOVIAcompleteRiderSession(CATIGOVIAData: [String: Any], CATIGOVIAfallbackEmail: String) {
        CATIGOVIAArenaPostController.CATIGOVIAlesson = CATIGOVIAData["neckExtension"] as? String
        let CATIGOVIALocalName = UserDefaults.standard.string(forKey: CATIGOVIAJourneyKeys.CATIGOVIAprofileName)
        UserDefaults.standard.set(CATIGOVIALocalName?.isEmpty == false ? CATIGOVIALocalName : CATIGOVIAfallbackEmail, forKey: CATIGOVIAJourneyKeys.CATIGOVIAprofileName)
        UserDefaults.standard.set(CATIGOVIAData["handContact"] as? Int ?? 0, forKey: CATIGOVIAJourneyKeys.CATIGOVIAprofileId)
        CATIGOVIArememberEmail(CATIGOVIAfallbackEmail)
        CATIGOVIArideIntoMainStable()
    }
    
    private func CATIGOVIAstoreLocalRider(CATIGOVIAemail: String, CATIGOVIAname: String, CATIGOVIAavatar: Data?) {
        UserDefaults.standard.set(CATIGOVIAname, forKey: CATIGOVIAJourneyKeys.CATIGOVIAprofileName)
        if let CATIGOVIAavatar = CATIGOVIAavatar {
            let CATIGOVIAPath = CATIGOVIAavatarPath(CATIGOVIAemail: CATIGOVIAemail)
            try? CATIGOVIAavatar.write(to: CATIGOVIAPath, options: .atomic)
            UserDefaults.standard.set(CATIGOVIAPath.absoluteString, forKey: CATIGOVIAJourneyKeys.CATIGOVIAprofileAvatar)
        }
        CATIGOVIArememberEmail(CATIGOVIAemail)
    }
    
    private func CATIGOVIArememberEmail(_ CATIGOVIAemail: String) {
        var CATIGOVIAEmails = CATIGOVIAregisteredEmails()
        CATIGOVIAEmails.insert(CATIGOVIAemail.lowercased())
        UserDefaults.standard.set(Array(CATIGOVIAEmails), forKey: CATIGOVIAJourneyKeys.CATIGOVIAregisteredEmails)
    }
    
    private func CATIGOVIAregisteredEmails() -> Set<String> {
        let CATIGOVIAEmails = UserDefaults.standard.stringArray(forKey: CATIGOVIAJourneyKeys.CATIGOVIAregisteredEmails) ?? []
        return Set(CATIGOVIAEmails.map { $0.lowercased() })
    }
    
    private func CATIGOVIAequipmentNo() -> String {
        if let CATIGOVIANumber = UserDefaults.standard.string(forKey: CATIGOVIAJourneyKeys.CATIGOVIAequipmentNo), CATIGOVIANumber.isEmpty == false {
            return CATIGOVIANumber
        }
        let CATIGOVIANumber = UUID().uuidString.uppercased()
        UserDefaults.standard.set(CATIGOVIANumber, forKey: CATIGOVIAJourneyKeys.CATIGOVIAequipmentNo)
        return CATIGOVIANumber
    }
    
    private func CATIGOVIAavatarPath(CATIGOVIAemail: String) -> URL {
        let CATIGOVIASafe = CATIGOVIAemail.replacingOccurrences(of: "@", with: "_").replacingOccurrences(of: ".", with: "_")
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("tigoo_\(CATIGOVIASafe)_avatar.jpg")
    }
    
    private func CATIGOVIArideIntoMainStable() {
        ((UIApplication.shared.delegate) as? AppDelegate)?.window?.rootViewController = CATIGOVIAStableTabBarController()
    }
    
    private func CATIGOVIAsetLoading(_ CATIGOVIAloading: Bool) {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = !CATIGOVIAloading
            CATIGOVIAloading ? self.CATIGOVIAdiscipline.startAnimating() : self.CATIGOVIAdiscipline.stopAnimating()
        }
    }
    
    @objc private func CATIGOVIAhideKeyboardTrail() {
        view.endEditing(true)
        CATIGOVIAactiveTextField = nil
        UIView.animate(withDuration: 0.22) {
            self.view.transform = .identity
        }
    }
    
    @objc private func CATIGOVIAkeyboardWillHide(_ CATIGOVIANotification: Notification) {
        UIView.animate(withDuration: CATIGOVIAkeyboardDuration(CATIGOVIANotification)) {
            self.view.transform = .identity
        }
    }
    
    @objc private func CATIGOVIAkeyboardWillChange(_ CATIGOVIANotification: Notification) {
        guard CATIGOVIAactiveMode != .welcome,
              let CATIGOVIAField = CATIGOVIAactiveTextField,
              let CATIGOVIAKeyboardFrame = CATIGOVIANotification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let CATIGOVIAConvertedFrame = view.convert(CATIGOVIAField.bounds, from: CATIGOVIAField)
        let CATIGOVIAKeyboardTop = CATIGOVIAKeyboardFrame.minY
        let CATIGOVIANeededLift = max(0, CATIGOVIAConvertedFrame.maxY + 18 - CATIGOVIAKeyboardTop)
        UIView.animate(withDuration: CATIGOVIAkeyboardDuration(CATIGOVIANotification)) {
            self.view.transform = CGAffineTransform(translationX: 0, y: -CATIGOVIANeededLift)
        }
    }
    
    private func CATIGOVIAkeyboardDuration(_ CATIGOVIANotification: Notification) -> TimeInterval {
        return CATIGOVIANotification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0.25
    }
    
    private func CATIGOVIAshowAlert(CATIGOVIAmessage: String) {
        let CATIGOVIAalert = UIAlertController(title: "Tigoo Notice", message: CATIGOVIAmessage, preferredStyle: .alert)
        CATIGOVIAalert.addAction(UIAlertAction(title: "OK", style: .default))
        present(CATIGOVIAalert, animated: true)
    }
    
    @objc private func CATIGOVIAchooseAvatarSource() {
        let CATIGOVIASheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        CATIGOVIASheet.addAction(UIAlertAction(title: "Photo", style: .default) { [weak self] _ in
            self?.CATIGOVIAopenImageStable(.camera)
        })
        CATIGOVIASheet.addAction(UIAlertAction(title: "Album", style: .default) { [weak self] _ in
            self?.CATIGOVIAopenImageStable(.photoLibrary)
        })
        CATIGOVIASheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        if let CATIGOVIAPopover = CATIGOVIASheet.popoverPresentationController {
            CATIGOVIAPopover.sourceView = CATIGOVIAavatarButton
            CATIGOVIAPopover.sourceRect = CATIGOVIAavatarButton.bounds
        }
        present(CATIGOVIASheet, animated: true)
    }
    
    private func CATIGOVIAopenImageStable(_ CATIGOVIASource: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(CATIGOVIASource) else {
            CATIGOVIAshowAlert(CATIGOVIAmessage: "This image source is unavailable.")
            return
        }
        let CATIGOVIAPicker = UIImagePickerController()
        CATIGOVIAPicker.sourceType = CATIGOVIASource
        CATIGOVIAPicker.allowsEditing = true
        CATIGOVIAPicker.delegate = self
        present(CATIGOVIAPicker, animated: true)
    }
}

extension CATIGOVIARiderLoginController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ CATIGOVIATextField: UITextField) {
        CATIGOVIAactiveTextField = CATIGOVIATextField
    }
    
    func textFieldShouldReturn(_ CATIGOVIATextField: UITextField) -> Bool {
        CATIGOVIATextField.resignFirstResponder()
        return true
    }
}

extension CATIGOVIARiderLoginController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ CATIGOVIAPicker: UIImagePickerController, didFinishPickingMediaWithInfo CATIGOVIAInfo: [UIImagePickerController.InfoKey : Any]) {
        let CATIGOVIAImage = (CATIGOVIAInfo[.editedImage] as? UIImage) ?? (CATIGOVIAInfo[.originalImage] as? UIImage)
        CATIGOVIAselectedAvatarData = CATIGOVIAImage?.jpegData(compressionQuality: 0.82)
        CATIGOVIAavatarButton.setTitle(nil, for: .normal)
        CATIGOVIAavatarButton.setImage(nil, for: .normal)
        CATIGOVIAavatarButton.setImage(CATIGOVIAImage, for: .normal)
        CATIGOVIAPicker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ CATIGOVIAPicker: UIImagePickerController) {
        CATIGOVIAPicker.dismiss(animated: true)
    }
}

extension CATIGOVIARiderLoginController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for CATIGOVIAController: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window ?? ASPresentationAnchor()
    }
    
    func authorizationController(controller CATIGOVIAController: ASAuthorizationController, didCompleteWithAuthorization CATIGOVIAAuthorization: ASAuthorization) {
        guard let CATIGOVIACredential = CATIGOVIAAuthorization.credential as? ASAuthorizationAppleIDCredential,
              let CATIGOVIATokenData = CATIGOVIACredential.identityToken,
              let CATIGOVIAToken = String(data: CATIGOVIATokenData, encoding: .utf8) else {
            CATIGOVIAshowAlert(CATIGOVIAmessage: "Apple identity token is unavailable.")
            return
        }
        CATIGOVIArequestAppleBridge(CATIGOVIAidentityToken: CATIGOVIAToken)
    }
    
    func authorizationController(controller CATIGOVIAController: ASAuthorizationController, didCompleteWithError CATIGOVIAError: Error) {
        CATIGOVIAshowAlert(CATIGOVIAmessage: CATIGOVIAError.localizedDescription)
    }
}

extension UITextField {
    func CATIGOVIAsetLeftPaddingPoints(_ CATIGOVIAAmount: CGFloat) {
        let CATIGOVIAPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: CATIGOVIAAmount, height: self.frame.height))
        self.leftView = CATIGOVIAPaddingView
        self.leftViewMode = .always
    }
}

extension CATIGOVIARiderLoginController: UITextViewDelegate {
    func textView(_ CATIGOVIATextView: UITextView, shouldInteractWith CATIGOVIAURL: URL, in CATIGOVIACharacterRange: NSRange, interaction CATIGOVIAInteraction: UITextItemInteraction) -> Bool {
        if CATIGOVIAURL.absoluteString == "cavya://tos" {
            let ringCATIGOVIAMasterVconter = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAWQhinny.CATIGOVIAreinsDouble.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: ""))
            ringCATIGOVIAMasterVconter.CATIGOVIAhorseTrial = true
            ringCATIGOVIAMasterVconter.modalPresentationStyle = .fullScreen
            present(ringCATIGOVIAMasterVconter, animated: true)
            return false
        } else if CATIGOVIAURL.absoluteString == "cavya://privacy" {
            let ringCATIGOVIAMasterVconter = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAWQhinny.CATIGOVIAreinsWebbed.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: ""))
            ringCATIGOVIAMasterVconter.CATIGOVIAhorseTrial = true
            ringCATIGOVIAMasterVconter.modalPresentationStyle = .fullScreen
            present(ringCATIGOVIAMasterVconter, animated: true)
            return false
        }
        return true
    }
    
    override func touchesBegan(_ CATIGOVIATouches: Set<UITouch>, with CATIGOVIAEvent: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension UITextField {
    func GATIGOVIAinsertDoneButton() {
        let GATIGOVIAtotolview = UIToolbar()
        GATIGOVIAtotolview.sizeToFit()
        let flexGATIGOVIASpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let compleGATIGOVIAButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(GATIGOVIAexistAction))
        GATIGOVIAtotolview.items = [flexGATIGOVIASpace, compleGATIGOVIAButton]
        self.inputAccessoryView = GATIGOVIAtotolview
    }
    
    @objc private func GATIGOVIAexistAction() {
        self.resignFirstResponder()
    }
}
