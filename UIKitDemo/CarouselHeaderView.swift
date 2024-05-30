//
//  CarouselHeaderView.swift
//  UIKitDemo
//
//  Created by wangjp on 2024/5/29.
//

import UIKit

class CarouselHeaderView: UIView, UIScrollViewDelegate {
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    var images: [UIImage] = []
    var timer: Timer?

    init(frame: CGRect, images:[UIImage]) {
        super.init(frame: frame)
        self.images = images
        setupCarousel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCarousel()
    }
    
    func setupCarousel(){
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
        
        scrollView = UIScrollView(frame: bounds)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: bounds.height - 50, width: bounds.width, height: 50))
        pageControl.center = CGPoint(x: bounds.width/2, y: bounds.height - 25)
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        
        for (index,image) in images.enumerated() {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            imageView.frame = CGRect(x: CGFloat(index)*bounds.width, y: 0, width: bounds.width, height: bounds.height)
            scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: bounds.width * CGFloat(images.count), height: bounds.height)
        
        addSubview(scrollView)
        addSubview(pageControl)
    }
    
    @objc func pageControlTapped(_ sender: UIPageControl) {
        let rect = CGRect(x: CGFloat(sender.currentPage) * bounds.width, y: 0, width: bounds.width, height: bounds.height)
        scrollView.scrollRectToVisible(rect, animated: true)
    }
    
    @objc func autoScroll() {
        let nextPage = (pageControl.currentPage + 1) % images.count
        let offset = CGPoint(x: CGFloat(nextPage) * scrollView.frame.size.width, y: 0)
        scrollView.setContentOffset(offset, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = round(scrollView.contentOffset.x / bounds.width)
        pageControl.currentPage = Int(page)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer?.invalidate()
        timer = nil
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    deinit {
        timer?.invalidate()
    }

}
