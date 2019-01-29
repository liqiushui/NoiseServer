//
//  CountDown.swift
//  NatureSound
//
//  Created by lunli on 2019/1/29.
//  Copyright © 2019年 lunli. All rights reserved.
//

import UIKit

class CountDown: NSObject {
    
    public var hour: Int = 0
    public var minute: Int = 5
    public var seconds: Int = 0
    public var isRuning: Bool = false
    
    public var hstr: String {
        get {
            return String.init(format: "%02d", hour)
        }
    }
    
    public var mstr: String {
        get {
            return String.init(format: "%02d", minute)
        }
    }
    
    public var sstr: String {
        get {
            return String.init(format: "%02d", seconds)
        }
    }
    
    public static let shared = CountDown.init()
    
    private override init() {
        super.init()
    }

    func timeFormate(_ formate: String = "YY : MM : SS") -> String {
        
        var result = formate
        result = result.replacingOccurrences(of: "YY", with: hstr)
        result = result.replacingOccurrences(of: "MM", with: mstr)
        result = result.replacingOccurrences(of: "SS", with: sstr)
        
        return result
    }
}
