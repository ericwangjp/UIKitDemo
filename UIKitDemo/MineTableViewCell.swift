//
//  MineTableViewCell.swift
//  UIKitDemo
//
//  Created by wangjp on 2024/5/29.
//

import UIKit

class MineTableViewCell: UITableViewCell {
    
    let leftIcon = UIImageView()
    let rightIcon = UIImageView()
    let label = UILabel()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initView(){
        leftIcon.translatesAutoresizingMaskIntoConstraints = false
        rightIcon.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(leftIcon)
        addSubview(rightIcon)
        addSubview(label)
        leftIcon.snp.makeConstraints{ make in
            make.left.top.equalTo(15)
            make.bottom.equalTo(-15)
            make.width.equalTo(20)
        }
        rightIcon.snp.makeConstraints{ make in
            make.top.equalTo(15)
            make.right.bottom.equalTo(-15)
            make.width.equalTo(20)
        }
        label.snp.makeConstraints{ make in
            make.left.equalTo(leftIcon.snp.right).offset(10)
            make.top.equalTo(15)
            make.bottom.equalTo(-15)
        }
    }
    
    func updateData(mineItem: MineItem){
        leftIcon.image = UIImage(systemName: mineItem.leftIcon ?? "person")
        rightIcon.image = UIImage(systemName: mineItem.rightIcon ?? "arrow.right")
        label.text = mineItem.title
    }

}
