//
//  ViewController.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 21.07.2023.
//

import UIKit

class NewsViewController: UIViewController {
    
    let viewModel = NewsViewModel()
    
    private let images: [UIImage] = [
        UIImage(systemName: "person.fill")!,
        UIImage(systemName: "person.fill")!,
        UIImage(systemName: "person.fill")!,
        UIImage(systemName: "person.fill")!,
        UIImage(systemName: "person.fill")!
    ]
    
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
        viewModel.getTopHeadlines()
        observeEvent()
        setUI()
        
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
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
