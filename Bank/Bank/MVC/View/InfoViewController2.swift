import Foundation
import UIKit


final class InfoViewController2: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    private let datePicker = UIDatePicker()
    private let toolBar = UIToolbar()
    
    private let data: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Укажите дату"
        txt.textAlignment = .center
        txt.textColor = .label
        txt.layer.cornerRadius = 8
        txt.layer.borderWidth = 1
        return txt
    }()
    
    private let source: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Укажите категорию"
        txt.textAlignment = .center
        txt.textColor = .label
        txt.layer.cornerRadius = 8
        txt.layer.borderWidth = 1
        return txt
    }()
    
    private let summ: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Введите сумму"
        txt.keyboardType = .numberPad
        txt.textAlignment = .center
        txt.textColor = .label
        txt.layer.cornerRadius = 8
        txt.layer.borderWidth = 1
        return txt
    }()
    
    private let dropDown: UIPickerView = {
        let pkr = UIPickerView()
        pkr.backgroundColor = .systemGray6
        return pkr
    }()
    
    internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Categories.share.listExpenses.count
    }
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return Categories.share.listExpenses[row]
    }
    
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.source.text = Categories.share.listExpenses[row]
        self.dropDown.isHidden = true
    }
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.source {
            self.dropDown.isHidden = false
            textField.endEditing(true)
        }
    }
    
    private func showDatePicker() {
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
    @objc private func doneDatePicker() {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.dateFormat = "dd/MM/yyyy"
        data.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    @objc private func cancelDatePicker() {
        self.view.endEditing(true)
    }

    private let button: UIButton = {
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
    @objc private func action3(sender: UIButton!) {
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
    data.text = ""
    source.text = ""
    summ.text = ""
}
    private func setTapPolitics() {
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(tap))
        view.addGestureRecognizer(gesture)
    }
    @objc private func tap() {
        summ.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        setTapPolitics()
        view.backgroundColor = .systemGroupedBackground
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
        data.layer.borderColor = UIColor.label.cgColor
        source.layer.borderColor = UIColor.label.cgColor
        summ.layer.borderColor = UIColor.label.cgColor
    }
}

