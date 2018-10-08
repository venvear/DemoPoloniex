//
//  AboutViewController.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.isUserInteractionEnabled = false
        label.textColor = .white
        label.text = "Poloniex"
        label.textAlignment = .center
        return label
    }()
    
    let versionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.isUserInteractionEnabled = false
        label.textColor = UIColor(white: 1, alpha: 0.5)
        label.text = "\(String.Localization.version) 1.0"
        label.textAlignment = .center
        return label
    }()
    
    var constraintsPortrait = [NSLayoutConstraint]()
    var constraintsLandscape = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(rgbaValue: 0x3b3b4dff)
        
        navigationController?.navigationBar.barTintColor = UIColor(rgbaValue: 0x313141ff)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.setNavigationBarBorderColor(UIColor(white: 1, alpha: 0.3))
        
        navigationItem.title = String.Localization.about
        
        view.addSubview(logoImage)
        view.addSubview(titleLabel)
        view.addSubview(versionLabel)
        
        logoImage.anchor(centerX: view.centerXAnchor, centerY: view.centerYAnchor, paddingCenterX: 0, paddingCenterY: -40, width: 160, height: 160)
        titleLabel.anchor(top: logoImage.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 30)
        versionLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
