//
//  ViewController.swift
//  tableDataPresent
//
//  Created by Navaneethkrishnan Manoj on 04/10/22.
//

import UIKit
import DropDownStack
class ViewController: UIViewController {
    let userDefaults = UserDefaults.standard
    var index = 0
    var passingData : Product!
    var user = [Product]()
    var Apple = [Product]()
    var Apple1 = [Product]()
    var test = [Product]()
    var expandedIndexSet : IndexSet = []
    var message = ""
    var msg = ""
    var Samsung = [Product]()
    var Microsoft = [Product]()
    func saveData(data : [Product]){
        test = data
        tableView?.reloadData()
        
    }
    func dataReload(msg : String){
        let service = APIservice(baseURL: "https://dummyjson.com/products")
        service.getResponse()
        // Completion handler implemented
        service.completionHandler{ [weak self] (user, status, message) in
            if status{
                guard let self = self else {return}
                guard let _user = user else {return}
                self.user = _user
                for i in self.user.indices{
                    if self.user[i].brand == "Apple"{
                        self.Apple.append(user![i])
                    }
                    else if self.user[i].brand == "Samsung"{
                        self.Samsung.append(user![i])
                    }
                    else if self.user[i].brand == "Microsoft"{
                        self.Microsoft.append(user![i])
                    }
                    
                }
            }
            if msg == "Apple"{
                test = Apple
                tableView?.reloadData()
            }
            if msg == "Samsung"{
                test = Samsung
                self.tableView.reloadData()
            }
            if msg == "Microsoft" {
                test = Microsoft
                self.tableView.reloadData()
            }
        }
           }
    // Prepare Segue to pass data to next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let destinationVC = segue.destination as! newViewController
            destinationVC.recievingData = passingData
        }
    }
    @IBAction func dropMenuList(_ sender: Any) {
    }
    // Table view outlet connected
    @IBOutlet weak var tableView: UITableView!
    // Variables declared
    
    
    override func viewDidLoad() {
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
                for i in self.user.indices{
                    if self.user[i].brand == "Apple"{
                        self.Apple.append(user![i])
                    }
                    else if self.user[i].brand == "Samsung"{
                        self.Samsung.append(user![i])
                    }
                    else if self.user[i].brand == "Microsoft"{
                        self.Microsoft.append(user![i])
                    }
                    
                }
                let Apple1 = self.Apple
                self.saveData(data: self.Apple)
               
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "dropDown") as! dropdownViewController
                vc.user = self.user
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

