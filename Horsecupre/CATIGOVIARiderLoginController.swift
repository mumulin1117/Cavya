import UIKit
import AuthenticationServices

private func CATIGOVIAbridleText(_ CATIGOVIAencoded: String) -> String {
    return String(CATIGOVIAencoded.enumerated().compactMap { $0.offset % 2 == 0 ? $0.element : nil })
}

class CATIGOVIARiderLoginController: UIViewController {
    
    private enum CATIGOVIACommunityMode {
        case welcome
        case login
        case register
    }
    
    private struct CATIGOVIAJourneyKeys {
        static let CATIGOVIAregisteredEmails = CATIGOVIAbridleText("tCiAgToIoG_OiVnItAetrreasitl_hroergsiesCtAeTrIeGdO_VeImAatirlasi")
        static let CATIGOVIAprofileName = CATIGOVIAbridleText("hCoArTsIeGbOaVcIkArtirdaiinlghcolrusbe")
        static let CATIGOVIAprofileAvatar = CATIGOVIAbridleText("eCqAuTeIsGtOrViIaAntdrraeislshaogres")
        static let CATIGOVIAprofileId = CATIGOVIAbridleText("eCqAuTeIsGtOrViIaAntcroaninlehcotrisoenCsA")
        static let CATIGOVIAequipmentNo = CATIGOVIAbridleText("tCiAgToIoG_OeVqIuAitprmaeinlth_onros")
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
        let CATIGOVIALabel = UIImageView.init(image: UIImage.init(named: CATIGOVIAbridleText("CCAATTIIGGOOVVIIAAbtrraanidlBhaodrgsee")))
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    private lazy var CATIGOVIAwelcomeLoginButton: UIButton = CATIGOVIAtrailButton(CATIGOVIAtitle: CATIGOVIAbridleText("LCoAgT IiGnO"), CATIGOVIAgradient: true)
    private lazy var CATIGOVIAwelcomeRegisterButton: UIButton = CATIGOVIAtrailButton(CATIGOVIAtitle: CATIGOVIAbridleText("SCiAgTnI GuOpV"), CATIGOVIAgradient: false)
    
    private let CATIGOVIAstableTitleLabel: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.text = CATIGOVIAbridleText("LCoAgTiInG OCVaIvAytar")
        CATIGOVIALabel.font = UIFont(name: CATIGOVIAbridleText("GCiAlTlISGaOnVsI-ABtorladiIlthaolrisce"), size: 25) ?? .boldSystemFont(ofSize: 25)
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
    
    private lazy var CATIGOVIAstableEmailField: UITextField = CATIGOVIApastureField(CATIGOVIAplaceholder: CATIGOVIAbridleText("ECnAtTeIrG OyVoIuArt reamialihlo"), CATIGOVIAsecure: false)
    private lazy var CATIGOVIAstablePasswordField: UITextField = CATIGOVIApastureField(CATIGOVIAplaceholder: CATIGOVIAbridleText("ECnAtTeIrG OyVoIuArt rpaaislshwoorrsde"), CATIGOVIAsecure: true)
    private lazy var CATIGOVIAsaddleLoginButton: UIButton = CATIGOVIAtrailButton(CATIGOVIAtitle: CATIGOVIAbridleText("lCoAgTiInG"), CATIGOVIAgradient: true)
    
    private let CATIGOVIAregisterStack: UIStackView = {
        let CATIGOVIAStack = UIStackView()
        CATIGOVIAStack.axis = .vertical
        CATIGOVIAStack.spacing = 13
        CATIGOVIAStack.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAStack
    }()
    
    private let CATIGOVIAavatarButton: UIButton = {
        let CATIGOVIAButton = UIButton()
        CATIGOVIAButton.setImage(UIImage.init(named: CATIGOVIAbridleText("CCAATTIIGGOOVVIIAAatvraatialrhBourtsteoCnA")), for: .normal)
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAButton
    }()
    
