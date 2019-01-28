//
//  ViewController.swift
//  NatureSound
//
//  Created by lunli on 2019/1/25.
//  Copyright © 2019年 lunli. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource,  UICollectionViewDelegate, AVAudioPlayerDelegate{
    
    @IBOutlet weak var colview: UICollectionView!
    
    public var model: SoundViewModel = SoundViewModel.init(models: SoundModelCenter.shareInstance().list)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colview.register(UINib(nibName: "SoundCollectionViewCell", bundle: nil),
                         forCellWithReuseIdentifier: "SoundCollectionViewCell")
        
        setupLayout()
        setupNotis()
    }
    
    func setupNotis() {
        
        NotificationCenter.default.addObserver(self, selector:#selector(handleVolumeChange(_:)),
                                               name: Noti.VolumeChangeNoti,
                                               object: nil)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! SoundCollectionViewCell
        cell.model!.selected = !cell.model!.selected
        cell.updateUI()
        tryPlayItem(item: cell.model!)
    }
    
    func tryPlayItem(item : SoundPlayItem) {
        if item.selected {
            if let path = item.model.url {
                
                let audioPath = Bundle.main.path(forResource: path,
                                                 ofType: "")
                if audioPath != nil, let Url = URL.init(string: audioPath!) {
                    
                    NSAudioPlayCenter.shareCenter().playAudio(url: Url,
                                                              key: item.model.soundID!,
                                                              delegate: self)
                }

            }
        }
        else {
            NSAudioPlayCenter.shareCenter().stopPlayAudio(key: item.model.soundID!)
        }
    }
    
    @objc func handleVolumeChange(_ noti: Notification) {
        
        let volume = noti.userInfo!["volume"] as! Float
        let key = noti.userInfo!["key"] as! String
        NSAudioPlayCenter.shareCenter().changeVolume(key: key, volume: volume)
    }
}

