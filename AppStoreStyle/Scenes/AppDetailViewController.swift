//
//  AppDetailViewController.swift.swift
//  AppStoreStyle
//
//  Created by 정은경 on 2022/04/11.
//

import UIKit
import SnapKit

final class AppDetailViewController: UIViewController {
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setView()
        
        imageView.backgroundColor = .lightGray
        titleLabel.text = "title"
        descLabel.text = "desc"
    }
    
}

// MARK: setView
private extension AppDetailViewController {
    func setView(){
        [imageView, titleLabel, descLabel, downloadButton, shareButton].forEach{ view.addSubview($0) }
        
        imageView.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(32)
            $0.height.width.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(imageView.snp.top)
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        descLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        downloadButton.snp.makeConstraints{
            $0.bottom.equalTo(imageView.snp.bottom)
            $0.height.equalTo(32)
            $0.width.equalTo(60)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        shareButton.snp.makeConstraints{
            $0.width.height.equalTo(32)
            $0.trailing.equalTo(titleLabel.snp.trailing)
            $0.bottom.equalTo(imageView.snp.bottom)
        }
    }
}
