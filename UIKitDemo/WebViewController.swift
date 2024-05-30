//
//  WebViewController.swift
//  UIKitDemo
//
//  Created by wangjp on 2024/5/30.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = UIColor.white

//        UIWebView was deprecated
//        let webview = UIWebView(frame: self.view.bounds)
//        let url = URL(string: "http://www.baidu.com")
//        let request = URLRequest(url: url!)
//        webview.loadRequest(request)
//        self.view.addSubview(webview)
        
        let configuration = WKWebViewConfiguration()
        let wkWebView = WKWebView(frame: self.view.frame, configuration: configuration)
//        一般不需要配置进程池,配置为同一进程池中的WKWebView实例会共享一些资源，
//        进程池在需要使用多个WKWebView实例时会使用到
//        let processPool = WKProcessPool()
//        configuration.processPool = processPool
        self.view.addSubview(wkWebView)
        let url = URL(string: "http://www.baidu.com")
        let request = URLRequest(url: url!)
        wkWebView.load(request)

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
