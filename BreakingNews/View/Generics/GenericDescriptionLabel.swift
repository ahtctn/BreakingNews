//
//  GenericDescriptionLabel.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 24.07.2023.
//

import UIKit

class GenericDescriptionLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        font = UIFont.boldSystemFont(ofSize: 20)
        textAlignment = .center
        numberOfLines = 5
        textColor = .label
    }
}
