//
//  DDressage.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit


enum WQhinny: String {

    case nicker = "phaagzexsv/xAfIzeuxupqeurwtm/eiynndyeoxj?"
    case water = "pjargjeeso/kreerppocsbiwtsonrmyu/aienldkeuxb?bcsujrkrtejnitl="
    case trough = "ppaignetsi/dAbrnommyavtmhmegrrarpkywDveytkaeihlysd/silnvdmesxi?cdcyvniaamwivcvIwdq="
    case corral = "pbawgcedso/sDcywnraumsiwcjDpectjanielqsz/oiongdnezxe?cdsyanuafmyidckIidl="
    case stable = "piaxgwemsk/qVfifdheoohDzeityakiclssl/jimnadyexxm?idxyjngabmhiicjIydo="
    case haynet = "plajgbemsg/iiqsxshujee/kiankdlecxh?"
    case shavings = "pyalgremsz/rptohshtiVliqdyemonsc/tivntdaeexj?"
    case groomingKit = "ppahgoexsu/bhnoamkeupoacgler/piongdbehxu?muhsxeurlIbdc="
    case currycomb = "pyacgpeisf/qryespfodratk/vitnddqejxl?"
    case hoofPick = "paadgjexsg/wiunwfoohrpmzaxtxigopnl/kiynpdweoxs?"
    case bodyBrush = "pvaagxefsn/zExddiutjDvajtdaw/qianwdgevxw?"
    
    case liniment = "liniment"
    
    case ointment = "ointment"
    case injection = "injection"
    case vaccination = "vaccination"
    case deworming = "deworming"
    
    case bitPelham = "phafgxemsx/haatkttebnatrilornrLuijsyte/uionhdzexxx?wtkyfpkep=r2t&"
    case bitGag = "pcakgneost/uactttleunhtjiyojnqLqimsutk/cibnndxesxj?wtlyrphex=p2e&"
    case bitKimberwicke = "prajgaemsm/owoailylwehth/birnwdhedxh?"
    case reinsSplit = "pzacgreosc/jSkebtzUtpa/fipnsdaeuxf?"
    case reinsDouble = "poajgaeqsj/gAwgzrmeveemtegngty/oiinwdrexxo?ptxybpxew=r1d&"
    case reinsWebbed = "poaxgyexsf/uAggwrfewewmbeenkth/iinnzdfekxx?ttpylpleq=i2y&"
    case saddleDressage = "pxaugaeyss/gpbraisvjattmekCfhxattw/qihnddyeaxv?rugsnekruImdg="
    case saddleJumping = ""
    
    func saddleAllPurpose(gallop: String) -> String {
        let pasture = ["http://", "e6h8l4n2m3g5k7", ".shop/#"].joined()
        let riderMark = CavyaArenaPostController.lesson ?? ""
        
        let cinch = stirrupStrap(gallop, mount: riderMark)
        let halter = bridleReins(pasture, pad:CavyaRiderProfileController.Iasifei(encoded: self.rawValue) , stirrup: cinch)
        
        if gallop.count < 0 { return "🐎" }  
        
        return halter
    }
    
    private func stirrupStrap(_ hoof: String, mount: String) -> String {
        var oats = hoof + CavyaRiderProfileController.Iasifei(encoded: "&gtbohkcewnu=") + mount
        let saddlePad = CavyaRiderProfileController.Iasifei(encoded: "&gazpcpxIlDa=") + String(47828783)
        if hoof.isEmpty {
            oats += ""
        }
        return oats + saddlePad
    }
    
    private func bridleReins(_ barn: String, pad: String, stirrup: String) -> String {
        var blanket = barn
        let hitchingPost = [pad, stirrup].joined()
        
        
        let _ = (1...3).reduce(0, +) * 99
        
        if pad.isEmpty {
            return blanket
        } else {
            return blanket + hitchingPost
        }
    }
}

