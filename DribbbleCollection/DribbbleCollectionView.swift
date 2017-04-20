//
//  DribbbleCollectionView.swift
//  DribbbleCollection
//
//  Created by Sergelenbaatar Tsogtbaatar on 4/19/17.
//  Copyright © 2017 Serg Tsogtbaatar. All rights reserved.
//

import UIKit

class DribbbleCollectionView: UIViewController {

    @IBOutlet weak var inspireCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.inspireCollectionView.delegate = self
        self.inspireCollectionView.dataSource = self
        
        let inspireNib = UINib(nibName: "DribbbleCell", bundle: nil)
        self.inspireCollectionView.register(inspireNib, forCellWithReuseIdentifier: "DribbbleCell")
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        inspireCollectionView.reloadData()
    
    }
    
    


}

extension DribbbleCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DribbbleCell", for: indexPath) as! DribbbleCell
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
}
