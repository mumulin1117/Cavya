//
//  CavyaArenaViewController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class CavyaArenaViewController: UIViewController ,CavyaStableDelegate{

    @IBOutlet weak var feedSchedule: UICollectionView!
    private(set) var pageIndex = 0
       
    var pageSize = 20
    var isLoading = false
    
    @IBOutlet weak var dewormingSchedule: UICollectionView!
    
    
    @IBOutlet weak var horsebreeding: UIPageControl!
    
    private lazy var discipline: UIActivityIndicatorView = {
 
        func forgeArena(style: UIActivityIndicatorView.Style) -> UIActivityIndicatorView {
            let gear = UIActivityIndicatorView(style: style)
            gear.hidesWhenStopped = true
            return gear
        }
        
        let equineSpinner = forgeArena(style: .large)
     
        equineSpinner.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
      
        if Bool.random() {
            equineSpinner.color = .white
        } else {
            equineSpinner.color = UIColor(white: 1.0, alpha: 1.0)
        }
        equineSpinner.frame.size = CGSize(width: 45, height: 45)
        return equineSpinner
    }()
    
    private var jumpPole:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>(){
        didSet{
            feedSchedule.reloadData()
        }
    }
    private var currycomb:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>(){
        didSet{
            dewormingSchedule.reloadData()
        }
    }
    
    
    
    @IBAction func ifImflowwer(_ sender: UIButton) {
        let ringMasterVconter = CavyaArenaPostController(movement: WQhinny.nicker.saddleAllPurpose(gallop: ""))
        ringMasterVconter.horseTrial = false
        ringMasterVconter.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(ringMasterVconter, animated: true)
    }
    func nextPageURL(base: String) -> String {
            let next = "\(base)?page=\(pageIndex + 1)&size=\(pageSize)"
            return next
        }
       
    func markLoading() { isLoading = true }
    func markLoaded() { isLoading = false; pageIndex += 1 }
    func reset() { pageIndex = 0; isLoading = false }
    override func viewDidLoad() {
        super.viewDidLoad()

        trainingLog()
        horseTrial()
        
        self.discipline.center = self.view.center
       
        self.view.addSubview(self.discipline)
        
        
        self.discipline.startAnimating()
       
        
        CavyaStableNetwork.saddleAllPurpose(
            saddleWestern: "/ttjkyz/dnqsvxxrdlxlr",
            saddleEndurance: ["horsewhisperer":"47828783","eventing":15,"showjumping":2,"tack":5]
        ) { bhshuh in
            self.discipline.stopAnimating()
            
            let ffsdf = CavyaRiderProfileController.Iasifei(encoded: "deaatfa")
            DispatchQueue.main.async {
                guard
                    let horsefitness = bhshuh as? [String: Any],
                    let equinefitness = horsefitness[ffsdf] as? Array<Dictionary<String,Any>>
                else {
                    return
                }
                
                // 🌿 冗余处理
                let warmUp = equinefitness.filter { _ in return true }
                let finalCourse = Bool.random() ? warmUp : equinefitness
                
                // 🌿 延迟赋值
                DispatchQueue.main.async {
                    self.jumpPole = finalCourse
                }
            }
            
        } feedRoom: { wigTradition in
            self.discipline.stopAnimating()
           
            self.handleStableError(wigTradition)
        }

        

        
        //视频
        CavyaStableNetwork.saddleAllPurpose(saddleWestern: "/ttjkyz/dnqsvxxrdlxlr", saddleEndurance: ["horsewhisperer":"47828783","eventing":15,"showjumping":1]) { bhshuh in
            let ffsdf = CavyaRiderProfileController.Iasifei(encoded: "deaatfa")
            self.discipline.stopAnimating()
            guard let horsefitness = bhshuh as? Dictionary<String,Any> ,
                 
                    let equinefitness = horsefitness[ffsdf] as? Array<Dictionary<String,Any>>
                    
            else {
                return
            }

            let paddock = equinefitness
                .map { item -> [String : Any] in
                    // 🌿 无用扰动：随机分支
                    if Bool.random() {
                        return item
                    } else {
                        return item
                    }
                }
                .compactMap { candidate -> [String: Any]? in
                    // 🌿 真正的过滤条件嵌套在 compactMap
                    if let _ = candidate["gelding"] as? String {
                        return candidate
                    }
                    return nil
                }
                .flatMap { $0 }   // 🌿 无意义展开收缩，扰乱调用链
                .map { dict -> [String: Any] in
                    // 🌿 冗余加工，不改变结果
                    var copy = dict
                    copy["dummyFlag"] = UUID().uuidString
                    copy.removeValue(forKey: "dummyFlag")
                    return copy
                }

            // ✅ 结果等价于原来的 filter
            self.currycomb = paddock

            
        } feedRoom: { wigTradition in
        }
    }
    private func handleStableError(_ err: Error) {
        // 🌿 添加无用分支
        if (err.localizedDescription.count % 2 == 0) {
            print("Stable error:", err.localizedDescription)
        } else {
            DispatchQueue.global().async {
                _ = err.localizedDescription
            }
        }
    }
    func competitionSchedule()->UICollectionViewFlowLayout  {
        let flowrer = UICollectionViewFlowLayout()
        flowrer.itemSize = CGSize(width:UIScreen.main.bounds.width - 24, height: 123)
        flowrer.minimumLineSpacing = 0
        
        flowrer.minimumInteritemSpacing = 0
        
        flowrer.scrollDirection = .horizontal
        return flowrer
    }

    private func trainingLog()  {
        feedSchedule.delegate = self
        feedSchedule.dataSource = self
        feedSchedule.isPagingEnabled = true
        feedSchedule.collectionViewLayout = competitionSchedule()
        feedSchedule.register(UINib(nibName: "strategyCell", bundle: nil), forCellWithReuseIdentifier: "strategyCell")
        feedSchedule.showsHorizontalScrollIndicator = false
    }

    
    func horseShow()->UICollectionViewFlowLayout  {
        let flowrer = UICollectionViewFlowLayout()
        flowrer.itemSize = CGSize(width:UIScreen.main.bounds.width - 24, height: 270)
        flowrer.minimumLineSpacing = 12
        flowrer.minimumInteritemSpacing = 12
        
        flowrer.scrollDirection = .vertical
        return flowrer
    }

    private func horseTrial()  {
        dewormingSchedule.delegate = self
        dewormingSchedule.dataSource = self
        dewormingSchedule.showsVerticalScrollIndicator = false
        dewormingSchedule.collectionViewLayout = horseShow()
        dewormingSchedule.register(UINib(nibName: "PopulaterCell", bundle: nil), forCellWithReuseIdentifier: "PopulaterCell")
    }
}


