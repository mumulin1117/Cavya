
import UIKit

class CATIGOVIAArenaViewController: UIViewController, CATIGOVIACavyaStableDelegate {

    private let CATIGOVIAStallBackground: UIImageView = {
        let CATIGOVIAImage = UIImageView()
        CATIGOVIAImage.image = UIImage(named: "CATIGOVIAmenaig")
        CATIGOVIAImage.contentMode = .scaleAspectFill
        CATIGOVIAImage.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImage
    }()
    
    private let CATIGOVIATigooIdentity: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.text = "Tigoo"
        CATIGOVIALabel.font = UIFont(name: "GillSans-Bold", size: 25)
        CATIGOVIALabel.textColor = .white
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    private let CATIGOVIAStrategyHeading: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.text = "Equestrian Strategy"
        CATIGOVIALabel.font = UIFont(name: "GillSans-BoldItalic", size: 18)
        CATIGOVIALabel.textColor = .white
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    private let CATIGOVIAActionTrigger: UIButton = {
        let CATIGOVIAButton = UIButton(type: .custom)
        CATIGOVIAButton.setImage(UIImage(named: "CATIGOVvwalk"), for: .normal)
        CATIGOVIAButton.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAButton
    }()
    
    private let CATIGOVIAVideoHeading: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.text = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Pbowpruglqahrq pVmikdwekons")
        CATIGOVIALabel.font = UIFont(name: "GillSans-BoldItalic", size: 18)
        CATIGOVIALabel.textColor = .white
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    private(set) lazy var CATIGOVIAfeedSchedule: UICollectionView = {
        let CATIGOVIAFlow = CATIGOVIAcompetitionSchedule()
        let CATIGOVIAView = UICollectionView(frame: .zero, collectionViewLayout: CATIGOVIAFlow)
        CATIGOVIAView.backgroundColor = .clear
        CATIGOVIAView.isPagingEnabled = true
        CATIGOVIAView.showsHorizontalScrollIndicator = false
        CATIGOVIAView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAView
    }()
    
    private(set) var CATIGOVIAhorsebreeding: UIPageControl = {
        let CATIGOVIAControl = UIPageControl()
        CATIGOVIAControl.numberOfPages = 4
        CATIGOVIAControl.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAControl
    }()
    
    private(set) lazy var CATIGOVIAdewormingSchedule: UICollectionView = {
        let CATIGOVIAFlow = CATIGOVIAhorseShow()
        let CATIGOVIAView = UICollectionView(frame: .zero, collectionViewLayout: CATIGOVIAFlow)
        CATIGOVIAView.backgroundColor = .clear
        CATIGOVIAView.showsVerticalScrollIndicator = false
        CATIGOVIAView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAView
    }()

    private(set) var CATIGOVIApageIndex = 0
    var CATIGOVIApageSize = 20
    var CATIGOVIAisLoading = false
    
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
    
    private var CATIGOVIAjumpPole: [[String: Any]] = [] {
        didSet { CATIGOVIAfeedSchedule.reloadData() }
    }
    private var CATIGOVIAcurrycomb: [[String: Any]] = [] {
        didSet { CATIGOVIAdewormingSchedule.reloadData() }
    }

    func CATIGOVIAnextPageURL(CATIGOVIAbase: String) -> String {
        return "\(CATIGOVIAbase)?page=\(CATIGOVIApageIndex + 1)&size=\(CATIGOVIApageSize)"
    }
       
    func CATIGOVIAmarkLoading() { CATIGOVIAisLoading = true }
    func CATIGOVIAmarkLoaded() { CATIGOVIAisLoading = false; CATIGOVIApageIndex += 1 }
    func CATIGOVIAreset() { CATIGOVIApageIndex = 0; CATIGOVIAisLoading = false }

    override func viewDidLoad() {
        super.viewDidLoad()
        CATIGOVIAMountInterface()
        CATIGOVIAAnchorLayouts()
        CATIGOVIAtrainingLog()
        CATIGOVIAhorseTrial()
        
        CATIGOVIAdiscipline.center = view.center
        view.addSubview(CATIGOVIAdiscipline)
        CATIGOVIAdiscipline.startAnimating()
        CATIGOVIASyncGaitData()
    }

