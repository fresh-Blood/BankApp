
import Foundation
import UIKit


final class Categories {
    static let share = Categories()
    
    // массивы данных для заполнения chartViewPie по доходам за все время
    var incomeCategoriesAllTime: [String] = []
    var incomeSummsAllTime: [Double] = []
    
    // массивы данных для заполнения chartViewPie по расходам за все время
    var expensesCategoriesAllTime: [String] = []
    var expensesSummsAllTime: [Double] = []
    
    // метод по заполнению доходов за все время
    var incomeDataCategoriesArray: [Income] = []
    
    func fillIncomeValuesAllTime() {
        
        var salaryItemsArray: [Income] = []
        
        // фильтр по Salary категории
        let salaryTermsArray = ["Зп","З/п","Зарплата","Получка","Деньги","Бабки","Кэш","Кеш","Бабосики","Бабосы","Лавандос","Лаванда","Бабло","Money","Salary","Cash","Part-time job","Job","Подработка"]
        let salaryCategory = ViewModel.shared.incomeArray.filter{
            var result: Income?
            for element in salaryTermsArray {
                if $0.source == element {
                    result = $0
                }
            }
            return (result != nil)
        }
        var tempArray = [Int]()
        var result = Int()
        for element in salaryCategory {
            tempArray.append(Int(element.summ) ?? 0)
        }
        result = tempArray.reduce(0,+)
        let resultItemOfSalaryCategory = Income(date: "", source: "Salary", summ: String(result))
        salaryItemsArray.removeAll()
        salaryItemsArray.append(resultItemOfSalaryCategory)
        
        // фильтр по категории семья
        var familyItemsArray: [Income] = []
        
        let familyTermsArray = ["Мама","Папа","Брат","Сестра","Сын","Дочь","Дядя","Тетя","Мамуля","Папуля","Сестренка","Mom","Mother","Pa","Father","Sister","Brother","Aunt","Auncle","Granpa","Grandma","Granfather","Grandmother","Ба","Бабуля","Бабушка","Дед","Дедушка","Дедуля","Семья","Предки","Fam","Family"]
        let familyCategory = ViewModel.shared.incomeArray.filter{
            var result: Income?
            for element in familyTermsArray {
                if $0.source == element {
                    result = $0
                }
            }
            return (result != nil)
        }
        var tempArray1 = [Int]()
        var result1 = Int()
        for element in familyCategory {
            tempArray1.append(Int(element.summ) ?? 0)
        }
        result1 = tempArray1.reduce(0,+)
        let resultItemOfFamilyCategory = Income(date: "", source: "Family", summ: String(result1))
        familyItemsArray.removeAll()
        familyItemsArray.append(resultItemOfFamilyCategory)
        
        cleanIncomeData()
        
        incomeDataCategoriesArray = salaryItemsArray + familyItemsArray
        
        for model in incomeDataCategoriesArray {
            incomeCategoriesAllTime.append(model.source)
            incomeSummsAllTime.append(Double(model.summ) ?? 0)
        }
        
    }
    
    func cleanIncomeData() {
        if !incomeDataCategoriesArray.isEmpty {
            incomeDataCategoriesArray.removeAll()
        }
        if !incomeCategoriesAllTime.isEmpty && !incomeSummsAllTime.isEmpty {
            incomeCategoriesAllTime.removeAll()
            incomeSummsAllTime.removeAll()
        }
    }
    
    
    var userTermsArray: [String] = []
    var nameOfUserCategory = ""
    
    // метод по заполнению расходов за все время
    var expensesDataCategoriesArray: [Income] = []
    
