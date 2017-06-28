//
//  TabViewController.swift
//  DribbbleCollection
//
//  Created by Sergelenbaatar Tsogtbaatar on 6/27/17.
//  Copyright © 2017 Serg Tsogtbaatar. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class TabViewController: TabmanViewController, PageboyViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func viewControllers(forPageboyViewController pageboyViewController: PageboyViewController) -> [UIViewController]? {
        // return array of view controllers
        let viewController = [DribbbleCollectionViewController]()
        
        let popularTab = TabmanBarItem(title: "Popular")
        let mobileTab = TabmanBarItem(title: "Mobile")
        
        // configure the bar
        self.bar.items = [popularTab, mobileTab]
        
        return viewController
    }
    
    func defaultPageIndex(forPageboyViewController pageboyViewController: PageboyViewController) -> PageboyViewController.PageIndex? {
        // use default index
        return nil
    }
    

}
