//
//  TodayListHeader.swift
//  AppStore
//
//  Created by Walter J on 2022/11/24.
//

import UIKit
import SnapKit

class TodayListHeader: UICollectionReusableView {
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "m월 d일(E)"
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "투데이"
        label.font = .systemFont(ofSize: 36.0, weight: .black)
        label.textColor = .label
        return label
    }()
    
    func setUpViews() {
        [dateLabel, titleLable].forEach { view in
            addSubview(view)
        }
        
        dateLabel.snp.makeConstraints { view in
            view.leading.equalToSuperview().inset(16.0)
            view.trailing.equalToSuperview()
            view.top.equalToSuperview().inset(32.0)
        }
        
        titleLable.snp.makeConstraints { view in
            view.left.equalTo(dateLabel)
            view.top.equalTo(dateLabel.snp.bottom).offset(8.0)
        }
    }
}
