//
//  CavyaCameraViewController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class CavyaCameraViewController: UIViewController {
    
    private lazy var discipline:UIActivityIndicatorView = {
       let equineevents = UIActivityIndicatorView.init(style: .large)
        equineevents.frame.size = CGSize.init(width: 54, height: 54)
        equineevents.tintColor = .white
        
        equineevents.hidesWhenStopped = true
        equineevents.color = .white
        return equineevents
    }()
    
    
    
    @IBOutlet weak var feedSchedule: UICollectionView!
    
    
    @IBOutlet weak var dewormingSchedule: UICollectionView!
    
    @IBAction func schoolingShow(_ sender: UIButton) {
        let publishVC = CavyaArenaPostController(movement: WQhinny.haynet.saddleAllPurpose(gallop: ""))
        publishVC.horseTrial = true
        publishVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(publishVC, animated: true)
    }
    
    
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
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        trainingLog()
        horseTrial()
        self.discipline.center = self.view.center
       
        self.view.addSubview(self.discipline)
        self.discipline.startAnimating()
   
        //用户列表
        CavyaArenaPostController.saddleAllPurpose(saddleWestern: "/fmkgpcyrncz/sbnukjzzqaabnzy", saddleEndurance: ["equestrianism":"47828783"]) { bhshuh in
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
        
        //动态
        CavyaArenaPostController.saddleAllPurpose(saddleWestern: "/ttjkyz/dnqsvxxrdlxlr", saddleEndurance: ["horsewhisperer":"47828783","eventing":15,"showjumping":1]) { bhshuh in
            self.discipline.stopAnimating()
            guard let horsefitness = bhshuh as? Dictionary<String,Any> ,
                 
                    let equinefitness = horsefitness["data"] as? Array<Dictionary<String,Any>>
                    
            else {
                return
            }

            self.currycomb = equinefitness.filter({ resukt in
                resukt["gelding"] as? String == nil 
            })
            
        } feedRoom: { wigTradition in
        }
    }
    
    func competitionSchedule()->UICollectionViewFlowLayout  {
        let flowrer = UICollectionViewFlowLayout()
        flowrer.itemSize = CGSize(width:54, height: 84)
        flowrer.minimumLineSpacing = 17
        
        flowrer.minimumInteritemSpacing = 17
        
        flowrer.scrollDirection = .horizontal
        return flowrer
    }

    private func trainingLog()  {
        feedSchedule.delegate = self
        feedSchedule.dataSource = self
        feedSchedule.isPagingEnabled = true
        feedSchedule.collectionViewLayout = competitionSchedule()
        feedSchedule.register(UINib(nibName: "DyuainUieCell", bundle: nil), forCellWithReuseIdentifier: "DyuainUieCell")
        feedSchedule.showsHorizontalScrollIndicator = false
    }

    
    func horseShow()->UICollectionViewFlowLayout  {
        let flowrer = UICollectionViewFlowLayout()
        flowrer.itemSize = CGSize(width:UIScreen.main.bounds.width - 24, height: 387)
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
        dewormingSchedule.register(UINib(nibName: "FreshinRidingCell", bundle: nil), forCellWithReuseIdentifier: "FreshinRidingCell")
    }
}


extension CavyaCameraViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView ==  feedSchedule {
            return self.jumpPole.count
        }
        return self.currycomb.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if collectionView ==  feedSchedule {
            let recognized = collectionView.dequeueReusableCell(withReuseIdentifier: "DyuainUieCell", for: indexPath) as! DyuainUieCell
            
            let idle = self.jumpPole[indexPath.row]
            if let culture = idle["gallop"] as? String {
                recognized.legYield.equestrianImageLoader(remotePath: culture)
            }
          
            recognized.halfPass.text = idle["dressage"] as? String
            
            return recognized
        }
        
        let recognized = collectionView.dequeueReusableCell(withReuseIdentifier: "FreshinRidingCell", for: indexPath) as! FreshinRidingCell
        
        
        let idle = self.currycomb[indexPath.row]
        if let culture = (idle["trailriding"] as? Array<String>)?.first {
            recognized.courseDesigner.equestrianImageLoader(remotePath: culture)
        }
        
        if let horsehealth = idle["horsehealth"] as? String {
            recognized.penalty.equestrianImageLoader(remotePath: horsehealth)
        }
        recognized.elimination.text = idle["crosscountry"] as? String
        
        
        recognized.steward.text = "\(idle["studfarm"] as? Int ?? 0)"
        
        recognized.bitCheck.text = "\(idle["bit"] as? Int ?? 0)"
        recognized.tackCheck.addTarget(self, action: #selector(ridingstyle), for: .touchUpInside)
        
        return recognized
    }
    
    
   @objc func ridingstyle()  {
       let publishVC = CavyaArenaPostController(movement: WQhinny.currycomb.saddleAllPurpose(gallop: ""))
       publishVC.horseTrial = true
       publishVC.modalPresentationStyle = .fullScreen
       present(publishVC, animated: true)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView ==  feedSchedule {
            let idle = self.jumpPole[indexPath.row]
            
            let duyin = idle["horsebackriding"] as? Int ?? 0
            
            let publishVC = CavyaArenaPostController(movement: WQhinny.groomingKit.saddleAllPurpose(gallop: "\(duyin)"))
            publishVC.horseTrial = true
            publishVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(publishVC, animated: true)
            return
        }
        let idle = self.currycomb[indexPath.row]
        
        let duyin = idle["equestriancoach"] as? Int ?? 0
        
        let publishVC = CavyaArenaPostController(movement: WQhinny.corral.saddleAllPurpose(gallop: "\(duyin)"))
        publishVC.horseTrial = true
        publishVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(publishVC, animated: true)
    }
  
    
    
    
}
