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
        
        // 显示一个加载圈
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            activityIndicator.stopAnimating()
        }
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
                product.image = "img_\(i%11 + 1)"
            } else {
                product.image = "img_\(i+1)"
            }
            product.desc = "这是内容说明\(i)，看看换行效果。"
            dataArray.append(product)
        }
        
        let tableView = UITableView(frame: self.view.frame,style: .grouped)
//        tableView.isEditing = true
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
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
        let images:[UIImage] = dataArray.map { UIImage(named: $0.image ?? "img_1")! }
        let headerView = CarouselHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200),images: images)
        return headerView
    }
    
//    设置尾部自定义视图
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80))
        view.backgroundColor = UIColor.systemGray6
        let label = UILabel(frame: view.frame)
        label.text = "我是有底线的~"
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textAlignment = .center
        view.addSubview(label)
        return view
    }
    
//    设置分区头部视图高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
    }
    
//    已经选中某一行
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("选中：\(indexPath)")
        let nextViewController = DetailViewController()
        nextViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
//    已经取消选中某一行
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("取消选中：\(indexPath)")
    }
    
    
    @objc func pageControlTapped(_ sender: UIPageControl){
//        let rect = CGRect(x: CGFloat(sender.currentPage) * view.bounds.width, y: 0, width: view.bounds.width, height: view.bounds.height)
//        scrollView.scrollRectToVisible(rect, animated: true)
    }
}
