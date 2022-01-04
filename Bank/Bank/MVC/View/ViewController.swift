import UIKit


final class ViewController: UIViewController {
    
    private let myTableView: UITableView = {
        let tbl = UITableView()
        tbl.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        tbl.backgroundColor = .clear
        return tbl
    }()
    private let balanceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Текущий баланс"
        lbl.textAlignment = .left
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return lbl
    }()
    
    private let balanceValue: UILabel = {
        let lbl = UILabel()
        lbl.text = "\(ViewModel.shared.balance)" 
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        lbl.adjustsFontSizeToFitWidth = true 
        return lbl
    }()
    private let income: UILabel = {
        let lbl = UILabel()
        lbl.text = "Доходы"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 40, weight: .light)
        return lbl
    }()
    private let addButton: UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(action), for: .touchUpInside)
        btn.setTitle("Добавить доход", for: .normal)
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
    @objc private func action(sender: UIButton!) {
        sender.pulsate()
        self.present(InfoViewController(),
                     animated: true,
                     completion: nil)
    }
    
    private let dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Дата"
        lbl.textAlignment = .left
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return lbl
    }()
    private let sourceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Источник"
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return lbl
    }()
    private let summLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Сумма"
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        lbl.textAlignment = .right
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let scrollView: UIScrollView = {
       let scr = UIScrollView()
        return scr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        view.backgroundColor = .systemGroupedBackground
        scrollView.addSubview(myTableView)
        scrollView.addSubview(balanceLabel)
        scrollView.addSubview(balanceValue)
        scrollView.addSubview(income)
        scrollView.addSubview(addButton)
        scrollView.addSubview(dateLabel)
        scrollView.addSubview(sourceLabel)
        scrollView.addSubview(summLabel)
        view.addSubview(scrollView)
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loadList1), name: NSNotification.Name(rawValue: "load1"), object: nil)
    }
    @objc private func loadList(){
        balanceValue.text = String(ViewModel.shared.balance)
        myTableView.reloadData()
    }
    @objc private func loadList1(){
        balanceValue.text = String(ViewModel.shared.balance)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myTableView.reloadData()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
        let inset: CGFloat = 10
        scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: scrollView.bounds.width+1)
        scrollView.frame = view.bounds
        balanceLabel.frame = CGRect(x: scrollView.bounds.minX + inset + view.safeAreaInsets.left,
                                    y: scrollView.bounds.minY + inset*4,
                                    width: scrollView.bounds.width/2,
                                    height: inset*4)
        balanceValue.frame = CGRect(x: balanceLabel.bounds.maxX - inset,
                                    y: scrollView.bounds.minY + inset*4,
                                    width: scrollView.bounds.width/2 - view.safeAreaInsets.right,
                                    height: inset*4)
        income.frame = CGRect(x: scrollView.bounds.minX + view.safeAreaInsets.left,
                              y: balanceLabel.bounds.maxY + inset,
                              width: scrollView.bounds.width - view.safeAreaInsets.left - view.safeAreaInsets.right,
                              height: inset*4)
        dateLabel.frame = CGRect(x: scrollView.bounds.minX + view.safeAreaInsets.left,
                                 y: income.bounds.maxY + income.bounds.maxY + inset*2,
                                 width: (scrollView.bounds.width - view.safeAreaInsets.right - view.safeAreaInsets.left)/3,
                                 height: inset*2)
        sourceLabel.frame = CGRect(x: scrollView.bounds.maxX/3,
                                   y: income.bounds.maxY + income.bounds.maxY + inset*2,
                                   width: scrollView.bounds.width/3,
                                   height: inset*2)
        summLabel.frame = CGRect(x: scrollView.bounds.maxX/3*2,
                                 y: income.bounds.maxY + income.bounds.maxY + inset*2,
                                 width: scrollView.bounds.width/3 - view.safeAreaInsets.right,
                                 height: inset*2)
        myTableView.frame = CGRect(x: scrollView.bounds.minX,
                                   y: balanceLabel.bounds.maxY + income.bounds.maxY + dateLabel.bounds.maxY + inset*2,
                                   width: scrollView.bounds.width - view.safeAreaInsets.left,
                                   height: scrollView.bounds.height/2)
        addButton.frame = CGRect(x: scrollView.bounds.maxX/4,
                                 y: balanceLabel.bounds.maxY + income.bounds.maxY + dateLabel.bounds.maxY + myTableView.bounds.maxY + inset*5,
                                 width: scrollView.bounds.width/2,
                                 height: 50)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        balanceValue.text = "\(ViewModel.shared.balance)"
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewModel.shared.incomeArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        let model = ViewModel.shared.incomeArray[indexPath.row]
        cell.date.text = model.date
        cell.source.text = model.source
        cell.summ.text = model.summ
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let model = ViewModel.shared.incomeArray[indexPath.row]
            ViewModel.shared.balance -= (Int(model.summ) ?? 0)
            balanceValue.text = String(ViewModel.shared.balance)
            ViewModel.shared.incomeArray.remove(at: indexPath.row)
            Categories.share.fillIncomeValuesAllTime()
            myTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
