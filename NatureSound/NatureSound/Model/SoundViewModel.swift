//
//  SoundViewModel.swift
//  NatureSound
//
//  Created by lunli on 2019/1/28.
//  Copyright © 2019年 lunli. All rights reserved.
//

import UIKit

class SoundViewModel: NSObject {
    
    public var models : [SoundPlayItem] = []
    
    override init() {
        super.init()
    }
    
    
    convenience init( models : [SoundItem]) {
        self.init()
        mergeModels(models: models)
    }
    
    
    func mergeModels(models : [SoundItem]) {
        models.forEach { (sItem) in
            mergeModel(model: sItem)
        }
    }
    
    func mergeModel(model : SoundItem)  {
        
        let sPlayItem = SoundPlayItem.init(item: model)
        if !models.contains(sPlayItem) {
            models.append(sPlayItem)
        }
    }

}
