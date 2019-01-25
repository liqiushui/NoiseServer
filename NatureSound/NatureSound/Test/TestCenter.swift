//
//  TestCenter.swift
//  NatureSound
//
//  Created by lunli on 2019/1/25.
//  Copyright © 2019年 lunli. All rights reserved.
//

import UIKit

class TestCenter: NSObject {
    
    static func testModelCenter() {
        SoundModelCenter.shareInstance().loadList()
    }

}
