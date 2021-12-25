import UIKit

final class NewCategoryViewController: UIViewController {
    
    private let data: UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .white
        txt.placeholder = " Укажите дату"
        return txt
    }()
    private let datePicker = UIDatePicker()
    private let toolBar = UIToolbar()
    
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
    
    private let newCategoryTextField: UITextField = {
        let new = UITextField()
        new.placeholder = "Введите категорию"
        new.backgroundColor = .white
        return new
    }()
    private let summ: UITextField = {
        let txt = UITextField()
        txt.placeholder = " Введите сумму"
        txt.keyboardType = .numberPad
        txt.backgroundColor = .white
        return txt
    }()
    private let button: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
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
        if !(data.text?.isEmpty ?? true) && !(newCategoryTextField.text?.isEmpty ?? true) && !(summ.text?.isEmpty ?? true) {
            sender.pulsate()
            ViewModel.shared.date = data.text ?? "error"
            var deleteEmptySpace = ""
            for symbol in newCategoryTextField.text ?? "error" {
                if symbol != " " {
                    deleteEmptySpace.append(symbol)
                }
            }
            ViewModel.shared.source = deleteEmptySpace
            Categories.share.userTermsArray.append(deleteEmptySpace)
            Categories.share.nameOfUserCategory = deleteEmptySpace
            ViewModel.shared.summ = summ.text ?? "error"
            ViewModel.shared.balance -= Int(summ.text ?? "Empty") ?? 0
            ViewModel.shared.addExpenses()
            
            Categories.share.fillExpensesValuesAllTime()
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load1"), object: nil)
        self.dismiss(animated: true, completion: nil)
        data.text = ""
        newCategoryTextField.text = ""
        summ.text = ""
    }
    
    private func setBackgrPicture() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "151007-illustracia-raketa-kosmicheskoe_prostranstvo-prostranstvo_iskusstva-kosmicheskij_apparat-720x1280.png")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        setBackgrPicture()
        view.addSubview(data)
        view.addSubview(newCategoryTextField)
        view.addSubview(summ)
        view.addSubview(button)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        data.frame = CGRect(x: view.bounds.width/4, y: view.bounds.height/4, width: view.bounds.width/2, height: 30)
        summ.frame = CGRect(x: view.bounds.width/4, y: view.bounds.height/2.5, width: view.bounds.width/2, height: 30)
        newCategoryTextField.frame = CGRect(x: view.bounds.width/4, y: view.bounds.height/3.07, width: view.bounds.width/2, height: 30)
        button.frame = CGRect(x: view.bounds.midX-50, y: view.bounds.height/2, width: 100, height: 100)
    }
    
}