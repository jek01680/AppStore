//
//  TodayCollectionViewCell.swift
//  AppStoreStyle
//
//  Created by 정은경 on 2022/04/08.
//

import UIKit
import SnapKit

final class TodayCollectionViewCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    func setup(){
        setupSubViews()
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 10
        
        subtitleLabel.text = "서브타이틀"
        descriptionLabel.text = "설명설명"
        titleLabel.text = "앱 이름"
    }
}

private extension TodayCollectionViewCell {
    func setupSubViews() {
        [imageView, titleLabel, subtitleLabel, descriptionLabel].forEach{
            addSubview($0)
        }
        
        subtitleLabel.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview().inset(24)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.trailing.equalTo(subtitleLabel)
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(4)
        }
        
        descriptionLabel.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview().inset(24)
        }
        
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
