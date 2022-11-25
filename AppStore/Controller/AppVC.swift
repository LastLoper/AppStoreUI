//
//  AppVC.swift
//  AppStore
//
//  Created by WalterCho on 2022/11/24.
//

import UIKit

class AppVC: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let featureSectionView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = RankingFeatureSectionView(frame: .zero)
        let exchangeCodeBtnView = ExchangeCodeButtonView(frame: .zero)
        
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(100.0)
        }
        
        [featureSectionView, rankingFeatureSectionView, exchangeCodeBtnView, spacingView].forEach { view in
//            view.snp.makeConstraints {        //우선순위로 높이가 잡히는 문제가 발생함
//                $0.height.equalTo(500.0)
//            }
            stackView.addArrangedSubview(view)
        }
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationController()
        setUpLayout()
    }
    
    func setUpNavigationController() {
        navigationItem.title = "앱"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setUpLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { view in
            view.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            view.leading.bottom.trailing.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { view in
            view.edges.equalToSuperview()
            view.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { view in
            view.edges.equalToSuperview()
        }
    }
}
