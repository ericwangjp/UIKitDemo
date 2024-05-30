//
//  ProductTableViewCell.swift
//  UIKitDemo
//
//  Created by wangjp on 2024/5/27.
//

import UIKit
import SnapKit

class ProductTableViewCell: UITableViewCell {
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    let descLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()
    
    let image : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(image)
        
        // 设置约束
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(10)
            make.top.equalTo(10)
            make.trailing.equalTo(-10)
        }
        
        descLabel.snp.makeConstraints { make in
            make.top.equalTo(30)
            make.bottom.equalTo(-30)
            make.trailing.equalTo(-10)
//            make.leftMargin.equalTo(10)
            make.left.equalTo(image.snp.right).offset(10)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.trailing.equalTo(-10)
        }
        
        image.snp.makeConstraints{ make in
            make.top.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.width.equalTo(120)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateState(product: Product){
        titleLabel.text = product.title
        descLabel.text = product.desc
        priceLabel.text = product.price
        image.image = UIImage(named: product.image ?? "img_2")
    }

}
