//
//  TableViewController.swift
//  Nook
//
//  Created by Enrique Pajuelo on 11/11/16.
//  Copyright © 2016 Enrique Pajuelo. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class TableViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate,UITableViewDataSource, CLLocationManagerDelegate {
    
    var titleToPass:String!
    var hoursToPass:String!
    var availabilityToPass:NookAvailability!
    var idToPass:Int!
    var coordinateToPass: CLLocationCoordinate2D!
    
    let locationManager = CLLocationManager()
    var authorized = false
    
    static let sharedInstance = TableViewController()
    
    // MARK: IBOutlets
        
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var tableview2: UITableView!
    @IBOutlet weak var tableview3: UITableView!
    @IBOutlet weak var mapview: MKMapView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // MARK: IBActions
    
    @IBAction func segmentChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            tableview.isHidden = false
            tableview2.isHidden = true
            tableview3.isHidden = true
            mapview.isHidden = true
        case 1:
            tableview.isHidden = true
            tableview2.isHidden = false
            tableview3.isHidden = true
            mapview.isHidden = true
        case 2:
        //If we don't use tableview3, get rid of it
            tableview.isHidden = true
            tableview2.isHidden = true
            tableview3.isHidden = false
            mapview.isHidden = false
        default:
            break
        }
    }
    
    // MARK: Table View Data Source
    
    // One row per nook.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count:Int?
        
        if tableView == self.tableview {
            count = NookViewController.sharedInstance.favoriteNooks.count
        }
        else if tableView == self.tableview2 {
            count = NookViewController.sharedInstance.nooks.count
        }
        else {
            count = NookViewController.sharedInstance.nooks.count
        }
        
        return count!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if tableView == self.tableview {
            cell = tableView.dequeueReusableCell(withIdentifier: "customcell1", for: indexPath)
            cell!.textLabel?.text = NookViewController.sharedInstance.favoriteNooks[indexPath.row].title
            
        }
        else if tableView == self.tableview2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "customcell2", for: indexPath)
            cell!.textLabel?.text = NookViewController.sharedInstance.nooks[indexPath.row].title
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "customcell3", for: indexPath)
            cell!.textLabel?.text = NookViewController.sharedInstance.nooks[indexPath.row].title
        }
        return cell!
    }
    
    // MARK: Table View Delegate
    
    // When a row is tapped, store in variables the properties of nook
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let entry1 = NookViewController.sharedInstance.favoriteNooks[indexPath.row]
//        let entry2 = NookViewController.sharedInstance.nooks[indexPath.row]
//        let entry3 = NookViewController.sharedInstance.nooks[indexPath.row]
        
        if tableView == self.tableview {
            titleToPass = NookViewController.sharedInstance.favoriteNooks[indexPath.row].title
            hoursToPass = NookViewController.sharedInstance.favoriteNooks[indexPath.row].hours
            availabilityToPass = NookViewController.sharedInstance.favoriteNooks[indexPath.row].availability
            idToPass = NookViewController.sharedInstance.favoriteNooks[indexPath.row].id
            coordinateToPass = NookViewController.sharedInstance.favoriteNooks[indexPath.row].coordinate
        }
        else if tableView == self.tableview2 {
            titleToPass = NookViewController.sharedInstance.nooks[indexPath.row].title
            hoursToPass = NookViewController.sharedInstance.nooks[indexPath.row].hours
            availabilityToPass = NookViewController.sharedInstance.nooks[indexPath.row].availability
            idToPass = NookViewController.sharedInstance.nooks[indexPath.row].id
            coordinateToPass = NookViewController.sharedInstance.nooks[indexPath.row].coordinate
        }
        else {
            titleToPass = NookViewController.sharedInstance.nooks[indexPath.row].title
            hoursToPass = NookViewController.sharedInstance.nooks[indexPath.row].hours
            availabilityToPass = NookViewController.sharedInstance.nooks[indexPath.row].availability
            idToPass = NookViewController.sharedInstance.nooks[indexPath.row].id
            coordinateToPass = NookViewController.sharedInstance.nooks[indexPath.row].coordinate
            
            // When a row is tapped, pan the map to its matching annotation.
            // Center only for entry 2 - check this
            mapview.setCenter(NookViewController.sharedInstance.nooks[indexPath.row].coordinate, animated: true)
            mapview.selectAnnotation(NookViewController.sharedInstance.nooks[indexPath.row], animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        self.performSegue(withIdentifier: "showView", sender: self)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // Need to edit so that add only shows on search and delete on favorites
        let add = UITableViewRowAction(style:.normal, title:"Add") {action, index in
        }
        add.backgroundColor = .orange
        let delete = UITableViewRowAction(style:.normal, title:"Delete") {action, index in
        }
        delete.backgroundColor = .red

        return [add,delete]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? ViewController {
            destinationViewController.titlePassed = titleToPass
            destinationViewController.hoursPassed = hoursToPass
            destinationViewController.availabilityPassed = availabilityToPass
            destinationViewController.idPassed = idToPass
            destinationViewController.coordinatePassed = coordinateToPass
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .denied) {
            // Change message to alert saying you can change it in settings
            print("Authorization denied")
        } else {
            authorized = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let center = CLLocationCoordinate2D(latitude:41.702960,longitude:-86.238826)
        let span = MKCoordinateSpanMake(0.02, 0.02)
        let region = MKCoordinateRegion(center:center, span:span)
        mapview.setRegion(region, animated: true)
    }
    
    // MARK: Map View Delegate
    
    
    // Create red pin annotations for our nooks, and enable callouts
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        // If this is the user location annotation, return nil to avoid overriding the default.
        if annotation is MKUserLocation {
            return nil
        }
        
        // Attempt to reuse a pin from the map.
        let identifier = "MyPin"
        var annotationView = mapview.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
    
        // If no reusable pin was available, create a new one and configure it appropriately.
        if (annotationView == nil) {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.pinTintColor = UIColor.red
         
            // Callouts
            annotationView!.canShowCallout = true
        }
        
        annotationView!.annotation = annotation
        return annotationView
        
    }
    
    // MARK: Initial view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview2.isHidden = true
        tableview3.isHidden = true
        mapview.isHidden = true
        
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview2.delegate = self
        tableview2.dataSource = self
        
        tableview3.delegate = self
        tableview3.dataSource = self
        
        mapview.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        self.mapview.showsUserLocation = true
        mapview.addAnnotations(NookViewController.sharedInstance.nooks)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableview.reloadData()
        self.tableview2.reloadData()
        self.tableview3.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
