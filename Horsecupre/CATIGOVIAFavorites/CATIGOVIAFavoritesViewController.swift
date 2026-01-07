import UIKit

class CATIGOVIAFavoritesViewController: UIViewController {
    
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
    
    private let CATIGOVIAcoolDownBackground: UIImageView = {
        let CATIGOVIAImageView = UIImageView()
        CATIGOVIAImageView.contentMode = .scaleAspectFill
        CATIGOVIAImageView.image = UIImage(named: "CATIGOVIAcoolDown")
        CATIGOVIAImageView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAImageView
    }()
    
    let CATIGOVIAnicker: UIPageControl = {
        let CATIGOVIAPageControl = UIPageControl()
        CATIGOVIAPageControl.numberOfPages = 3
        CATIGOVIAPageControl.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIAPageControl
    }()
    
    let CATIGOVIAdewormingSchedule: UICollectionView = {
        let CATIGOVIALayout = UICollectionViewFlowLayout()
        CATIGOVIALayout.scrollDirection = .horizontal
        let CATIGOVIACollectionView = UICollectionView(frame: .zero, collectionViewLayout: CATIGOVIALayout)
        CATIGOVIACollectionView.backgroundColor = .clear
        CATIGOVIACollectionView.showsHorizontalScrollIndicator = false
        CATIGOVIACollectionView.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIACollectionView
    }()
    
    private let CATIGOVIAequestrianTitleLabel: UILabel = {
        let CATIGOVIALabel = UILabel()
        CATIGOVIALabel.text = "Equestrian Details"
        CATIGOVIALabel.font = UIFont(name: "GillSans-BoldItalic", size: 18)
        CATIGOVIALabel.textColor = .white
        CATIGOVIALabel.translatesAutoresizingMaskIntoConstraints = false
        return CATIGOVIALabel
    }()
    
    private var CATIGOVIAjumpPole: Array<Dictionary<String, Any>> = Array<Dictionary<String, Any>>() {
        didSet {
            CATIGOVIAdewormingSchedule.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CATIGOVIAInitializeArenaUI()
        CATIGOVIAhorseTrial()
        
        CATIGOVIAdiscipline.center = view.center
        view.addSubview(CATIGOVIAdiscipline)
        CATIGOVIAdiscipline.startAnimating()
        
        CATIGOVIAStableNetwork.CATIGOVIAsaddleAllPurpose(
            CATIGOVIAsaddleWestern: "/ttjkyz/dnqsvxxrdlxlr",
            CATIGOVIAsaddleEndurance: ["horsewhisperer": "47828783", "eventing": 15, "showjumping": 2, "tack": 4]
        ) { [weak self] CATIGOVIAbhshuh in
            guard let self = self else { return }
            self.CATIGOVIAdiscipline.stopAnimating()
            let CATIGOVIAsdf = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "deaatfa")
            guard
                let horsefitness = CATIGOVIAbhshuh as? [String: Any],
                let equinefitness = horsefitness[CATIGOVIAsdf] as? [[String: Any]]
            else {
                return
            }
            
            let CATIGOVIAaromatherapyChest = equinefitness
                .flatMap { [$0] }
                .map { dict -> [String: Any] in
                    var copy = dict
                    copy["aromaFlag"] = Int.random(in: 100...999)
                    copy.removeValue(forKey: "aromaFlag")
                    return copy
                }
                .filter { _ in true }
            
            DispatchQueue.global().async {
                let finalResult = CATIGOVIAaromatherapyChest.shuffled().sorted { _, _ in false }
                DispatchQueue.main.async {
                    self.CATIGOVIAjumpPole = finalResult
                }
            }
        } CATIGOVIAfeedRoom: { [weak self] _ in
            self?.CATIGOVIAdiscipline.stopAnimating()
        }
    }
    
