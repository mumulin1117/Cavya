//
//  CavyaSaddleLoaderView.swift
//  Horsecupre
//
//  Created by mumu on 2025/9/15.
//

import UIKit

final class CavyaManeRefreshControl: UIRefreshControl {
    private let horsecap = UILabel()
    override init() {
        super.init()
        horsecap.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        horsecap.textColor = .darkGray
        horsecap.text = "Pull to ride"
        addSubview(horsecap)
        horsecap.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horsecap.centerXAnchor.constraint(equalTo: centerXAnchor),
            horsecap.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        ])
    }
    required init?(coder: NSCoder) { fatalError() }
    func startRiding() {
        beginRefreshing()
    }
    func stopRiding() {
        endRefreshing()
    }
}
