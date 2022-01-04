import UIKit

final class MyTableViewCell: UITableViewCell {
    
    let date: UILabel = {
        let lbl = UILabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return lbl
    }()
    let source: UILabel = {
        let lbl = UILabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return lbl
    }()
    let summ: UILabel = {
        let lbl = UILabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .light)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.addSubview(date)
        self.contentView.addSubview(source)
        self.contentView.addSubview(summ)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        date.frame = CGRect(x: contentView.bounds.minX,
                            y: contentView.bounds.minY,
                            width: contentView.bounds.width/3,
                            height: contentView.bounds.height)
        source.frame = CGRect(x: contentView.bounds.width/3,
                            y: contentView.bounds.minY,
                            width: contentView.bounds.width/3,
                            height: contentView.bounds.height)
        summ.frame = CGRect(x: contentView.bounds.width/3*2,
                            y: contentView.bounds.minY,
                            width: contentView.bounds.width/3,
                            height: contentView.bounds.height)
    }
}
