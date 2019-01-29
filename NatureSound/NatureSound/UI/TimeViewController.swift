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


class TimeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Time Setup"
    }
    

    @IBAction func modifyTimeCounddown(_ sender: LGButton) {
      
        
        
        Logger.shared.log(.model, .info, "modifyTimeCounddown vc")
                

        let timePicker: DPTimePicker = DPTimePicker.timePicker()
        timePicker.insertInView(view)
        
        /*
         Customization goes here
         */
        
        timePicker.show(nil)
        
    }


}
