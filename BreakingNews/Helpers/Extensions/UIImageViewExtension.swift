//
//  UIImageViewExtension.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 22.07.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String) {
        guard let url = URL.init(string: urlString) else {
            return
        }
        
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
