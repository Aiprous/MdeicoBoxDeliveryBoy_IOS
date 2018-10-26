//
//  HomeViewController.swift
//  MedicoBoxDeliveryBoy
//
//  Created by NCORD LLP on 09/10/18.
//  Copyright © 2018 Aiprous. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import GoogleMaps
import GooglePlaces
import Foundation
import CoreGraphics

class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource , CLLocationManagerDelegate,GMSMapViewDelegate {
    
    @IBOutlet weak var btnYearly: DesignableButton!
    @IBOutlet weak var btnMonthly: DesignableButton!
    @IBOutlet weak var btnWeekly: DesignableButton!
    @IBOutlet weak var tblTodaysOrdersList: UITableView!
    @IBOutlet weak var gmsMapview: GMSMapView!
    @IBOutlet weak var barChart: BasicBarChart!

    //For map View
    var anInt: Int = 42
    var anOptionalInt: Int? = 42
    var anotherOptionalInt: Int?    // `nil` is the default when no value is provided
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    var likelyPlaces: [GMSPlace] = []
    var selectedPlace: GMSPlace?
    var geocoder = CLGeocoder()
    var marker = GMSMarker()
    var days = [String]()
    var months = [String]()
    var year = [String]()
    var barChartStatus = String()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gmsMapview.padding = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        gmsMapview.settings.myLocationButton = true
        gmsMapview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.navigationController?.isNavigationBarHidden = false;

        self.tblTodaysOrdersList.register(UINib(nibName: "TodaysOrdersTableViewCell", bundle: nil), forCellReuseIdentifier: "TodaysOrdersTableViewCell")
        tblTodaysOrdersList.delegate = self
        tblTodaysOrdersList.dataSource = self
        tblTodaysOrdersList.estimatedRowHeight = 130
        tblTodaysOrdersList.separatorStyle = .singleLine
        tblTodaysOrdersList.separatorColor = #colorLiteral(red: 0.5215686275, green: 0.5215686275, blue: 0.5215686275, alpha: 1)
        barChartStatus = "Weekly"
        days = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]

    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false;
        self.setNavigationBarItem()
        setUpLocation()

    }
   
    override func viewDidAppear(_ animated: Bool) {
        let dataEntries = generateDataEntries()
        barChart.dataEntries = dataEntries
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnYearlyAction(_ sender: Any) {
        
        self.btnYearly.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1607843137, blue: 0.3098039216, alpha: 1)
        self.btnMonthly.backgroundColor = #colorLiteral(red: 1, green: 0.7803921569, blue: 0, alpha: 1)
        self.btnWeekly.backgroundColor = #colorLiteral(red: 1, green: 0.7803921569, blue: 0, alpha: 1)
        barChartStatus = "Yearly"
        year = ["2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018"]
        let dataEntries = generateDataEntries()
        barChart.dataEntries = dataEntries
    }
    
    @IBAction func btnMonthlyAction(_ sender: Any) {
        
        self.btnYearly.backgroundColor = #colorLiteral(red: 1, green: 0.7803921569, blue: 0, alpha: 1)
        self.btnMonthly.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1607843137, blue: 0.3098039216, alpha: 1)
        self.btnWeekly.backgroundColor = #colorLiteral(red: 1, green: 0.7803921569, blue: 0, alpha: 1)
        barChartStatus = "Monthly"
        months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
        let dataEntries = generateDataEntries()
        barChart.dataEntries = dataEntries
    }

    @IBAction func btnWeeklyAction(_ sender: Any) {
        
        self.btnYearly.backgroundColor = #colorLiteral(red: 1, green: 0.7803921569, blue: 0, alpha: 1)
        self.btnMonthly.backgroundColor = #colorLiteral(red: 1, green: 0.7803921569, blue: 0, alpha: 1)
        self.btnWeekly.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1607843137, blue: 0.3098039216, alpha: 1)
        barChartStatus = "Weekly"
        days = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
        let dataEntries = generateDataEntries()
        barChart.dataEntries = dataEntries
        
    }
    
    /// MARK: Chart
    func generateDataEntries() -> [BarEntry] {
        
        let colors = [#colorLiteral(red: 0.1220000014, green: 0.172999993, blue: 0.2980000079, alpha: 1)]
        var result: [BarEntry] = []
        
            if(barChartStatus == "Yearly"){
                
                for i in 0..<year.count {
                    let value = (arc4random() % 90) + 10
                    let height: Float = Float(value) / 100.0
                    result.append(BarEntry(color: colors[i % colors.count], height: height, textValue: "\(value)", title: year[i % year.count]))
                }
                
            }else if(barChartStatus == "Monthly"){
                
                for i in 0..<months.count {
                    let value = (arc4random() % 90) + 10
                    let height: Float = Float(value) / 100.0
                    result.append(BarEntry(color: colors[i % colors.count], height: height, textValue: "\(value)", title: months[i % months.count]))
                }
                
            }else if(barChartStatus == "Weekly"){
                
                for i in 0..<days.count {
                    let value = (arc4random() % 90) + 10
                    let height: Float = Float(value) / 100.0
                    result.append(BarEntry(color: colors[i % colors.count], height: height, textValue: "\(value)", title: days[i % days.count]))
                }
            }
        
        return result
    }
    //MARK:- Table View Delegate And DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int{
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cellObj = tableView.dequeueReusableCell(withIdentifier: "TodaysOrdersTableViewCell") as! TodaysOrdersTableViewCell
        
        if(indexPath.row == 0){
            
            cellObj.imgTodaysOrders.image = #imageLiteral(resourceName: "pending")
            cellObj.lblTodaysOrdersTitle.text = "Pending Orders (20)"
            cellObj.btnTodaysOrders.tag = indexPath.row;
            
        }else if(indexPath.row == 1){
            
            cellObj.imgTodaysOrders.image = #imageLiteral(resourceName: "processing")
            cellObj.lblTodaysOrdersTitle.text = "Processing Orders (20)"
            cellObj.btnTodaysOrders.tag = indexPath.row;
            
        }else{
            
            cellObj.imgTodaysOrders.image = #imageLiteral(resourceName: "check-1")
            cellObj.lblTodaysOrdersTitle.text = "Completed Orders (20)"
            cellObj.btnTodaysOrders.tag = indexPath.row;
        }
        
        cellObj.selectionStyle = .none
        return cellObj
    }
    
    //MARK: - tableview delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 61
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell:TodaysOrdersTableViewCell = tableView.cellForRow(at: indexPath) as! TodaysOrdersTableViewCell
        
        if(indexPath.row == 0){
            
            let Controller = kMainStoryboard.instantiateViewController(withIdentifier: kPendingOrdersVC)
            self.navigationController?.pushViewController(Controller, animated: true)
            
        }else if(indexPath.row == 2)
        {
            let Controller = kMainStoryboard.instantiateViewController(withIdentifier: kCompletedOrdersVC)
            self.navigationController?.pushViewController(Controller, animated: true)
            
        }
      
        
    }
    
    
    
    //MARK: Location show on map
    
    func setUpLocation() {
        
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 50
        placesClient = GMSPlacesClient.shared()
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
        
        
    }
    
    //Localtion manager Delegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
         let user_location = manager.location!.coordinate;
        let location = locations.last
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 9.0)
        self.gmsMapview?.animate(to: camera)
        self.locationManager.stopUpdatingLocation()
        
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)-> Void in
            if (error != nil) {
                print("Reverse geocoder failed with error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            if (placemarks?.count)! > 0 {
                let pm = placemarks?[0]
                self.displayLocationInfo(pm)
            } else {
                print("Problem with the data received from geocoder")
            }
        })
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            //            listLikelyPlaces(loc: location)
            self.setUpMarker(loc: location)
        }
    }
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            
            let CITY = (containsPlacemark.locality != nil) ? containsPlacemark.locality! : ""
            let AREA = (containsPlacemark.subLocality != nil) ? containsPlacemark.subLocality! : ""
            let  SUBAREA1 = (containsPlacemark.name != nil) ? containsPlacemark.name! : ""
            let SUBAREA2 = (containsPlacemark.subLocality != nil) ? containsPlacemark.subLocality! : ""
            let STATE = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea! : ""
            let addressDictionary  = containsPlacemark.addressDictionary! as NSDictionary
            let address = containsPlacemark.addressDictionary?["FormattedAddressLines"] as? [String]
            //            print(STATE,addressDictionary)
            //            print(AREA,SUBAREA1,SUBAREA2)