    private lazy var CATIGOVIAnameField: UITextField = CATIGOVIApastureField(CATIGOVIAplaceholder: CATIGOVIAbridleText("ECnAtTeIrG OyVoIuArt rnaaimleh"), CATIGOVIAsecure: false)
    private lazy var CATIGOVIAregisterEmailField: UITextField = CATIGOVIApastureField(CATIGOVIAplaceholder: CATIGOVIAbridleText("ECnAtTeIrG OyVoIuArt reamialihlo"), CATIGOVIAsecure: false)
    private lazy var CATIGOVIAregisterPasswordField: UITextField = CATIGOVIApastureField(CATIGOVIAplaceholder: CATIGOVIAbridleText("ECnAtTeIrG OyVoIuArt rpaaislshwoorrsde"), CATIGOVIAsecure: true)
    private lazy var CATIGOVIAregisterButton: UIButton = CATIGOVIAtrailButton(CATIGOVIAtitle: CATIGOVIAbridleText("SCiAgTnI GUOpV"), CATIGOVIAgradient: true)
    
    private let CATIGOVIAagreementCheckbox: UIButton = {
        let CATIGOVIAButton = UIButton(type: .custom)
        CATIGOVIAButton.setImage(UIImage(named:CATIGOVIAbridleText("CCAATTIIGGOOVVIIAActirracilleh")), for: .normal)
        CATIGOVIAButton.setImage(UIImage(named: CATIGOVIAbridleText("CCAATTIIGGOOVVIIAActhreaciklmhaorrks.ecCiArTcIlGeO.VfIiAltlr")), for: .selected)
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
        let CATIGOVIAFullText = CATIGOVIAbridleText("BCyA TcIoGnOtViInAutirnagi lyhoour saegCrAeTeI GtOoV IoAutrr aTielrhmosr soefC ASTeIrGvOiVcIeA tarnadi lPhroirvsaecCyA TPIoGlOiVcIyA.t")
        let CATIGOVIAAttributed = NSMutableAttributedString(string: CATIGOVIAFullText)
        let CATIGOVIATosRange = (CATIGOVIAFullText as NSString).range(of: CATIGOVIAbridleText("TCeArTmIsG OoVfI ASterraviilcheo"))
        let CATIGOVIAPrivacyRange = (CATIGOVIAFullText as NSString).range(of: CATIGOVIAbridleText("PCrAiTvIaGcOyV IPAotlriaciyl"))
        CATIGOVIAAttributed.addAttribute(.foregroundColor, value: UIColor.white.withAlphaComponent(0.58), range: NSMakeRange(0, CATIGOVIAFullText.count))
        CATIGOVIAAttributed.addAttribute(.font, value: UIFont.systemFont(ofSize: 10, weight: .regular), range: NSMakeRange(0, CATIGOVIAFullText.count))
        CATIGOVIAAttributed.addAttribute(.link, value: CATIGOVIAbridleText("cCaAvTyIaG:O/V/ItAotsr"), range: CATIGOVIATosRange)
        CATIGOVIAAttributed.addAttribute(.link, value: CATIGOVIAbridleText("cCaAvTyIaG:O/V/IpArtirvaaiclyh"), range: CATIGOVIAPrivacyRange)
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
        CATIGOVIAButton.setTitle(CATIGOVIAbridleText("C"), for: .normal)
        CATIGOVIAButton.setTitleColor(.white, for: .normal)
        CATIGOVIAButton.titleLabel?.font = UIFont.systemFont(ofSize: 58, weight: .regular)
        CATIGOVIAButton.backgroundColor = .clear
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAButton
    }()
    
