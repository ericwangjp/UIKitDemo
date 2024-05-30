//
//  CustomCollectionFooterView.swift
//  UIKitDemo
//
//  Created by wangjp on 2024/5/29.
//

import UIKit

class CustomCollectionFooterView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    
    func configureView(){
        let label = UILabel()
        label.text = "我是有底线的~"
        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.backgroundColor = UIColor.systemGray6
        label.frame = bounds
        addSubview(label)
    }
    
        
}
