//
//  RoundedContainerView.swift
//  
//
//  Created by Marko Benačić on 22.05.2023..
//

import UIKit

class RoundedContainerView: UIView {

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .g500
        layer.cornerRadius = 12
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
