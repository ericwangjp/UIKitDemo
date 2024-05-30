//
//  WaterfallLayout.swift
//  UIKitDemo
//  自定义瀑布流布局
//
//  Created by wangjp on 2024/5/28.
//

import UIKit

class WaterfallLayout: UICollectionViewFlowLayout {
    private let numberOfColumns: Int
    private let cellPadding: CGFloat
    private var cache: [UICollectionViewLayoutAttributes] = []
    private var contentHeight: CGFloat = 0
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }

    init(numberOfColumns: Int, cellPadding: CGFloat = 10) {
        self.numberOfColumns = numberOfColumns
        self.cellPadding = cellPadding
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }

    override func prepare() {
        guard cache.isEmpty, let collectionView = collectionView else { return }
        
        guard collectionView.numberOfSections > 0 else {
            return
        }
        
        assert(numberOfColumns > 0, "WaterfallFlowLayout's columnCount should be greater than 0")
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset: [CGFloat] = []
        for column in 0..<numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
        
//        for section in 0..<collectionView.numberOfSections {
//            
//        }

        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            // 计算图片高度，这里随机给值 100-250
            let photoHeight: CGFloat = CGFloat(arc4random()%150+100)
            let height = cellPadding * 2 + photoHeight
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
        
        // 计算尾部视图的布局属性
        let footerIndexPath = IndexPath(item: 0, section: collectionView.numberOfSections - 1)
        let footerAttributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, with: footerIndexPath)
        footerAttributes.frame = CGRect(x: 0, y: contentHeight, width: collectionView.bounds.width, height: 80)
        cache.append(footerAttributes)
        contentHeight = max(contentHeight, footerAttributes.frame.maxY)
     

    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }

}
