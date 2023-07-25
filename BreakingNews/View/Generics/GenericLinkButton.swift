//
//  GenericLinkButton.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 25.07.2023.
//

import UIKit

class GenericLinkButton: UIButton {
    init(buttonTitle: String, contentMultiplier: CGFloat) {
        super.init(frame: .zero)
        setTitle(buttonTitle, for: .normal)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        
        let configuration = UIImage.SymbolConfiguration(pointSize: (titleLabel?.font.pointSize ?? 17) * contentMultiplier)
        let symbolImage = UIImage(systemName: "arrow.forward", withConfiguration: configuration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        symbolImage?.withTintColor(.white)
        setImage(symbolImage, for: .normal)
        
        self.backgroundColor = backgroundColor
        layer.cornerRadius = 5
        clipsToBounds = true
        
        // Arrow image ile title arasında 10 piksellik boşluk bırakmak için contentEdgeInsets'ı ayarlayalım
        let padding: CGFloat = 10.0
        let arrowImageWidth = symbolImage?.size.width ?? 0
        let titleWidth = titleLabel?.intrinsicContentSize.width ?? 0
        let totalContentWidth = arrowImageWidth + padding + titleWidth
        
        contentEdgeInsets = UIEdgeInsets(top: 0, left: (bounds.width - totalContentWidth) / 2, bottom: 0, right: (bounds.width - totalContentWidth) / 2)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: titleLabel!.widthAnchor, multiplier: 2.0), // Genişlik 2 katı
            heightAnchor.constraint(equalTo: titleLabel!.heightAnchor, multiplier: 2.0) // Yükseklik 2 katı
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
