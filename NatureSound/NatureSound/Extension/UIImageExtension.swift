//
//  UIImageExtension.swift
//  NatureSound
//
//  Created by lunli on 2019/1/28.
//  Copyright © 2019年 lunli. All rights reserved.
//

import UIKit

extension UIImage {
    
    func tintedImageUsingColor(tintColor : UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
        let drawRect = CGRect.init(x: 0, y: 0, width: self.size.width, height: self.size.height)
        draw(in: drawRect)
        tintColor.set()
        UIRectFillUsingBlendMode(drawRect, CGBlendMode.sourceIn)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return tintedImage!;
    }
    
    
}
