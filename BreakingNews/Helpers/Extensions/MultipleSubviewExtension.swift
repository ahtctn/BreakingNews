//
//  MultipleSubviewExtension.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 22.07.2023.
//

import UIKit

extension NSLayoutConstraint {
    static func activateMultiple(_ constraints: [NSLayoutConstraint]...) {
        NSLayoutConstraint.activate(constraints.flatMap({ $0 }))
    }
}