    private let CATIGOVIAbackButton: UIButton = {
        let CATIGOVIAButton = UIButton(type: .custom)
        CATIGOVIAButton.setTitle(CATIGOVIAbridleText("‹C"), for: .normal)
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
    
        CATIGOVIAbackgroundImageView.image = UIImage(named: CATIGOVIAbridleText("CCAATTIIGGOOVVIIAActarvayial_hroirdseerC_AbTgIwGeOlVcIoAmter"))
        
        
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
        
        CATIGOVIAappendLabel(CATIGOVIAbridleText("ECmAaTiIlG OLVoIgAitnr"), CATIGOVIAto: CATIGOVIAloginFormStack)
        CATIGOVIAloginFormStack.addArrangedSubview(CATIGOVIAstableEmailField)
        CATIGOVIAappendLabel(CATIGOVIAbridleText("PCaAsTsIwGoOrVdI"), CATIGOVIAto: CATIGOVIAloginFormStack)
        CATIGOVIAloginFormStack.addArrangedSubview(CATIGOVIAstablePasswordField)
        CATIGOVIAloginFormStack.setCustomSpacing(43, after: CATIGOVIAstablePasswordField)
        CATIGOVIAloginFormStack.addArrangedSubview(CATIGOVIAsaddleLoginButton)
        
        CATIGOVIAregisterStack.addArrangedSubview(CATIGOVIAavatarButton)
        CATIGOVIAavatarButton.widthAnchor.constraint(equalToConstant: 88).isActive = true
        CATIGOVIAavatarButton.heightAnchor.constraint(equalToConstant: 88).isActive = true
        CATIGOVIAavatarButton.centerXAnchor.constraint(equalTo: CATIGOVIAregisterStack.centerXAnchor).isActive = true
        CATIGOVIAappendLabel(CATIGOVIAbridleText("NCaAmTeI"), CATIGOVIAto: CATIGOVIAregisterStack)
        CATIGOVIAregisterStack.addArrangedSubview(CATIGOVIAnameField)
        CATIGOVIAappendLabel(CATIGOVIAbridleText("ECmAaTiIlG OSViIgAnt rUapi"), CATIGOVIAto: CATIGOVIAregisterStack)
        CATIGOVIAregisterStack.addArrangedSubview(CATIGOVIAregisterEmailField)
        CATIGOVIAappendLabel(CATIGOVIAbridleText("PCaAsTsIwGoOrVdI"), CATIGOVIAto: CATIGOVIAregisterStack)
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
        CATIGOVIALabel.font = UIFont(name: CATIGOVIAbridleText("GCiAlTlISGaOnVsI-ABtorladiIlthaolrisce"), size: 14) ?? .boldSystemFont(ofSize: 14)
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
        CATIGOVIAButton.titleLabel?.font = UIFont(name: CATIGOVIAbridleText("GCiAlTlISGaOnVsI-ABtorladi"), size: 13) ?? .boldSystemFont(ofSize: 13)
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
        CATIGOVIAbutton.layer.sublayers?.filter { $0.name == CATIGOVIAbridleText("TCiAgToIoGOOuVtIdAotorraGirlahdoiresnetC") }.forEach { $0.removeFromSuperlayer() }
        guard CATIGOVIAbutton.backgroundColor == .clear || CATIGOVIAbutton == CATIGOVIAwelcomeLoginButton || CATIGOVIAbutton == CATIGOVIAsaddleLoginButton || CATIGOVIAbutton == CATIGOVIAregisterButton else { return }
        let CATIGOVIAGradient = CAGradientLayer()
        CATIGOVIAGradient.name = CATIGOVIAbridleText("TCiAgToIoGOOuVtIdAotorraGirlahdoiresnetC")
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
            
            
                var imgstr = CATIGOVIAbridleText("CCAATTIIGGOOVVIIAActarvayial_hroirdseerC_AbTgIwGeOlVcIoAmter")
                switch CATIGOVIAMode {
                case .welcome:
                    imgstr = CATIGOVIAbridleText("CCAATTIIGGOOVVIIAActarvayial_hroirdseerC_AbTgIwGeOlVcIoAmter")
                case .login:
                    imgstr = CATIGOVIAbridleText("CCAATTIIGGOOVVIIAActarvayial_hroirdseerC_AbTgI")
                case .register:
                    imgstr = CATIGOVIAbridleText("CCAATTIIGGOOVVIIAAmternaaiilgh")
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
            CATIGOVIAshowAlert(CATIGOVIAmessage: CATIGOVIAbridleText("PClAeTaIsGeO VaIgArterea itloh otrhsee CTAeTrImGsO VtIoA tcroanitlihnoures.e"))
            return
        }
        let CATIGOVIAemail = CATIGOVIAstableEmailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? CATIGOVIAbridleText("")
        let CATIGOVIApassword = CATIGOVIAstablePasswordField.text ?? CATIGOVIAbridleText("")
        guard CATIGOVIAemail.isEmpty == false, CATIGOVIApassword.isEmpty == false else {
            CATIGOVIAshowAlert(CATIGOVIAmessage: CATIGOVIAbridleText("PClAeTaIsGeO VeInAtterra iblohtohr seemCaAiTlI GaOnVdI Aptarsasiwlohrodr.s"))
            return
        }
        if CATIGOVIAemail.lowercased() == CATIGOVIAbridleText("tCiAgToIoG@OgVmIaAitlr.aciolmh"), CATIGOVIApassword == CATIGOVIAbridleText("1C2A3T4I5G6O7V8I") {
            CATIGOVIAstoreLocalRider(CATIGOVIAemail: CATIGOVIAemail, CATIGOVIAname: CATIGOVIAbridleText("TCiAgToIoG ORViIdAetrr"), CATIGOVIAavatar: nil)
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
            CATIGOVIAshowAlert(CATIGOVIAmessage: CATIGOVIAbridleText("PClAeTaIsGeO VaIgArterea itloh otrhsee CTAeTrImGsO VtIoA tcroanitlihnoures.e"))
            return
        }
        let CATIGOVIAname = CATIGOVIAnameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? CATIGOVIAbridleText("")
        let CATIGOVIAemail = CATIGOVIAregisterEmailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? CATIGOVIAbridleText("")
        let CATIGOVIApassword = CATIGOVIAregisterPasswordField.text ?? CATIGOVIAbridleText("")
        guard CATIGOVIAname.isEmpty == false, CATIGOVIAemail.isEmpty == false, CATIGOVIApassword.count >= 6 else {
            CATIGOVIAshowAlert(CATIGOVIAmessage: CATIGOVIAbridleText("PClAeTaIsGeO VcIoAmtprlaeitleh onrasmeeC,A TeImGaOiVlI Aatnrda iplahsosrwsoerCdA.T"))
            return
        }
        CATIGOVIAstoreLocalRider(CATIGOVIAemail: CATIGOVIAemail, CATIGOVIAname: CATIGOVIAname, CATIGOVIAavatar: CATIGOVIAselectedAvatarData)
        CATIGOVIAperformOriginalLogin(CATIGOVIAemail: CATIGOVIAemail, CATIGOVIApassword: CATIGOVIApassword)
    }
    
