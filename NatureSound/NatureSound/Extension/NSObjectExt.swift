//
//  NSObjectExt.swift
//  NatureSound
//
//  Created by lunli on 2019/1/28.
//  Copyright © 2019年 lunli. All rights reserved.
//

import Foundation

extension NSObject {
    
    private struct extDicKey {
        
        static var name: String = ""
    }
    
    var extDic: Dictionary<String, Any>{
        get {
            guard let theDic = objc_getAssociatedObject(self, &extDicKey.name) as? Dictionary<String, Any> else {
                var temp: Dictionary<String, Any> = [:]
                self.extDic = temp
                return temp
            }
            return theDic
        }
        set {
            objc_setAssociatedObject(self, &extDicKey.name, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
}
