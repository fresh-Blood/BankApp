import Foundation
import UIKit

final class Store {
    // MARK: had fun with userDefaults 
    private enum SettingKeys: String {
        case income // 0
        case expenses // 1
        case balance // 2
        case incomeCategoriesAllTime // 3
        case incomeSummsAllTime // 4
        case expensesCategoriesAllTime // 5
        case expensesSummsAllTime // 6
    }
    static var income: [Income]! {
        get {
            guard let savedData = UserDefaults.standard.object(forKey: SettingKeys.income.rawValue) as? Data, let decodedModel = try?
                    NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? [Income] else {
                        return []
                    }
            return decodedModel
        }
        set {
            let defaults = UserDefaults.standard
            let key = SettingKeys.income.rawValue
            if let model = newValue {
                if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: model, requiringSecureCoding: false) {
                    defaults.set(savedData, forKey: key)
                }
            }
        }
    }
    static var balance: Int! {
        get {
            guard let savedData1 = UserDefaults.standard.object(forKey: SettingKeys.balance.rawValue) as? Data, let decodedModel1 = try?
                    NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData1) as? Int else {
                        return 0
                    }
            return decodedModel1
        }
        set {
            let defaults1 = UserDefaults.standard
            let key1 = SettingKeys.balance.rawValue
            if let model1 = newValue {
                if let savedData1 = try? NSKeyedArchiver.archivedData(withRootObject: model1, requiringSecureCoding: false) {
                    defaults1.set(savedData1, forKey: key1)
                }
            }
        }
    }
    static var expenses: [Income]! {
        get {
            guard let savedData2 = UserDefaults.standard.object(forKey: SettingKeys.expenses.rawValue) as? Data, let decodedModel2 = try?
                    NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData2) as? [Income] else {
                        return []
                    }
            return decodedModel2
        }
        set {
            let defaults2 = UserDefaults.standard
            let key2 = SettingKeys.expenses.rawValue
            if let model2 = newValue {
                if let savedData2 = try? NSKeyedArchiver.archivedData(withRootObject: model2, requiringSecureCoding: false) {
                    defaults2.set(savedData2, forKey: key2)
                }
            }
        }
    }
    static var incomeCategoriesAllTime: [String]! {
        get {
            guard let savedData3 = UserDefaults.standard.object(forKey: SettingKeys.incomeCategoriesAllTime.rawValue) as? Data, let decodedModel3 = try?
                    NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData3) as? [String] else {
                        return []
                    }
            return decodedModel3
        }
        set {
            let defaults3 = UserDefaults.standard
            let key3 = SettingKeys.incomeCategoriesAllTime.rawValue
            if let model3 = newValue {
                if let savedData3 = try? NSKeyedArchiver.archivedData(withRootObject: model3, requiringSecureCoding: false) {
                    defaults3.set(savedData3, forKey: key3)
                }
            }
        }
    }
    static var incomeSummsAllTime: [Double]! {
        get {
            guard let savedData4 = UserDefaults.standard.object(forKey: SettingKeys.incomeSummsAllTime.rawValue) as? Data, let decodedModel4 = try?
                    NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData4) as? [Double] else {
                        return []
                    }
            return decodedModel4
        }
        set {
            let defaults4 = UserDefaults.standard
            let key4 = SettingKeys.incomeSummsAllTime.rawValue
            if let model4 = newValue {
                if let savedData4 = try? NSKeyedArchiver.archivedData(withRootObject: model4, requiringSecureCoding: false) {
                    defaults4.set(savedData4, forKey: key4)
                }
            }
        }
    }
    static var expensesCategoriesAllTime: [String]! {
        get {
            guard let savedData5 = UserDefaults.standard.object(forKey: SettingKeys.expensesCategoriesAllTime.rawValue) as? Data, let decodedModel5 = try?
                    NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData5) as? [String] else {
                        return []
                    }
            return decodedModel5
        }
        set {
            let defaults5 = UserDefaults.standard
            let key5 = SettingKeys.expensesCategoriesAllTime.rawValue
            if let model5 = newValue {
                if let savedData5 = try? NSKeyedArchiver.archivedData(withRootObject: model5, requiringSecureCoding: false) {
                    defaults5.set(savedData5, forKey: key5)
                }
            }
        }
    }
    static var expensesSummsAllTime: [Double]! {
        get {
            guard let savedData6 = UserDefaults.standard.object(forKey: SettingKeys.expensesSummsAllTime.rawValue) as? Data, let decodedModel6 = try?
                    NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData6) as? [Double] else {
                        return []
                    }
            return decodedModel6
        }
        set {
            let defaults6 = UserDefaults.standard
            let key6 = SettingKeys.expensesSummsAllTime.rawValue
            if let model6 = newValue {
                if let savedData6 = try? NSKeyedArchiver.archivedData(withRootObject: model6, requiringSecureCoding: false) {
                    defaults6.set(savedData6, forKey: key6)
                }
            }
        }
    }
}
