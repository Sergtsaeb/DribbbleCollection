//
//  DribbbleCollectionView.swift
//  DribbbleCollection
//
//  Created by Sergelenbaatar Tsogtbaatar on 4/19/17.
//  Copyright © 2017 Serg Tsogtbaatar. All rights reserved.
//

import UIKit
import Alamofire


class DribbbleCollectionView: UIViewController {

    @IBOutlet weak var inspireCollectionView: UICollectionView!
    
    var dribbbleItems = [DribbbleCell]()
    var cellSize = CGSize()
    
    
    var shotsURL = "https://api.dribbble.com/v1/shots/"
    let accessToken = "cd1fb8d92975c1f17efb46df08f3ca9018aff49f30af187f92b0531d1194b0aa"
    let clientID = "f08f587c2beffc39e8ea5fb87a45a794f37d2c9cb62042070d099a88e976d7d9"
    let clientSecret = "ba7c4c1556986e175f3c06a6e556c6c1eafc99c6d333470bcb9affba837f9d81"
    
    typealias JSONStandard = [String: AnyObject]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.calculateCellWidth()
        callAlamo(url: shotsURL)

        self.inspireCollectionView.dataSource = self
    
        let inspireNib = UINib(nibName: "DribbbleCell", bundle: nil)
        self.inspireCollectionView.register(inspireNib, forCellWithReuseIdentifier: "cell")
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        inspireCollectionView.reloadData()
    }
    
//    func calculateCellWidth() {
//        let width = (kLazyLoadScreenSize - (CGFloat(kLazyLoadColumnsPerRow + 1.0) * kLazyLoadSpan)) / CGFloat(kLazyLoadColumnsPerRow) - 1
//        let height = width * kLazyLoadAspectRatio
//        self.cellSize = CGSize(width: width, height: height)
//    }
    
    func callAlamo(url: String) {
        
//        Alamofire.request("https://api.dribbble.com/v1/user?access_token=OAUTH_TOKEN")(DataResponse<Any>) -> Void)
        
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
//            if let value = response.result.value as? JSONStandard, let shot = value["shot"] as? JSONStandard {
//                print(shot)
//            }
            
            self.parseData(JSONData: response.data!)
            
        })
        
    }
    
    func parseData(JSONData: Data) {
        do {
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
            
            if let shots = readableJSON["shot"] as? JSONStandard {
                for shot in 0...shots.count {
                    
//                    dribbbleItems.append(shot)
                    self.inspireCollectionView.reloadData()
                }
            }
            
            print(readableJSON)
            
        } catch {
            print(error)
        }
        
    }
    
    


}



extension DribbbleCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DribbbleCell", for: indexPath) as! DribbbleCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dribbbleItems.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return cellSize
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        
//        let headerView = inspireCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "dribbbleHeader", for: indexPath)
//        
////        headerView.textInputMode.customMirror.description.capitalized
//        
//        return headerView
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        let alert = UIAlertController(title: "item selected at:", message: "Indexpath: \(indexPath)", preferredStyle: .alert)
//        
//        let alertAction = UIAlertAction(title: "Yay", style: .default, handler: nil)
//        alert.addAction(alertAction)
//        
//        self.present(alert, animated: true, completion: nil)
//        
//    }
    
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
