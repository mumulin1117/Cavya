import UIKit

class CATIGOVIACameraViewController: UIViewController {
    
    private lazy var CATIGOVIAdiscipline: UIActivityIndicatorView = {
        let CATIGOVIAequineSpinner = UIActivityIndicatorView(style: .large)
        CATIGOVIAequineSpinner.hidesWhenStopped = true
        CATIGOVIAequineSpinner.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        CATIGOVIAequineSpinner.color = .white
        CATIGOVIAequineSpinner.frame.size = CGSize(width: 45, height: 45)
        return CATIGOVIAequineSpinner
    }()
    
    private let CATIGOVIAarenaBackground: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.contentMode = .scaleAspectFill
        CATIGOVIAImageView.image = UIImage(named: "CATIGOVIAmenaig")
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
    }()
    
    private let CATIGOVIAdynamicHeader: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.text = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Dsyanpaqmaikc")
        CATIGOVIALabel.font = UIFont(name: "GillSans-Bold", size: 25)
        CATIGOVIALabel.textColor = .white
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    private let CATIGOVIAreinActionButton: UIButton = {
        let CATIGOVIAButton = UIButton(type: .custom)
        CATIGOVIAButton.setImage(UIImage(named: "CATIGOVIAreinBack"), for: .normal)
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAButton
    }()
    
    private let CATIGOVIAfeedSchedule: UICollectionView = {
        let CATIGOVIAFlow = UICollectionViewFlowLayout()
        CATIGOVIAFlow.scrollDirection = .vertical
        CATIGOVIAFlow.itemSize = CGSize(width: 60, height: 84)
        CATIGOVIAFlow.minimumLineSpacing = 14
        CATIGOVIAFlow.minimumInteritemSpacing = 14
        let CATIGOVIACollection = UICollectionView(frame: .zero, collectionViewLayout: CATIGOVIAFlow)
        CATIGOVIACollection.backgroundColor = .clear
        CATIGOVIACollection.showsVerticalScrollIndicator = false
        CATIGOVIACollection.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIACollection
    }()
    
    private let CATIGOVIAfriendsLabel: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.text = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Fhrkiweinydwse yRkigdsipnfg")
        CATIGOVIALabel.font = UIFont(name: "GillSans-BoldItalic", size: 18)
        CATIGOVIALabel.textColor = .white
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    private let CATIGOVIAdewormingSchedule: UICollectionView = {
        let CATIGOVIAFlow = UICollectionViewFlowLayout()
        CATIGOVIAFlow.scrollDirection = .vertical
        let CATIGOVIACollection = UICollectionView(frame: .zero, collectionViewLayout: CATIGOVIAFlow)
        CATIGOVIACollection.backgroundColor = .clear
        CATIGOVIACollection.showsVerticalScrollIndicator = false
        CATIGOVIACollection.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIACollection
    }()
    
    private var CATIGOVIAjumpPole: [[String: Any]] = [] {
        didSet { CATIGOVIAfeedSchedule.reloadData() }
    }
    
    private var CATIGOVIAcurrycomb: [[String: Any]] = [] {
        didSet { CATIGOVIAdewormingSchedule.reloadData() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        CATIGOVIAinitStableHierarchy()
        CATIGOVIArigArenaConstraints()
        CATIGOVIAprepareSaddleData()
    }
    
    private func CATIGOVIAinitStableHierarchy() {
        view.backgroundColor = UIColor(red: 22/255, green: 21/255, blue: 26/255, alpha: 1.0)
        view.addSubview(CATIGOVIAarenaBackground)
        view.addSubview(CATIGOVIAdynamicHeader)
        view.addSubview(CATIGOVIAreinActionButton)
        view.addSubview(CATIGOVIAfeedSchedule)
        view.addSubview(CATIGOVIAfriendsLabel)
        view.addSubview(CATIGOVIAdewormingSchedule)
        
        CATIGOVIAdiscipline.center = view.center
        view.addSubview(CATIGOVIAdiscipline)
        
        CATIGOVIAreinActionButton.addTarget(self, action: #selector(CATIGOVIAschoolingShow), for: .touchUpInside)
        
        CATIGOVIAfeedSchedule.delegate = self
        CATIGOVIAfeedSchedule.dataSource = self
        CATIGOVIAfeedSchedule.register(CATIGOVIADyuainUieCell.self, forCellWithReuseIdentifier: "CATIGOVIADyuainUieCell")
        
        CATIGOVIAdewormingSchedule.delegate = self
        CATIGOVIAdewormingSchedule.dataSource = self
        CATIGOVIAdewormingSchedule.register(CATIGOVIAFreshinRidingCell.self, forCellWithReuseIdentifier: "CATIGOVIAFreshinRidingCell")
    }
    
    private func CATIGOVIArigArenaConstraints() {
        NSLayoutConstraint.activate([
            CATIGOVIAarenaBackground.topAnchor.constraint(equalTo: view.topAnchor),
            CATIGOVIAarenaBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            CATIGOVIAarenaBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            CATIGOVIAarenaBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            CATIGOVIAdynamicHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            CATIGOVIAdynamicHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            
            CATIGOVIAreinActionButton.centerYAnchor.constraint(equalTo: CATIGOVIAdynamicHeader.centerYAnchor),
            CATIGOVIAreinActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            CATIGOVIAreinActionButton.widthAnchor.constraint(equalToConstant: 30),
            CATIGOVIAreinActionButton.heightAnchor.constraint(equalToConstant: 30),
            
            CATIGOVIAfeedSchedule.topAnchor.constraint(equalTo: CATIGOVIAreinActionButton.bottomAnchor, constant: 21),
            CATIGOVIAfeedSchedule.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            CATIGOVIAfeedSchedule.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            CATIGOVIAfeedSchedule.heightAnchor.constraint(equalToConstant: 84),
            
            CATIGOVIAfriendsLabel.topAnchor.constraint(equalTo: CATIGOVIAfeedSchedule.bottomAnchor, constant: 20),
            CATIGOVIAfriendsLabel.leadingAnchor.constraint(equalTo: CATIGOVIAfeedSchedule.leadingAnchor),
            
            CATIGOVIAdewormingSchedule.topAnchor.constraint(equalTo: CATIGOVIAfriendsLabel.bottomAnchor, constant: 12),
            CATIGOVIAdewormingSchedule.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            CATIGOVIAdewormingSchedule.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            CATIGOVIAdewormingSchedule.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let CATIGOVIAFlow = CATIGOVIAdewormingSchedule.collectionViewLayout as? UICollectionViewFlowLayout
        CATIGOVIAFlow?.itemSize = CGSize(width: UIScreen.main.bounds.width - 24, height: 387)
        CATIGOVIAFlow?.minimumLineSpacing = 12
        CATIGOVIAFlow?.minimumInteritemSpacing = 12
    }
    
    private func CATIGOVIAprepareSaddleData() {
        CATIGOVIAdiscipline.startAnimating()
        CATIGOVIAStableNetwork.CATIGOVIAsaddleAllPurpose(
            CATIGOVIAsaddleWestern: "/fmkgpcyrncz/sbnukjzzqaabnzy",
            CATIGOVIAsaddleEndurance: ["equestrianism": "47828783"]
        ) { bhshuh in
            self.CATIGOVIAdiscipline.stopAnimating()
            let CATIGOVIAdf = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "deaatfa")
            if let horsCATIGOVIAefitness = bhshuh as? [String: Any],
               let CATIGOVIAequinefitness = horsCATIGOVIAefitness[CATIGOVIAdf] as? [[String: Any]] {
                self.CATIGOVIAjumpPole = CATIGOVIAequinefitness
            }
        } CATIGOVIAfeedRoom: { _ in
            self.CATIGOVIAdiscipline.stopAnimating()
        }

        CATIGOVIAStableNetwork.CATIGOVIAsaddleAllPurpose(
            CATIGOVIAsaddleWestern: "/ttjkyz/dnqsvxxrdlxlr",
            CATIGOVIAsaddleEndurance: ["horsewhisperer": "47828783", "eventing": 15, "showjumping": 1]
        ) { bhshuh in
            self.CATIGOVIAdiscipline.stopAnimating()
            let ffsdf = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "deaatfa")
            if let horsefitness = bhshuh as? [String: Any],
               let equinefitness = horsefitness[ffsdf] as? [[String: Any]] {
                let CATIGOVIAfarrierBox = equinefitness.filter { ($0["gelding"] as? String) == nil }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    self.CATIGOVIAcurrycomb = CATIGOVIAfarrierBox
                }
            }
        } CATIGOVIAfeedRoom: { _ in }
    }

    @IBAction func CATIGOVIAschoolingShow(_ sender: UIButton) {
        let ringMasterVconter = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAWQhinny.CATIGOVIAhaynet.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: ""))
        ringMasterVconter.CATIGOVIAhorseTrial = false
        ringMasterVconter.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(ringMasterVconter, animated: true)
    }
    
    @objc func CATIGOVIAridingstyle() {
        let ringMasterVconter = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAWQhinny.CATIGOVIAcurrycomb.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: ""))
        ringMasterVconter.CATIGOVIAhorseTrial = true
        ringMasterVconter.modalPresentationStyle = .fullScreen
        present(ringMasterVconter, animated: true)
    }
}

