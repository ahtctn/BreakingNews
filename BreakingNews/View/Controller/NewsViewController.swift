//
//  ViewController.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 21.07.2023.
//

import UIKit

class NewsViewController: UIViewController {
    
    let viewModel = NewsViewModel()
    
    var countryCode: String?
    var categoryCode: String?
    
    var countryName: String = ""
    var categoryName: String = ""
    
    init(countryCode: String? = nil, categoryCode: String? = nil) {
        self.countryCode = countryCode
        self.categoryCode = categoryCode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: OUTLETS
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.allowsSelection = true
        tv.register(NewsTableViewCell.self, forCellReuseIdentifier: Constants.cellID)
        return tv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observeEvent()
        setUI()
        selectHeaderNames()
        
    }
    
    
    //MARK: SET UI
    private func setUI() {
        self.title = "News"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.addSubview(tableView)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
    }
    
    //MARK: VIEWMODEL BINDING SECTION
    func observeEvent() {
        viewModel.getTopHeadlines(country: countryCode ?? "error", category: categoryCode ?? "error")
        viewModel.eventHandler = { [weak self] event in
            switch event {
            case .loading:
                print("Data is loading")
            case .stopLoading:
                print("Data stopped loading")
            case .dataLoaded:
                print("data loaded")
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .error(let error):
                print("event error")
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    private func selectHeaderNames() {
        switch countryCode {
        case Constants.Countries.usa:
            countryName = "Amerika Birleşik Devletleri"
        case Constants.Countries.turkey:
            countryName = "Türkiye"
        case Constants.Countries.netherlands:
            countryName = "Hollanda"
        case Constants.Countries.germany:
            countryName = "Almanya"
        case Constants.Countries.russia:
            countryName = "Rusya"
        default:
            print("error var selectheader names")
        }
        
        switch categoryCode {
        case Constants.Categories.general:
            categoryName = "Genel"
        case Constants.Categories.business:
            categoryName = "İş Dünyası"
        case Constants.Categories.entertainment:
            categoryName = "Eğlence"
        case Constants.Categories.sports:
            categoryName = "Spor"
        case Constants.Categories.health:
            categoryName = "Sağlık"
        case Constants.Categories.science:
            categoryName = "Bilim"
        case Constants.Categories.technology:
            categoryName = "Teknoloji"
        default:
            print("Selected header names error")
        }
    }
    
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = self.viewModel.articleCell(at: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellID, for: indexPath) as? NewsTableViewCell else {
            print("cell error")
            return UITableViewCell()
        }
        cell.configure(with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArticle = self.viewModel.articleCell(at: indexPath.row)
        let detailVC = DetailViewController(article: selectedArticle, country: countryName, category: categoryName)
        self.navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