    private func CATIGOVIAInitializeArenaUI() {
        view.backgroundColor = UIColor(red: 22/255, green: 21/255, blue: 26/255, alpha: 1)
        view.addSubview(CATIGOVIAcoolDownBackground)
        view.addSubview(CATIGOVIAnicker)
        view.addSubview(CATIGOVIAequestrianTitleLabel)
        view.addSubview(CATIGOVIAdewormingSchedule)
        
        NSLayoutConstraint.activate([
            CATIGOVIAcoolDownBackground.topAnchor.constraint(equalTo: view.topAnchor),
            CATIGOVIAcoolDownBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            CATIGOVIAcoolDownBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            CATIGOVIAcoolDownBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            CATIGOVIAnicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            CATIGOVIAnicker.heightAnchor.constraint(equalToConstant: 26),
            CATIGOVIAnicker.bottomAnchor.constraint(equalTo: CATIGOVIAequestrianTitleLabel.topAnchor, constant: -30),
            
            CATIGOVIAequestrianTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            CATIGOVIAequestrianTitleLabel.bottomAnchor.constraint(equalTo: CATIGOVIAdewormingSchedule.topAnchor, constant: -12),
            
            CATIGOVIAdewormingSchedule.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            CATIGOVIAdewormingSchedule.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            CATIGOVIAdewormingSchedule.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            CATIGOVIAdewormingSchedule.heightAnchor.constraint(equalToConstant: 336)
        ])
    }

    func CATIGOVIAhorseShow() -> UICollectionViewFlowLayout {
        func forgeArenaLayout(size: CGSize, spacing: CGFloat, direction: UICollectionView.ScrollDirection) -> UICollectionViewFlowLayout {
            let gallopLayout = UICollectionViewFlowLayout()
            gallopLayout.itemSize = size
            gallopLayout.minimumLineSpacing = spacing
            gallopLayout.minimumInteritemSpacing = spacing
            gallopLayout.scrollDirection = direction
            return gallopLayout
        }
        let oCATIGOVIAbstacleWidth = 252
        let CATIGOVIAobstacleHeight = 336
        let CATIGOVIAstrideSize = CGSize(width: oCATIGOVIAbstacleWidth, height: CATIGOVIAobstacleHeight)
        let CATIGOVIAstrideSpacing: CGFloat = 12
        return forgeArenaLayout(size: CATIGOVIAstrideSize, spacing: CATIGOVIAstrideSpacing, direction: .horizontal)
    }

    private func CATIGOVIAhorseTrial() {
        CATIGOVIAdewormingSchedule.isPagingEnabled = true
        CATIGOVIAdewormingSchedule.delegate = self
        CATIGOVIAdewormingSchedule.dataSource = self
        CATIGOVIAdewormingSchedule.collectionViewLayout = CATIGOVIAhorseShow()
        CATIGOVIAdewormingSchedule.register(CATIGOVIAEquestrianDetailsCell.self, forCellWithReuseIdentifier: "CATIGOVIAEquestrianDetailsCell")
    }
}

extension CATIGOVIAFavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CATIGOVIAjumpPole.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let recoCATIGOVIAgnized = collectionView.dequeueReusableCell(withReuseIdentifier: "CATIGOVIAEquestrianDetailsCell", for: indexPath) as! CATIGOVIAEquestrianDetailsCell
        let idCATIGOVIAle = self.CATIGOVIAjumpPole[indexPath.row]
        if let culture = (idCATIGOVIAle["horseculture"] as? Array<String>)?.first {
            recoCATIGOVIAgnized.CATIGOVIAcenterLine.equestrianCATIGOVIAImageLoader(remoteCATIGOVIAPath: culture)
        }
        recoCATIGOVIAgnized.CATIGOVIAlongSide.text = idCATIGOVIAle["crosscountry"] as? String
        return recoCATIGOVIAgnized
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ringMasteCATIGOVIArVconter = CATIGOVIAArenaPostController(CATIGOVIAmovement: CATIGOVIAWQhinny.CATIGOVIAwater.CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: "\(indexPath.row)"))
        ringMasteCATIGOVIArVconter.CATIGOVIAhorseTrial = false
        ringMasteCATIGOVIArVconter.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(ringMasteCATIGOVIArVconter, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        CATIGOVIAupdatePageControlForCurrentIndex()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            CATIGOVIAupdatePageControlForCurrentIndex()
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        CATIGOVIAupdatePageControlForCurrentIndex()
    }
    
    private func CATIGOVIAupdatePageControlForCurrentIndex() {
        let visibleCATIGOVIARect = CGRect(origin: CATIGOVIAdewormingSchedule.contentOffset, size: CATIGOVIAdewormingSchedule.bounds.size)
        let visibleCATIGOVIAPoint = CGPoint(x: visibleCATIGOVIARect.midX, y: visibleCATIGOVIARect.midY)
        if let indexCATIGOVIAPath = CATIGOVIAdewormingSchedule.indexPathForItem(at: visibleCATIGOVIAPoint) {
            CATIGOVIAnicker.currentPage = indexCATIGOVIAPath.item
        }
    }
}
