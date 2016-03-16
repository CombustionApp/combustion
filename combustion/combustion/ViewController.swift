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
    
    let cellSize = CGSize(width: 295, height: 203)
    var cellScale: CGFloat!
    var thisLineIsRightColumn: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cellScale = (cellSize.width)/(cellSize.height)
        
        
        //setting collection view
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.pagingEnabled = false
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //rows number
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 40
    }
    //columns number
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    //If the column is on the right, the cell used from storyboard will be on the right, and the same for the left side
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        print(" ")
        print("section \(indexPath.section)")
        print("row \(indexPath.row)")
        print("remainder \(indexPath.section % 2)")

        //ir row is 0, it will be left cell, if it is 1, it will be right cell
        if indexPath.row == 0{
            let cellLeft = collectionView.dequeueReusableCellWithReuseIdentifier("cellLeft", forIndexPath: indexPath) as! LeftCollectionViewCell
            cellLeft.balloonButton.hidden = false

            //if section is odd
            if(indexPath.section % 2 != 0){
                print("hide left")
                cellLeft.balloonButton.hidden = true
            }
            
            return cellLeft
        }
            
        else{
            let cellRight = collectionView.dequeueReusableCellWithReuseIdentifier("cellRight", forIndexPath: indexPath) as! RightCollectionViewCell
            cellRight.balloonButton.hidden = false

            
            //now using right side
            if(indexPath.section % 2 == 0){
                print("hide right")
                cellRight.balloonButton.hidden = true
            }
           
            
            return cellRight
        }
    }
    //size of each column
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        //cell needs to be half of screen, so button will be in middle
        let cellWidth = self.view.frame.width/2
        //changing height dinamically with correct scale from storyboard
        let cellHeight = cellSize.height - (cellSize.width - cellWidth)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    //layout (distance between corners and view) of each column
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: 0, bottom: 10, right: 0)
    }
    //space between columns
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}

