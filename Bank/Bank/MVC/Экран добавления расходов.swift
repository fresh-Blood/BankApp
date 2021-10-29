//
//  ViewModel2.swift
//  Bank
//
//  Created by Admin on 20.10.2021.
//

import Foundation
import UIKit


class InfoViewController2: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    let dropDown: UIPickerView = {
        let pkr = UIPickerView()
        pkr.backgroundColor = .systemGray6
        return pkr
    }()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Categories.share.listExpenses.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return Categories.share.listExpenses[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.source.text = Categories.share.listExpenses[row]
        self.dropDown.isHidden = true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.source {
            self.dropDown.isHidden = false
            textField.endEditing(true)
        }
    }
    static let shared = InfoViewController2()
    
    let data: UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .white
        txt.placeholder = " Укажите дату"
        return txt
    }()
    let datePicker = UIDatePicker()
    let toolBar = UIToolbar()
    
    func showDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.frame = CGRect(x: view.frame.minX, y: view.frame.height/3, width: view.frame.width, height: datePicker.bounds.height)
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        toolBar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        data.inputView = datePicker
        data.inputAccessoryView = toolBar
    }
    @objc func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.dateFormat = "dd/MM/yyyy"
        data.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    @objc func cancelDatePicker() {
        self.view.endEditing(true)
    }
    
    let source: UITextField = {
        let txt = UITextField()
        txt.placeholder = " Укажите категорию"
        txt.backgroundColor = .white
        return txt
    }()
    let summ: UITextField = {
        let txt = UITextField()
        txt.placeholder = " Введите сумму"
        txt.keyboardType = .numberPad
        txt.backgroundColor = .white
        
        return txt
    }()
    let button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .purple
        btn.addTarget(self, action: #selector(action3), for: .touchUpInside)
        btn.setTitle("ОК", for: .normal)
        btn.tintColor = .white
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.layer.cornerRadius = 50
        btn.layer.shadowRadius = 3.0
        btn.layer.shadowOpacity = 0.8
        btn.layer.shadowOffset = CGSize.init(width: 2.0, height: 2.0)
        return btn
    }()
    @objc func action3(sender: UIButton!) {
        if !(data.text?.isEmpty ?? true) && !(source.text?.isEmpty ?? true) && !(summ.text?.isEmpty ?? true) {
            sender.pulsate()
            ViewModel.shared.date = data.text ?? "error"
            var deleteEmptySpace = ""
            for symbol in source.text ?? "error" {
                if symbol != " " {
                    deleteEmptySpace.append(symbol)
                }
            }
            ViewModel.shared.source = deleteEmptySpace
            ViewModel.shared.summ = summ.text ?? "error"
            ViewModel.shared.balance -= Int(summ.text ?? "Empty") ?? 0
            ViewModel.shared.addExpenses()
            
            Categories.share.fillExpensesValuesAllTime()
    }
        
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load1"), object: nil)
    self.dismiss(animated: true, completion: nil)
    data.text = ""
    source.text = ""
    summ.text = ""
}
    func setBackgrPicture() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "59ee6b4da2389.png")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        setBackgrPicture()
        view.backgroundColor = .white
        view.addSubview(data)
        view.addSubview(source)
        view.addSubview(summ)
        view.addSubview(button)
        dropDown.isHidden = true
        source.delegate = self
        dropDown.delegate = self
        dropDown.dataSource = self
        view.addSubview(dropDown)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        data.frame = CGRect(x: view.bounds.width/4, y: view.bounds.height/4, width: view.bounds.width/2, height: 30)
        source.frame = CGRect(x: view.bounds.width/4, y: view.bounds.height/3.07, width: view.bounds.width/2, height: 30)
        summ.frame = CGRect(x: view.bounds.width/4, y: view.bounds.height/2.5, width: view.bounds.width/2, height: 30)
        button.frame = CGRect(x: view.bounds.midX-50, y: view.bounds.height/2, width: 100, height: 100)
        dropDown.frame = CGRect(x: 0, y: view.bounds.height/2.5, width: view.bounds.width, height: view.bounds.height/3)
    }
}

