//
//  dropdownViewController.swift
//  tableDataPresent
//
//  Created by Navaneethkrishnan Manoj on 28/10/22.
//

import UIKit

class dropdownViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        cell.textLabel?.text = "\(list[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "vc") as! ViewController
        vc.dataReload(msg: list[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
        
        self.dismiss(animated: true)
    }
    var list = ["Apple", "Samsung","Microsoft"]
    override func viewDidLoad() {
        super.viewDidLoad()

        dropMenu.delegate = self
        dropMenu.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var dropMenu: UITableView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
