//
//  ViewController.swift
//  CleverSecond
//
//  Created by Евгений Волчецкий on 16.12.22.
//

import UIKit

class ViewController: UIViewController {
    
    private let item = Item.getItem()
    public lazy var arrayOfImageName = [String]()
    public var itemName = ""
    public var itemDescription = ""
    
    
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
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(editTableView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        addSubviews()
        setUpConstraints()
        repeatedItemInArray()
    }
    
    private func setUI() {
        view.backgroundColor = .white
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
    
    private func repeatedItemInArray() {
        for _ in 1...100 {
            for item in item {
                arrayOfImageName.append(item.imageName)
                itemName = item.itemName
                itemDescription = item.itemDescription
            }
        }
    }
    
    @objc func editTableView() {
        tableView.isEditing = !tableView.isEditing
    }
}

