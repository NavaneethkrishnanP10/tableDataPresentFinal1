//
//  newViewController.swift
//  tableDataPresent
//
//  Created by Navaneethkrishnan Manoj on 11/10/22.
//

import UIKit
import Kingfisher

class newViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // variables declared
    var user = [Product]()
    var recievingData : Product!
    var indexval : Int!
    
    //outlets connected
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var mycollView: UICollectionView!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var descText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // icon image set using kingfisher
        let url = URL(string: recievingData.images?[0] ?? "https://dummyjson.com/image/i/products/1/1.jpg")
        iconImage.kf.setImage(with: url)
        // user details added
        userId.text = String(recievingData.title!)
        titleText.text = "$" + String(recievingData.price!)
        descText.text = String(recievingData.descriptionField!)
        // Notification center observer added
        NotificationCenter.default.addObserver(self, selector: #selector(observingMethod), name: Notification.Name("Notification#1"), object: nil)
    }
    // CollectionView functions initialized
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recievingData.images!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! cellCollectionView
        let url = URL(string: (recievingData.images?[indexPath.row])!)
        cell.imgCell.kf.setImage(with: url)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "pageController") as! pageController
        self.navigationController?.pushViewController(vc, animated: true)
        vc.imageLibrary = recievingData
        self.present(vc, animated: true, completion: nil)
    }
    // notification center observing method declared
    @objc func observingMethod(_ notification: NSNotification) {
        if let message = notification.userInfo?["new_edit_text"] {
            descText.text = "\(message)"
        }
    }
    func sendDataToFirstVC(newBody: String) {
        self.descText.text = newBody
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // prepare segue for image popover
        if segue.identifier == "popupView" {
            let popup = segue.destination as! popupViewController
            popup.userid = "$" + String(recievingData.price!)
            popup.img = String(recievingData.images?[0] ?? "https://dummyjson.com/image/i/products/1/1.jpg")
        }
        // prepare segue for editing popover
        if segue.identifier == "editTextId" {
            let popup2 = segue.destination as! editPopupViewController
            popup2.presentText = descText.text ?? ""
        }
        
    }
        
}


extension ViewController: UICollectionViewDelegateFlowLayout{
    // collectionView item size set
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        return CGSize(width: collectionWidth/2, height: collectionWidth/2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}
    

