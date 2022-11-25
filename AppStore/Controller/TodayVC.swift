//
//  TodayVC.swift
//  AppStore
//
//  Created by WalterCho on 2022/11/24.
//

import UIKit
import SnapKit

class TodayVC: UIViewController {
    
    private var todayListData: [Today] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(TodayListCell.self, forCellWithReuseIdentifier: "TodayListCell")
        collectionView.register(
            TodayListHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "TodayListHeader"
        )
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { view in
            view.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

//MARK: - UICollectionViewDataSource
extension TodayVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayListCell", for: indexPath) as! TodayListCell
        
        let item = todayListData[indexPath.item]
        cell.setUpViews(today: item)
        
        return cell
    }
    
    //Header || Footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard
            kind == UICollectionView.elementKindSectionHeader,
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "TodayListHeader",
                for: indexPath
            ) as? TodayListHeader else { return UICollectionReusableView() }
        
        header.setUpViews()
        
        return header
    }
}

//MARK: - UICollectionViewDelegate
extension TodayVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //셀 선택
        let item = todayListData[indexPath.item]
        let detailVC = DetailVC(today: item)
        self.present(detailVC, animated: true)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension TodayVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 32.0
        let height = width
        
        return CGSize(width: width, height: height)
    }
    
    //Header || Footer의 크기를 정해주어야 함
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.frame.width - 32.0
        let height = 100.0
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let value: CGFloat = 16.0
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
}

private extension TodayVC {
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "Today", withExtension: "plist") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([Today].self, from: data)
            todayListData = result
        } catch let error {
            print("error: \(error.localizedDescription)")
        }
    }
}
