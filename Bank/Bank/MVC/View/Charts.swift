import UIKit
import Charts

final class ThirdViewController: UIViewController, ChartViewDelegate {
    
    var counter = 0
    
    private let monthButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(action1), for: .touchUpInside)
        btn.setTitle("Месяц", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    @objc private func action1(sender: UIButton!) {
        print("Выбран период - месяц")
        sender.pulsate()
        pieIncomeChartView.removeFromSuperview()
        pieExpensesChartView.removeFromSuperview()
        Categories.share.fillIncomeValuesMonth()
        Categories.share.fillExpensesValuesMonth()
        counter = 1
        customizeChart(categories: Categories.share.incomeCategoriesMonth, values: Categories.share.incomeSummsMonth)
        customizeChart2(categories: Categories.share.expensesCategoriesMonth, values: Categories.share.expensesSummsMonth)
        view.addSubview(pieIncomeChartView)
        view.addSubview(pieExpensesChartView)
    }
    private let yearButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(action2), for: .touchUpInside)
        btn.setTitle("Год", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    @objc private func action2(sender: UIButton!) {
        print("Выбран период - год")
        sender.pulsate()
        pieIncomeChartView.removeFromSuperview()
        pieExpensesChartView.removeFromSuperview()
        Categories.share.fillIncomeValuesYear()
        Categories.share.fillExpensesValuesYear()
        counter = 2
        customizeChart(categories: Categories.share.incomeCategoriesYear, values: Categories.share.incomeSummsYear)
        customizeChart2(categories: Categories.share.expensesCategoriesYear, values: Categories.share.expensesSummsYear)
        view.addSubview(pieIncomeChartView)
        view.addSubview(pieExpensesChartView)
    }
    private let allTimeButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(action3), for: .touchUpInside)
        btn.setTitle("Все время", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    @objc private func action3(sender: UIButton!) {
        sender.pulsate()
        print("Выбран период - все время")
        pieIncomeChartView.removeFromSuperview()
        pieExpensesChartView.removeFromSuperview()
        Categories.share.fillIncomeValuesAllTime()
        Categories.share.fillExpensesValuesAllTime()
        counter = 3
        customizeChart(categories: Categories.share.incomeCategoriesAllTime, values: Categories.share.incomeSummsAllTime)
        customizeChart2(categories: Categories.share.expensesCategoriesAllTime, values: Categories.share.expensesSummsAllTime)
        view.addSubview(pieIncomeChartView)
        view.addSubview(pieExpensesChartView)
    }
    
    private let stackView: UIStackView = {
       let stck = UIStackView()
        stck.isUserInteractionEnabled = true
        stck.backgroundColor = .clear
        stck.alignment = .center
        stck.distribution = .fillEqually
        stck.layer.shadowRadius = 3.0
        stck.layer.shadowOpacity = 0.8
        stck.layer.shadowOffset = CGSize.init(width: 2.0, height: 2.0)
        return stck
    }()
    
    private let pieIncomeChartView: PieChartView = {
       let view = PieChartView()
        view.backgroundColor = .clear
        view.centerAttributedText = NSAttributedString("Доходы")
        view.chartDescription?.textAlign = .right
        view.chartDescription?.font = .systemFont(ofSize: 20, weight: .light)
        view.holeColor = .clear
        return view
    }()
    private let pieExpensesChartView: PieChartView = {
       let view = PieChartView()
        view.backgroundColor = .clear
        view.centerAttributedText = NSAttributedString("Расходы")
        view.chartDescription?.textAlign = .right
        view.chartDescription?.font = .systemFont(ofSize: 20, weight: .light)
        view.holeColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        view.addSubview(stackView)
        view.addSubview(pieIncomeChartView)
        view.addSubview(pieExpensesChartView)
        stackView.addArrangedSubview(allTimeButton)
        stackView.addArrangedSubview(monthButton)
        stackView.addArrangedSubview(yearButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let inset: CGFloat = 10
        pieIncomeChartView.frame = CGRect(x: view.bounds.minX,
                                          y: view.bounds.minY + view.safeAreaInsets.top/2,
                                          width: view.bounds.width,
                                          height: view.bounds.height/3)
        pieExpensesChartView.frame = CGRect(x: view.bounds.minX,
                                            y: view.bounds.minY + view.safeAreaInsets.top/2 + pieIncomeChartView.bounds.height + inset,
                                            width: view.bounds.width,
                                            height: view.bounds.height/3)
        stackView.frame = CGRect(x: view.bounds.minX + inset + view.safeAreaInsets.left,
                                 y: view.bounds.minY + view.safeAreaInsets.top/2 + pieIncomeChartView.bounds.height + pieExpensesChartView.bounds.height + inset,
                                 width: view.bounds.width - view.safeAreaInsets.left*2 - inset*2,
                                 height: inset*5)
    }
    
    internal func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switch counter {
        case 1:
            customizeChart(categories: Categories.share.incomeCategoriesMonth, values: Categories.share.incomeSummsMonth)
            customizeChart2(categories: Categories.share.expensesCategoriesMonth, values: Categories.share.expensesSummsMonth)
        case 2:
            customizeChart(categories: Categories.share.incomeCategoriesYear, values: Categories.share.incomeSummsYear)
            customizeChart2(categories: Categories.share.expensesCategoriesYear, values: Categories.share.expensesSummsYear)
        default:
            customizeChart(categories: Categories.share.incomeCategoriesAllTime, values: Categories.share.incomeSummsAllTime)
            customizeChart2(categories: Categories.share.expensesCategoriesAllTime, values: Categories.share.expensesSummsAllTime)
        }
        pieIncomeChartView.legend.enabled = false
        pieExpensesChartView.legend.enabled = false
    }
    
    private func customizeChart(categories: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<categories.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: categories[i], data: categories[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "")
        pieChartDataSet.colors = colorsOfCharts(numbersOfColors: categories.count)
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.maximumFractionDigits = 1
        format.multiplier = 1.0
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        pieIncomeChartView.data = pieChartData
    }
    private func customizeChart2(categories: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<categories.count {
            let dataEntry = PieChartDataEntry(value: values[i], label: categories[i], data: categories[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "")
        pieChartDataSet.colors = colorsOfCharts(numbersOfColors: categories.count)
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.maximumFractionDigits = 1
        format.multiplier = 1.0
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        pieExpensesChartView.data = pieChartData
    }
    private func colorsOfCharts(numbersOfColors: Int) -> [UIColor] {
        var colors: [UIColor] = []
        for _ in 0..<numbersOfColors {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        return colors
    }
}





