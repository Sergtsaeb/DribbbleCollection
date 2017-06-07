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
        
//        updateImageForCell(cell, inCollectionView: collectionView, withEntry: dribbbleItems[(indexPath as NSIndexPath).row] as! String, atIndexPath: indexPath)
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dribbbleItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
//    func updateImageForCell(_ cell: UICollectionViewCell, inCollectionView collectionView: UICollectionView, withEntry: String, atIndexPath indexPath: IndexPath) {
//        let imageView = cell.viewWithTag(kLazyLoadCellImageViewTag) as! UIImageView
//        //imageView.image = kLazyLoadPlaceholderImage
//        // load image.
//        let imageURL = dribbbleItems[(indexPath as NSIndexPath).row]
////        ImageManager.sharedInstance.downloadImageFromURL(imageURL) { (success, image) -> Void in
//            if success && image != nil {
//                if (collectionView.indexPath(for: cell) as NSIndexPath?)?.row == (indexPath as NSIndexPath).row {
//                    imageView.image = image
//                }
//            }
//        }
//    }
    

    

    
}
