//
//  TableViewController.swift
//  Nook
//
//  Created by Enrique Pajuelo on 11/11/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var nameToPass:String!
    var availabilityToPass:NookAvailability!
    
    static let sharedInstance = TableViewController()
        
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var tableview2: UITableView!
    @IBOutlet weak var tableview3: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func segmentChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            tableview.isHidden = false
            tableview2.isHidden = true
            tableview3.isHidden = true
        case 1:
            tableview.isHidden = true
            tableview2.isHidden = false
            tableview3.isHidden = true
        case 2:
            tableview.isHidden = true
            tableview2.isHidden = true
            tableview3.isHidden = false
            
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count:Int?
        
        if tableView == self.tableview {
            count = NookViewController.sharedInstance.nooks.count
        }
        
        if tableView == self.tableview2 {
            count = NookViewController.sharedInstance.nooks2.count
        }
        
        if tableView == self.tableview3 {
            count = NookViewController.sharedInstance.nooks3.count
        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if tableView == self.tableview {
            cell = tableView.dequeueReusableCell(withIdentifier: "customcell1", for: indexPath)
            cell!.textLabel?.text = NookViewController.sharedInstance.nooks[indexPath.row].name
        }
        
        if tableView == self.tableview2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "customcell2", for: indexPath)
            cell!.textLabel?.text = NookViewController.sharedInstance.nooks2[indexPath.row].name
        }
        
        if tableView == self.tableview3 {
            cell = tableView.dequeueReusableCell(withIdentifier: "customcell3", for: indexPath)
            cell!.textLabel?.text = NookViewController.sharedInstance.nooks3[indexPath.row].name
        }
        return cell!

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showView", sender: self)
        
        if tableView == self.tableview {
            nameToPass = NookViewController.sharedInstance.nooks[indexPath.row].name
            availabilityToPass = NookViewController.sharedInstance.nooks[indexPath.row].availability
        }
        
        if tableView == self.tableview2 {
            nameToPass = NookViewController.sharedInstance.nooks2[indexPath.row].name
            availabilityToPass = NookViewController.sharedInstance.nooks2[indexPath.row].availability
        }
        
        if tableView == self.tableview3 {
            nameToPass = NookViewController.sharedInstance.nooks3[indexPath.row].name
            availabilityToPass = NookViewController.sharedInstance.nooks3[indexPath.row].availability
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationViewController = segue.destination as? ViewController {
            destinationViewController.namePassed = nameToPass
            destinationViewController.availabilityPassed = availabilityToPass
        }
        
    }
    
    enum NookAvailability {
        case Red
        case Yellow
        case Green
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview2.isHidden = true
        tableview3.isHidden = true
        
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview2.delegate = self
        tableview2.dataSource = self
        
        tableview3.delegate = self
        tableview3.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.tableview.reloadData()
        self.tableview2.reloadData()
        self.tableview3.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
