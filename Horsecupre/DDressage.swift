//
//  DDressage.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit


enum WQhinny:String {

    case nicker = "pages/AIexpert/index?"
    case water = "pages/repository/index?current="
    case trough = "pages/AromatherapyDetails/index?dynamicId="
    case corral = "pages/DynamicDetails/index?dynamicId="
    case stable = "pages/VideoDetails/index?dynamicId="
    case haynet = "pages/issue/index?"
    case shavings = "pages/postVideos/index?"
    case groomingKit = "pages/homepage/index?userId="
    case currycomb = "pages/report/index?"
    case hoofPick = "pages/information/index?"
    case bodyBrush = "pages/EditData/index?"
    
    case bitPelham = "pages/attentionList/index?type=1&"
    case bitGag = "pages/attentionList/index?type=2&"
    case bitKimberwicke = "pages/wallet/index?"
    case reinsSplit = "pages/SetUp/index?"
    case reinsDouble = "pages/Agreement/index?type=1&"
    case reinsWebbed = "pages/Agreement/index?type=2&"
    case saddleDressage = "pages/privateChat/index?userId="
 
    case saddleJumping = ""
    
    func saddleAllPurpose(gallop:String) -> String {
        let pasture = "http://e6h8l4n2m3g5k7.shop/#"
        if self != .saddleJumping {
            return  pasture + self.rawValue + gallop + "&token=" + (CavyaArenaPostController.lesson ?? "") + "&appID=47828783"
        }
        return  pasture
 
    }
}
