//
//  SoundCollectionViewCell.swift
//  NatureSound
//
//  Created by lunli on 2019/1/25.
//  Copyright © 2019年 lunli. All rights reserved.
//

import UIKit

class SoundCollectionViewCell: UICollectionViewCell {

    public var model: SoundPlayItem? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        
        playBtn.setImage(nil, for: UIControl.State.normal)
        
        if let m = model {
            
            let icon = m.model.normalIcon ?? ""
            let img = UIImage.init(imageLiteralResourceName: icon)
            if m.selected {
                
                playBtn.setImage(img, for: UIControl.State.normal)
                playBtn.setImage(img, for: UIControl.State.disabled)
            }
            else {
                
                playBtn.setImage(img.tintedImageUsingColor(tintColor: UIColor.gray),
                                 for: UIControl.State.normal)
                playBtn.setImage(img.tintedImageUsingColor(tintColor: UIColor.gray),
                                 for: UIControl.State.disabled)
            }
            volumeSlider.isHidden = !m.selected
            volumeSlider.setValue(m.volume, animated: true)
        }
        
        setNeedsDisplay()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        playBtn.isEnabled = false
    }
    
    @IBAction func volumeChange(_ sender: UISlider) {
        if let m = model {
            m.volume = sender.value
            NotificationCenter.default.post(name: Noti.VolumeChangeNoti,
                                            object: nil,
                                            userInfo: ["key":m.model.soundID!, "volume": sender.value])
            
        }
    }
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
}