//            DRIVER_LOCATION = (address?.joined(separator: ", "))!
            
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error.localizedDescription)")
    }
    
    
    // Populate the array with the list of likely places.
    func listLikelyPlaces(loc:CLLocation) {
        // Clean up from previous sessions.
        likelyPlaces.removeAll()
        
        placesClient.currentPlace(callback: { (placeLikelihoods, error) -> Void in
            if let error = error {
                // TODO: Handle the error.
                print("Current Place error: \(error.localizedDescription)")
                return
            }
            self.setUpMarker(loc: loc)
            
            // Get likely places and add to the list.
            if let likelihoodList = placeLikelihoods {
                for likelihood in likelihoodList.likelihoods {
                    let place = likelihood.place
                    self.likelyPlaces.append(place)
                }
                
                print(self.likelyPlaces.count)
                for place in self.likelyPlaces{
                    
                    self.setUpmarkers(place: place)
                }
            }
        })
    }
    func setUpMarker(loc:CLLocation) {
     
                let marker = GMSMarker()
                marker.position = loc.coordinate
                marker.icon = GMSMarker.markerImage(with: UIColor.red)
//                marker.icon = UIImage(named: "maps-and-flags")
                marker.map = gmsMapview
                gmsMapview.camera = GMSCameraPosition.camera(withTarget: loc.coordinate, zoom: 7.5)
    
    }
    
    func setUpmarkers(place: GMSPlace){
        let marker = GMSMarker(position: (place.coordinate))
        marker.title = place.name
//        marker.icon = GMSMarker.markerImage(with: UIColor.red)
        marker.map = gmsMapview
        
    }
}
