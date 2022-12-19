//
//  ViewController.swift
//  CleverSecond
//
//  Created by Евгений Волчецкий on 16.12.22.
//

import UIKit

class ViewController: UIViewController {
    
    let images = ImageList.getImageList()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setUpConstraints()
    }
    
    
    private func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(editButton)
    }
    
    private func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: editButton.topAnchor),
        
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            editButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            editButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
}

