//
//  MineViewController.swift
//  UIKitDemo
//
//  Created by wangjp on 2024/5/24.
//

import UIKit

class MineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var settingTitles : [MineItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 设置视图背景色
        self.view.backgroundColor = .white

        // 设置标签和标题
        self.title = "我的"
//        self.tabBarItem.image = UIImage(systemName: "2.square.fill")
        
        
        let item1 = MineItem()
        item1.title = "个人中心"
        item1.leftIcon = "person.circle"
        item1.rightIcon = "chevron.forward.circle"
        settingTitles.append(item1)
        
        let item2 = MineItem()
        item2.title = "意见反馈"
        item2.leftIcon = "pencil.and.list.clipboard"
        item2.rightIcon = "chevron.forward.circle"
        settingTitles.append(item2)
        
        let item3 = MineItem()
        item3.title = "设置"
        item3.leftIcon = "gearshape"
        item3.rightIcon = "chevron.forward.circle"
        settingTitles.append(item3)
        
        let item4 = MineItem()
        item4.title = "退出登录"
        item4.leftIcon = "rectangle.portrait.and.arrow.right"
        item4.rightIcon = "chevron.forward.circle"
        settingTitles.append(item4)
        

        let headImg = UIImageView(image: UIImage(named: "img_2"))
        headImg.translatesAutoresizingMaskIntoConstraints = false
        headImg.isUserInteractionEnabled = true
        headImg.layer.cornerRadius = 80
        headImg.layer.masksToBounds = true
        headImg.layer.borderWidth = 2.0
        headImg.layer.borderColor = UIColor.systemGray5.cgColor
        // 创建一个新的 layer 用于显示阴影
        let shadowLayer = CALayer()
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOffset = CGSize(width: 0, height: 2)
        shadowLayer.shadowRadius = 2
        shadowLayer.shadowOpacity = 0.5
        shadowLayer.frame = headImg.frame
        shadowLayer.cornerRadius = headImg.layer.cornerRadius
        // 将阴影 layer 添加到 imageView 的 superView
        headImg.superview?.layer.insertSublayer(shadowLayer, below: headImg.layer)
        self.view.addSubview(headImg)
        let headTapGesture = UITapGestureRecognizer(target: self, action: #selector(loginClicked))
        headImg.addGestureRecognizer(headTapGesture)
        headImg.snp.makeConstraints{ make in
            make.top.equalTo(120)
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.height.equalTo(160)
        }
        
        // 登录按钮
        let loginButton = UIButton(type: .system)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("登录/注册", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.addTarget(self, action: #selector(loginClicked), for: .touchUpInside)
        self.view.addSubview(loginButton)
        loginButton.snp.makeConstraints{ make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(headImg.snp.bottom).offset(20)
        }
        
        let dividerView = UIView()
        dividerView.backgroundColor = UIColor.systemGray6
        self.view.addSubview(dividerView)
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.snp.makeConstraints{ make in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(10)
        }
        
        let tableView = UITableView(frame: self.view.frame,style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // 注册 cell
        tableView.register(MineTableViewCell.self, forCellReuseIdentifier: "MineCell")
        self.view.addSubview(tableView)
        // 设置数据源与代理
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(dividerView.snp.bottom).offset(10)
            make.left.right.bottom.equalTo(0)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 根据注册的cell类ID值获取载体cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MineCell", for: indexPath) as! MineTableViewCell
        cell.updateData(mineItem: settingTitles[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 120
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("选中：\(indexPath)")
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 1:
            let webViewController = WebViewController()
            webViewController.hidesBottomBarWhenPushed = true
            webViewController.title = settingTitles[indexPath.row].title
            self.navigationController?.pushViewController(webViewController, animated: true)
            break
        case 3:
            let alertController = UIAlertController(title: "退出登录", message: "确定退出登录吗？", preferredStyle: .actionSheet)
            let actionSure = UIAlertAction(title: "确定", style: .destructive){ action in
                
            }
            let actionCancel = UIAlertAction(title: "取消", style: .cancel){ action in
                
            }
            alertController.addAction(actionSure)
            alertController.addAction(actionCancel)
            self.present(alertController, animated: true, completion: nil)
            break
        default:
            let detailViewController = DetailViewController()
            detailViewController.hidesBottomBarWhenPushed = true
            detailViewController.title = settingTitles[indexPath.row].title
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }

    }
    
    @objc func loginClicked() {
        let alertController = UIAlertController(title: "登录", message: "登录后使用全部功能", preferredStyle: .alert)
        let actionSure = UIAlertAction(title: "确定", style: .destructive){ action in
            
        }
        let actionCancel = UIAlertAction(title: "取消", style: .cancel){ action in
            
        }

        alertController.addTextField { textField in
            textField.placeholder = "请输入账号"
        }
        alertController.addTextField { textField in
            textField.placeholder = "请输入密码"
            // 密码模式
            textField.isSecureTextEntry = true
        }
        alertController.addAction(actionSure)
        alertController.addAction(actionCancel)
        present(alertController, animated: true, completion: nil)
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