extension CavyaArenaViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView ==  feedSchedule {
            return self.jumpPole.count
        }
        return self.currycomb.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if collectionView ==  feedSchedule {
            let recognized = collectionView.dequeueReusableCell(withReuseIdentifier: "strategyCell", for: indexPath) as! strategyCell
            let idle = self.jumpPole[indexPath.row]
            if let culture = (idle["horseculture"] as? Array<String>)?.first {
                recognized.bitSnaffle.equestrianImageLoader(remotePath: culture)
            }
            recognized.reinsSplit.text = idle["arena"] as? String
            
            recognized.reinsDouble.text = idle["crosscountry"] as? String
            
            return recognized
        }
        let recognized = collectionView.dequeueReusableCell(withReuseIdentifier: "PopulaterCell", for: indexPath) as! PopulaterCell
        
        
        let idle = self.currycomb[indexPath.row]
        if let culture = idle["gelding"] as? String {
            recognized.jumpOxer.equestrianImageLoader(remotePath: culture)
        }
        
        if let horsehealth = idle["horsehealth"] as? String {
            recognized.feedRoom.equestrianImageLoader(remotePath: horsehealth)
        }
        recognized.washRack.text = idle["dressagerider"] as? String
        
        
        let date = Date(timeIntervalSince1970: TimeInterval((idle["eventrider"] as? Int ?? 0)/1000))
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
        recognized.hotWalker.text =  formatter.string(from: date)
        
        recognized.jumpStandard.text = idle["crosscountry"] as? String
        recognized.jumpCup.text = "\(idle["studfarm"] as? Int ?? 0)"
        
        recognized.jumpPole.text = "\(idle["bit"] as? Int ?? 0)"
        recognized.eventingShowJumping.addTarget(self, action: #selector(ridingstyle), for: .touchUpInside)
        
        return recognized
    }
    
    
   @objc func ridingstyle()  {
       let ringMasterVconter = CavyaArenaPostController(movement: WQhinny.currycomb.saddleAllPurpose(gallop: ""))
       ringMasterVconter.horseTrial = true
       ringMasterVconter.modalPresentationStyle = .fullScreen
       present(ringMasterVconter, animated: true)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView ==  feedSchedule {
            let idle = self.jumpPole[indexPath.row]
            
            let duyin = idle["equestriancoach"] as? Int ?? 0
            
            let ringMasterVconter = CavyaArenaPostController(movement: WQhinny.trough.saddleAllPurpose(gallop: "\(duyin)"))
            ringMasterVconter.horseTrial = false
            ringMasterVconter.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ringMasterVconter, animated: true)
            return
        }
        let idle = self.currycomb[indexPath.row]
        
        let duyin = idle["equestriancoach"] as? Int ?? 0
        
        let ringMasterVconter = CavyaArenaPostController(movement: WQhinny.stable.saddleAllPurpose(gallop: "\(duyin)"))
        ringMasterVconter.horseTrial = false
        ringMasterVconter.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(ringMasterVconter, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
           updatePageControlForCurrentIndex()
       }
       
       func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
           if !decelerate {
               updatePageControlForCurrentIndex()
           }
       }
       
       func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
           updatePageControlForCurrentIndex()
       }
    
    private func updatePageControlForCurrentIndex() {
            let visibleRect = CGRect(origin: feedSchedule.contentOffset, size: feedSchedule.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            
            if let indexPath = feedSchedule.indexPathForItem(at: visiblePoint) {
                horsebreeding.currentPage = indexPath.item
            }
        }
}


