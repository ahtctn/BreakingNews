//
//  NewsTableViewCell.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 22.07.2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    let viewModel = NewsViewModel()

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(headerLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let headerLabelConstraints = [
            headerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            headerLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 30),
        ]
        
        let descriptionLabelConstraints = [
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            descriptionLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 0),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ]
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateMultiple(headerLabelConstraints, descriptionLabelConstraints)
    }
    
    //MARK: mvvm'e uygun değil.
    func configure(with item: ArticleModel) {
        self.headerLabel.text = item.author
        self.descriptionLabel.text = item.author
        
    }

}
