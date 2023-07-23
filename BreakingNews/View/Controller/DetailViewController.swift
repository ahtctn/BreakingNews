//
//  DetailViewController.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 23.07.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var article: ArticleModel
    
    init(article: ArticleModel) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let coverImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        configureArticle()
    }
    
    private func setupUI() {
        view.addSubview(coverImage)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        
        coverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        coverImage.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20).isActive = true
        coverImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        coverImage.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 20).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    
    private func configureArticle() {
        coverImage.setImage(with: article.urlToImage ?? Constants.optionalImageUrl)
        titleLabel.text = article.title
        descriptionLabel.text = article.description
    }
}
