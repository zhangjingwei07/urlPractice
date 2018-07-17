//
//  ImageViewController.swift
//  Cassini
//
//  Created by 张经纬 on 2018/7/13.
//  Copyright © 2018 Jingwei Zhang. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController{
    
    var imageURL: URL?{
        didSet{
            image = nil;
            if view.window != nil{
                print("fetching new image from ")
                print(self.imageURL ?? "NULL" );
                print ("\n");
                fetchImage();
            }
        }
    }
    
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private func fetchImage(){
        if let url = imageURL{
            
            spinner.startAnimating(); DispatchQueue.global(qos: .userInitiated).async{[weak self] in
            let urlContents = try?Data(contentsOf: url);
            
            if let imageData = urlContents, url == self?.imageURL {
                self?.image = UIImage(data: imageData);
            }
            }
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self;
            scrollView.contentSize = imageView.frame.size;
            scrollView.addSubview(imageView);
            
            scrollView.maximumZoomScale = 5;
            scrollView.minimumZoomScale = 0.5;
            
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil{
            fetchImage();
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.addSubview(scrollView);
     //   imageURL = DemoURL.daniel;
    }
    
    
    fileprivate var imageView = UIImageView();
    
    private var image: UIImage?{
        get{
            return imageView.image;
        }
        
        set{
            DispatchQueue.main.async{ [weak self] in
                self?.imageView.image = newValue;
                self?.imageView.sizeToFit();
                self?.scrollView?.contentSize = (self?.imageView.frame.size)!;
                self?.spinner.stopAnimating();
            }
            
        }
    }


    


}


extension ImageViewController : UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView;
    }
}
