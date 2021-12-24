import UIKit

final class MyTableViewCell2: UITableViewCell {
    
    let date: UILabel = {
        let lbl = UILabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.backgroundColor = .clear
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return lbl
    }()
    let category: UILabel = {
        let lbl = UILabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.backgroundColor = .clear
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return lbl
    }()
    let summ: UILabel = {
        let lbl = UILabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.backgroundColor = .clear
        lbl.numberOfLines = 0
        lbl.textAlignment = .right
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.contentView.addSubview(date)
        self.contentView.addSubview(category)
        self.contentView.addSubview(summ)
        let inset:CGFloat = 10
        date.frame = CGRect(x: contentView.bounds.minX + inset,
                            y: contentView.bounds.minY + inset,
                            width: contentView.bounds.width/3 - inset,
                            height: contentView.bounds.height - inset)
        category.frame = CGRect(x: contentView.bounds.width/3 + inset,
                            y: contentView.bounds.minY + inset,
                            width: contentView.bounds.width/3 - inset,
                            height: contentView.bounds.height - inset)
        summ.frame = CGRect(x: contentView.bounds.width/3*2 + inset,
                            y: contentView.bounds.minY + inset,
                            width: contentView.bounds.width/3 - inset*2,
                            height: contentView.bounds.height - inset)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
