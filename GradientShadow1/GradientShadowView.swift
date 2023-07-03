//
//  GradientShadowView.swift
//  GradientShadow1
//
//  Created by Aleksandr Bolotov on 03.07.2023.
//

import UIKit

class GradientShadowView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureLayer()
        backgroundColor = .yellow
    }
    
    func configureLayer() {
        layer.cornerRadius = bounds.width / 10
        layer.shadowColor = CGColor(red: 244, green: 185, blue: 64, alpha: 1)
        layer.shadowRadius = 200
        layer.shadowOpacity = 1
    }
    
}
