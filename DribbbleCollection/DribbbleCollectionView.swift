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

    
    typealias JSONStandard = [String: AnyObject]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calculateCellWidth()
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
    
       

    // MARK: - Lazy Loading of cells
    
//    func loadImagesForOnscreenRows() {
//        if dribbbleItems.count > 0 {
//            let visiblePaths = inspireCollectionView.indexPathsForVisibleItems
//            for indexPath in visiblePaths {
////                let entry = dribbbleItems[(indexPath as NSIndexPath).row]
//                let cell = self.collectionView(inspireCollectionView, cellForItemAt: indexPath)
//                updateImageForCell(cell, inCollectionView: inspireCollectionView, withEntry: "dribbbleItems", atIndexPath: indexPath)
//            }
//        }
//    }
    
    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        loadImagesForOnscreenRows()
//    }
//    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if !decelerate { loadImagesForOnscreenRows() }
//    }

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
//        ImageManager.sharedInstance.downloadImageFromURL(imageURL as! String) { (success, image) -> Void in
//            if success && image != nil {
//                if (collectionView.indexPath(for: cell) as NSIndexPath?)?.row == (indexPath as NSIndexPath).row {
//                    imageView.image = image
//                }
//            }
//        }
//    }


    

    
}
