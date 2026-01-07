//
//  CATIGOVIATrailCache.swift
//  Horsecupre
//
//  Created by  on 2025/9/15.
//

import UIKit

final class CATIGOVIATrailCache {
    static let CATIGOVIAshared = CATIGOVIATrailCache()
    private init() {}
    private var CATIGOVIApaddocks: [String: Data] = [:]
    func CATIGOVIAstore(CATIGOVIAdata: Data, CATIGOVIAfor key: String) { CATIGOVIApaddocks[key] = CATIGOVIAdata }
    func CATIGOVIAretrieve(CATIGOVIAfor key: String) -> Data? { CATIGOVIApaddocks[key] }
}
