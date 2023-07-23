//
//  ChooseNewViewController.swift
//  BreakingNews
//
//  Created by Ahmet Ali ÇETİN on 22.07.2023.
//

import UIKit

class NewsCategoryViewController: UIViewController {
    
    let countries = ["Amerika", "Türkiye", "Hollanda", "Almanya", "Rusya"]
    let categories = ["General", "Business", "Entertaintment", "Sports", "Health", "Sciene", "Technology"]

    lazy var countryPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()

    lazy var categoryPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()

    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        return button
    }()

    var selectedCountry: String?
    var selectedCategory: String?
    
    var countryCode: String?
    var categoryCode: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationItem.title = "Choose Category"
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(countryPicker)
        view.addSubview(categoryPicker)
        view.addSubview(submitButton)

        NSLayoutConstraint.activate([
            countryPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countryPicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            countryPicker.widthAnchor.constraint(equalToConstant: 200),
            countryPicker.heightAnchor.constraint(equalToConstant: 216),

            categoryPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoryPicker.topAnchor.constraint(equalTo: countryPicker.bottomAnchor, constant: 20),
            categoryPicker.widthAnchor.constraint(equalToConstant: 200),
            categoryPicker.heightAnchor.constraint(equalToConstant: 216),

            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.topAnchor.constraint(equalTo: categoryPicker.bottomAnchor, constant: 20),
        ])

        countryPicker.dataSource = self
        countryPicker.delegate = self

        categoryPicker.dataSource = self
        categoryPicker.delegate = self
    }

    @objc func submitButtonTapped() {
        guard let selectedCountry = selectedCountry, let selectedCategory = selectedCategory else {
            print("Please select both country and category")
            return
        }

        switch selectedCountry {
        case "Amerika":
            countryCode = Constants.Countries.usa
        case "Türkiye":
            countryCode = Constants.Countries.turkey
        case "Hollanda":
            countryCode = Constants.Countries.netherlands
        case "Almanya":
            countryCode = Constants.Countries.germany
        case "Rusya":
            countryCode = Constants.Countries.russia
        default:
            fatalError("Something happened")
        }
        switch selectedCategory {
        case "General":
            categoryCode = Constants.Categories.general
        case "Business":
            categoryCode = Constants.Categories.business
        case "Entertainment":
            categoryCode = Constants.Categories.entertainment
        case "Sports":
            categoryCode = Constants.Categories.sports
        case "Health":
            categoryCode = Constants.Categories.health
        case "Science":
            categoryCode = Constants.Categories.science
        case "Technology":
            categoryCode = Constants.Categories.technology
        default:
            fatalError("Something happened")
        }
        
        print("Selected Country: \(selectedCountry), Selected Category: \(selectedCategory)")
        print("Country Code: \(countryCode ?? "N/A"), Category Code: \(categoryCode ?? "N/A")")
    
        
        let newsViewController = NewsViewController(countryCode: countryCode, categoryCode: categoryCode)
        self.navigationController?.pushViewController(newsViewController, animated: true)
        
    }

}

extension NewsCategoryViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == countryPicker {
            return countries.count
        } else if pickerView == categoryPicker {
            return categories.count
        }
        return 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == countryPicker {
            return countries[row]
        } else if pickerView == categoryPicker {
            return categories[row]
        }
        return nil
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == countryPicker {
            selectedCountry = countries[row]
        } else if pickerView == categoryPicker {
            selectedCategory = categories[row]
        }
    }
}
