//
//  ExchangeCodeButtonView.swift
//  AppStoreStyle
//
//  Created by 정은경 on 2022/04/11.
//

import SnapKit
import UIKit

final class ExchangeCodeButtonView: UIView {
    private lazy var exchangeCodeButton: UIButton = {
        let button = UIButton()
        button.setTitle("코드 교환", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .tertiarySystemGroupedBackground
        button.layer.cornerRadius = 7
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(exchangeCodeButton)
        
        exchangeCodeButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(32)
            $0.bottom.equalToSuperview().offset(32)
            $0.height.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
}
