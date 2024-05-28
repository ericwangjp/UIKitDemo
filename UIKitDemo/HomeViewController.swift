//
//  HomeViewController.swift
//  UIKitDemo
//
//  Created by wangjp on 2024/5/24.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var dataArray:Array<Product> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.title = "首页"
//        self.tabBarItem.image = UIImage(systemName: "1.square.fill")
        
        initData()
        
//        let button = UIButton(type: .system)
//        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
//        button.setTitle("Go to Other Page", for: .normal)
//        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
//        self.view.addSubview(button)
    }
    
//    @objc func buttonClicked() {
//        let nextViewController = DetailViewController()
//        nextViewController.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(nextViewController, animated: true)
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func initData(){
        for i in 0...20 {
            let product = Product()
            product.title = "第\(i)行"
            product.price = "\(i * 10 + i)"
            if i>10 {
                product.image = "img_\(i%10)"
            } else {
                product.image = "img_\(i+1)"
            }
            product.desc = "这是内容说明\(i)"
            dataArray.append(product)
        }
        
        let tableView = UITableView(frame: self.view.frame,style: .grouped)
        // 注册 cell
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        self.view.addSubview(tableView)
        // 设置数据源与代理
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 根据注册的cell类ID值获取载体cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! ProductTableViewCell
        cell.updateState(product: dataArray[indexPath.row])
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
    
//    分区设置
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
//    
//    头尾设置
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "分区头部\(section)"
//    }
//    
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return "尾部分区\(section)"
//    }
    
//    设置头部自定义视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 120))
        view.backgroundColor = UIColor.systemGray
        return view
    }
    
//    设置尾部自定义视图
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 120))
        view.backgroundColor = UIColor.systemGray
        return view
    }
    
//    设置分区头部视图高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 120
    }
    
//    已经选中某一行
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("选中：\(indexPath)")
    }
    
//    已经取消选中某一行
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("取消选中：\(indexPath)")
    }
}
