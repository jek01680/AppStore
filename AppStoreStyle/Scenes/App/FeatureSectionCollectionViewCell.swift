//
//  FeatureSectionCollectionViewCell.swift
//  AppStoreStyle
//
//  Created by 정은경 on 2022/04/10.
//

import UIKit
import SnapKit

final class FeatureSectionCollectionViewCell: UICollectionViewCell {
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 7
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.separator.cgColor
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    func setup(){
        setupLayout()
        
        typeLabel.text = "새로운 게임"
        titleLabel.text = "앱이름"
        descLabel.text = "설명설명"
        imageView.backgroundColor = .lightGray
    }
}

private extension FeatureSectionCollectionViewCell {
    func setupLayout(){
        [typeLabel,titleLabel,descLabel,imageView].forEach{ addSubview($0) }
        
        typeLabel.snp.makeConstraints{
            $0.trailing.top.leading.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(typeLabel.snp.bottom)
        }
        
        descLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
        
        imageView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(descLabel.snp.bottom).offset(8)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
}
