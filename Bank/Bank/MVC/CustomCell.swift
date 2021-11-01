//
//  MyTableViewCell.swift
//  Bank
//
//  Created by Admin on 19.10.2021.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    let date = UILabel()
    let source = UILabel()
    let summ = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        date.backgroundColor = .clear
        date.textAlignment = .center
        date.textColor = .black
        date.font = UIFont.systemFont(ofSize: 20, weight: .light)
        source.backgroundColor = .clear
        source.textAlignment = .center
        source.textColor = .black
        source.numberOfLines = 0
        source.font = UIFont.systemFont(ofSize: 20, weight: .light)
        summ.backgroundColor = .clear
        summ.textAlignment = .center
        summ.textColor = .black
        summ.font = UIFont.systemFont(ofSize: 20, weight: .light)
        self.selectionStyle = .none
        self.contentView.addSubview(date)
        self.contentView.addSubview(source)
        self.contentView.addSubview(summ)
        date.translatesAutoresizingMaskIntoConstraints = false
        date.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        date.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        date.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true

        source.translatesAutoresizingMaskIntoConstraints = false
        source.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        source.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        source.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        source.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true

        summ.translatesAutoresizingMaskIntoConstraints = false
        summ.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        summ.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        summ.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
