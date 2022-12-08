//
//  RatingControl.swift
//  TMDB-SwiftUI
//
//  Created by Aldair Cosetito Coral on 6/12/22.
//

import Foundation
import UIKit

protocol RatingControlDelegate: AnyObject {
    func sendMessage(_ message: String)
}

final class RatingControl: UIView {
 
    lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        guard let image = UIImage(named: "ic-change") else {
            return button
        }
        
        button.setImage(image, for: .normal)
        return button
    }()
    
    weak var delegate: RatingControlDelegate?
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(containerView)
        containerView.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: self.heightAnchor),
            containerView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        containerView.backgroundColor = .systemGreen
    }
    
    func setupMethod() {
        startButton.addTarget(self, action: #selector(startButtonTapped(sender:)), for: .touchUpInside)
    }
    
    @objc func startButtonTapped(sender: UIButton) {
        let numberRandom = Int.random(in: 1...1000)
        delegate?.sendMessage("\(numberRandom)")
    }
    
    func updateBackground(_ title: String, _ color: UIColor) {
        containerView.backgroundColor = color
        self.largeContentTitle = title
    }
}
