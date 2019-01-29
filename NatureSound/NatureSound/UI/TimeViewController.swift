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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Time Setup"
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
        timePicker.insertInView(container)
        
        /*
         Customization goes here
         */
        timePicker.delegate = self
        timePicker.show(nil)
        
    }

    func timePickerDidConfirm(_ hour: String, minute: String, timePicker: DPTimePicker) {
        Logger.shared.log(.model, .info, "Confirm vc hour \(hour) minute \(minute)")
        view.viewWithTag(1234)!.removeFromSuperview()
    }
    
    func timePickerDidClose(_ timePicker: DPTimePicker) {
        Logger.shared.log(.model, .info, "Cancel vc")
        view.viewWithTag(1234)!.removeFromSuperview()
    }
}
