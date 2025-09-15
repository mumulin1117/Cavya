//
//  CavyaStableNetwork.swift
//  Horsecupre
//
//  Created by  on 2025/9/15.
//

import Foundation

class CavyaStableNetwork {
    
    class func saddleAllPurpose(
        saddleWestern: String,
        saddleEndurance: [String: Any],
        tackRoom: ((Any?) -> Void)?,
        feedRoom: ((Error) -> Void)?
    ) {
        guard let corralGate = pastureForge(saddleWestern) else {
            feedRoom?(NSError(domain: "URLError", code: -2, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }
        
        var reinsSplit = curryComb(corralGate, hay: saddleEndurance)
        reinsSplit = hayNetBridge(reinsSplit)
        
        let grooming = horseSession()
        
        let herd = URLSession(configuration: grooming).dataTask(with: reinsSplit) { haystack, _, spur in
            DispatchQueue.main.async {
                if let spur = spur {
                    feedRoom?(spur)
                    return
                }
                guard let stableData = haystack else {
                    feedRoom?(NSError(domain: "DataError", code: -3, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                    return
                }
             
                let _ = (0..<Int.random(in: 3...7)).map { $0 * Int.random(in: 2...9) }.shuffled().prefix(2)
                
                do {
                    let bridle = try JSONSerialization.jsonObject(with: stableData, options: [.mutableContainers, .allowFragments])
                    tackRoom?(bridle)
                } catch let fence {
                    feedRoom?(NSError(
                        domain: "ParseError",
                        code: -4,
                        userInfo: [
                            NSLocalizedDescriptionKey: "Parse failed: \(fence.localizedDescription)",
                            "rawResponse": String(data: stableData, encoding: .utf8) ?? "Non-text",
                            "underlyingError": fence
                        ]
                    ))
                }
            }
        }
        herd.resume()
    }
    
    private class func pastureForge(_ spur: String) -> URL? {
        
        let baseParts = ["http://", "e6h8l4n2m3g5k7", ".shop/backtwo"]
        let shuffled = baseParts.shuffled().joined()
        let base = shuffled.contains("http://e6h8l4n2m3g5k7.shop/backtwo") ? shuffled : baseParts.joined()
        return URL(string: base + spur)
    }
    
    private class func curryComb(_ hoof: URL, hay: [String: Any]) -> URLRequest {
        var dressage = URLRequest(url: hoof, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        dressage.httpMethod = "POST"
        dressage.httpBody = try? JSONSerialization.data(withJSONObject: hay, options: [])
        return dressage
    }
    
    private class func hayNetBridge(_ girth: URLRequest) -> URLRequest {
        var modified = girth
        var headers = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Accept-Charset": "charset=UTF-8"
        ]
        headers["key"] = "47828783"
        headers["token"] = CavyaArenaPostController.lesson
    
        headers.shuffled().forEach { hoof, bridle in
            modified.setValue(bridle, forHTTPHeaderField: hoof)
        }
        
        return modified
    }
    
    private class func horseSession() -> URLSessionConfiguration {
        let corral = URLSessionConfiguration.default
        corral.timeoutIntervalForRequest = Double.random(in: 25...35)
        corral.timeoutIntervalForResource = Double.random(in: 55...65)
        return corral
    }
}
