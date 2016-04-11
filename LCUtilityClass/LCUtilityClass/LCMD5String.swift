//
//  LCMD5String.swift
//  LCUtilityClass
//
//  Created by liuchao on 16/4/11.
//  Copyright © 2016年 LiuChao. All rights reserved.
//

import UIKit

class LCMD5String: NSString {
    
    /**
     *  @brief md5加密
     */
    
    static func md5encryption (str: NSString) -> NSString {
        
        let cStr = str.UTF8String
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let buffer = UnsafeMutablePointer<UInt8>.alloc(digestLen)
        CC_MD5(cStr,(CC_LONG)(strlen(cStr)), buffer)
        let md5String:NSMutableString = NSMutableString();
        for i in 0 ..< digestLen {
            md5String.appendFormat("%02x", buffer[i]);
        }
        free(buffer)
        
        return String(md5String);
    }
}
