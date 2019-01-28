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
        }
        
        setNeedsDisplay()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        playBtn.isEnabled = false
    }
    
    @IBOutlet weak var playBtn: UIButton!
    
}
