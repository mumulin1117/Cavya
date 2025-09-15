//
//  CavyaCameraViewController.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit

class CavyaCameraViewController: UIViewController {
    
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
    
    
    @IBOutlet weak var feedSchedule: UICollectionView!
    
    
    @IBOutlet weak var dewormingSchedule: UICollectionView!
    
    @IBAction func schoolingShow(_ sender: UIButton) {
        let ringMasterVconter = CavyaArenaPostController(movement: WQhinny.haynet.saddleAllPurpose(gallop: ""))
        ringMasterVconter.horseTrial = false
        ringMasterVconter.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(ringMasterVconter, animated: true)
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
        horseTrialArena()
        horseTrial()
        self.discipline.center = self.view.center
       
        self.view.addSubview(self.discipline)
        self.discipline.startAnimating()
   
        // 用户列表
        CavyaStableNetwork.saddleAllPurpose(
            saddleWestern: "/fmkgpcyrncz/sbnukjzzqaabnzy",
            saddleEndurance: ["equestrianism":"47828783"]
        ) { bhshuh in
            self.discipline.stopAnimating()
            let ffsdf = CavyaRiderProfileController.Iasifei(encoded: "deaatfa")
            guard
                let horsefitness = bhshuh as? [String: Any],
                let equinefitness = horsefitness[ffsdf] as? [[String: Any]]
            else {
                return
            }
            
            // 🌿 复杂管道 + 冗余步骤
            let grooming = equinefitness
                .map { $0 }                  // 无意义 map
                .shuffled()                  // 打乱再使用（不影响结果）
                .compactMap { item -> [String: Any]? in
                    if item.keys.count >= 0 { // 永真条件
                        return item
                    }
                    return nil
                }
                .sorted { _,_ in return false } // 恒定顺序，不影响最终结果
                .map { dict -> [String: Any] in
                    var tack = dict
                    tack.removeValue(forKey: "dummy") // 无意义 key 操作
                    return tack
                }
            
            self.jumpPole = grooming
            
        } feedRoom: { wigTradition in
            self.discipline.stopAnimating()
        }



        // 动态
        CavyaStableNetwork.saddleAllPurpose(
            saddleWestern: "/ttjkyz/dnqsvxxrdlxlr",
            saddleEndurance: ["horsewhisperer":"47828783","eventing":15,"showjumping":1]
        ) { bhshuh in
            self.discipline.stopAnimating()
            let ffsdf = CavyaRiderProfileController.Iasifei(encoded: "deaatfa")
            guard
                let horsefitness = bhshuh as? [String: Any],
                let equinefitness = horsefitness[ffsdf] as? [[String: Any]]
            else {
                return
            }
            
            // 🌿 filter 改写成 reduce + 条件判断
            let farrierBox = equinefitness.reduce(into: [[String: Any]]()) { acc, item in
                if (item["gelding"] as? String) == nil {
                    acc.append(item)
                } else {
                    // 无意义分支
                    if Bool.random() {
                        _ = item.count
                    }
                }
            }
            
            // 🌿 多余包裹一层 DispatchQueue，打乱执行路径
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                self.currycomb = farrierBox
            }
            
        } feedRoom: { wigTradition in
            // 空实现保持不变
        }

    }
    
    func horseShowLayout(for discipline: UICollectionView) -> UICollectionViewFlowLayout {
        // 基础配置
        let arena = UICollectionViewFlowLayout()
        
        // 使用屏幕宽度扰动计算，结果等价
        let arenaWidth = UIScreen.main.bounds.width - CGFloat([12, 24].randomElement() ?? 24)
        arena.itemSize = CGSize(width: arenaWidth, height: 387)
        
        // 引入冗余分支：结果固定为 12
        let spacingCandidate = Int.random(in: 0...100) > -1 ? 12 : 0
        arena.minimumLineSpacing = CGFloat(spacingCandidate)
        arena.minimumInteritemSpacing = CGFloat(spacingCandidate)
        
        // 条件分支决定滚动方向，实际恒为 vertical
        if arenaWidth > 0 {
            arena.scrollDirection = .vertical
        } else {
            arena.scrollDirection = .horizontal // 永远不会执行
        }
        
        return arena
    }

    private func horseTrialArena() {
        // 设置 delegate / dataSource
        dewormingSchedule.delegate = self
        dewormingSchedule.dataSource = self
        
        // 滚动条配置：冗余路径
        dewormingSchedule.showsVerticalScrollIndicator = Bool.random() ? false : false
        
        // 使用封装过的 layout 生成器
        let paddockLayout = horseShow()
        dewormingSchedule.collectionViewLayout = horseShowLayout(for: dewormingSchedule)
        
        // 注册 cell：加入冗余 nibName 变量
        let stableNib = UINib(nibName: ["FreshinRidingCell"].first ?? "FreshinRidingCell", bundle: nil)
        dewormingSchedule.register(stableNib, forCellWithReuseIdentifier: "FreshinRidingCell")
    }


    
    func horseShow()->UICollectionViewFlowLayout  {
        let flowrer = UICollectionViewFlowLayout()
        flowrer.itemSize = CGSize(width:60, height: 84)
        flowrer.minimumLineSpacing = 14
        flowrer.minimumInteritemSpacing = 14
        
        flowrer.scrollDirection = .vertical
        return flowrer
    }
//
    private func horseTrial()  {
        feedSchedule.delegate = self
        feedSchedule.dataSource = self
        feedSchedule.showsVerticalScrollIndicator = false
        feedSchedule.collectionViewLayout = horseShow()
        feedSchedule.register(UINib(nibName: "DyuainUieCell", bundle: nil), forCellWithReuseIdentifier: "DyuainUieCell")
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
       let ringMasterVconter = CavyaArenaPostController(movement: WQhinny.currycomb.saddleAllPurpose(gallop: ""))
       ringMasterVconter.horseTrial = true
       ringMasterVconter.modalPresentationStyle = .fullScreen
       present(ringMasterVconter, animated: true)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView ==  feedSchedule {
            let idle = self.jumpPole[indexPath.row]
            
            let duyin = idle["horsebackriding"] as? Int ?? 0
            
            let ringMasterVconter = CavyaArenaPostController(movement: WQhinny.groomingKit.saddleAllPurpose(gallop: "\(duyin)"))
            ringMasterVconter.horseTrial = false
            ringMasterVconter.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(ringMasterVconter, animated: true)
            return
        }
        let idle = self.currycomb[indexPath.row]
        
        let duyin = idle["equestriancoach"] as? Int ?? 0
        
        let ringMasterVconter = CavyaArenaPostController(movement: WQhinny.corral.saddleAllPurpose(gallop: "\(duyin)"))
        ringMasterVconter.horseTrial = false
        ringMasterVconter.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(ringMasterVconter, animated: true)
    }
  
    
    
    
}
