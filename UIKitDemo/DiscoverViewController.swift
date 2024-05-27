//
//  DiscoverViewController.swift
//  UIKitDemo
//
//  Created by wangjp on 2024/5/24.
//

import UIKit

class DiscoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置视图背景色
        self.view.backgroundColor = .white

        // 设置标签和标题
        self.title = "发现"
//        self.tabBarItem.image = UIImage(systemName: "2.square.fill")

        // 添加一个按钮
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.setTitle("Go to Other Page", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func buttonClicked() {
        let otherPage = DetailViewController()
        otherPage.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(otherPage, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
