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

class DribbbleCollectionViewController: UIViewController, UITabBarControllerDelegate {
    @IBOutlet weak var inspireCollectionView: UICollectionView!
    
    var token = ""
    var dribbbleItems = [Shot]()
    var cellSize = CGSize()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DribbbleAPI.shared.getUser()
        checkToken()
        
        self.inspireCollectionView.dataSource = self
        let inspireNib = UINib(nibName: "DribbbleCell", bundle: nil)
        self.inspireCollectionView.register(inspireNib, forCellWithReuseIdentifier: "DribbbleCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        inspireCollectionView.reloadData()
    }
    
    func checkToken() {
        let token = UserDefaults.standard.object(forKey: "access_token")
        let loginVC = LoginViewController()
        
        if token == nil {
            self.present(loginVC, animated: true, completion: nil)
        } else {
            print("Already logged in!")
        }
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
        
        let cell = inspireCollectionView.dequeueReusableCell(withReuseIdentifier: "DribbbleCell", for: indexPath) as! DribbbleCell
        cell.backgroundColor = UIColor.red
//        cell.titleLabel.text = dribbbleItems[indexPath.row].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dribbbleItems.count
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    
}
