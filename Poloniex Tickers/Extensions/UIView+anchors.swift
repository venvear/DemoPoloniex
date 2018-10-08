//
//  UIView+anchors.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import UIKit

let DEFAULT_PADDING: Float = 12
let IPHONE5_PADDING: Float = 6

extension UIView {
    
    func fillSafeArea() {
        guard let superview = self.superview else {
            return
        }
        
        if #available(iOS 11.0, *) {
            anchor(top: superview.safeAreaLayoutGuide.topAnchor, left: superview.safeAreaLayoutGuide.leftAnchor, bottom: superview.safeAreaLayoutGuide.bottomAnchor, right: superview.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        } else {
            anchor(top: superview.topAnchor, left: superview.leftAnchor, bottom: superview.bottomAnchor, right: superview.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        }
    }
    
    func fillSuperView() {
        guard let superview = self.superview else {
            return
        }
        
        anchor(top: superview.topAnchor, left: superview.leftAnchor, bottom: superview.bottomAnchor, right: superview.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func centerSuperView(width: Float, height: Float) {
        guard let superview = self.superview else {
            return
        }
        
        anchor(centerX: superview.centerXAnchor, centerY: superview.centerYAnchor, paddingCenterX: 0, paddingCenterY: 0, width: width, height: height)
    }
    
    func anchor(centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?, paddingCenterX: Float, paddingCenterY: Float, width: Float, height: Float) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX, constant: CGFloat(paddingCenterX)).isActive = true
            constraints.append(centerXAnchor.constraint(equalTo: centerX, constant: CGFloat(paddingCenterX)))
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY, constant: CGFloat(paddingCenterY)).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        }
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: Float, paddingLeft: Float, paddingBottom: Float, paddingRight: Float, width: Float, height: Float) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            if #available(iOS 11.0, *) {
                safeAreaLayoutGuide.topAnchor.constraint(equalTo: top, constant: CGFloat(paddingTop)).isActive = true
            } else {
                topAnchor.constraint(equalTo: top, constant: CGFloat(paddingTop)).isActive = true
            }
        }
        
        if let left = left {
            if #available(iOS 11.0, *) {
                safeAreaLayoutGuide.leftAnchor.constraint(equalTo: left, constant: CGFloat(paddingLeft)).isActive = true
            } else {
                leftAnchor.constraint(equalTo: left, constant: CGFloat(paddingLeft)).isActive = true
            }
        }
        
        if let bottom = bottom {
            if #available(iOS 11.0, *) {
                safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: bottom, constant: CGFloat(-paddingBottom)).isActive = true
            } else {
                bottomAnchor.constraint(equalTo: bottom, constant: CGFloat(-paddingBottom)).isActive = true
            }
        }
        
        if let right = right {
            if #available(iOS 11.0, *) {
                safeAreaLayoutGuide.rightAnchor.constraint(equalTo: right, constant: CGFloat(-paddingRight)).isActive = true
            } else {
                rightAnchor.constraint(equalTo: right, constant: CGFloat(-paddingRight)).isActive = true
            }
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        }
    }
    
}
