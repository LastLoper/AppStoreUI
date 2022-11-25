//
//  SeparatorView.swift
//  AppStore
//
//  Created by Walter J on 2022/11/24.
//

import UIKit
import SnapKit

class SeparatorView: UIView {
    private lazy var separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .separator
        
        return separator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(separator)
        separator.snp.makeConstraints { view in
            view.leading.equalToSuperview().inset(16.0)
            view.trailing.equalToSuperview()
            view.top.equalToSuperview()
            view.height.equalTo(0.5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
