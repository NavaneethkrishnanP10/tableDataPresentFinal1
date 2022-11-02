//
//  ViewController.swift
//  tableDataPresent
//
//  Created by Navaneethkrishnan Manoj on 04/10/22.
//

import UIKit
import iOSDropDown
class ViewController: UIViewController {
    let userDefaults = UserDefaults.standard
    var index = 0
    var passingData : Product!
    var user = [Product]()
    var Apple = [Product]()
    var OPPO = [Product]()
    var test = [Product]()
    var expandedIndexSet : IndexSet = []
    var message = ""
    var msg = ""
    var Samsung = [Product]()
    var Microsoft = [Product]()
    func saveData(data : [Product]){
        test = data
        //print(test)
    }
    // Prepare Segue to pass data to next view
  
    @IBOutlet weak var productTitle: UILabel!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let destinationVC = segue.destination as! newViewController
            destinationVC.recievingData = passingData
        }
    }
    
    
    @IBOutlet weak var brandName: DropDown!
    
    @IBAction func dropMenuList(_ sender: Any) {
    }
    // Table view outlet connected
    @IBAction func filter(_ sender: Any) {
        let service = APIservice(baseURL: "https://dummyjson.com/products")
        service.getResponse()
        // Completion handler implemented
        service.completionHandler{ [weak self] (user, status, message) in
            if status{
                guard let self = self else {return}
                guard let _user = user else {return}
                self.user = _user
                self.test = self.user
                if self.brandName.text == "Apple"{
                    self.productTitle.text = "Apple"
                    self.Apple = self.user.filter({$0.brand == "Apple" || $0.brand == "APPle"})
                    self.saveData(data: self.Apple)
                }
                else if self.brandName.text == "Samsung"{
                    self.productTitle.text = "Samsung"
                    self.Samsung = self.user.filter({$0.brand == "Samsung"})
                    self.saveData(data: self.Samsung)
                }
                else if self.brandName.text == "OPPO"{
                    self.productTitle.text = "OPPO"
                    self.OPPO = self.user.filter({$0.brand == "OPPO"})
                    self.saveData(data: self.OPPO)
                }
                else{
                    self.productTitle.text = "Products"
                    let dialogMessage = UIAlertController(title: "No Results", message: "There were no products found with the given name", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default )

                     dialogMessage.addAction(ok)
                    self.present(dialogMessage, animated: true, completion: nil)

                }
                self.tableView.reloadData()
            }
        }
    }
    @IBOutlet weak var tableView: UITableView!
    // Variables declared
    
    
    override func viewDidLoad() {
        brandName.optionArray = ["Apple", "Samsung", "OPPO"]
        super.viewDidLoad()
        // Xib cell registered
        tableView.register(UINib.init(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "DataTableViewCell")
        
        // Automatic height dimension set
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 141
        tableView.separatorColor = UIColor.clear
        
        // API service class called with JSON API
        let service = APIservice(baseURL: "https://dummyjson.com/products")
        service.getResponse()
        // Completion handler implemented
        service.completionHandler{ [weak self] (user, status, message) in
            if status{
                guard let self = self else {return}
                guard let _user = user else {return}
                self.user = _user
                self.test = self.user
                self.tableView.reloadData()
            }
            
            
            
        }
    }
    
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell initialized
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as? DataTableViewCell else {
            print("failed to get cell")
            return UITableViewCell()
        }
        let users = test[indexPath.row]
        // Functions called
        cell.dataPass(users: users) // datapass() is used to set add the values into the tableview cell
        cell.updateIcon(users: users) // updateIcon() is used to set the icon Image for each tableview cell
        cell.selectionStyle = .none

        return cell
    }
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        passingData = user[indexPath.row] // passingData holds the data that should be passed on selecting a row in the tableview
        performSegue(withIdentifier: "showDetail"
                     , sender: self) // View transferred to newViewController() using the segue "showDetail"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension // row height set to automatic dimension
        
    }
}

