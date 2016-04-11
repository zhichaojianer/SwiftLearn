//
//  TestWebViewController.swift
//  SwiftLearn001
//
//  Created by 刘超-EriC on 15/12/1.
//  Copyright © 2015年 刘超. All rights reserved.
//

import UIKit

class TestWebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var ui_backButton: UIButton!

    @IBOutlet weak var ui_webView: UIWebView!
    @IBOutlet weak var ui_activityIndicator: UIActivityIndicatorView!

    var requestUrl: NSURL!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        let backgroundColor = UIColor(red: 242/250, green: 243/250, blue: 244/250, alpha: 1)
        self.view.backgroundColor = backgroundColor
        self.ui_webView.backgroundColor =  backgroundColor
        
        self.ui_backButton.titleLabel?.font = UIFont(name: "Chalkduster", size: 18)
        
        self.requestUrl = NSURL(string: "http://imzhiliao.com")
        self.ui_webView.loadRequest(NSURLRequest(URL: self.requestUrl))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.ui_activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.ui_activityIndicator.stopAnimating()
        self.ui_activityIndicator.hidden = true
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
    }
    
    @IBAction func backButtonTouch(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
}
