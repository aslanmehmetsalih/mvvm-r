//
//  MovieDetailImdbView.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 26.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit

class MovieDetailImdbView: ShadowView {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var ratingTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .regular(of: 12)
        label.textColor = .lightGray
        label.text = "iMDB"
        return label
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .regular(of: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var ratingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var votesTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .regular(of: 12)
        label.textColor = .lightGray
        label.text = "iMDB Votes"
        return label
    }()
    
    private lazy var votesLabel: UILabel = {
        let label = UILabel()
        label.font = .regular(of: 14)
        label.textColor = .black
        return label
    }()

    private lazy var votesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var runtimeTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .regular(of: 12)
        label.textColor = .lightGray
        label.text = "Time"
        return label
    }()
    
    private lazy var runtimeLabel: UILabel = {
        let label = UILabel()
        label.font = .regular(of: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var runtimeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
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
        addSubviews()
    }
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.edgesToSuperview(insets: UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12))
        
        ratingStackView.addArrangedSubview(ratingTitleLabel)
        ratingStackView.addArrangedSubview(ratingLabel)
        
        votesStackView.addArrangedSubview(votesTitleLabel)
        votesStackView.addArrangedSubview(votesLabel)
        
        runtimeStackView.addArrangedSubview(runtimeTitleLabel)
        runtimeStackView.addArrangedSubview(runtimeLabel)
        
        stackView.addArrangedSubview(ratingStackView)
        stackView.addArrangedSubview(votesStackView)
        stackView.addArrangedSubview(runtimeStackView)
    }
    
    func set(viewModel: MovieDetailImdbViewProtocol?) {
        ratingLabel.text = viewModel?.rating
        votesLabel.text = viewModel?.votes
        runtimeLabel.text = viewModel?.runtime
    }
    
}
