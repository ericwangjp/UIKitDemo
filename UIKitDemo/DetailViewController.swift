//
//  DetailViewController.swift
//  UIKitDemo
//
//  Created by wangjp on 2024/5/24.
//

import UIKit

class DetailViewController: UIViewController, UISearchBarDelegate {
    
    let segmentItems = ["自然风景","动物","美女","建筑","城市","乡村"]
    var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 设置视图背景色
        self.view.backgroundColor = .white

        // 设置标题
        self.title = "详情页"
        
//        edgesForExtendedLayout = UIRectEdge.all.subtracting(.top)
        let safeArea = self.view.safeAreaLayoutGuide
        
        searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = "请输入搜索关键词"
        searchBar.prompt = "快速搜索"
//        searchBar.showsCancelButton = true
        searchBar.showsSearchResultsButton = true
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = segmentItems
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
//        修改取消按钮的文字
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "取消"
        self.view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(safeArea.snp.top)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        
        let segmentedControl = UISegmentedControl(items: segmentItems)
//        设置控件风格颜色，设置无效？？待深究
        segmentedControl.tintColor = UIColor.systemBlue
//        根据其中每个item内容的长短自动控制每个item的宽度（默认每个item相等，评分总宽度）
        segmentedControl.apportionsSegmentWidthsByContent = true
//        segmentedControl.isMomentary = true
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.addTarget(self, action: #selector(tabValueChaged), for: .valueChanged)
        self.view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.equalTo(searchBar.snp.bottom).offset(15)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
    }
    
    @objc func tabValueChaged(segmentedControl: UISegmentedControl){
        print("选中了：\(segmentedControl.selectedSegmentIndex)")
    }
    
    // UISearchBar开始编辑时调用
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
//        使用了键值编码（KVC）来访问私有属性，这种方法可能在未来的iOS版本中不再有效，使用上面的方案也可以
//        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
//            cancelButton.setTitle("取消", for: .normal)
//        }
    }
    
    // UISearchBar结束编辑时调用
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
//    点击取消按钮
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("搜索关键词为：\(searchText)")
    }
    
//    点击键盘上的搜索按钮
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("开始搜索")
        searchBar.resignFirstResponder()
    }
    
//    点击搜索结果
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print("点击搜索结果列表按钮")
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("点击搜索栏分类：\(selectedScope)")
    }

}
