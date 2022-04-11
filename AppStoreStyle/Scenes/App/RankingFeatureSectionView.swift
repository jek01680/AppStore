//
//  RankingFeatureSectionView.swift
//  AppStoreStyle
//
//  Created by 정은경 on 2022/04/11.
//

import UIKit
import SnapKit

final class RankingFeatureSectionView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .black)
        label.text = "iPone이 처음이라면"
        return label
    }()
    
    private lazy var showAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("모두 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 32
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(RankingFeatureCollectionViewCell.self, forCellWithReuseIdentifier: "RankingFeatureCollectionViewCell")
        return collectionView
    }()
    
    private let separatorView = SeparatorView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
}

extension RankingFeatureSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 32 , height: RankingFeatureCollectionViewCell.height)
    }
}

extension RankingFeatureSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RankingFeatureCollectionViewCell", for: indexPath) as? RankingFeatureCollectionViewCell else { return UICollectionViewCell() }
        cell.setupLayout()
        return cell
    }
    
}

extension RankingFeatureSectionView {
    func setupView(){
        [titleLabel,showAllButton,collectionView,separatorView].forEach{ addSubview($0) }
        
        titleLabel.snp.makeConstraints{
            $0.leading.top.equalToSuperview().inset(16)
            $0.trailing.equalTo(showAllButton.snp.leading).offset(8)
        }
        
        showAllButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(titleLabel.snp.bottom)
        }
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.height.equalTo(RankingFeatureCollectionViewCell.height*3)
            $0.leading.trailing.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints{
            $0.top.equalTo(collectionView.snp.bottom).offset(16)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}
