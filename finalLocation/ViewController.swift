//
//  ViewController.swift
//  finalLocation
//
//  Created by Student016 on 02/10/18.
//  Copyright © 2018 mahesh. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class ViewController: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate {
fileprivate let locationmanager = CLLocationManager()
    
   
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
    }
    
    @IBAction func getlocation(_ sender: UIButton) {
        startLocation()
    }
    
    @IBOutlet weak var mapView: MKMapView!
    func startLocation()
    {
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        locationmanager.requestWhenInUseAuthorization()
        locationmanager.delegate = self
        locationmanager.startUpdatingLocation()
   
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        var latitute:CGFloat , longtitute:CGFloat
        let currentLocation:CLLocation = locations.last!
        
        latitute = CGFloat(currentLocation.coordinate.latitude)
        longtitute = CGFloat(currentLocation.coordinate.longitude)
        print("rint print\(latitute) and \(longtitute)")
        //manager.stopUpdatingLocation()
        let cordinate:CLLocationCoordinate2D = currentLocation.coordinate
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let resion:MKCoordinateRegion = MKCoordinateRegion(center: cordinate, span: span)
        mapView.setRegion(resion, animated: true)
        self.mapView.showsUserLocation = true
        let annomationPoint = MKPointAnnotation()
        annomationPoint.coordinate = cordinate
        mapView.addAnnotation(annomationPoint)
        
        
    }

}

