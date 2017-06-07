//
//  DribbbleCollectionView.swift
//  DribbbleCollection
//
//  Created by Sergelenbaatar Tsogtbaatar on 4/19/17.
//  Copyright © 2017 Serg Tsogtbaatar. All rights reserved.
//

import UIKit
import Alamofire

private let kLazyLoadScreenSize = UIScreen.main.bounds.width
private let kLazyLoadCellImageViewTag = 1
private let kLazyLoadSpan: CGFloat = 10.0
private let kLazyLoadAspectRatio: CGFloat = 1.0 // width / height aspect ratio for non square cells.
private let kLazyLoadColumnsPerRow: CGFloat = 3.0 // number of columns for every row.

class DribbbleCollectionViewController: UIViewController {

    @IBOutlet weak var inspireCollectionView: UICollectionView!
    
    var dribbbleItems = [Any]()
    var cellSize = CGSize()
    
    
    var shotsURL = "https://api.dribbble.com/v1/shots/"
    let accessToken = "cd1fb8d92975c1f17efb46df08f3ca9018aff49f30af187f92b0531d1194b0aa"
    let clientID = "f08f587c2beffc39e8ea5fb87a45a794f37d2c9cb62042070d099a88e976d7d9"
    let clientSecret = "ba7c4c1556986e175f3c06a6e556c6c1eafc99c6d333470bcb9affba837f9d81"
    
    typealias JSONStandard = [String: AnyObject]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calculateCellWidth()
        
        callAlamo(url: shotsURL)
        
//        self.inspireCollectionView.dataSource = self
        
        let inspireNib = UINib(nibName: "DribbbleCell", bundle: nil)
        self.inspireCollectionView.register(inspireNib, forCellWithReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        inspireCollectionView.reloadData()
    }

    func calculateCellWidth() {
        let width = (kLazyLoadScreenSize - (CGFloat(kLazyLoadColumnsPerRow + 1.0) * kLazyLoadSpan)) / CGFloat(kLazyLoadColumnsPerRow) - 1
        let height = width * kLazyLoadAspectRatio // square factor: 1
        self.cellSize = CGSize(width: width, height: height)
    }


}



extension DribbbleCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DribbbleCell", for: indexPath) as! DribbbleCell
        
//        let imageView = cell.viewWithTag(kLazyLoadCellImageViewTag) as! UIImageView
        //        imageView.image = kLazyLoadPlaceholderImage
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dribbbleItems.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return cellSize
    }
    

    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        let picDimension = self.view.frame.size.width / 4.0
//        return CGSize(width: picDimension, height: picDimension)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        
//        let leftRightInset = self.view.frame.size.width / 14.0
//        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
//    }
    
    
}
