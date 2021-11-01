//
//  Model.swift
//  Bank
//
//  Created by Admin on 19.10.2021.
//

import Foundation
import UIKit


class Income: NSObject,NSCoding {
    
    let date: String
    var source: String
    let summ: String
    
    init(date:String, source: String, summ:String) {
        self.summ = summ
        self.source = source
        self.date = date
    }
    func encode(with coder: NSCoder) {
        coder.encode(summ, forKey: "summ")
        coder.encode(source, forKey: "source")
        coder.encode(date, forKey: "date")
    }
    required init?(coder: NSCoder) {
        summ = coder.decodeObject(forKey: "summ") as? String ?? ""
        source = coder.decodeObject(forKey: "source") as? String ?? ""
        date = coder.decodeObject(forKey: "date") as? String ?? ""
    }
    
}

class ViewModel: NSObject,NSCoding {
    
    init(balance: Int) {
        self.balance = balance
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(balance, forKey: "balance")
    }
    
    required init?(coder: NSCoder) {
        balance = coder.decodeObject(forKey: "balance") as? Int ?? 0
    }
    
    
    static let shared = ViewModel(balance: 0)
    var balance: Int
    var incomeArray:[Income] = []
    var expensesArray:[Income] = []
    
    var date: String = ""
    var source: String = ""
    var summ: String = ""
    
    func addEarnings() {
        let income = Income(date: date, source: source, summ: summ)
        incomeArray.append(income)
    }
    func addExpenses() {
        let expense = Income(date: date, source: source, summ: summ)
        expensesArray.append(expense)
    }
}

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.1
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
}


