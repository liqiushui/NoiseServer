//
//  ViewController.swift
//  NatureSound
//
//  Created by lunli on 2019/1/25.
//  Copyright © 2019年 lunli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource,  UICollectionViewDelegate{

    
    
    @IBOutlet weak var colview: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @objc func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
    }
    
    @objc func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell.init()
    }
}