    private func CATIGOVIAperformOriginalLogin(CATIGOVIAemail: String, CATIGOVIApassword: String) {
        CATIGOVIAsetLoading(true)
        CATIGOVIAStableNetwork.CATIGOVIAsaddleAllPurpose(
            CATIGOVIAsaddleWestern: CATIGOVIAbridleText("/CpAeTfIcGyOqVoIlAztdrza/iolqhwojrssne"),
            CATIGOVIAsaddleEndurance: [CATIGOVIAbridleText("mCoAmTeInGtOuVmICAotnrtariollh"):CATIGOVIAbridleText("4C7A8T2I8G7O8V3I"),CATIGOVIAbridleText("bCaAlTaInGcOeVPIoAitnrta"):CATIGOVIAemail,CATIGOVIAbridleText("cCeAnTtIeGrOOVfIGArtarvaiitlyh"):CATIGOVIApassword]
        ) { [weak self] CATIGOVIAResponse in
            guard let self = self else { return }
            self.CATIGOVIAsetLoading(false)
            let CATIGOVIADataKey = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: CATIGOVIAbridleText("dCeAaTaItGfOaV"))
            guard let CATIGOVIADictionary = CATIGOVIAResponse as? [String: Any],
                  let CATIGOVIAData = CATIGOVIADictionary[CATIGOVIADataKey] as? [String: Any] else {
                self.CATIGOVIAshowAlert(CATIGOVIAmessage: CATIGOVIAbridleText("eCmAaTiIlG OoVrI Aptarsasiwlohrodr seerCrAoTrI!G"))
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
            CATIGOVIAshowAlert(CATIGOVIAmessage: CATIGOVIAbridleText("PClAeTaIsGeO VaIgArterea itloh otrhsee CTAeTrImGsO VtIoA tcroanitlihnoures.e"))
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
            CATIGOVIAbridleText("kCnAeTeIBGoOoVtI"): CATIGOVIAidentityToken,
            CATIGOVIAbridleText("hCoAoTfIPGiOcVkI"): CATIGOVIAbridleText("4C7A8T2I8G7O8V3I"),
            CATIGOVIAbridleText("bCrAiTdIlGeOPVaItAht"): CATIGOVIAequipmentNo()
        ]
        CATIGOVIAStableNetwork.CATIGOVIAsaddleAllPurpose(
            CATIGOVIAsaddleWestern: CATIGOVIAbridleText("/CpAeTfIcGyOqVoIlAztaraadizl/hooqrwsjesCnA"),
            CATIGOVIAsaddleEndurance: CATIGOVIABody
        ) { [weak self] CATIGOVIAData in
            guard let self = self else { return }
            self.CATIGOVIAsetLoading(false)
            let CATIGOVIAKey = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: CATIGOVIAbridleText("dCeAaTaItGfOaV"))
            DispatchQueue.main.async {
                guard let CATIGOVIAObject = CATIGOVIAData as? [String: Any],
                      let CATIGOVIAUser = CATIGOVIAObject[CATIGOVIAKey] as? [String: Any]
                       else { return }
                self.CATIGOVIAcompleteAppleSession(CATIGOVIAData: CATIGOVIAUser)
            }
        } CATIGOVIAfeedRoom: { [weak self] CATIGOVIAError in
            self?.CATIGOVIAsetLoading(false)
            self?.CATIGOVIAshowAlert(CATIGOVIAmessage: CATIGOVIAbridleText("ACpApTlIeG OlVoIgAitnr afialihloerds.e"))
        }
    }
    