    func fillExpensesValuesAllTime() {
        
        var foodItemsArray: [Income] = []
        
        // фильтр по категории Еда
        let foodTermsArray = ["Еда","Хавчик","Food","Вкуссвил","Лента","Магнит","Пятерочка","Пятера","Столовая","Красное белое","Фасоль","Красное и белое"]
        let foodCategory = ViewModel.shared.expensesArray.filter{
            var result: Income?
            for element in foodTermsArray {
                if $0.source == element {
                    result = $0
                }
            }
            return (result != nil)
        }
        var tempArray = [Int]()
        var result = Int()
        for element in foodCategory {
            tempArray.append(Int(element.summ) ?? 0)
        }
        result = tempArray.reduce(0,+)
        let resultItemOfFoodCategory = Income(date: "", source: "Food", summ: String(result))
        foodItemsArray.removeAll()
        foodItemsArray.append(resultItemOfFoodCategory)
        
        // фильтр по категории развлечения
        var attractionsItemsArray: [Income] = []
        
        let  attractionsTermsArray = ["Attractions","Развлечения","Кино","Парк аттракционов","Ресторан","Кафе","Боулинг","Рыбалка","Каршеринг","Whoosh","Urent","Film","Cafe","Аквапарк","Стрипклуб","Бар","Bar","StripClub","Massage","Массаж","Яндексдрайв","Aquapark","Bali","Бали"]
        let attractionsCategory = ViewModel.shared.expensesArray.filter{
            var result: Income?
            for element in attractionsTermsArray {
                if $0.source == element {
                    result = $0
                }
            }
            return (result != nil)
        }
        var tempArray1 = [Int]()
        var result1 = Int()
        for element in attractionsCategory {
            tempArray1.append(Int(element.summ) ?? 0)
        }
        result1 = tempArray1.reduce(0,+)
        let resultItemOfAttractionsCategory = Income(date: "", source: "Развлечения", summ: String(result1))
        attractionsItemsArray.removeAll()
        attractionsItemsArray.append(resultItemOfAttractionsCategory)
        
        // фильтр по категории остальное
        var otherItemsArray: [Income] = []
        
        let otherTermsArray = ["Переводы","Связь","Топливо","Заправка","Бензин","Одежда","Обувь","Транспорт","различные товары","Музыка","Жкх","ЖКХ","Коммуналка","Коммунальные платежи"]
        let otherCategory = ViewModel.shared.expensesArray.filter{
            var result: Income?
            for element in otherTermsArray {
                if $0.source == element {
                    result = $0
                }
            }
            return (result != nil)
        }
        var tempArray2 = [Int]()
        var result2 = Int()
        for element in otherCategory {
            tempArray2.append(Int(element.summ) ?? 0)
        }
        result2 = tempArray2.reduce(0,+)
        let resultItemOfOtherCategory = Income(date: "", source: "Остальное", summ: String(result2))
        otherItemsArray.removeAll()
        otherItemsArray.append(resultItemOfOtherCategory)
        
        // фильтр по категории ВВЕЛ ПОЛЬЗОВАТЕЛЬ
        var userItemsArray: [Income] = []
        //
        let userCategory = ViewModel.shared.expensesArray.filter{
            var result: Income?
            for element in userTermsArray {
                if $0.source == element {
                    result = $0
                }
            }
            return (result != nil)
        }
        var tempArray3 = [Int]()
        var result3 = Int()
        for element in userCategory {
            tempArray3.append(Int(element.summ) ?? 0)
        }
        result3 = tempArray3.reduce(0,+)
        let resultItemOfUserCategory = Income(date: "", source: "UserSource", summ: String(result3))
        resultItemOfUserCategory.source = nameOfUserCategory
        userItemsArray.removeAll()
        userItemsArray.append(resultItemOfUserCategory)
        
        cleanExpensesData()
        
        expensesDataCategoriesArray = foodItemsArray + otherItemsArray + attractionsItemsArray + userItemsArray
        
        for model in expensesDataCategoriesArray {
            expensesCategoriesAllTime.append(model.source)
            expensesSummsAllTime.append(Double(model.summ) ?? 0)
        }
    }
    
    func cleanExpensesData() {
        if !expensesDataCategoriesArray.isEmpty {
            expensesDataCategoriesArray.removeAll()
        }
        if !expensesCategoriesAllTime.isEmpty && !expensesSummsAllTime.isEmpty {
            expensesCategoriesAllTime.removeAll()
            expensesSummsAllTime.removeAll()
        }
    }
    
    let listIncome = ["Зп","Зарплата","Получка","Деньги","Бабки","Кэш","Кеш","Бабосики","Бабосы","Лавандос","Лаванда","Бабло","Money","Salary","Cash","Job","Подработка","Мама","Папа","Брат","Сестра","Сын","Дочь","Дядя","Тетя","Мамуля","Папуля","Сестренка","Mom","Mother","Pa","Father","Sister","Brother","Aunt","Auncle","Granpa","Grandma","Granfather","Grandmother","Ба","Бабуля","Бабушка","Дед","Дедушка","Дедуля","Семья","Предки","Fam","Family"]
    let listExpenses = ["Еда","Хавчик","Food","Вкуссвил","Лента","Магнит","Пятерочка","Пятера","Столовая","Алкомаркет","Фасоль","Attractions","Развлечения","Кино","Ресторан","Кафе","Боулинг","Рыбалка","Каршеринг","Whoosh","Urent","Film","Cafe","Аквапарк","Стрипклуб","Бар","Bar","StripClub","Massage","Массаж","Яндексдрайв","Aquapark","Bali","Бали","Переводы","Связь","Топливо","Заправка","Бензин","Одежда","Обувь","Транспорт","Скотч","Музыка","Жкх","ЖКХ","Коммуналка"]
    
    // массивы данных для заполнения chartViewPie по доходам за месяц
    var incomeCategoriesMonth: [String] = []
    var incomeSummsMonth: [Double] = []
    
    // массивы данных для заполнения chartViewPie по расходам за месяц
    var expensesCategoriesMonth: [String] = []
    var expensesSummsMonth: [Double] = []
    
    // массивы данных для заполнения chartViewPie по доходам за год
    var incomeCategoriesYear: [String] = []
    var incomeSummsYear: [Double] = []
    
