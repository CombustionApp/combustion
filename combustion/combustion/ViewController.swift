//
//  ViewController.swift
//  combustion
//
//  Created by Sergio Pichardo on 2/24/16.
//  Copyright © 2016 SergioPichardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //rows
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 40
    }
    //columns
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if indexPath.row % 2 == 0{
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellLeft", forIndexPath: indexPath)
        }
        else{
            cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellRight", forIndexPath: indexPath)
        }
        // Configure the cell
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    }
}

