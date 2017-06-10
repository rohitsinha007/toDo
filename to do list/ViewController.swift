//
//  ViewController.swift
//  to do list
//
//  Created by admin on 06/06/17.
//  Copyright © 2017 boom. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
UITableViewDelegate, UITableViewDataSource{
    
    var listArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        listTable.backgroundColor = UIColor.clear
        listTable.separatorStyle = .none
        
        if let list = UserDefaults.standard.array(forKey: "list") as? [String] {
            
            listArray = list
            
        }
        else {
            
            print("went in else")
        }
        
    }
    
    @IBOutlet weak var listTable: UITableView!

    @IBOutlet weak var input: UITextField!

    @IBOutlet weak var list: UITableView!
    @IBAction func donebutton(_ sender: Any) {
        
        listArray.append(input.text!)
        
        listTable.reloadData()
        
        input.resignFirstResponder()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listcell", for: indexPath)
        
        cell.textLabel?.text = listArray[indexPath.row]
        
        return cell
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        UserDefaults.standard.set(listArray, forKey: "list")
        
    }
    
}





