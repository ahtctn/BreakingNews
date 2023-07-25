import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var article: ArticleModel
    var country: String
    var category: String
    
    init(article: ArticleModel, country: String, category: String) {
        self.article = article
        self.country = country
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let categoryColorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let flagImageView: UIImageView = {
        let imageView = GenericSmallImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let coverImage: GenericImageView = {
        let imageView = GenericImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: GenericHeaderLabel = {
        let label = GenericHeaderLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let authorLabel: GenericAuthorLabel = {
        let label = GenericAuthorLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: GenericDescriptionLabel = {
        let label = GenericDescriptionLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let linkButton: GenericLinkButton = {
        let button = GenericLinkButton(buttonTitle: "Read More", contentMultiplier: 1.5)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = .white
        setupUI()
        configureArticle()
        
    }
    
    private func setupNavigationBar() {
        // Navigation title'ını "Haberler" olarak ayarlayalım
        navigationItem.title = "Haberler"
        
        // Large title kullanılmasını sağlayalım
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Navigation bar rengini mavi yapalım
        navigationController?.navigationBar.barTintColor = .blue
        
        // Navigation bar'ın içerik rengini beyaz yapalım
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        // Navigation bar'ın arkaplan rengini transparan yapalım
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    
    private func setupUI() {
        view.addSubview(categoryColorView)
        view.addSubview(headerLabel)
        view.addSubview(flagImageView)
        view.addSubview(coverImage)
        view.addSubview(titleLabel)
        view.addSubview(authorLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(linkButton)
        
        categoryColorView.backgroundColor = setHeaderBackground()
        linkButton.backgroundColor = setHeaderBackground()
        
        let categoryColorViewConstraints = [
            //Background View Constraints
            categoryColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryColorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryColorView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
        ]
        
        let headerLabelConstraints = [
            // Header Label constraints
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            headerLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1), // Yüksekliği iki katına çıkaracak
        ]
        
        let flagImageViewConstraints = [
            // Profile Image constraints
            flagImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Align with leading edge of view with 20 pixels gap
            flagImageView.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor), // Vertically align with the headerLabel
            
            flagImageView.widthAnchor.constraint(equalToConstant: 50), // 50x50 boyutunda
            flagImageView.heightAnchor.constraint(equalToConstant: 50),
        ]
        
        let coverImageConstraints = [
            // Cover Image constraints
            coverImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coverImage.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            coverImage.widthAnchor.constraint(equalToConstant: 300),
            coverImage.heightAnchor.constraint(equalToConstant: 300),
        ]
        
        let titleLabelConstraints = [
            // Title Label constraints
            titleLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ]
        
        let authorLabelConstraints = [
            // Author Label constraints
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ]
        
        let descriptionLabelConstraints = [
            // Description Label constraints
            descriptionLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ]
        
        let linkButtonConstraints = [
            // Link Button constraints
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linkButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ]
        
        NSLayoutConstraint.activateMultiple(categoryColorViewConstraints, headerLabelConstraints, flagImageViewConstraints, coverImageConstraints, titleLabelConstraints, authorLabelConstraints, descriptionLabelConstraints, linkButtonConstraints)
        
        linkButton.addTarget(self, action: #selector(openLinkInSafari), for: .touchUpInside)
    }
    
    private func setHeaderBackground() -> UIColor {
        switch category {
        case "Genel":
            return .systemYellow
        case "İş Dünyası":
            return .systemOrange
        case "Eğlence":
            return .systemPink
        case "Spor":
            return .systemGreen
        case "Sağlık":
            return .systemCyan
        case "Bilim":
            return .systemBlue
        case "Teknoloji":
            return .systemPink
        default:
            return .systemYellow
        }
    }
    
    private func configureArticle() {
        let imageUrlString = Constants.optionalImageUrl
        
        if let imageUrlString = article.urlToImage {
            // Eğer urlToImage değeri varsa ve geçerli bir URL ise, resmi yükle
            coverImage.isHidden = false
            coverImage.setImage(with: imageUrlString)
        } else {
            // Eğer urlToImage değeri yoksa veya geçerli bir URL değilse, coverImage'ı gizle
            coverImage.isHidden = true
            
            titleLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true
            // Diğer elementlerin anchorlarındaki değişiklikleri aktifleştir
            view.layoutIfNeeded()
        }
        
        let imageUrl = article.urlToImage ?? imageUrlString
        coverImage.setImage(with: imageUrl)
        
        titleLabel.text = article.title
        if let author = article.author {
            authorLabel.text = "Author: \(author)"
        } else {
            authorLabel.text = "Author: Unknown"
        }
        descriptionLabel.text = article.description
        
        // Üst blok için bayrak ismi ve kategori adını ayarlayalım
        headerLabel.text = "\(category.uppercased())"
        
        //Flag image set
        switch country {
        case "Amerika Birleşik Devletleri":
            flagImageView.setImage(with: Constants.Flags.usaFlag)
        case "Türkiye":
            flagImageView.setImage(with: Constants.Flags.trFlag)
        case "Hollanda":
            flagImageView.setImage(with: Constants.Flags.nlFlag)
        case "Almanya":
            flagImageView.setImage(with: Constants.Flags.deFlag)
        case "Rusya":
            flagImageView.setImage(with: Constants.Flags.ruFlag)
        default:
            flagImageView.setImage(with: Constants.optionalImageUrl)
        }
    }
    
    @objc private func openLinkInSafari() {
        if let url = URL(string: article.url) {
            UIApplication.shared.open(url)
        }
    }
}
