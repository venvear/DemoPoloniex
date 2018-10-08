//
//  HeaderCellView.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import Foundation

import UIKit

class HeaderCellView: UITableViewHeaderFooterView {
    
    let coinColumnLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.isUserInteractionEnabled = false
        label.textColor = .white
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.text = String.Localization.coin
        return label
    }()
    
    let highestColumnLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.isUserInteractionEnabled = false
        label.textAlignment = .right
        label.textColor = .white
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.text = String.Localization.highestBid
        return label
    }()
    
    let priceColumnLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.isUserInteractionEnabled = false
        label.textAlignment = .right
        label.textColor = .white
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.text = String.Localization.price
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.3)
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundView = UIView(frame: self.bounds)
        backgroundView?.backgroundColor = UIColor(rgbaValue: 0x3b3b4dff)
        
        contentView.backgroundColor = UIColor(rgbaValue: 0x3b3b4dff)
        
        addSubview(coinColumnLabel)
        addSubview(highestColumnLabel)
        addSubview(priceColumnLabel)
        addSubview(separatorView)
        
        let titleWidth: Float
        let priceWidth: Float
        let padding: Float
        
        if UIDevice.current.device == .iPhone5 {
            titleWidth = 60
            priceWidth = 120
            padding = IPHONE5_PADDING
            
        } else {
            titleWidth = 70
            priceWidth = 140
            padding = DEFAULT_PADDING
        }
        
        if #available(iOS 11.0, *) {
            coinColumnLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, bottom: nil, right: nil, paddingTop: 4, paddingLeft: padding, paddingBottom: 0, paddingRight: 0, width: titleWidth, height: 18)
            priceColumnLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: safeAreaLayoutGuide.rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: padding, width: priceWidth, height: 18)
            highestColumnLabel.anchor(top: safeAreaLayoutGuide.topAnchor, left: coinColumnLabel.safeAreaLayoutGuide.rightAnchor, bottom: nil, right: priceColumnLabel.safeAreaLayoutGuide.leftAnchor, paddingTop: 4, paddingLeft: padding, paddingBottom: 0, paddingRight: padding, width: 0, height: 18)
            separatorView.anchor(top: nil, left: safeAreaLayoutGuide.leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        } else {
            coinColumnLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 4, paddingLeft: padding, paddingBottom: 0, paddingRight: 0, width: titleWidth, height: 18)
            priceColumnLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: padding, width: priceWidth, height: 18)
            highestColumnLabel.anchor(top: topAnchor, left: coinColumnLabel.rightAnchor, bottom: nil, right: priceColumnLabel.leftAnchor, paddingTop: 4, paddingLeft: padding, paddingBottom: 0, paddingRight: padding, width: 0, height: 18)
            separatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        }
    }
    
}