    // массивы данных для заполнения chartViewPie по расходам за год
    var expensesCategoriesYear: [String] = []
    var expensesSummsYear: [Double] = []
    
    func fillIncomeValuesMonth() {
        var monthItemsArray: [Income] = []
        var monthCategoryArray: [Income] = []
        var one: Character = "a"
        var two: Character = "b"
        var temp = ""
        _ = ViewModel.shared.incomeArray.filter{
            let index = $0.date.index($0.date.startIndex, offsetBy: 3)
            one = $0.date[index]
            let index2 = $0.date.index($0.date.startIndex, offsetBy: 4)
            two = $0.date[index2]
            temp.append(one)
            temp.append(two)
            for item in ViewModel.shared.incomeArray {
                if item.date.contains(temp) {
                    monthCategoryArray.append(item)
                }
            }
            return true
        }
        monthItemsArray.removeAll()
        for item in monthCategoryArray {
            monthItemsArray.append(item)
        }
        incomeCategoriesMonth.removeAll()
        incomeSummsMonth.removeAll()
        for item in monthItemsArray {
            incomeCategoriesMonth.append(item.source)
            incomeSummsMonth.append(Double(item.summ) ?? 0)
        }
    }
    
    func fillExpensesValuesMonth() {
        var monthItemsArray: [Income] = []
        var monthCategoryArray: [Income] = []
        var one: Character = "a"
        var two: Character = "b"
        var temp = ""
        _ = ViewModel.shared.expensesArray.filter{
            let index = $0.date.index($0.date.startIndex, offsetBy: 3)
            one = $0.date[index]
            let index2 = $0.date.index($0.date.startIndex, offsetBy: 4)
            two = $0.date[index2]
            temp.append(one)
            temp.append(two)
            for item in ViewModel.shared.expensesArray {
                if item.date.contains(temp) {
                    monthCategoryArray.append(item)
                }
            }
            return true
        }
        monthItemsArray.removeAll()
        for item in monthCategoryArray {
            monthItemsArray.append(item)
        }
        expensesCategoriesMonth.removeAll()
        expensesSummsMonth.removeAll()
        for item in monthItemsArray {
            expensesCategoriesMonth.append(item.source)
            expensesSummsMonth.append(Double(item.summ) ?? 0)
        }
    }
    
    func fillIncomeValuesYear() {
        var yearItemsArray: [Income] = []
        var yearCategoryArray: [Income] = []
        var one: Character = "a"
        var two: Character = "b"
        var three: Character = "c"
        var four: Character = "d"
        var temp = ""
        _ = ViewModel.shared.incomeArray.filter{
            let index = $0.date.index($0.date.startIndex, offsetBy: 6)
            one = $0.date[index]
            let index2 = $0.date.index($0.date.startIndex, offsetBy: 7)
            two = $0.date[index2]
            let index3 = $0.date.index($0.date.startIndex, offsetBy: 8)
            three = $0.date[index3]
            let index4 = $0.date.index($0.date.startIndex, offsetBy: 9)
            four = $0.date[index4]
            temp.append(one)
            temp.append(two)
            temp.append(three)
            temp.append(four)
            for item in ViewModel.shared.incomeArray {
                if item.date.contains(temp) {
                    yearCategoryArray.append(item)
                }
            }
            return true
        }
        yearItemsArray.removeAll()
        for item in yearCategoryArray {
            yearItemsArray.append(item)
        }
        incomeCategoriesYear.removeAll()
        incomeSummsYear.removeAll()
        for item in yearItemsArray {
            incomeCategoriesYear.append(item.source)
            incomeSummsYear.append(Double(item.summ) ?? 0)
        }
    }

    func fillExpensesValuesYear() {
        var yearItemsArray: [Income] = []
        var yearCategoryArray: [Income] = []
        var one: Character = "a"
        var two: Character = "b"
        var three: Character = "c"
        var four: Character = "d"
        var temp = ""
        _ = ViewModel.shared.expensesArray.filter{
            let index = $0.date.index($0.date.startIndex, offsetBy: 6)
            one = $0.date[index]
            let index2 = $0.date.index($0.date.startIndex, offsetBy: 7)
            two = $0.date[index2]
            let index3 = $0.date.index($0.date.startIndex, offsetBy: 8)
            three = $0.date[index3]
            let index4 = $0.date.index($0.date.startIndex, offsetBy: 9)
            four = $0.date[index4]
            temp.append(one)
            temp.append(two)
            temp.append(three)
            temp.append(four)
            for item in ViewModel.shared.expensesArray {
                if item.date.contains(temp) {
                    yearCategoryArray.append(item)
                }
            }
            return true
        }
        yearItemsArray.removeAll()
        for item in yearCategoryArray {
            yearItemsArray.append(item)
        }
        expensesCategoriesYear.removeAll()
        expensesSummsYear.removeAll()
        for item in yearItemsArray {
            expensesCategoriesYear.append(item.source)
            expensesSummsYear.append(Double(item.summ) ?? 0)
        }
    }
    
}
