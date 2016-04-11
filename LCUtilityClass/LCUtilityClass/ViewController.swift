//
//  ViewController.swift
//  LCUtilityClass
//
//  Created by liuchao on 16/4/11.
//  Copyright © 2016年 LiuChao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.redColor()
        
        // 获取十六进制颜色
        self.view.backgroundColor = LCColorWithHexString.colorWithF2F3F4()
        self.view.backgroundColor = LCColorWithHexString.colorWithHexString("#658ad6")

        // 检查字符串是否为空
        var testStr = ""
        if (LCCheckNullString.checkNullString(testStr, excludes: false)) {
            print("isNullString");
        }else {
            print("isNotNullString");
        }
        
        testStr = "isNotNullString"
        if (LCCheckNullString.checkNullString(testStr, excludes: false)) {
            print("isNullString");
        }else {
            print("isNotNullString");
        }
        
        testStr = String()
        if (LCCheckNullString.checkNullString(testStr, excludes: false)) {
            print("isNullString");
        }else {
            print("isNotNullString");
        }
        
        // md5加密
        let md5Str = LCMD5String.md5encryption("123123")
        print(md5Str)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