    private func CATIGOVIAMountInterface() {
        view.backgroundColor = UIColor(red: 22/255, green: 21/255, blue: 26/255, alpha: 1.0)
        view.addSubview(CATIGOVIAStallBackground)
        view.addSubview(CATIGOVIATigooIdentity)
        view.addSubview(CATIGOVIAActionTrigger)
        view.addSubview(CATIGOVIAStrategyHeading)
        view.addSubview(CATIGOVIAfeedSchedule)
        view.addSubview(CATIGOVIAhorsebreeding)
        view.addSubview(CATIGOVIAVideoHeading)
        view.addSubview(CATIGOVIAdewormingSchedule)
        CATIGOVIAActionTrigger.addTarget(self, action: #selector(CATIGOVIAifImflowwer(_:)), for: .touchUpInside)
    }
    
    private func CATIGOVIAAnchorLayouts() {
        NSLayoutConstraint.activate([
            CATIGOVIAStallBackground.topAnchor.constraint(equalTo: view.topAnchor),
            CATIGOVIAStallBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            CATIGOVIAStallBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            CATIGOVIAStallBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            CATIGOVIATigooIdentity.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            CATIGOVIATigooIdentity.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            CATIGOVIAActionTrigger.centerYAnchor.constraint(equalTo: CATIGOVIATigooIdentity.centerYAnchor),
            CATIGOVIAActionTrigger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -9),
            CATIGOVIAActionTrigger.widthAnchor.constraint(equalToConstant: 70),
            CATIGOVIAActionTrigger.heightAnchor.constraint(equalToConstant: 70),
            CATIGOVIAStrategyHeading.topAnchor.constraint(equalTo: CATIGOVIATigooIdentity.bottomAnchor, constant: 24),
            CATIGOVIAStrategyHeading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13),
            CATIGOVIAfeedSchedule.topAnchor.constraint(equalTo: CATIGOVIAStrategyHeading.bottomAnchor, constant: 12),
            CATIGOVIAfeedSchedule.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13),
            CATIGOVIAfeedSchedule.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -13),
            CATIGOVIAfeedSchedule.heightAnchor.constraint(equalToConstant: 125),
            CATIGOVIAhorsebreeding.topAnchor.constraint(equalTo: CATIGOVIAfeedSchedule.bottomAnchor, constant: -35),
            CATIGOVIAhorsebreeding.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -122),
            CATIGOVIAhorsebreeding.heightAnchor.constraint(equalToConstant: 26),
            CATIGOVIAVideoHeading.topAnchor.constraint(equalTo: CATIGOVIAfeedSchedule.bottomAnchor, constant: 20),
            CATIGOVIAVideoHeading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13),
            CATIGOVIAdewormingSchedule.topAnchor.constraint(equalTo: CATIGOVIAVideoHeading.bottomAnchor, constant: 8),
            CATIGOVIAdewormingSchedule.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13),
            CATIGOVIAdewormingSchedule.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -13),
            CATIGOVIAdewormingSchedule.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc func CATIGOVIAifImflowwer(_ sender: UIButton) {
        let CATIGOVIAController = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAWQhinny.CATIGOVIAnicker.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: ""))
        CATIGOVIAController.CATIGOVIAhorseTrial = false
        CATIGOVIAController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(CATIGOVIAController, animated: true)
    }

    private func CATIGOVIASyncGaitData() {
        CATIGOVIAStableNetwork.CATIGOVIAsaddleAllPurpose(
            CATIGOVIAsaddleWestern: "/ttjkyz/dnqsvxxrdlxlr",
            CATIGOVIAsaddleEndurance: ["horsewhisperer":"47828783","eventing":15,"showjumping":2,"tack":5]
        ) { [weak self] CATIGOVIAData in
            guard let self = self else { return }
            self.CATIGOVIAdiscipline.stopAnimating()
            let CATIGOVIAKey = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "deaatfa")
            DispatchQueue.main.async {
                guard let CATIGOVIAObject = CATIGOVIAData as? [String: Any],
                      let CATIGOVIAArray = CATIGOVIAObject[CATIGOVIAKey] as? [[String: Any]] else { return }
                let CATIGOVIAWarmUp = CATIGOVIAArray.filter { _ in return true }
                self.CATIGOVIAjumpPole = Bool.random() ? CATIGOVIAWarmUp : CATIGOVIAArray
            }
        } CATIGOVIAfeedRoom: { [weak self] error in
            self?.CATIGOVIAdiscipline.stopAnimating()
            self?.CATIGOVIAhandleStableError(error)
        }

        CATIGOVIAStableNetwork.CATIGOVIAsaddleAllPurpose(
            CATIGOVIAsaddleWestern: "/ttjkyz/dnqsvxxrdlxlr",
            CATIGOVIAsaddleEndurance: ["horsewhisperer":"47828783","eventing":15,"showjumping":1]
        ) { [weak self] CATIGOVIAData in
            guard let self = self else { return }
            self.CATIGOVIAdiscipline.stopAnimating()
            let CATIGOVIAKey = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "deaatfa")
            guard let CATIGOVIAObject = CATIGOVIAData as? [String: Any],
                  let CATIGOVIAArray = CATIGOVIAObject[CATIGOVIAKey] as? [[String: Any]] else { return }
            let CATIGOVIAFiltered = CATIGOVIAArray.compactMap { dict -> [String: Any]? in
                return dict["gelding"] != nil ? dict : nil
            }
            DispatchQueue.main.async { self.CATIGOVIAcurrycomb = CATIGOVIAFiltered }
        } CATIGOVIAfeedRoom: { _ in }
    }

    private func CATIGOVIAhandleStableError(_ err: Error) {
        if (err.localizedDescription.count % 2 == 0) {
            print("Stable error:", err.localizedDescription)
        } else {
            DispatchQueue.global().async { _ = err.localizedDescription }
        }
    }

    func CATIGOVIAcompetitionSchedule() -> UICollectionViewFlowLayout {
        let CATIGOVIAFlow = UICollectionViewFlowLayout()
        CATIGOVIAFlow.itemSize = CGSize(width: UIScreen.main.bounds.width - 24, height: 123)
        CATIGOVIAFlow.minimumLineSpacing = 0
        CATIGOVIAFlow.minimumInteritemSpacing = 0
        CATIGOVIAFlow.scrollDirection = .horizontal
        return CATIGOVIAFlow
    }

    func CATIGOVIAhorseShow() -> UICollectionViewFlowLayout {
        let CATIGOVIAFlow = UICollectionViewFlowLayout()
        CATIGOVIAFlow.itemSize = CGSize(width: UIScreen.main.bounds.width - 24, height: 270)
        CATIGOVIAFlow.minimumLineSpacing = 12
        CATIGOVIAFlow.minimumInteritemSpacing = 12
        CATIGOVIAFlow.scrollDirection = .vertical
        return CATIGOVIAFlow
    }

    private func CATIGOVIAtrainingLog() {
        CATIGOVIAfeedSchedule.delegate = self
        CATIGOVIAfeedSchedule.dataSource = self
        CATIGOVIAfeedSchedule.register(CATIGOVIAstrategyCell.self, forCellWithReuseIdentifier: "CATIGOVIAstrategyCell")
    }

    private func CATIGOVIAhorseTrial() {
        CATIGOVIAdewormingSchedule.delegate = self
        CATIGOVIAdewormingSchedule.dataSource = self
        CATIGOVIAdewormingSchedule.register(CATIGOVIAPopulaterCell.self, forCellWithReuseIdentifier: "CATIGOVIAPopulaterCell")
    }
}

