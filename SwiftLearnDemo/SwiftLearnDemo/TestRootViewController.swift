//
//  TestRootViewController.swift
//  SwiftLearn001
//
//  Created by 刘超-EriC on 15/12/1.
//  Copyright © 2015年 刘超. All rights reserved.
//

import UIKit

class TestRootViewController: UIViewController {
    
    @IBOutlet weak var ui_phoneTextField: UITextField!
    @IBOutlet weak var ui_passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func testButtonTouch(sender: AnyObject) {
        NSLog("testButtonTouch")
        
        if (self.ui_phoneTextField.text?.characters.count > 0 && self.ui_passwordTextField.text?.characters.count > 0) {
            //拿到mainTableViewController
            let testMainViewController = TestMainViewController(nibName: "TestMainViewController", bundle: nil)
            self.navigationController?.pushViewController(testMainViewController, animated: true)
        }else{
            let alertController = UIAlertController(title: "系统提示", message: "请输入正确的手机号码和密码", preferredStyle: UIAlertControllerStyle.Alert)
            let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: {
                (alerts: UIAlertAction!) -> Void in
                
                print("cancelAction")
            })
            let sureAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: {
                (alerts: UIAlertAction!) -> Void in
                
                print("sureAction")
            })
            alertController.addAction(cancelAction)
            alertController.addAction(sureAction)
            self.presentViewController(alertController, animated:true, completion:nil)
        }
    }
    
    @IBAction func dynamicAdaptationButtonTouch(sender: AnyObject) {
        let testDynamicAdaptationHeight = TestDynamicAdaptationHeight(nibName: "TestDynamicAdaptationHeight", bundle: nil)
        self.navigationController?.pushViewController(testDynamicAdaptationHeight, animated: true)
    }
    
    @IBAction func tapGestureRecognizer(sender: AnyObject) {
        self.ui_phoneTextField.resignFirstResponder()
        self.ui_passwordTextField.resignFirstResponder()
    }

}
