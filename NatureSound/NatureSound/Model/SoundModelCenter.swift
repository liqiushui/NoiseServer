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
        loadList()
    }

    public func loadList() {
        
        Logger.shared.logToConsole()
        if let path = Bundle.main.path(forResource: "list", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path),
                                    options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>{
                    Logger.shared.log(.model, .error, "loadList " + jsonResult.description )
                    handleRespDic(rspDic: jsonResult)
                }
            } catch {
                
                Logger.shared.log(.model, .error, "loadList " + error.localizedDescription)
            }
        }
        
    }
    
    
    func handleRespDic(rspDic:Dictionary<String, AnyObject>) {
        
        let tmpVer = rspDic["version"] as? Int ?? 0
        var tmpList:[SoundItem] = []
        if let list = rspDic["list"] as? [Dictionary<String, AnyObject>] {
            for dic in list {
                if let item = itenDicToModel(itemDic: dic) {
                    tmpList.append(item)
                }
            }
        }
        
        if(tmpVer > ver) {
            ver = tmpVer
            list = tmpList
        }
    }
    
    func itenDicToModel(itemDic:Dictionary<String, AnyObject>) -> SoundItem? {
    
        let id  = itemDic["soundID"] as? String
        let url = itemDic["url"] as? String
        let normalIcon = itemDic["normalIcon"] as? String
        let selectedIcon = itemDic["selectedIcon"] as? String
        let sourceType = itemDic["sourceType"] as? Int
    
        let item = SoundItem.init()
        
        if id != nil
            && url != nil
            && normalIcon != nil
            && selectedIcon != nil
            && sourceType != nil {
            
            item.soundID = id!
            item.url = url!
            item.normalIcon = normalIcon!
            item.selectedIcon = selectedIcon!
            item.sourceType = sourceType!
            
            return item
        }
        
        return nil
    }
}
