//
//  CountDown.swift
//  NatureSound
//
//  Created by lunli on 2019/1/29.
//  Copyright © 2019年 lunli. All rights reserved.
//

import UIKit
import NSLogger


class CountDown: NSObject {
    
    public var hour: Int = 0
    public var minute: Int = 5
    public var seconds: Int = 0
    public var isRuning: Bool = false
    public var isPause: Bool = false
    public var totalSecs : Int = 0
    private var timer : Timer?
    
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
    
    public func updateCountDown(_ hour: Int, _ minute: Int) {
        
        guard !isRuning else {
            Logger.shared.log(.model, .warning, "startCountDown hour \(hour) minute \(minute) already runing")
            return
        }
        
        self.hour = hour
        self.minute = minute
        self.seconds = 0
        
        self.totalSecs = hour * 60 * 60 + minute * 60
    }
    
    public func startCountDown() {
        
        guard !isRuning else {
            Logger.shared.log(.model, .warning, "startCountDown already runing")
            return
        }

        
        DispatchQueue.main.async { [unowned self] in
            
            self.timer = Timer.init(timeInterval: 1, repeats: true, block: { [unowned self] (timer) in
                
                guard self.isRuning && !self.isPause else {
                    
                    Logger.shared.log(.model, .warning, "Timer Call Back \(self.isRuning) \(self.isPause)")
                    return
                }
                self.totalSecs -= 1
                self.updateHMSFromTotalSecs()
            })
            
            RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.common)
            self.isRuning = true
        }
    }
    
    public func stopCountDown () {
        
        guard isRuning else {
            Logger.shared.log(.model, .warning, "pauseCountDown not runing")
            return
        }

        
        self.timer?.invalidate()
        self.timer = nil
        isRuning = false
        
    }
    
    
    public func pauseCountDown () {
        
        guard isRuning else {
            Logger.shared.log(.model, .warning, "pauseCountDown not runing")
            return
        }
        guard !isPause else {
            Logger.shared.log(.model, .warning, "pauseCountDown already pause")
            return
        }
        
        isPause = true
    }
    
    public func resumeCountDown () {
        
        guard isRuning else {
            Logger.shared.log(.model, .warning, "pauseCountDown not runing")
            return
        }
        guard isPause else {
            Logger.shared.log(.model, .warning, "pauseCountDown not pause")
            return
        }
        
        isPause = false
    }
    
    func updateHMSFromTotalSecs() {
        
        guard totalSecs > 0 else {
            totalSecs = 0
            hour = 0
            minute = 0
            seconds = 0
            timeUp()
            return
        }
        hour = Int(totalSecs/3600)
        minute = Int((totalSecs - hour * 3600 )/60)
        seconds = Int(totalSecs - hour * 60 * 60 - minute * 60)
        notifyCounterChange()
    }
    
    func timeUp() {
        
        Logger.shared.log(.model, .important, "CountDown timeup")
        stopCountDown()
        notifyCounterChange()
    }
    
    public func notifyCounterChange() {
        
        NotificationCenter.default.post(name: Noti.CountDownChangeNoti,
                                        object: nil,
                                        userInfo: ["timeup":totalSecs == 0 ?true:false,
                                                   "isruning":isRuning])
        
    }
}
