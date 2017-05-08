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
    
    var shotsURL = "https://api.dribbble.com/v1/shots/:471756"
    
    
    typealias JSONStandard = [String: AnyObject]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAlamo(url: shotsURL)

        self.inspireCollectionView.delegate = self
        self.inspireCollectionView.dataSource = self
        
        
        let inspireNib = UINib(nibName: "DribbbleCell", bundle: nil)
        self.inspireCollectionView.register(inspireNib, forCellWithReuseIdentifier: "DribbbleCell")
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        inspireCollectionView.reloadData()
    
    }
    
    func callAlamo(url: String) {
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = inspireCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "dribbbleHeader", for: indexPath)
        
//        headerView.textInputMode.customMirror.description.capitalized
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "item selected at:", message: "Indexpath: \(indexPath)", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Yay", style: .default, handler: nil)
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let picDimension = self.view.frame.size.width / 4.0
        return CGSize(width: picDimension, height: picDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let leftRightInset = self.view.frame.size.width / 14.0
        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
    }
    
    
}
