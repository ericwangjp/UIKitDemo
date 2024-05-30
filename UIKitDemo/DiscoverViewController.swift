//
//  DiscoverViewController.swift
//  UIKitDemo
//
//  Created by wangjp on 2024/5/24.
//

import UIKit

class DiscoverViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var dataArray:Array<Product> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置视图背景色
        self.view.backgroundColor = .white

        // 设置标签和标题
        self.title = "发现"
//        self.tabBarItem.image = UIImage(systemName: "2.square.fill")
        
        for i in 0...30 {
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

        let layout = WaterfallLayout(numberOfColumns: 2, cellPadding: 5)
//        let layout = UICollectionViewFlowLayout()
//        设置头部视图尺寸
//        layout.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: 100)
//        设置尾部视图尺寸
//        layout.footerReferenceSize = CGSize(width: self.view.frame.size.width, height: 80)
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: 120, height: 120)
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        // 注册数据载体类
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "itemId")
        // 注册尾部视图
        collectionView.register(CustomCollectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footerView")
        self.view.addSubview(collectionView)
        
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

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
        cell.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255, green: CGFloat(arc4random()%255)/255, blue: CGFloat(arc4random()%255)/255, alpha: 1)
        let image = UIImageView()
        cell.contentView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.image = UIImage(named: dataArray[indexPath.row].image ?? "img_2")
        image.snp.makeConstraints{ make in
            make.size.equalToSuperview()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("选中\(indexPath.row)个item")
        let detailPage = DetailViewController()
        detailPage.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detailPage, animated: true)
    }
    
    
    
//    设置每个item的大小
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if indexPath.row%2 == 0 {
//            return CGSize(width: 50, height: 50)
//        } else {
//            return CGSize(width: 100, height: 100)
//        }
//    }
    
//    设置尾部视图
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerView", for: indexPath) as! CustomCollectionFooterView
            return footerView
        default:
            return UICollectionReusableView()
        }
    }
    
//    设置尾部视图大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
    
}
