//
//  SoundSlider.swift
//  NatureSound
//
//  Created by lunli on 2019/1/28.
//  Copyright © 2019年 lunli. All rights reserved.
//

import UIKit

class SoundSlider: UISlider {

    override func awakeFromNib() {
        super.awakeFromNib()
        setThumbImage(UIImage.init(named: "slider.png"), for: UIControl.State.normal)
    }

}
