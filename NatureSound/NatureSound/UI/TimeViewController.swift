//
//  TimeViewController.swift
//  NatureSound
//
//  Created by lunli on 2019/1/29.
//  Copyright © 2019年 lunli. All rights reserved.
//

import UIKit
import LGButton
import NSLogger
import SnapKit

class TimeViewController: UIViewController, DPTimePickerDelegate {

    @IBOutlet weak var timeBtn: LGButton!
    
    @IBOutlet weak var startBtn: LGButton!
    
    @IBOutlet weak var stopBtn: LGButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Time Setup"
        timeBtn.titleString = CountDown.shared.timeFormate()
        view.backgroundColor = UIColor.hexStringToUIColor(hex: "EC8371")
        
        updateButtons()
    }
    
    
    func updateButtons() {
        if CountDown.shared.isRuning {
            timeBtn.titleColor = UIColor.darkText
            startBtn.titleColor = UIColor.lightGray
            stopBtn.titleColor = UIColor.darkText
        }
        else {
            timeBtn.titleColor = UIColor.lightGray
            startBtn.titleColor = UIColor.darkText
            stopBtn.titleColor = UIColor.lightGray
        }
    }
    

    @IBAction func modifyTimeCounddown(_ sender: LGButton) {
      
        
        Logger.shared.log(.model, .info, "modifyTimeCounddown vc")
        
        let container = UIView.init(frame: CGRect.init(x: view.safeAreaInsets.left,
                                                       y: view.safeAreaInsets.top,
                                                       width: view.bounds.width - view.safeAreaInsets.left - view.safeAreaInsets.right,
                                                       height: view.bounds.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom))
        container.backgroundColor = UIColor.clear
        container.tag = 1234
        view.addSubview(container)
        container.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }

        let timePicker: DPTimePicker = DPTimePicker.timePicker()
        timePicker.initialMinute = CountDown.shared.mstr
        timePicker.initialHour = CountDown.shared.hstr
        timePicker.insertInView(container)
        /*
         Customization goes here
         */
        timePicker.delegate = self
        timePicker.show(nil)
        animateBgColor(color: UIColor.hexStringToUIColor(hex: "FD7F24"))
    }
    
    func animateBgColor(color: UIColor) {
        
        UIView.animateKeyframes(withDuration: 0.25,
                                delay: 0,
                                options: UIView.KeyframeAnimationOptions(rawValue: UIView.KeyframeAnimationOptions.allowUserInteraction.rawValue | UIView.KeyframeAnimationOptions.beginFromCurrentState.rawValue),
                                animations: { [unowned self] in
                                    
            self.view.backgroundColor = color
                                    
        }) { (complete) in
            Logger.shared.log(.model, .info, "animateBgColor \(color) complete \(complete)")
        }
        view.backgroundColor = color
    }
    
    func dismiss() {
        view.viewWithTag(1234)!.removeFromSuperview()
        animateBgColor(color: UIColor.hexStringToUIColor(hex: "EC8371"))
    }

    func timePickerDidConfirm(_ hour: String, minute: String, timePicker: DPTimePicker) {
        Logger.shared.log(.model, .info, "Confirm vc hour \(hour) minute \(minute)")
        dismiss()
    }
    

    func timePickerDidClose(_ timePicker: DPTimePicker) {
        Logger.shared.log(.model, .info, "Cancel vc")
        dismiss()
    }
    
    @IBAction func stopClick(_ sender: LGButton) {
        Logger.shared.log(.model, .info, "stopClick")

    }
    
    @IBAction func startClick(_ sender: LGButton) {
        Logger.shared.log(.model, .info, "startClick")

    }
    
}
