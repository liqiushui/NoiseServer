//
//  NSAudioPlayCenter.swift
//  NatureSound
//
//  Created by lunli on 2019/1/28.
//  Copyright © 2019年 lunli. All rights reserved.
//

import UIKit
import AVFoundation
import NSLogger

class NSAudioPlayCenter: NSObject {
    
    static private let shared = NSAudioPlayCenter.init()
    var mDic = Dictionary<String, AVAudioPlayer>()
    
    private override init() {
        super.init()
    }
    
    static func shareCenter() -> NSAudioPlayCenter {
        return NSAudioPlayCenter.shared
    }
    
    public func playAudio(url:URL, key:String, delegate:AVAudioPlayerDelegate) {
        
        let keyExists = mDic[key] != nil
        var player:AVAudioPlayer? = nil
        
        if !keyExists {
            player = createAudioPlayer(url: url, delegate: delegate)
        }
        else {
            player = mDic[key]
        }
        
        if player != nil && !player!.isPlaying {
            configAudioSession()
            player!.prepareToPlay()
            player!.play()
            mDic[key] = player
        }
    }
    
    public func stopPlayAudio(key:String) {
        
        let keyExists = mDic[key] != nil
        var player:AVAudioPlayer? = nil
        
        if keyExists {
            player = mDic[key]
        }

        if player != nil && player!.isPlaying {
            player?.pause()
        }
    }

    public func createAudioPlayer(url:URL, delegate:AVAudioPlayerDelegate) -> AVAudioPlayer? {
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.delegate = delegate
            return player
        } catch let error {
            Logger.shared.log(.model, Logger.Level.error, "createAudioPlayer error \(error)")
            return nil
        }
    }
    
    
    
    
    func configAudioSession() {
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default, options: .mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)

        } catch let error {
            
            Logger.shared.log(.model, Logger.Level.error, "configAudioSession error \(error)")
        }
    }
}
