//
//  TickerCellView.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import UIKit

class TickerCellView: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.isUserInteractionEnabled = false
        label.textColor = UIColor(rgbaValue: 0xffd769ff)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.isUserInteractionEnabled = false
        label.textAlignment = .right
        label.textColor = .white
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let percentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.isUserInteractionEnabled = false
        label.textAlignment = .right
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    let highestLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.isUserInteractionEnabled = false
        label.textAlignment = .right
        label.textColor = UIColor(white: 1, alpha: 0.5)
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.12)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor(rgbaValue: 0x3b3b4dff)
        
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(percentLabel)
        addSubview(highestLabel)
        addSubview(separatorView)
        
        let titleWidth: Float
        let priceWidth: Float
        let padding: Float
        
        if UIDevice.current.device == .iPhone5 {
            titleWidth = 60
            priceWidth = 120
            padding = IPHONE5_PADDING
            
            titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        } else {
            titleWidth = 70
            priceWidth = 140
            padding = DEFAULT_PADDING
        }
        
        if #available(iOS 11.0, *) {
            titleLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, paddingTop: padding, paddingLeft: padding, paddingBottom: 0, paddingRight: 0, width: titleWidth, height: 24)
            priceLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: safeAreaLayoutGuide.rightAnchor, paddingTop: padding, paddingLeft: 0, paddingBottom: 0, paddingRight: padding, width: priceWidth, height: 20)
            percentLabel.anchor(top: priceLabel.safeAreaLayoutGuide.bottomAnchor, left: priceLabel.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: safeAreaLayoutGuide.rightAnchor, paddingTop: 2, paddingLeft: 0, paddingBottom: 0, paddingRight: padding, width: 0, height: 20)
            highestLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: titleLabel.safeAreaLayoutGuide.rightAnchor, bottom: nil, right: priceLabel.safeAreaLayoutGuide.leftAnchor, paddingTop: padding, paddingLeft: padding, paddingBottom: 0, paddingRight: padding, width: 0, height: 20)
            separatorView.anchor(top: nil, left: safeAreaLayoutGuide.leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
        } else {
            titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: padding, paddingLeft: padding, paddingBottom: 0, paddingRight: 0, width: titleWidth, height: 24)
            priceLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: padding, paddingLeft: 0, paddingBottom: 0, paddingRight: padding, width: priceWidth, height: 20)
            percentLabel.anchor(top: priceLabel.bottomAnchor, left: priceLabel.leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 2, paddingLeft: 0, paddingBottom: 0, paddingRight: padding, width: 0, height: 20)
            highestLabel.anchor(top: topAnchor, left: titleLabel.rightAnchor, bottom: nil, right: priceLabel.leftAnchor, paddingTop: padding, paddingLeft: padding, paddingBottom: 0, paddingRight: padding, width: 0, height: 20)
            separatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
        }
    }
    
}
