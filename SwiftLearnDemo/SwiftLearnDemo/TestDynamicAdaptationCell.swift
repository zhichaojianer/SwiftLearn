//
//  TestDynamicAdaptationCell.swift
//  SwiftLearn001
//
//  Created by 刘超-EriC on 15/12/5.
//  Copyright © 2015年 刘超. All rights reserved.
//

import UIKit

let TestDynamicAdaptationIdentifier = "TestDynamicAdaptationIdentifier"

class TestDynamicAdaptationCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var ui_testLabel: UILabel!
    @IBOutlet weak var ui_collectionView: UICollectionView!
    @IBOutlet weak var ui_collectionHeightConstraint: NSLayoutConstraint!
    
    var collectionArray: NSMutableArray!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        self.ui_collectionView.dataSource = self;
        self.ui_collectionView.delegate = self;
        
        self.ui_collectionView.registerNib(UINib(nibName: "TestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: TestCollectionIdentifier)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.collectionArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(TestCollectionIdentifier, forIndexPath: indexPath) as! TestCollectionViewCell
        
//        let headUrl:NSURL!
//        let headImage:UIImage!
//        let headImageData:NSData!
//        
//        headUrl = NSURL.init(string: self.collectionArray[indexPath.row] as! String)
//        headImageData = NSData.init(contentsOfURL: headUrl)
//        headImage = UIImage.init(data: headImageData)
        
//        headImage = UIImage.init(named: self.collectionArray[indexPath.row] as! String)
//        cell.ui_headImageView.image = headImage

        ImageLoader.sharedLoader.imageForUrl(self.collectionArray[indexPath.row] as! String) { (image, url) -> () in
            cell.ui_headImageView.image = image
        }
        
        
        return cell
    }
        
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 2.0
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize.init(width: 50.0, height: 50.0)
    }
}
