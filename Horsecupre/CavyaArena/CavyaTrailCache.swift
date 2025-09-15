//
//  CavyaTrailCache.swift
//  Horsecupre
//
//  Created by  on 2025/9/15.
//

import UIKit

final class CavyaTrailCache {
    static let shared = CavyaTrailCache()
    private init() {}
    private var paddocks: [String: Data] = [:]
    func store(data: Data, for key: String) { paddocks[key] = data }
    func retrieve(for key: String) -> Data? { paddocks[key] }
}
