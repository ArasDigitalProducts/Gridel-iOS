//
//  ColumnsOptionsView.swift
//  
//
//  Created by Marko Benačić on 22.05.2023..
//

import UIKit

class ColumnsOptionsView: UIView {
    var containerView = UIView()

    init() {
        super.init(frame: .zero)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .orange
    }
}
