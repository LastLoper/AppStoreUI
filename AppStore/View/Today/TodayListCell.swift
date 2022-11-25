//
//  TodayListCell.swift
//  AppStore
//
//  Created by WalterCho on 2022/11/24.
//

import UIKit
import SnapKit
import Kingfisher

class TodayListCell: UICollectionViewCell {
    
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var subTitleLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var descriptionLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true      //이미지가 뷰보다 큰 경우, 가장자리 등에서 뷰를 벗어나 표시될 수 있음을 방지
        imageView.layer.cornerRadius = 12.0
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    func setUpViews(today: Today) {
        setUpSubViews()
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 10
        
        prepare(today: today)
    }
    
    func prepare(today: Today) {
        self.titleLable.text = today.title
        self.subTitleLable.text = today.subTitle
        self.descriptionLable.text = today.description
        self.imageView.image = kf.setImage(with: today.imageURL)
    }
}

private extension TodayListCell {
    func setUpSubViews() {
        [imageView, titleLable, subTitleLable, descriptionLable].forEach { view in
            addSubview(view)
        }
        
        subTitleLable.snp.makeConstraints { view in
            view.leading.trailing.equalToSuperview().inset(24.0)
            view.top.equalToSuperview().inset(24.0)
        }
        
        titleLable.snp.makeConstraints { view in
            view.leading.trailing.equalTo(subTitleLable)
            view.top.equalTo(subTitleLable.snp.bottom).offset(4.0)
        }
        
        descriptionLable.snp.makeConstraints { view in
            view.leading.trailing.equalToSuperview().inset(24.0)
            view.bottom.equalToSuperview().inset(24.0)
        }
        
        imageView.snp.makeConstraints { view in
            view.edges.equalToSuperview()
        }
    }
}
