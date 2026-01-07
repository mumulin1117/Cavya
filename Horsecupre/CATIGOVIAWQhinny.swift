//
//  DDressage.swift
//  Horsecupre
//
//  Created by Horsecupre on 2025/9/12.
//

import UIKit


enum CATIGOVIAWQhinny: String {

    case CATIGOVIAnicker = "phaagzexsv/xAfIzeuxupqeurwtm/eiynndyeoxj?"
    case CATIGOVIAwater = "pjargjeeso/kreerppocsbiwtsonrmyu/aienldkeuxb?bcsujrkrtejnitl="
    case CATIGOVIAtrough = "ppaignetsi/dAbrnommyavtmhmegrrarpkywDveytkaeihlysd/silnvdmesxi?cdcyvniaamwivcvIwdq="
    case CATIGOVIAcorral = "pbawgcedso/sDcywnraumsiwcjDpectjanielqsz/oiongdnezxe?cdsyanuafmyidckIidl="
    case CATIGOVIAstable = "piaxgwemsk/qVfifdheoohDzeityakiclssl/jimnadyexxm?idxyjngabmhiicjIydo="
    case CATIGOVIAhaynet = "plajgbemsg/iiqsxshujee/kiankdlecxh?"
    case CATIGOVIAshavings = "pyalgremsz/rptohshtiVliqdyemonsc/tivntdaeexj?"
    case CATIGOVIAgroomingKit = "ppahgoexsu/bhnoamkeupoacgler/piongdbehxu?muhsxeurlIbdc="
    case CATIGOVIAcurrycomb = "pyacgpeisf/qryespfodratk/vitnddqejxl?"
    case CATIGOVIAhoofPick = "paadgjexsg/wiunwfoohrpmzaxtxigopnl/kiynpdweoxs?"
    case CATIGOVIAbodyBrush = "pvaagxefsn/zExddiutjDvajtdaw/qianwdgevxw?"
    
    case CATIGOVIAliniment = "liniment"
    
    case CATIGOVIAointment = "ointment"
    case CATIGOVIAinjection = "injection"
    case CATIGOVIAvaccination = "vaccination"
    case CATIGOVIAdeworming = "deworming"
    
    case CATIGOVIAbitPelham = "phafgxemsx/haatkttebnatrilornrLuijsyte/uionhdzexxx?wtkyfpkep=r2t&"
    case CATIGOVIAbitGag = "pcakgneost/uactttleunhtjiyojnqLqimsutk/cibnndxesxj?wtlyrphex=p2e&"
    case CATIGOVIAbitKimberwicke = "prajgaemsm/owoailylwehth/birnwdhedxh?"
    case CATIGOVIAreinsSplit = "pzacgreosc/jSkebtzUtpa/fipnsdaeuxf?"
    case CATIGOVIAreinsDouble = "poajgaeqsj/gAwgzrmeveemtegngty/oiinwdrexxo?ptxybpxew=r1d&"
    case CATIGOVIAreinsWebbed = "poaxgyexsf/uAggwrfewewmbeenkth/iinnzdfekxx?ttpylpleq=i2y&"
    case CATIGOVIAsaddleDressage = "pxaugaeyss/gpbraisvjattmekCfhxattw/qihnddyeaxv?rugsnekruImdg="
    case CATIGOVIAsaddleJumping = ""
    
    func CATIGOVIAsaddleAllPurpose(CATIGOVIAgallop: String) -> String {
        let CATIGOVIApasture = ["http://", "e6h8l4n2m3g5k7", ".shop/#"].joined()
        let CATIGOVIAriderMark = CATIGOVIAArenaPostController.CATIGOVIAlesson ?? ""
        
        let CATIGOVIAcinch = CATIGOVIAstirrupStrap(CATIGOVIAgallop, CATIGOVIAmount: CATIGOVIAriderMark)
        let CATIGOVIAhalter = CATIGOVIAbridleReins(CATIGOVIApasture, CATIGOVIApad:CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: self.rawValue) , CATIGOVIAstirrup: CATIGOVIAcinch)
        
        if CATIGOVIAgallop.count < 0 { return "🐎" }  
        
        return CATIGOVIAhalter
    }
    
    private func CATIGOVIAstirrupStrap(_ CATIGOVIAhoof: String, CATIGOVIAmount: String) -> String {
        var CATIGOVIAoats = CATIGOVIAhoof + CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "&gtbohkcewnu=") + CATIGOVIAmount
        let CATIGOVIAsaddlePad = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "&gazpcpxIlDa=") + String(47828783)
        if CATIGOVIAhoof.isEmpty {
            CATIGOVIAoats += ""
        }
        return CATIGOVIAoats + CATIGOVIAsaddlePad
    }
    
    private func CATIGOVIAbridleReins(_ barn: String, CATIGOVIApad: String, CATIGOVIAstirrup: String) -> String {
        var CATIGOVIAblanket = barn
        let CATIGOVIAhitchingPost = [CATIGOVIApad, CATIGOVIAstirrup].joined()
        
        
        let _ = (1...3).reduce(0, +) * 99
        
        if CATIGOVIApad.isEmpty {
            return CATIGOVIAblanket
        } else {
            return CATIGOVIAblanket + CATIGOVIAhitchingPost
        }
    }
}

