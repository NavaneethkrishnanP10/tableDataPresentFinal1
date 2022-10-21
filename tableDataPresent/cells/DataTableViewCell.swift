//
//  DataTableViewCell.swift
//  tableDataPresent
//
//  Created by Navaneethkrishnan Manoj on 04/10/22.
//

import UIKit
import Kingfisher
class DataTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userid: UILabel!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var icon: UIImageView!
    
    
    @IBOutlet weak var desc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        icon.image = UIImage(named: "icon2.jpg")
        //icon.layer.cornerRadius = 37
        //icon.clipsToBounds = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func dataPass(users: Product){
        userid.text = users.title
        
        title.text = "$" + String(users.price!) 
        
        desc.text = users.descriptionField
        
    }
    func updateIcon(users: Product){
        let url = URL(string: users.images?[0] ?? "https://dummyjson.com/image/i/products/1/1.jpg")
        icon.kf.setImage(with: url)
    }
    
}
