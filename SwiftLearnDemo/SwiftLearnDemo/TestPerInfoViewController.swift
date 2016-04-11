//
//  TestPerInfoViewController.swift
//  SwiftLearn001
//
//  Created by 刘超-EriC on 15/12/1.
//  Copyright © 2015年 刘超. All rights reserved.
//

import UIKit

class TestPerInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var ui_titleLabel: UILabel!
    @IBOutlet weak var ui_nameTitle: UILabel!
    @IBOutlet weak var ui_nameLabel: UILabel!
    @IBOutlet weak var ui_genderTitle: UILabel!
    @IBOutlet weak var ui_genderLabel: UILabel!
    @IBOutlet weak var ui_headImageView: UIImageView!
    @IBOutlet weak var ui_tableView: UITableView!
    
    @IBOutlet weak var ui_topImageView: UIImageView!
    @IBOutlet weak var ui_topImageHeightConstraint: NSLayoutConstraint!

    var nameStr: NSString!
    var genderStr: NSString!
    var headImageStr: NSString!
    var heightConstant: CGFloat!
    var mainScreenSize: CGSize!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = NSLocalizedString("个人信息", comment: "")
        self.view.backgroundColor = UIColor(red: 242/250, green: 243/250, blue: 244/250, alpha: 1)
        
        self.ui_tableView.registerNib(UINib(nibName: "TestPerInfoTableViewCell", bundle: nil), forCellReuseIdentifier: TestPerInfoIdentifier)
        
        self.mainScreenSize = UIScreen.mainScreen().bounds.size
        self.ui_topImageHeightConstraint.constant = self.mainScreenSize.width*211/375
        
        self.ui_topImageView.hidden = true
        self.ui_titleLabel.alpha = 0.0
        self.ui_titleLabel.text = self.nameStr! as String
        
        self.ui_headImageView.image = UIImage(named:self.headImageStr! as String)
        self.ui_nameLabel.text = self.nameStr! as String
        self.ui_genderLabel.text = self.genderStr! as String
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        
        self.navigationController?.navigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let customHeaderView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 24))
        customHeaderView.backgroundColor = UIColor.whiteColor()
        
        let customHeaderLabel = UILabel(frame: CGRectMake(10, 0, tableView.frame.size.width-10*2, 24))
        customHeaderLabel.text = "2015年12月7日-" + String(section)
        customHeaderLabel.textAlignment = NSTextAlignment.Left
        customHeaderLabel.textColor = UIColor.darkGrayColor()
        customHeaderLabel.font = UIFont.systemFontOfSize(12.0)
        
        customHeaderView.addSubview(customHeaderLabel)
        
        return customHeaderView
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cellIdentifier = "CellIdentifier"
//        let cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
//        
//        cell.textLabel?.text = NSLocalizedString("test", comment: "")
//        
//        return cell
        
        let testPerInfoTableViewCell : TestPerInfoTableViewCell = tableView.dequeueReusableCellWithIdentifier(TestPerInfoIdentifier, forIndexPath: indexPath) as! TestPerInfoTableViewCell
        
        return testPerInfoTableViewCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if(scrollView.contentOffset.y < 0){
            
            self.ui_topImageHeightConstraint.constant = self.mainScreenSize.width*211/375-scrollView.contentOffset.y
            self.view.layoutIfNeeded()
            
            self.ui_topImageView.hidden = true
            [self .setUIAttributes(1)]
        }else{
            
            self.ui_topImageHeightConstraint.constant = self.mainScreenSize.width*211/375
            self.view.layoutIfNeeded()

            if(scrollView.contentOffset.y >= 87){
                self.ui_topImageView.hidden = false
                self.ui_titleLabel.alpha = 1.0
                [self .setUIAttributes(0.0)]
            }else if(scrollView.contentOffset.y >= 40){
                var floatValue: CGFloat
                floatValue = (37 - (scrollView.contentOffset.y-40))/37
                self.ui_topImageView.hidden = true
                self.ui_titleLabel.alpha = 1.0-floatValue
                [self .setUIAttributes(floatValue)]
            }else{
                self.ui_topImageView.hidden = true
                self.ui_titleLabel.alpha = 0.0
                [self .setUIAttributes(1.0)]
            }
        }
    }
    
    func setUIAttributes(floatValue: CGFloat){
            self.ui_headImageView.alpha = floatValue
            self.ui_nameTitle.alpha = floatValue
            self.ui_nameLabel.alpha = floatValue
            self.ui_genderTitle.alpha = floatValue
            self.ui_genderLabel.alpha = floatValue
    }
    
    @IBAction func backButtonTouch(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
