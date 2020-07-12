//
//  InfoView.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 25.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

class InfoView: ShadowView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .semiBold(of: 14)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .regular(of: 12)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        separator.height(1)
        return separator
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12
        stackView.axis = .vertical
        return stackView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        layer.cornerRadius = 6
        addSubViews()
    }
    
    private func addSubViews() {
        addSubview(stackView)
        stackView.edgesToSuperview(insets: UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12))
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(separator)
        stackView.addArrangedSubview(subtitleLabel)
    }
    
    func set(viewModel: InfoViewProtocol?) {
        titleLabel.text = viewModel?.title
        subtitleLabel.text = viewModel?.subtitle
    }
    
}
