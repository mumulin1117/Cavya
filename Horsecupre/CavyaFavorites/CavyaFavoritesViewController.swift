//
//  CavyaFavoritesViewController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class CavyaFavoritesViewController: UIViewController {
    
    private lazy var discipline:UIActivityIndicatorView = {
       let equineevents = UIActivityIndicatorView.init(style: .large)
        equineevents.frame.size = CGSize.init(width: 54, height: 54)
        equineevents.tintColor = .white
        
        equineevents.hidesWhenStopped = true
        equineevents.color = .white
        return equineevents
    }()
    
    
    @IBOutlet weak var nicker: UIPageControl!
    
    @IBOutlet weak var dewormingSchedule: UICollectionView!
    
    
    
    private var jumpPole:Array<Dictionary<String,Any>> = Array<Dictionary<String,Any>>(){
        didSet{
            dewormingSchedule.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        horseTrial()
        self.discipline.center = self.view.center
       
        self.view.addSubview(self.discipline)
        self.discipline.startAnimating()
        
        //香薰知识库
        CavyaArenaPostController.saddleAllPurpose(saddleWestern: "/ttjkyz/dnqsvxxrdlxlr", saddleEndurance: ["horsewhisperer":"47828783","eventing":15,"showjumping":2,"tack":4]) { bhshuh in
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
    }

    func horseShow()->UICollectionViewFlowLayout  {
        let flowrer = UICollectionViewFlowLayout()
        flowrer.itemSize = CGSize(width:252, height: 336)
        flowrer.minimumLineSpacing = 12
        flowrer.minimumInteritemSpacing = 12
        
        flowrer.scrollDirection = .horizontal
        return flowrer
    }

    private func horseTrial()  {
        dewormingSchedule.delegate = self
        dewormingSchedule.isPagingEnabled = false
        dewormingSchedule.dataSource = self
        dewormingSchedule.showsVerticalScrollIndicator = false
        dewormingSchedule.collectionViewLayout = horseShow()
        dewormingSchedule.register(UINib(nibName: "EquestrianDetailsCell", bundle: nil), forCellWithReuseIdentifier: "EquestrianDetailsCell")
    }
}


extension CavyaFavoritesViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return jumpPole.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let recognized = collectionView.dequeueReusableCell(withReuseIdentifier: "EquestrianDetailsCell", for: indexPath) as! EquestrianDetailsCell
        
        let idle = self.jumpPole[indexPath.row]
        if let culture = (idle["horseculture"] as? Array<String>)?.first {
            recognized.centerLine.equestrianImageLoader(remotePath: culture)
        }
        
        recognized.longSide.text = idle["crosscountry"] as? String
        return recognized
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
            
        let ringMasterVconter = CavyaArenaPostController(movement: WQhinny.water.saddleAllPurpose(gallop: "\(indexPath.row)"))
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
            let visibleRect = CGRect(origin: dewormingSchedule.contentOffset, size: dewormingSchedule.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            
            if let indexPath = dewormingSchedule.indexPathForItem(at: visiblePoint) {
                nicker.currentPage = indexPath.item
            }
        }
}
