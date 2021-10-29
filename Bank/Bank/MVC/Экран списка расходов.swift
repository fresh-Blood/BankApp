//
//  SecondViewController.swift
//  Bank
//
//  Created by Admin on 19.10.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    static let vc = SecondViewController()
    
    let myTableView = UITableView()
    let balanceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Текущий баланс"
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return lbl
    }()
    
    let balanceValue: UILabel = {
        let lbl = UILabel()
        lbl.text = "\(ViewModel.shared.balance)" // это просто var a = Int который 0 изначально
        lbl.textAlignment = .right
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return lbl
    }()
    let expense: UILabel = {
        let lbl = UILabel()
        lbl.text = "Расходы"
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 40, weight: .light)
        return lbl
    }()
    let addButton: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(action), for: .touchUpInside)
        btn.setTitle("Добавить расход", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.black.cgColor
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        btn.layer.cornerRadius = 25
                btn.layer.shadowRadius = 3.0
                btn.layer.shadowOpacity = 0.8
                btn.layer.shadowOffset = CGSize.init(width: 2.0, height: 2.0)
        return btn
    }()
    let addCategoryButton: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(newCategory), for: .touchUpInside)
        btn.setTitle("Добавить категорию", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.black.cgColor
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        btn.layer.cornerRadius = 25
                btn.layer.shadowRadius = 3.0
                btn.layer.shadowOpacity = 0.8
                btn.layer.shadowOffset = CGSize.init(width: 2.0, height: 2.0)
        return btn
    }()
    let vc = InfoViewController2()
    @objc func action(sender: UIButton!) {
        sender.pulsate()
        self.present(vc, animated: true, completion: nil)
    }
    let vc1 = NewCategoryViewController()
    @objc func newCategory(sender: UIButton!) {
        sender.pulsate()
        self.present(vc1, animated: true, completion: nil)
    }
    
    let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Дата"
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return lbl
    }()
    let sourceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Категория"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return lbl
    }()
    let summLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Сумма"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        lbl.textAlignment = .right
        return lbl
    }()
    
    func setBackgrPicture() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "744a72233fe313834f87ec925d562744.png")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(MyTableViewCell2.self, forCellReuseIdentifier: "cell2")
        setBackgrPicture()
        myTableView.backgroundColor = .clear
        view.addSubview(myTableView)
        view.addSubview(balanceLabel)
        view.addSubview(balanceValue)
        view.addSubview(expense)
        view.addSubview(addButton)
        view.addSubview(addCategoryButton)
        view.addSubview(dateLabel)
        view.addSubview(sourceLabel)
        view.addSubview(summLabel)
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadList1), name: NSNotification.Name(rawValue: "load1"), object: nil)
    }
    @objc func loadList(){
        balanceValue.text = String(ViewModel.shared.balance)
        myTableView.reloadData()
    }
    @objc func loadList1(){
        balanceValue.text = String(ViewModel.shared.balance)
    }
    override func viewWillAppear(_ animated: Bool) {
        balanceValue.text = "\(ViewModel.shared.balance)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
        myTableView.frame = CGRect(x: view.bounds.minX, y: view.bounds.height/3, width: view.bounds.width, height: view.bounds.height/2)
        balanceLabel.frame = CGRect(x: view.bounds.minX+20, y: 50, width: view.bounds.width/2, height: 40)
        balanceValue.frame = CGRect(x: view.bounds.width*0.61, y: 50, width: view.bounds.width/3, height: 40)
        expense.frame = CGRect(x: view.bounds.width/4, y: view.bounds.maxY/5, width: view.bounds.width/2, height: 40)
        addButton.frame = CGRect(x: view.bounds.minX+20, y: view.bounds.maxY-140, width: view.bounds.width/2-25, height: 50)
        addCategoryButton.frame = CGRect(x: view.bounds.maxX-200, y: view.bounds.maxY-140, width: view.bounds.width/2-25, height: 50)
        dateLabel.frame = CGRect(x: view.bounds.width/12, y: view.bounds.height/3-30, width: view.bounds.width/3, height: 20)
        sourceLabel.frame = CGRect(x: view.bounds.width/2.5, y: view.bounds.height/3-30, width: view.bounds.width/3, height: 20)
        summLabel.frame = CGRect(x: view.bounds.width*0.61, y: view.bounds.height/3-30, width: view.bounds.width/3, height: 20)
    }
}

extension SecondViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewModel.shared.expensesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! MyTableViewCell2
        let model = ViewModel.shared.expensesArray[indexPath.row]
        cell.date.text = model.date
        cell.category.text = model.source
        cell.summ.text = model.summ
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let model = ViewModel.shared.expensesArray[indexPath.row]
            ViewModel.shared.balance += (Int(model.summ) ?? 0) // действие прибаляем баланс растет
            balanceValue.text = String(ViewModel.shared.balance) // опять чему он равен чтобы обновил
            ViewModel.shared.expensesArray.remove(at: indexPath.row)
            Categories.share.fillExpensesValuesAllTime()
            myTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

