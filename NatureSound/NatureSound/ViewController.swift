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
    
    public var model: SoundViewModel = SoundViewModel.init(models: SoundModelCenter.shareInstance().list)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colview.register(UINib(nibName: "SoundCollectionViewCell", bundle: nil),
                         forCellWithReuseIdentifier: "SoundCollectionViewCell")
        
        setupLayout()
    }
    
    func setupLayout() {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20;
        layout.minimumInteritemSpacing = 30;
        layout.headerReferenceSize = CGSize.init(width: self.view.bounds.width, height: 50)
        layout.itemSize = CGSize.init(width: (self.view.bounds.width - 40 - 30)/2, height: 100)
        colview.collectionViewLayout = layout
        
    }
    

    @objc func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return model.models.count
    }
    
    @objc func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SoundCollectionViewCell",
                                                      for: indexPath) as! SoundCollectionViewCell
        cell.model = model.models[indexPath.row]
        
        return cell
    }
}