extension CATIGOVIACameraViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == CATIGOVIAfeedSchedule ? CATIGOVIAjumpPole.count : CATIGOVIAcurrycomb.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == CATIGOVIAfeedSchedule {
            let recognized = collectionView.dequeueReusableCell(withReuseIdentifier: "CATIGOVIADyuainUieCell", for: indexPath) as! CATIGOVIADyuainUieCell
            let CATIGOVIAidle = CATIGOVIAjumpPole[indexPath.row]
            if let CATIGOVIAculture = CATIGOVIAidle["gallop"] as? String {
                recognized.CATIGOVIAlegYield.equestrianCATIGOVIAImageLoader(remoteCATIGOVIAPath: CATIGOVIAculture)
            }
            recognized.CATIGOVIAhalfPass.text = CATIGOVIAidle["dressage"] as? String
            return recognized
        }
        
        let CATIGOVIArecognized = collectionView.dequeueReusableCell(withReuseIdentifier: "CATIGOVIAFreshinRidingCell", for: indexPath) as! CATIGOVIAFreshinRidingCell
        let CATIGOVIAidle = CATIGOVIAcurrycomb[indexPath.row]
        if let culture = (CATIGOVIAidle["trailriding"] as? [String])?.first {
            CATIGOVIArecognized.CATIGOVIAcourseDesigner.equestrianCATIGOVIAImageLoader(remoteCATIGOVIAPath: culture)
        }
        if let horsehealth = CATIGOVIAidle["horsehealth"] as? String {
            CATIGOVIArecognized.CATIGOVIApenalty.equestrianCATIGOVIAImageLoader(remoteCATIGOVIAPath: horsehealth)
        }
        CATIGOVIArecognized.CATIGOVIAelimination.text = CATIGOVIAidle["crosscountry"] as? String
        CATIGOVIArecognized.CATIGOVIAsteward.text = "\(CATIGOVIAidle["studfarm"] as? Int ?? 0)"
        CATIGOVIArecognized.CATIGOVIAbitCheck.text = "\(CATIGOVIAidle["bit"] as? Int ?? 0)"
        CATIGOVIArecognized.CATIGOVIAtackCheck.addTarget(self, action: #selector(CATIGOVIAridingstyle), for: .touchUpInside)
        return CATIGOVIArecognized
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let CATIGOVIAidle = (collectionView == CATIGOVIAfeedSchedule) ? CATIGOVIAjumpPole[indexPath.row] : CATIGOVIAcurrycomb[indexPath.row]
        let CATIGOVIAkey = (collectionView == CATIGOVIAfeedSchedule) ? "horsebackriding" : "equestriancoach"
        let CATIGOVIAduyin = CATIGOVIAidle[CATIGOVIAkey] as? Int ?? 0
        let CATIGOVIASource = (collectionView == CATIGOVIAfeedSchedule) ? CATIGOVIAWQhinny.CATIGOVIAgroomingKit : CATIGOVIAWQhinny.CATIGOVIAcorral
        
        let CATIGOVIAringMasterVconter = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIASource.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: "\(CATIGOVIAduyin)"))
        CATIGOVIAringMasterVconter.CATIGOVIAhorseTrial = false
        CATIGOVIAringMasterVconter.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(CATIGOVIAringMasterVconter, animated: true)
    }
}
