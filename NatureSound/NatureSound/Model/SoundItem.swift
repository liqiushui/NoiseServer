//
//  SoundItem.swift
//  NatureSound
//
//  Created by lunli on 2019/1/25.
//  Copyright © 2019年 lunli. All rights reserved.
//

import UIKit

class SoundItem: NSObject {
    
    public var soundID: String?
    public var url: String?
    public var normalIcon: String?
    public var selectedIcon: String?
    //0 表示本地资源 1 表示远程资源
    public var sourceType: Int = 0
    
    @objc override func isEqual(_ object: Any?) -> Bool {
        
        if let otherItem = object as? SoundItem {
            return self.soundID == otherItem.soundID
        }
        return false
    }
    
}


class SoundPlayItem: NSObject {
    
    public var model:SoundItem
    public var selected:Bool = false
    public var playing:Bool = false
    public var volume:Float = 0.8

    init(item:SoundItem) {
        self.model = item
        super.init()
    }
    
    @objc override func isEqual(_ object: Any?) -> Bool {
        
        if let otherItem = object as? SoundPlayItem {
            return self.model.soundID == otherItem.model.soundID
        }
        return false
    }
}
