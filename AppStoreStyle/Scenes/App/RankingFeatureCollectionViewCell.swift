//
//  RankingFeatureCollectionViewCell.swift
//  AppStoreStyle
//
//  Created by 정은경 on 2022/04/11.
//

import SnapKit
import UIKit

final class RankingFeatureCollectionViewCell: UICollectionViewCell {
    static var height: CGFloat{70}
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiarySystemGroupedBackground
        imageView.layer.borderColor = UIColor.tertiaryLabel.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 7.0
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        button.backgroundColor = .secondarySystemBackground
        button.layer.cornerRadius = 12
        return button
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private var inAppPurchaseInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "앱 내 구입"
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
        titleLabel.text = "앱 이름"
        descLabel.text = "어쩐저쩐 앱입니다."
        inAppPurchaseInfoLabel.isHidden = [true, false].randomElement() ?? true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RankingFeatureCollectionViewCell {
    func setupLayout(){
        [imageView,titleLabel,descLabel,downloadButton,inAppPurchaseInfoLabel].forEach{ addSubview($0) }
        
        imageView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(4)
            $0.width.equalTo(imageView.snp.height)
        }
        
        downloadButton.snp.makeConstraints{
            $0.centerY.trailing.equalToSuperview()
            $0.height.equalTo(24)
            $0.width.equalTo(50)
        }
        
        inAppPurchaseInfoLabel.snp.makeConstraints{
            $0.centerX.equalTo(downloadButton.snp.centerX)
            $0.top.equalTo(downloadButton.snp.bottom).offset(4)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
            $0.trailing.equalTo(downloadButton.snp.leading)
            $0.top.equalTo(imageView.snp.top).inset(8)
        }
        
        descLabel.snp.makeConstraints{
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
    }
}
