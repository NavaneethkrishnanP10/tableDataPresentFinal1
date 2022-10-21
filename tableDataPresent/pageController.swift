//
//  pageController.swift
//  tableDataPresent
//
//  Created by Navaneethkrishnan Manoj on 19/10/22.
//

import UIKit

class pageController: UIViewController, UIScrollViewDelegate {
    
    // outlets connected
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // prev button function
    @IBAction func prev(_ sender: Any) {
        if pageControl.currentPage > 0 {
            pageControl.currentPage -= 1
            pageScroll.contentOffset.x = CGFloat(pageControl.currentPage) * pageScroll.frame.size.width
        }
    }
    
    // next button  function
    @IBAction func Next(_ sender: Any) {
        if pageControl.currentPage < imageLibrary.images!.count {
            pageControl.currentPage += 1
            pageScroll.contentOffset.x = CGFloat(pageControl.currentPage) * pageScroll.frame.size.width
        }
    }
    
    @IBOutlet weak var pageScroll: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    // variables declared
    var imageLibrary : Product!
    var frame = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // number of pages set for page control
        pageControl.numberOfPages  = imageLibrary.images!.count
        setupScreens() // function for page control pages
    }
    
    func setupScreens(){
        
        // scrollview appended with images
        for i in 0..<imageLibrary.images!.count{
            frame.origin.x = pageScroll.frame.size.width * CGFloat(i)
            frame.size = pageScroll.frame.size
            let imgPage = UIImageView(frame: frame)
            imgPage.contentMode = .scaleToFill
            let url = URL(string: imageLibrary.images![i])
            imgPage.kf.setImage(with: url)
            self.pageScroll.addSubview(imgPage)
            
        }
        pageScroll.contentSize = CGSize(width: (pageScroll.frame.size.width * CGFloat(imageLibrary.images!.count)), height: pageScroll.frame.size.height)
        pageScroll.delegate = self
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
    }
}
