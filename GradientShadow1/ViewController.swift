//
//  ViewController.swift
//  GradientShadow1
//
//  Created by Aleksandr Bolotov on 03.07.2023.
//

import UIKit

class ViewController: UIViewController {
    private lazy var cyanView = View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cyanView.backgroundColor = .systemCyan
        cyanView.layer.cornerRadius = 14
        cyanView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cyanView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cyanView.widthAnchor.constraint(equalToConstant: 100),
            cyanView.heightAnchor.constraint(equalToConstant: 100),
            cyanView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            cyanView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        cyanView.frame = .init(x: 100, y: cyanView.frame.origin.y, width: 120, height: 120)
//        cyanView.center.y = view.frame.height/2
//    }
    
}

class View: UIView {
    let gradientLayer = CAGradientLayer()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .systemCyan
        // TODO: что за свойство понять
        layer.cornerCurve = .continuous
        
//        layer.masksToBounds = true // wrong
        
        /// тень
        layer.shadowOpacity = 0.6
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 12
        
        gradientLayer.startPoint = .init(x: 0, y: 0)
        gradientLayer.endPoint = .init(x: 1, y: 0.5)
        gradientLayer.colors = [
            UIColor.systemRed.withAlphaComponent(0.1).cgColor,
            UIColor.systemRed.cgColor
        ]
        layer.addSublayer(gradientLayer)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // TODO: не очень понятно, подумать, удалить ттуду 
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        if layer == self.layer {
            gradientLayer.frame = bounds
            gradientLayer.cornerRadius = layer.cornerRadius
        }
    }
}
