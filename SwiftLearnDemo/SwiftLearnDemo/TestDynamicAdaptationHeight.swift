//
//  TestDynamicAdaptationHeight.swift
//  SwiftLearn001
//
//  Created by 刘超-EriC on 15/12/5.
//  Copyright © 2015年 刘超. All rights reserved.
//

import UIKit

class TestDynamicAdaptationHeight: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var ui_testLabel: UILabel!
    @IBOutlet weak var ui_tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "测试动态适配"
        
        self.ui_testLabel.text = "TestDynamicAdaptationHeightTestDynamicAdaptationHeightTestDynamicAdaptationHeightTestDynamicAdaptationHeightTestDynamicAdaptationHeightTestDynamicAdaptationHeight"
        self.ui_testLabel.numberOfLines = 0
        
        self.ui_tableView.estimatedRowHeight = 44
        self.ui_tableView.rowHeight = UITableViewAutomaticDimension
        
        
        self.ui_tableView.registerNib(UINib(nibName: "TestDynamicAdaptationCell", bundle: nil), forCellReuseIdentifier: TestDynamicAdaptationIdentifier)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section != 1){
            return 2
        }else{
            return 5
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section != 1){
            return 0.1
        }else{
            return 24
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            return custonTableViewCell(indexPath)
        }else{
            return configTestDynamicAdaptationCell(tableView, indexPath: indexPath)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func custonTableViewCell(indexPath: NSIndexPath) -> UITableViewCell{
        let cellIdentifier = "TestDynamicAdaptationHeight"
        let tableViewCell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        if(indexPath.row%2 == 0){
            tableViewCell.textLabel?.text = "我来测试一下动态适配高度"
        }else{
            tableViewCell.textLabel?.text = "TestDynamicAdaptationHeightTestDynamicAdaptationHeightTestDynamicAdaptationHeight"
        }
        tableViewCell.textLabel?.numberOfLines = 0
        
        return tableViewCell
    }
    
    func configTestDynamicAdaptationCell(tableView: UITableView, indexPath: NSIndexPath) -> UITableViewCell{
        let testDynamicAdaptationCell: TestDynamicAdaptationCell = tableView.dequeueReusableCellWithIdentifier(TestDynamicAdaptationIdentifier, forIndexPath: indexPath) as! TestDynamicAdaptationCell
        let tempArray:NSMutableArray!
//        tempArray = [
//            "http://7qnd84.com2.z0.glb.qiniucdn.com/141999744232734Stz6JazN.jpg",
//            "http://7qnd84.com2.z0.glb.qiniucdn.com/14215687894454yxC2WRa54.jpg",
//            "http://7qnd84.com2.z0.glb.qiniucdn.com/1425973849385Mz0qp3ygC8.jpg",
//            "http://7qnd84.com2.z0.glb.qiniucdn.com/1430140564153nVIYjvXs2k.jpg"
//        ]
        tempArray = [
            "http://7qnd84.com2.z0.glb.qiniucdn.com/141999744232734Stz6JazN.jpg",
            "http://7qnd84.com2.z0.glb.qiniucdn.com/1425973849385Mz0qp3ygC8.jpg",
            "http://7qnd84.com2.z0.glb.qiniucdn.com/141999744232734Stz6JazN.jpg",
            "http://7qnd84.com2.z0.glb.qiniucdn.com/1425973849385Mz0qp3ygC8.jpg",
            "http://7qnd84.com2.z0.glb.qiniucdn.com/141999744232734Stz6JazN.jpg",
            "http://7qnd84.com2.z0.glb.qiniucdn.com/1425973849385Mz0qp3ygC8.jpg"
        ]
        testDynamicAdaptationCell.collectionArray = tempArray
        if(tempArray.count > 4){
            testDynamicAdaptationCell.ui_collectionHeightConstraint.constant = 102
        }else{
            testDynamicAdaptationCell.ui_collectionHeightConstraint.constant = 50
        }
        
        if(indexPath.row%2 == 0){
            testDynamicAdaptationCell.ui_testLabel?.text = "我来测试一下动态适配高度"
            
        }else{
            testDynamicAdaptationCell.ui_testLabel?.text = "TestDynamicAdaptationHeightTestDynamicAdaptationHeightTestDynamicAdaptationHeight"
        }
        
        testDynamicAdaptationCell.ui_testLabel?.numberOfLines = 0
        
        testDynamicAdaptationCell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return testDynamicAdaptationCell
    }
    
}
