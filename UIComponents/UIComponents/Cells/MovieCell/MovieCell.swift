//
//  MovieCell.swift
//  mvvm-r
//
//  Created by Mehmet Salih Aslan on 24.04.2020.
//  Copyright © 2020 Mehmet Salih Aslan. All rights reserved.
//

import UIKit
import TinyConstraints
import Utilities

public class MovieCell: UICollectionViewCell, ReusableView {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .semiBold(of: 14)
        label.textColor = .black
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .regular(of: 12)
        label.textColor = .black
        return label
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.font = .regular(of: 12)
        label.textColor = .black
        return label
    }()
    
    private var viewModel: MovieCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
        setupViews()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.text = nil
        subTitleLabel.text = nil
        yearLabel.text = nil
    }
}

// MARK: - UI
extension MovieCell {
    
    private func addSubviews() {
        addSubview(imageView)
        imageView.leadingToSuperview().constant = 12
        imageView.topToSuperview().constant = 12
        imageView.bottomToSuperview().constant = -12
        imageView.aspectRatio(2 / 3)
        
        addSubview(stackView)
        stackView.centerYToSuperview()
        stackView.leadingToTrailing(of: imageView).constant = 12
        stackView.trailingToSuperview().constant = -12
        stackView.topToSuperview(relation: .equalOrGreater).constant = 12
        stackView.bottomToSuperview(relation: .equalOrLess).constant = -12
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
        stackView.addArrangedSubview(yearLabel)
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 6
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowOffset = .zero
    }
    
}

// MARK: - DataSet
public extension MovieCell {
    
    func set(viewModel: MovieCellProtocol) {
        self.viewModel = viewModel
        imageView.setImage(viewModel.imageUrl)
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subtitle
        yearLabel.text = viewModel.year
    }
    
}
