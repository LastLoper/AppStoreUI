//
//  FeatureSectionCollectionCell.swift
//  AppStore
//
//  Created by Walter J on 2022/11/24.
//

import UIKit
import SnapKit
import Kingfisher

class FeatureSectionCollectionCell: UICollectionViewCell {
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0, weight: .semibold)
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        return label
    }()
    
    private lazy var descriptionLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true      //이미지가 뷰보다 큰 경우, 가장자리 등에서 뷰를 벗어나 표시될 수 있음을 방지
        imageView.layer.borderColor = UIColor.separator.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 7.0
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    func setUpViews(feature: Feature) {
        setUpSubViews()
        
        typeLabel.text = feature.type
        appNameLabel.text = feature.appName
        descriptionLable.text = feature.description
//        imageView.backgroundColor = .lightGray
        if let imgURL = URL(string: feature.imageURL) {
            imageView.kf.setImage(with: imgURL)
        }
    }
}

private extension FeatureSectionCollectionCell {
    func setUpSubViews() {
        [imageView, typeLabel, appNameLabel, descriptionLable].forEach { view in
            addSubview(view)
        }
        
        typeLabel.snp.makeConstraints { view in
            view.leading.trailing.equalToSuperview()
            view.top.equalToSuperview()
        }
        
        appNameLabel.snp.makeConstraints { view in
            view.leading.trailing.equalToSuperview()
            view.top.equalTo(typeLabel.snp.bottom).offset(4.0)
        }
        
        descriptionLable.snp.makeConstraints { view in
            view.leading.trailing.equalToSuperview()
            view.top.equalTo(appNameLabel.snp.bottom).offset(4.0)
        }
        
        imageView.snp.makeConstraints { view in
            view.leading.trailing.equalToSuperview()
            view.top.equalTo(descriptionLable.snp.bottom).offset(8.0)
            view.bottom.equalToSuperview().inset(8.0)
        }
    }
}
