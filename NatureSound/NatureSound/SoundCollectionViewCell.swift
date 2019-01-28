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
        
        if let icon = model?.model.normalIcon {
            let img = UIImage.init(imageLiteralResourceName: icon)
            playBtn.setImage(img, for: UIControl.State.normal)
        }

        setNeedsDisplay()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var playBtn: UIButton!
    
}