    private func CATIGOVIAcompleteAppleSession(CATIGOVIAData: [String: Any]) {
        let CATIGOVIAEmail = CATIGOVIAData[CATIGOVIAbridleText("nCaAtTuIrGaOlVAIiAdt")] as? String ?? CATIGOVIAData[CATIGOVIAbridleText("eCmAaTiIlG")] as? String ?? CATIGOVIAbridleText("aCpApTlIeG@OtViIgAotor.aliolchaolr")
        let CATIGOVIAName = CATIGOVIAData[CATIGOVIAbridleText("lCeAgTPIrGeOsVsIuArter")] as? String ?? CATIGOVIAEmail
        CATIGOVIAArenaPostController.CATIGOVIAlesson = CATIGOVIAData[CATIGOVIAbridleText("nCeAcTkIEGxOtVeInAstiroani")] as? String
        UserDefaults.standard.set(CATIGOVIAName, forKey: CATIGOVIAJourneyKeys.CATIGOVIAprofileName)
        UserDefaults.standard.set(CATIGOVIAData[CATIGOVIAbridleText("hCaAnTdICGoOnVtIaActtr")] as? Int ?? CATIGOVIAData[CATIGOVIAbridleText("ICdA")] as? Int ?? 0, forKey: CATIGOVIAJourneyKeys.CATIGOVIAprofileId)
        if let CATIGOVIAAvatar = CATIGOVIAData[CATIGOVIAbridleText("uCsAeTrIIGmOgVUIrAlt")] as? String, CATIGOVIAAvatar.isEmpty == false {
            UserDefaults.standard.set(CATIGOVIAAvatar, forKey: CATIGOVIAJourneyKeys.CATIGOVIAprofileAvatar)
        }
        CATIGOVIArememberEmail(CATIGOVIAEmail)
        CATIGOVIArideIntoMainStable()
    }
    