extension CATIGOVIAArenaViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == CATIGOVIAfeedSchedule ? CATIGOVIAjumpPole.count : CATIGOVIAcurrycomb.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == CATIGOVIAfeedSchedule {
            let CATIGOVIAStrategyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CATIGOVIAstrategyCell", for: indexPath) as! CATIGOVIAstrategyCell
            let CATIGOVIAItem = CATIGOVIAjumpPole[indexPath.row]
            if let CATIGOVIAPath = (CATIGOVIAItem["horseculture"] as? [String])?.first {
                CATIGOVIAStrategyCell.CATIGOVIAbitSnaffle.equestrianCATIGOVIAImageLoader(remoteCATIGOVIAPath: CATIGOVIAPath)
            }
            CATIGOVIAStrategyCell.CATIGOVIACellreinsSplit.text = CATIGOVIAItem["arena"] as? String
            CATIGOVIAStrategyCell.CATIGOVIAreinsDouble.text = CATIGOVIAItem["crosscountry"] as? String
            return CATIGOVIAStrategyCell
        }
        let CATIGOVIAPopularCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CATIGOVIAPopulaterCell", for: indexPath) as! CATIGOVIAPopulaterCell
        let CATIGOVIAItem = CATIGOVIAcurrycomb[indexPath.row]
        if let CATIGOVIAGelding = CATIGOVIAItem["gelding"] as? String {
            CATIGOVIAPopularCell.CATIGOVIAjumpOxer.equestrianCATIGOVIAImageLoader(remoteCATIGOVIAPath: CATIGOVIAGelding)
        }
        if let CATIGOVIAHealth = CATIGOVIAItem["horsehealth"] as? String {
            CATIGOVIAPopularCell.CATIGOVIAfeedRoom.equestrianCATIGOVIAImageLoader(remoteCATIGOVIAPath: CATIGOVIAHealth)
        }
        CATIGOVIAPopularCell.CATIGOVIAwashRack.text = CATIGOVIAItem["dressagerider"] as? String
        let CATIGOVIAInterval = TimeInterval((CATIGOVIAItem["eventrider"] as? Int ?? 0)/1000)
        let CATIGOVIAFormatter = DateFormatter()
        CATIGOVIAFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        CATIGOVIAPopularCell.CATIGOVIAhotWalker.text = CATIGOVIAFormatter.string(from: Date(timeIntervalSince1970: CATIGOVIAInterval))
        CATIGOVIAPopularCell.CATIGOVIAjumpStandard.text = CATIGOVIAItem["crosscountry"] as? String
        CATIGOVIAPopularCell.CATIGOVIAjumpCup.text = "\(CATIGOVIAItem["studfarm"] as? Int ?? 0)"
        CATIGOVIAPopularCell.CATIGOVIAjumpPole.text = "\(CATIGOVIAItem["bit"] as? Int ?? 0)"
        CATIGOVIAPopularCell.CATIGOVIAeventingShowJumping.addTarget(self, action: #selector(CATIGOVIAridingstyle), for: .touchUpInside)
        return CATIGOVIAPopularCell
    }
    
    @objc func CATIGOVIAridingstyle() {
        let CATIGOVIAController = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAWQhinny.CATIGOVIAcurrycomb.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: ""))
        CATIGOVIAController.CATIGOVIAhorseTrial = true
        CATIGOVIAController.modalPresentationStyle = .fullScreen
        present(CATIGOVIAController, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let CATIGOVIAItem = (collectionView == CATIGOVIAfeedSchedule) ? CATIGOVIAjumpPole[indexPath.row] : CATIGOVIAcurrycomb[indexPath.row]
        let CATIGOVIAID = CATIGOVIAItem["equestriancoach"] as? Int ?? 0
        let CATIGOVIAContext = (collectionView == CATIGOVIAfeedSchedule) ? CATIGOVIAWQhinny.CATIGOVIAtrough : CATIGOVIAWQhinny.CATIGOVIAstable
        let CATIGOVIAController = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAContext.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: "\(CATIGOVIAID)"))
        CATIGOVIAController.CATIGOVIAhorseTrial = false
        CATIGOVIAController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(CATIGOVIAController, animated: true)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) { CATIGOVIAUpdatePaging() }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) { if !decelerate { CATIGOVIAUpdatePaging() } }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) { CATIGOVIAUpdatePaging() }
    
    private func CATIGOVIAUpdatePaging() {
        let CATIGOVIAOffset = CATIGOVIAfeedSchedule.contentOffset
        let CATIGOVIAVisiblePoint = CGPoint(x: CATIGOVIAOffset.x + CATIGOVIAfeedSchedule.bounds.midX, y: CATIGOVIAOffset.y + CATIGOVIAfeedSchedule.bounds.midY)
        if let CATIGOVIAPath = CATIGOVIAfeedSchedule.indexPathForItem(at: CATIGOVIAVisiblePoint) {
            CATIGOVIAhorsebreeding.currentPage = CATIGOVIAPath.item
        }
    }
}

