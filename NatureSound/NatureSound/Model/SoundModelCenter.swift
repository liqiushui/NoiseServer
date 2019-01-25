//
//  SoundModelCenter.swift
//  NatureSound
//
//  Created by lunli on 2019/1/25.
//  Copyright © 2019年 lunli. All rights reserved.
//

import UIKit
import NSLogger

class SoundModelCenter: NSObject {
    
    public var list:[SoundItem]
    public var ver:Int = 0
    
    private static let sharedManager: SoundModelCenter = {
        let shared = SoundModelCenter()
        return shared
    }()

    static func shareInstance() -> SoundModelCenter{
        
        return sharedManager;
    }
    
    private override init() {
        list = []
        super.init()
    }

    public func loadList() {
        Logger.shared.log(.model, .info, "loadList")

    }
}
