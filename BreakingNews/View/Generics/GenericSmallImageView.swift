//
//  GenericSmallImageView.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 24.07.2023.
//

import UIKit

class GenericSmallImageView: UIImageView {
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentMode = .scaleAspectFit
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.masksToBounds = false
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4
    }
}

