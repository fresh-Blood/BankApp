//
//  MyTableViewCell2.swift
//  Bank
//
//  Created by Admin on 20.10.2021.
//

import UIKit

class MyTableViewCell2: UITableViewCell {

    let date = UILabel()
    let category = UILabel()
    let summ = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        date.backgroundColor = .clear
        date.textAlignment = .center
        date.textColor = .black
        date.font = UIFont.systemFont(ofSize: 20, weight: .light)
        category.backgroundColor = .clear
        category.textAlignment = .center
        category.textColor = .black
        category.numberOfLines = 0
        category.font = UIFont.systemFont(ofSize: 20, weight: .light)
        summ.backgroundColor = .clear
        summ.textAlignment = .center
        summ.textColor = .black
        summ.font = UIFont.systemFont(ofSize: 20, weight: .light)
        self.selectionStyle = .none
        self.contentView.addSubview(date)
        self.contentView.addSubview(category)
        self.contentView.addSubview(summ)
        date.translatesAutoresizingMaskIntoConstraints = false
        date.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        date.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        date.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true

        category.translatesAutoresizingMaskIntoConstraints = false
        category.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        category.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        category.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        category.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true

        summ.translatesAutoresizingMaskIntoConstraints = false
        summ.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        summ.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        summ.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
