//
//  TabViewController.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import UIKit
import Moya

class TabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        
//        let provider = MoyaProvider<PoloniexAPI>(plugins: [NetworkLoggerPlugin(verbose: true, cURL: true)])
        let provider = MoyaProvider<PoloniexAPI>(plugins: [])
        
        let service = TickersService()
        service.provider = provider
        
        let presenter = TickersPresenter()
        presenter.tickersService = service
        
        let mainController = MainViewController()
        mainController.presenter = presenter
        
        presenter.view = mainController
        
        let mainNavController = UINavigationController(rootViewController: mainController)
        mainNavController.tabBarItem.title = String.Localization.tickers
        mainNavController.tabBarItem.image = UIImage(named: "tab_main")
        if #available(iOS 11.0, *) {
            mainNavController.tabBarItem.landscapeImagePhone = UIImage(named: "tab_main_landscape")
        }
        
        let aboutViewController = AboutViewController()
        let aboutNavController = UINavigationController(rootViewController: aboutViewController)
        aboutNavController.tabBarItem.title = String.Localization.about
        aboutNavController.tabBarItem.image = UIImage(named: "tab_about")
        if #available(iOS 11.0, *) {
            aboutNavController.tabBarItem.landscapeImagePhone = UIImage(named: "tab_about_landscape")
        }
        
        viewControllers = [mainNavController, aboutNavController]
        
        tabBar.barTintColor = UIColor(rgbaValue: 0x313141ff)
        tabBar.tintColor = .white
        tabBar.isTranslucent = false
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 1)
        topBorder.backgroundColor = UIColor(white: 1, alpha: 0.3).cgColor

        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
    }
    
    fileprivate func templateViewController(_ rootViewController: UIViewController, image: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = image
        return navController
    }
    
}

