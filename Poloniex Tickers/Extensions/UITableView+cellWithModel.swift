//
//  UITableView+cellWithModel.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func dequeueReusableCell(withModel model: CellViewAnyModel, for indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = String(describing: type(of: model).cellAnyType)
        let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        model.setupAny(cell: cell)
        return cell
    }
    
    func dequeueReusableSupplementaryView(withModel model: CellViewAnyModel, ofKind elementKind: String, for indexPath: IndexPath) -> UICollectionReusableView {
        let identifier = String(describing: type(of: model).cellAnyType)
        let cell = self.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: identifier, for: indexPath)
        
        model.setupAny(cell: cell)
        return cell
    }
    
}

extension UITableView {
    
    func dequeueReusableCell(withModel model: CellViewAnyModel, for indexPath: IndexPath) -> UITableViewCell  {
        let identifier = String(describing: type(of: model).cellAnyType)
        let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        model.setupAny(cell: cell)
        return cell
    }

    
}