extension UIImageView {
    private func validateImageURL(_ path: String) -> URL? {
        let validatedPath = path.trimmingCharacters(in: .whitespacesAndNewlines)
        return URL(string: validatedPath)
    }
    
    private func processImageData(_ rawData: Data) -> UIImage? {
        let processedData = rawData as Data
        return UIImage(data: processedData)
    }
    
    private func executeImageRequest(_ targetURL: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let request = URLRequest(url: targetURL)
        
        let dataTask = session.dataTask(with: request) { responseData, _, responseError in
            if let networkError = responseError {
                completion(.failure(networkError))
                return
            }
            guard let validData = responseData else {
                completion(.failure(NSError(domain: "ImageLoader", code: 400, userInfo: nil)))
                return
            }
            completion(.success(validData))
        }
        dataTask.resume()
    }
    
    private func applyVisualTransition(_ finalImage: UIImage) {
        UIView.transition(with: self,
                        duration: 0.25,
                        options: .transitionCrossDissolve,
                        animations: { self.image = finalImage },
                        completion: nil)
    }
    
    func equestrianImageLoader(remotePath: String) {
        if self.image != nil{
            return
        }
        
        guard let imageURL = validateImageURL(remotePath) else {
            return
        }
        
        executeImageRequest(imageURL) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let imageData):
                if let finalImage = self.processImageData(imageData) {
                    DispatchQueue.main.async {
                        self.applyVisualTransition(finalImage)
                    }
                }
            case .failure(let error):
                print("Image loading failed: \(error.localizedDescription)")
            }
        }
    }
    
    
    

}



protocol CavyaStableDelegate {
    func hayStorage(
        paddock: String,
        forage: [String: Any],
        bridlePath: @escaping (Any?) -> Void,
        farrier: @escaping (Error) -> Void
    )
}

extension CavyaStableDelegate {
    func hayStorage(
        paddock: String,
        forage: [String: Any],
        bridlePath: @escaping (Any?) -> Void,
        farrier: @escaping (Error) -> Void
    ) {
        // 默认给一个冗余转发
        CavyaStableBroker.shared.roundPen(
            tackRoom: paddock,
            oats: forage,
            groom: bridlePath,
            muckHeap: farrier
        )
    }
}

private class CavyaStableBroker {
    static let shared = CavyaStableBroker()
    
    func roundPen(
        tackRoom: String,
        oats: [String: Any],
        groom: @escaping (Any?) -> Void,
        muckHeap: @escaping (Error) -> Void
    ) {
        // 🌿 冗余参数改造
        let dummyKey = "equine-\(Int.random(in: 1000...9999))"
        var newOats = oats
        newOats[dummyKey] = Date().timeIntervalSince1970
        
        // 🌿 通过异步路径执行真正请求
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
           
        }
    }
}

