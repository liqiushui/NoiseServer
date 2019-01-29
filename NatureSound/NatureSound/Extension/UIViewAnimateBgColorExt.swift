//
//  UIViewAnimateBgColorExt.swift
//  NatureSound
//
//  Created by lunli on 2019/1/28.
//  Copyright © 2019年 lunli. All rights reserved.
//

import UIKit

extension UIView {
    
    @objc func startRandomAnimation() {
        
        let key = "randomAnimationBgColorRuning"
        if extDic[key] == nil || (extDic[key] as! Bool) == false {
            
            extDic[key] = true
            let colors = ["#1abc9c", "#3498db", "#ea5b4d", "#9b59b6", "#34495e", "#16a085", "#27ae60", "#2980b9", "#f1c40f", "#e67e22", "#e74c3c", "#f39c12", "#d35400", "#c0392b", "#06b3db", "#e3b63d", "#dc3d66", "#bd3559", "#0082c8", "#16528e", "#e54b4b", "#a2c5bf", "#167c80", "#72616e", "#72BDC2", "#F99899", "#2C9AB7", "#52BAD5", "#6DC5DC", "#B1E0EC", "#449A88", "#72C1B0", "#95D1C4", "#C5E5DE", "#FEBE12", "#FED156", "#DB3A1B", "#E85C41", "#EE836E", "#66CC99", "#8A9BB1", "#CC89A2", "#C26787", "#64AE60", "#27695E", "#993366", "#8E368B", "#345773", "#E8755C", "#DB334E", "#98AE60", "#78AD45", "#547B30", "#527D5A", "#D83944", "#993366", "#782344", "#8ADCB3"]
            
            UIView.animate(withDuration: 3.0,
                           delay: 0,
                           options: UIView.AnimationOptions.allowUserInteraction,
                           animations: { [unowned self] in
                self.backgroundColor = UIColor.hexStringToUIColor(hex: colors.randomElement()!)

                }) { [unowned self] complete in
                
                self.extDic[key] = false
                self.perform(#selector(self.startRandomAnimation))
            }
        }
    }
}
