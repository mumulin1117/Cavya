//
//  CavyaArenaViewController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class CavyaArenaViewController: UIViewController {

    @IBOutlet weak var feedSchedule: UICollectionView!
    
    
    @IBOutlet weak var dewormingSchedule: UICollectionView!
    
    
    @IBOutlet weak var horsebreeding: UIPageControl!
    
    private lazy var discipline:UIActivityIndicatorView = {
       let equineevents = UIActivityIndicatorView.init(style: .large)
        equineevents.frame.size = CGSize.init(width: 54, height: 54)
        equineevents.tintColor = .white
        
        equineevents.hidesWhenStopped = true
        equineevents.color = .white
        return equineevents
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        trainingLog()
        horseTrial()
        
        self.discipline.center = self.view.center
       
        self.view.addSubview(self.discipline)
        
        
        self.discipline.startAnimating()
        //香薰动态
        CavyaArenaPostController.saddleAllPurpose(saddleWestern: "/ttjkyz/dnqsvxxrdlxlr", saddleEndurance: ["horsewhisperer":"47828783","eventing":15,"showjumping":2,"tack":5]) { bhshuh in
            self.discipline.stopAnimating()
            guard let horsefitness = bhshuh as? Dictionary<String,Any> ,
                 
                    let equinefitness = horsefitness["data"] as? Array<Dictionary<String,Any>>
                    
            else {
               
                
                return
            }
           
            self.jumpPole = equinefitness
            
            
        } feedRoom: { wigTradition in
            self.discipline.stopAnimating()
           
            
        }
        
        //视频
        CavyaArenaPostController.saddleAllPurpose(saddleWestern: "/ttjkyz/dnqsvxxrdlxlr", saddleEndurance: ["horsewhisperer":"47828783","eventing":15,"showjumping":1]) { bhshuh in
            self.discipline.stopAnimating()
            guard let horsefitness = bhshuh as? Dictionary<String,Any> ,
                 
                    let equinefitness = horsefitness["data"] as? Array<Dictionary<String,Any>>
                    
            else {
                return
            }

            self.currycomb = equinefitness.filter({ resukt in
                resukt["gelding"]  as? String != nil
            })
            
        } feedRoom: { wigTradition in
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

