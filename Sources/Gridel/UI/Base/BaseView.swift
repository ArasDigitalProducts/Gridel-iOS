//
//  BaseView.swift
//  
//
//  Created by Marko Benačić on 22.05.2023..
//

import UIKit

class BaseView: UIView {

    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
