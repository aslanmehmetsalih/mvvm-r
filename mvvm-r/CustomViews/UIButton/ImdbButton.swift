//
//  ImdbButton.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 26.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit
import TinyConstraints

class ImdbButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        height(44)
        backgroundColor = .imdbColor
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 6
        titleLabel?.font = .bold(of: 14)
    }
    
}
