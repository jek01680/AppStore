//
//  TodayViewController.swift
//  AppStoreStyle
//
//  Created by 정은경 on 2022/04/08.
//

import SnapKit
import UIKit

final class TodayViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame:  .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .systemBackground
        collectionView.register(TodayCollectionViewCell.self, forCellWithReuseIdentifier: "todayCell")
        collectionView.register(TodayCollectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "TodayCollectionHeaderView")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}

extension TodayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 32
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let value: CGFloat = 16
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = AppDetailViewController()
        present(vc, animated: true, completion: nil)
    }
}

extension TodayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todayCell", for: indexPath) as? TodayCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setup()
        cell.backgroundColor = .black
        cell.layer.cornerRadius = 12
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: "TodayCollectionHeaderView",
                for: indexPath
              ) as? TodayCollectionHeaderView else { return UICollectionReusableView() }
        
        header.setupViews()
        
        return header
    }
    
}
