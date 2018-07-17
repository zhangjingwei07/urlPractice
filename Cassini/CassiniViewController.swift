//
//  CassiniViewController.swift
//  Cassini
//
//  Created by 张经纬 on 2018/7/16.
//  Copyright © 2018 Jingwei Zhang. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController, UISplitViewControllerDelegate{

    override func awakeFromNib() {
        super.awakeFromNib();
        self.splitViewController?.delegate = self;
    }
    
    
    static let blankurl = URL(string: "")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let url = DemoURL.NASA[segue.identifier ?? ""]{
            if url != CassiniViewController.blankurl {
            if let imageVC = (segue.destination.contents as? ImageViewController){
                imageVC.imageURL = url;
                imageVC.title = (sender as? UIButton)?.currentTitle;
                
            }
            }
            
        }
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if primaryViewController.contents == self{
            if let ivc = secondaryViewController.contents as? ImageViewController, ivc.imageURL == CassiniViewController.blankurl{
                return true;
            }
        }
        return false;
    }
}

extension UIViewController {
    var contents:UIViewController{
        if let nav = self as? (UINavigationController){
            return nav.visibleViewController ?? self;
        } else{
            return self;
        
        }
    }
}



