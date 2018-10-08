//
//  MainController.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 28/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.indicatorStyle = .white
        tableView.backgroundColor = UIColor(rgbaValue: 0x313141ff)
        return tableView
    }()
    
    lazy var emptyView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgbaValue: 0x3b3b4dff)
        return view
    }()
    
    let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    
    var indicatorItem: UIBarButtonItem!
    var buttonRefreshItem: UIBarButtonItem!
    
    var presenter: TickersPresenter!
    
    var tickerCellViewModels = [TickerCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        presenter.viewLoaded()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.fillSafeArea()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(TickerCellView.self, forCellReuseIdentifier: TickerCellView.identifier)
        tableView.register(HeaderCellView.self, forHeaderFooterViewReuseIdentifier: HeaderCellView.identifier)
        
        addEmptyView()
        
        navigationController?.navigationBar.barTintColor = UIColor(rgbaValue: 0x313141ff)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.setNavigationBarBorderColor(UIColor(white: 1, alpha: 0.3))
        
        navigationItem.title = String.Localization.tickers
        
        indicatorItem = UIBarButtonItem(customView: activityIndicator)
        buttonRefreshItem = UIBarButtonItem(image: UIImage(named: "refresh"), style: .plain, target: self, action: #selector(handleRefresh))
        
        navigationItem.rightBarButtonItem = buttonRefreshItem
        
        emptyView.isHidden = false
        tableView.isHidden = true
    }
    
    private func addEmptyView() {
        view.addSubview(emptyView)
        emptyView.fillSuperView()
        
        let logoImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "no_data")?.tinted(with: .white)
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 22)
            label.isUserInteractionEnabled = false
            label.textColor = .white
            label.text = String.Localization.emptyData
            label.numberOfLines = 2
            label.textAlignment = .center
            return label
        }()
        
        emptyView.addSubview(logoImage)
        emptyView.addSubview(titleLabel)
        
        logoImage.anchor(centerX: emptyView.centerXAnchor, centerY: emptyView.centerYAnchor, paddingCenterX: 0, paddingCenterY: -40, width: 160, height: 160)
        titleLabel.anchor(top: logoImage.bottomAnchor, left: emptyView.leftAnchor, bottom: nil, right: emptyView.rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.viewAppeared()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        presenter.viewDisappeared()
    }
    
    @objc func handleRefresh() {
        presenter.resresh()
    }

}

extension MainViewController: TickersView {
    
    func showLoading(loading: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = loading
        
        if loading {
            activityIndicator.startAnimating()
            navigationItem.rightBarButtonItem = indicatorItem
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func showLoadedTickers(tickers: [TickerModel]) {
        emptyView.isHidden = true
        tableView.isHidden = false

        tickerCellViewModels.removeAll()
        
        tickers.sorted { (t1, t2) -> Bool in
            return t1.name < t2.name
        }.forEach { (tickerModel) in
            let tickerCellViewModel = TickerCellViewModel(tickerModel: tickerModel)
            tickerCellViewModels.append(tickerCellViewModel)
        }
        
        tableView.reloadData()
    }
    
    func updateTickers(tickers: [TickerModel]) {
        emptyView.isHidden = true
        tableView.isHidden = false

        var indexPaths = [IndexPath]()
        
        for (index, tickerCellViewModel) in tickerCellViewModels.enumerated() {
            for tickerModel in tickers {
                if tickerCellViewModel.tickerModel == tickerModel {
                    tickerCellViewModel.tickerModel = tickerModel
                    let indexPath = IndexPath(row: index, section: 0)
                    indexPaths.append(indexPath)
                    
                    break
                }
            }
        }
        
        tableView.reloadRows(at: indexPaths, with: .right)
    }
   
    func didFailLoadTickers(message: String) {
        let alert = UIAlertController(title: String.Localization.error, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        
        navigationItem.rightBarButtonItem = buttonRefreshItem

        emptyView.isHidden = false
        tableView.isHidden = true
    }
    
}

extension MainViewController: UITableViewDelegate {

}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tickerCellViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = tickerCellViewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withModel: model, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderCellView.identifier)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.device == .iPhone5 ? 54 : 66
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 26
    }
    
}
