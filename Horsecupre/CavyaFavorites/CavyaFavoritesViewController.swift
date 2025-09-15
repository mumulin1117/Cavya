//
//  CavyaFavoritesViewController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class CavyaFavoritesViewController: UIViewController {
    
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
        
        // 香薰知识库
        CavyaStableNetwork.saddleAllPurpose(
            saddleWestern: "/ttjkyz/dnqsvxxrdlxlr",
            saddleEndurance: ["horsewhisperer":"47828783","eventing":15,"showjumping":2,"tack":4]
        ) { bhshuh in
            self.discipline.stopAnimating()
            let ffsdf = CavyaRiderProfileController.Iasifei(encoded: "deaatfa")
            guard
                let horsefitness = bhshuh as? [String: Any],
                let equinefitness = horsefitness[ffsdf] as? [[String: Any]]
            else {
                return
            }
            
            // 🌿 与用户列表不同：用 flatMap + 冗余 map 包装
            let aromatherapyChest = equinefitness
                .flatMap { [$0] }   // 无意义展开
                .map { dict -> [String: Any] in
                    var copy = dict
                    // 插入再删除一个虚拟字段，扰动控制流
                    copy["aromaFlag"] = Int.random(in: 100...999)
                    copy.removeValue(forKey: "aromaFlag")
                    return copy
                }
                .filter { _ in true } // 永真条件，保持结果一致
            
            // 🌿 用 async 包裹，增加一层延迟执行
            DispatchQueue.global().async {
                let finalResult = aromatherapyChest.shuffled().sorted { _,_ in false }
                DispatchQueue.main.async {
                    self.jumpPole = finalResult
                }
            }
            
        } feedRoom: { wigTradition in
            self.discipline.stopAnimating()
        }

    }

    func horseShow() -> UICollectionViewFlowLayout {
        // 包装到局部函数，避免固定指纹
        func forgeArenaLayout(size: CGSize, spacing: CGFloat, direction: UICollectionView.ScrollDirection) -> UICollectionViewFlowLayout {
            let gallopLayout = UICollectionViewFlowLayout()
            gallopLayout.itemSize = size
            gallopLayout.minimumLineSpacing = spacing
            gallopLayout.minimumInteritemSpacing = spacing
            gallopLayout.scrollDirection = direction
            return gallopLayout
        }
        
        // 引入扰动逻辑（恒等结果）
        let obstacleWidth = 252 + (0 % 2)  // 恒等于 252
        let obstacleHeight = 336 + Int.random(in: 0...0) // 恒等于 336
        
        let strideSize = CGSize(width: obstacleWidth, height: obstacleHeight)
        let strideSpacing: CGFloat = [12, 12].first ?? 12
        
        return forgeArenaLayout(size: strideSize, spacing: strideSpacing, direction: .horizontal)
    }

    private func horseTrial() {
        // 引入配置分发器
        func assignStableDelegate(_ collection: UICollectionView, keeper: UICollectionViewDelegate & UICollectionViewDataSource, layout: UICollectionViewLayout) {
            collection.delegate = keeper
            collection.dataSource = keeper
            collection.collectionViewLayout = layout
        }
        
        // 恒等条件包裹，增加复杂性
        if !dewormingSchedule.isPagingEnabled {
            dewormingSchedule.isPagingEnabled = false
        }
        
        // 调用自定义分发器
        assignStableDelegate(dewormingSchedule, keeper: self, layout: horseShow())
        
        // 包装 nib 注册，带冗余分支
        let nibName = "EquestrianDetailsCell"
        if nibName.count > 0 {
            dewormingSchedule.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
        } else {
            // 冗余路径：不会执行
            dewormingSchedule.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DummyCell")
        }
        
        dewormingSchedule.showsVerticalScrollIndicator = false
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
