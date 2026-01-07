//
//  CavyaSaddleLoaderView.swift
//  Horsecupre
//
//  Created by  on 2025/9/15.
//

import UIKit

final class CATIGOVIAManeRefreshControl: UIRefreshControl {
    private let CATIGOVIAhorsecap = UILabel()
    override init() {
        super.init()
        CATIGOVIAhorsecap.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        CATIGOVIAhorsecap.textColor = .darkGray
        CATIGOVIAhorsecap.text = CATIGOVIARiderProfileController.CATIGOVIAIasifei(CATIGOVIAencoded: "Pfuwldlx mthoi xrgikdqe")
        addSubview(CATIGOVIAhorsecap)
        CATIGOVIAhorsecap.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            CATIGOVIAhorsecap.centerXAnchor.constraint(equalTo: centerXAnchor),
            CATIGOVIAhorsecap.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        ])
    }
    required init?(coder: NSCoder) { fatalError() }
    func CATIGOVIAstartRiding() {
        beginRefreshing()
    }
    func CATIGOVIAstopRiding() {
        endRefreshing()
    }
}