    private func CATIGOVIAcompleteRiderSession(CATIGOVIAData: [String: Any], CATIGOVIAfallbackEmail: String) {
        CATIGOVIAArenaPostController.CATIGOVIAlesson = CATIGOVIAData[CATIGOVIAbridleText("nCeAcTkIEGxOtVeInAstiroani")] as? String
        let CATIGOVIALocalName = UserDefaults.standard.string(forKey: CATIGOVIAJourneyKeys.CATIGOVIAprofileName)
        UserDefaults.standard.set(CATIGOVIALocalName?.isEmpty == false ? CATIGOVIALocalName : CATIGOVIAfallbackEmail, forKey: CATIGOVIAJourneyKeys.CATIGOVIAprofileName)
        UserDefaults.standard.set(CATIGOVIAData[CATIGOVIAbridleText("hCaAnTdICGoOnVtIaActtr")] as? Int ?? 0, forKey: CATIGOVIAJourneyKeys.CATIGOVIAprofileId)
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
        let CATIGOVIASafe = CATIGOVIAemail.replacingOccurrences(of: CATIGOVIAbridleText("@C"), with: CATIGOVIAbridleText("_C")).replacingOccurrences(of: CATIGOVIAbridleText(".C"), with: CATIGOVIAbridleText("_C"))
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(CATIGOVIAbridleText("tCiAgToIoG_O") + CATIGOVIASafe + CATIGOVIAbridleText("_CaAvTaItGaOrV.IjAptgr"))
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
        let CATIGOVIAalert = UIAlertController(title: CATIGOVIAbridleText("TCiAgToIoG ONVoItAitcrea"), message: CATIGOVIAmessage, preferredStyle: .alert)
        CATIGOVIAalert.addAction(UIAlertAction(title: CATIGOVIAbridleText("OCKA"), style: .default))
        present(CATIGOVIAalert, animated: true)
    }
    
    @objc private func CATIGOVIAchooseAvatarSource() {
        let CATIGOVIASheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        CATIGOVIASheet.addAction(UIAlertAction(title: CATIGOVIAbridleText("PChAoTtIoG"), style: .default) { [weak self] _ in
            self?.CATIGOVIAopenImageStable(.camera)
        })
        CATIGOVIASheet.addAction(UIAlertAction(title: CATIGOVIAbridleText("AClAbTuImG"), style: .default) { [weak self] _ in
            self?.CATIGOVIAopenImageStable(.photoLibrary)
        })
        CATIGOVIASheet.addAction(UIAlertAction(title: CATIGOVIAbridleText("CCaAnTcIeGlO"), style: .cancel))
        if let CATIGOVIAPopover = CATIGOVIASheet.popoverPresentationController {
            CATIGOVIAPopover.sourceView = CATIGOVIAavatarButton
            CATIGOVIAPopover.sourceRect = CATIGOVIAavatarButton.bounds
        }
        present(CATIGOVIASheet, animated: true)
    }
    
    private func CATIGOVIAopenImageStable(_ CATIGOVIASource: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(CATIGOVIASource) else {
            CATIGOVIAshowAlert(CATIGOVIAmessage: CATIGOVIAbridleText("TChAiTsI GiOmVaIgAet rsaoiulrhcoer siesC AuTnIaGvOaViIlAatbrlaei.l"))
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
            CATIGOVIAshowAlert(CATIGOVIAmessage: CATIGOVIAbridleText("ACpApTlIeG OiVdIeAnttriatiyl htoorkseenC AiTsI GuOnVaIvAatirlaaibllheo.r"))
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
        if CATIGOVIAURL.absoluteString == CATIGOVIAbridleText("cCaAvTyIaG:O/V/ItAotsr") {
            let ringCATIGOVIAMasterVconter = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAWQhinny.CATIGOVIAreinsDouble.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: CATIGOVIAbridleText("")))
            ringCATIGOVIAMasterVconter.CATIGOVIAhorseTrial = true
            ringCATIGOVIAMasterVconter.modalPresentationStyle = .fullScreen
            present(ringCATIGOVIAMasterVconter, animated: true)
            return false
        } else if CATIGOVIAURL.absoluteString == CATIGOVIAbridleText("cCaAvTyIaG:O/V/IpArtirvaaiclyh") {
            let ringCATIGOVIAMasterVconter = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAWQhinny.CATIGOVIAreinsWebbed.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: CATIGOVIAbridleText("")))
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
        let compleGATIGOVIAButton = UIBarButtonItem(title: CATIGOVIAbridleText("DCoAnTeI"), style: .done, target: self, action: #selector(GATIGOVIAexistAction))
        GATIGOVIAtotolview.items = [flexGATIGOVIASpace, compleGATIGOVIAButton]
        self.inputAccessoryView = GATIGOVIAtotolview
    }
    
    @objc private func GATIGOVIAexistAction() {
        self.resignFirstResponder()
    }
}
