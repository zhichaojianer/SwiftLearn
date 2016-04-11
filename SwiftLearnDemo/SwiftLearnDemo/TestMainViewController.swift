//
//  TestMainViewController.swift
//  SwiftLearn001
//
//  Created by 刘超-EriC on 15/11/30.
//  Copyright © 2015年 刘超. All rights reserved.
//

import UIKit

class TestMainViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var ui_tableView: UITableView!
    
    var genderArray: NSArray!
    
    var tableNameArray: NSArray!
    var tableImageArray: NSArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = NSLocalizedString("用户列表", comment: "")
        
        genderArray = ["男", "女", "女", "男", "女", "男"]
        
        tableNameArray = ["杨国宝的爸爸", "张糖宝的妈妈", "王晓丹的奶奶", "刘小超的爷爷", "知了客服", "刘小云的外公"]
        tableImageArray = ["login_head_image", "public_share_circle_icon", "public_share_qq_icon", "public_share_more_icon", "default_avatar_service", "public_share_wechat_icon"]
        
        self.ui_tableView.registerNib(UINib(nibName: "TestMainTableViewCell", bundle: nil), forCellReuseIdentifier: TestMainIdentifier)
        
        //设置状态栏标题颜色
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.blueColor()]

        //自定义返回按钮
        let backButton = UIBarButtonItem(title: "< Back", style: UIBarButtonItemStyle.Plain, target: self, action: "goBackButtonTouch")
        navigationItem.leftBarButtonItem = backButton

        //设置返回按钮字体及颜色
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.blueColor(),NSFontAttributeName: UIFont(name: "Chalkduster", size: 18)!], forState: UIControlState.Normal)
        //设置返回按钮字体
//        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!], forState: UIControlState.Normal)
        
        //自定义转场按钮
        let rightBarButtonItem = UIBarButtonItem(title: "转场", style: UIBarButtonItemStyle.Plain, target: self, action: "rightBarButtonItemTouch")
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.blueColor(),NSFontAttributeName: UIFont(name: "Chalkduster", size: 15)!], forState: UIControlState.Normal)

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        self.navigationController?.interactivePopGestureRecognizer?.enabled = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        
        self.navigationController?.interactivePopGestureRecognizer?.enabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tableNameArray.count
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let testMainTableViewCell : TestMainTableViewCell = tableView.dequeueReusableCellWithIdentifier(TestMainIdentifier, forIndexPath: indexPath) as! TestMainTableViewCell
        testMainTableViewCell.ui_headImageView.image = UIImage(named: (tableImageArray[indexPath.row] as? String)!)
        testMainTableViewCell.ui_nameLabel.text = tableNameArray[indexPath.row] as? String
        testMainTableViewCell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return testMainTableViewCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.gotoPerInfoViewController(indexPath);
    }
    
    func gotoPerInfoViewController(indexPath: NSIndexPath){
        let testPerInfoViewController = TestPerInfoViewController(nibName: "TestPerInfoViewController", bundle: nil)
        testPerInfoViewController.genderStr = genderArray[indexPath.row] as? String
        testPerInfoViewController.nameStr = tableNameArray[indexPath.row] as? String
        testPerInfoViewController.headImageStr = tableImageArray[indexPath.row] as? String
        self.navigationController?.pushViewController(testPerInfoViewController, animated: true)
    }
    
    func rightBarButtonItemTouch(){
        NSLog("rightBarButtonItemTouch")
        let testWebViewController = TestWebViewController(nibName: "TestWebViewController", bundle: nil)
        self.presentViewController(testWebViewController, animated: true) { () -> Void in
            
        }
    }
    
    func goBackButtonTouch(){
        NSLog("goBackButtonTouch")
        self.navigationController?.popViewControllerAnimated(true)
    }
}