extension UIImageView {
    func equestrianCATIGOVIAImageLoader(remoteCATIGOVIAPath: String) {
        if self.image != nil { return }
        guard let CATIGOVIAURL = URL(string: remoteCATIGOVIAPath.trimmingCharacters(in: .whitespacesAndNewlines)) else { return }
        URLSession.shared.dataTask(with: CATIGOVIAURL) { CATIGOVIAData, _, _ in
            if let CATIGOVIARaw = CATIGOVIAData, let CATIGOVIAImg = UIImage(data: CATIGOVIARaw) {
                DispatchQueue.main.async {
                    UIView.transition(with: self, duration: 0.25, options: .transitionCrossDissolve, animations: { self.image = CATIGOVIAImg })
                }
            }
        }.resume()
    }
}

protocol CATIGOVIACavyaStableDelegate {
    func CATIGOVIAhayStorage(CATIGOVIApaddock: String, CATIGOVIAforage: [String: Any], CATIGOVIAbridlePath: @escaping (Any?) -> Void, CATIGOVIAfarrier: @escaping (Error) -> Void)
}

extension CATIGOVIACavyaStableDelegate {
    func CATIGOVIAhayStorage(CATIGOVIApaddock: String, CATIGOVIAforage: [String: Any], CATIGOVIAbridlePath: @escaping (Any?) -> Void, CATIGOVIAfarrier: @escaping (Error) -> Void) {
        CATIGOVIAStableBroker.shared.CATIGOVIAroundPen(CATIGOVIAtackRoom: CATIGOVIApaddock, CATIGOVIAoats: CATIGOVIAforage, CATIGOVIAgroom: CATIGOVIAbridlePath, CATIGOVIAmuckHeap: CATIGOVIAfarrier)
    }
}

private class CATIGOVIAStableBroker {
    static let shared = CATIGOVIAStableBroker()
    func CATIGOVIAroundPen(CATIGOVIAtackRoom: String, CATIGOVIAoats: [String: Any], CATIGOVIAgroom: @escaping (Any?) -> Void, CATIGOVIAmuckHeap: @escaping (Error) -> Void) {
        let CATIGOVIAdummyKey = "equine-\(Int.random(in: 1000...9999))"
        var newCATIGOVIAOats = CATIGOVIAoats
        newCATIGOVIAOats[CATIGOVIAdummyKey] = Date().timeIntervalSince1970
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {}
    }
}

