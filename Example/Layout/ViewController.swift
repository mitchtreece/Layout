//
//  ViewController.swift
//  Layout
//
//  Created by Mitch Treece on 07/17/2020.
//  Copyright (c) 2020 Mitch Treece. All rights reserved.
//

import UIKit
import Layout

class ViewController: UIViewController {
    
    private var containerView: UIView!
    private var contentView: UIView!
    private var titleLabel: UILabel!
    private var subtitleLabel: UILabel!
    private var button: UIButton!
    
    private var isButtonBig: Bool = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.containerView = UIView()
        self.containerView.backgroundColor = .clear
        self.view.addSubview(self.containerView)
        self.containerView.layout.make
            .edges(to: self.view.layout.safeAreaEdges)

        self.contentView = UIView()
        self.contentView.backgroundColor = #colorLiteral(red: 0.8979700804, green: 0.8980780244, blue: 0.8979334235, alpha: 1)
        self.contentView.layer.cornerRadius = 12
        self.contentView.layer.shadowOpacity = 0.2
        self.contentView.layer.shadowRadius = 10
        self.contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.25).cgColor
        self.containerView.addSubview(self.contentView)
        self.contentView.layout.make
            .size(to: self.view.layout.width, offset: -40)
            .center()
                
        self.titleLabel = UILabel()
        self.titleLabel.text = "Layout Example"
        self.titleLabel.font = .preferredFont(forTextStyle: .title1)
        self.titleLabel.numberOfLines = 0
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.layout.make
            .edges(.allExceptBottom, insets: .all(20))
            .hugging(axis: .vertical, .defaultHigh)
        
        self.subtitleLabel = UILabel()
        self.subtitleLabel.text = "This is an example of the Layout system. Tap the button below to update constraints."
        self.subtitleLabel.font = .preferredFont(forTextStyle: .subheadline)
        self.subtitleLabel.numberOfLines = 0
        self.contentView.addSubview(self.subtitleLabel)
        self.subtitleLabel.layout.make
            .top(to: self.titleLabel.layout.bottom, offset: 8)
            .edges(.horizontal, insets: .all(20))
            .hugging(axis: .vertical, .defaultHigh)
        
        self.button = UIButton()
        self.button.backgroundColor = .white
        self.button.layer.cornerRadius = 6
        self.button.setTitle("Press Me", for: .normal)
        self.button.setTitleColor(.black, for: .normal)
        self.button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        self.contentView.addSubview(self.button)
        self.button.layout.make
            .edges(.allExceptTop, insets: .all(20))
            .height(50)
        
    }
    
    @objc private func didTapButton(_ sender: UIButton) {

        if !self.isButtonBig {
            
            self.contentView.layout.remake
                .edges()
            
            self.button.layout.remake
                .top(to: self.subtitleLabel.layout.bottom, offset: 20)
                .edges(.allExceptTop, insets: .all(20))
            
        }
        else {
            
            self.contentView.layout.remake
                .size(to: self.view.layout.width, offset: -40)
                .center()

            self.button.layout.remake
                .edges(.allExceptTop, insets: .all(20))
                .height(50)
            
        }
                
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.3,
                       options: [],
                       animations: {
                        
            self.contentView.superview?.layoutIfNeeded()
            self.button.superview?.layoutIfNeeded()
                        
            self.view.backgroundColor = self.isButtonBig ? .white : self.contentView.backgroundColor
            self.contentView.layer.cornerRadius = self.isButtonBig ? 12 : 0
            self.contentView.layer.borderWidth = self.isButtonBig ? 1 : 0
            self.contentView.layer.shadowOpacity = self.isButtonBig ? 0.2 : 0
                        
        }, completion: nil)
        
        self.isButtonBig.toggle()
        
    }

}

