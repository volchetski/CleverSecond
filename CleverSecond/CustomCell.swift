//
//  CustomCell.swift
//  CleverSecond
//
//  Created by Евгений Волчецкий on 19.12.22.
//

import UIKit

class CustomCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .label
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    private lazy var itemImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = self.frame.height / 2
        image.layer.masksToBounds = true
        image.backgroundColor = .gray
        return image
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(itemImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String, descriptionText: String, imageName: String) {
        nameLabel.text = text
        descriptionLabel.text = descriptionText
        itemImage.image = UIImage(named: imageName)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height - 30
        
        itemImage.frame = CGRect(x: 15, y: 15, width: imageSize, height: imageSize)
        nameLabel.frame = CGRect(x: itemImage.frame.maxX + 30, y: itemImage.frame.minY, width: contentView.frame.size.width/1.5, height: itemImage.frame.size.height/2)
        descriptionLabel.frame = CGRect(x: itemImage.frame.maxX + 30, y: nameLabel.frame.maxY, width: contentView.frame.size.width/1.5, height: itemImage.frame.size.height/2)
    }
}
