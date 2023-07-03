//
//  ViewController.swift
//  GradientShadow1
//
//  Created by Aleksandr Bolotov on 03.07.2023.
//

import UIKit

class ViewController: UIViewController {
    private lazy var gradientShadowView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(gradientShadowView)
        
        NSLayoutConstraint.activate([
            gradientShadowView.widthAnchor.constraint(equalToConstant: 100),
            gradientShadowView.heightAnchor.constraint(equalToConstant: 100),
            gradientShadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            gradientShadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGradientShadow()
    }
    
    private func setupGradientShadow() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 65/255, green: 72/255, blue: 86/255, alpha: 1).cgColor,
            UIColor(red: 252/255, green: 240/255, blue: 130/255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.frame = gradientShadowView.bounds
        gradientLayer.cornerRadius = 20
        gradientShadowView.layer.shadowOffset = CGSize(width: 0, height: 2)
        gradientShadowView.layer.shadowOpacity = 0.8
        gradientShadowView.layer.shadowRadius = 20.0
        gradientShadowView.layer.shadowColor = UIColor(red: 30/255, green: 36/255, blue: 50/255, alpha: 1).cgColor
        gradientShadowView.layer.masksToBounds = false
        gradientShadowView.layer.insertSublayer(gradientLayer, at: 0)
    }
}
