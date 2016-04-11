//
//  LCCheckNullString.swift
//  LCUtilityClass
//
//  Created by liuchao on 16/4/11.
//  Copyright © 2016年 LiuChao. All rights reserved.
//

import UIKit

class LCCheckNullString: NSString {
    
    /**
    *  @brief 检查字符串是否为空
    */
    
    static func checkNullString (var str: NSString, excludes: Bool) -> Bool {
        
        if (excludes) {
            // 不包括空白字符在内的字符串
            str = str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        }
        
        var isNullStr:Bool = true
        if(!str.isEqual(NSNull) && !str.isEqualToString("<null>") && !str.isEqualToString("(null)") && !str.isEqualToString("")) {
            isNullStr = false
        }
        
        return isNullStr;
    }

}
