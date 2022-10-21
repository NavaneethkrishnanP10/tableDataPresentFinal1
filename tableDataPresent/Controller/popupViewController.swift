//
//  popupViewController.swift
//  tableDataPresent
//
//  Created by Navaneethkrishnan Manoj on 12/10/22.
//

import UIKit
import Kingfisher
class popupViewController: UIViewController, UIScrollViewDelegate {
    
    // dismiss on click
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    // outlets created
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var scrollZoom: UIScrollView!
    @IBOutlet weak var largeUserID: UILabel!
    
    //variables declared
    var userid = ""
    var img = ""
    let size : CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // scrollZoom used to zoom image in popover
        scrollZoom.delegate = self
        scrollZoom.minimumZoomScale = 1.0
        scrollZoom.maximumZoomScale = 10.0
        
        // image set using kingfisher
        let url = URL(string: img)
        imgView.kf.setImage(with: url)
        largeUserID.text = userid
        
        // Do any additional setup after loading the view.
    }
    func viewForZooming(in scrollZoom: UIScrollView) -> UIView? {
        return imgView
    }

}
