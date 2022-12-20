//
//  DescriptionController.swift
//  CleverSecond
//
//  Created by Евгений Волчецкий on 20.12.22.
//

import UIKit

class DescriptionController: UIViewController {
    
    public var model: Item?
    
    private lazy var imageContent: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        //        image.image = UIImage(named: "account")
        image.image = UIImage(named: model?.imageName ?? "account")
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var stackForLabels: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [secondNameLabel, secondDescriptionLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var secondNameLabel: UILabel = {
        let label = UILabel()
        label.text = model?.itemName
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    private lazy var secondDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = model?.itemDescription
        label.textAlignment = .center
        label.textColor = .systemGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubviews()
        addConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func addSubviews() {
        view.addSubview(imageContent)
        view.addSubview(stackForLabels)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageContent.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageContent.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageContent.widthAnchor.constraint(equalToConstant: 100),
            imageContent.heightAnchor.constraint(equalToConstant: 100),
            
            stackForLabels.topAnchor.constraint(equalTo: imageContent.bottomAnchor, constant: 100),
            stackForLabels.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
}
