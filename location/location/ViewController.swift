//
//  ViewController.swift
//  location
//
//  Created by Alexander Baran on 27/09/2017.
//  Copyright © 2017 Alexander Baran. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

// https://stackoverflow.com/questions/25296691/get-users-current-location-coordinates
// https://developer.apple.com/documentation/corelocation/cllocationmanager

class ViewController: UIViewController, CLLocationManagerDelegate {

    let mapView: MKMapView = {
        let mv = MKMapView()
        return mv
    }()
    
    let locationManager = CLLocationManager()
    
    // This function is called every time our users location is updated.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // All the locations are going to be stored in this locations array. We want the first element in the array, so the most recent position of our user.
        let location: CLLocation = locations[0]
        let latitude: CLLocationDegrees = location.coordinate.latitude
        let longitude: CLLocationDegrees = location.coordinate.longitude
        // For span we are only going to say how much we want our map to be zoomed in on our users location.
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.005, 0.005)
//        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
//        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.06, 0.06)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        // Add the blue dot.
        mapView.showsUserLocation = true
        
        // We can extract all kinds of information from our location variable.
        print(location.altitude)
        print(location.speed)
        print(location.course)
        
    }
    
    // This method will be called each time when a user changes his location access preference.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            print("User allowed us to access location.")
            // Do whatever init activities here.
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didUpdateLocations is called but failed getting location:", error)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        mapView.fillSuperview()
        
        isAuthorizedToGetUserLocation()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            // We are also saying startUpdatingLocation so we are calling a function every time the location is updated.
            locationManager.startUpdatingLocation()
        }
    }
    
    private func isAuthorizedToGetUserLocation() {
        // https://developer.apple.com/documentation/corelocation/cllocationmanager/1423523-authorizationstatus
        // https://developer.apple.com/documentation/corelocation/clauthorizationstatus
        // Can also check for .authorizedAlways
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            // We could also request authorization for using the users location in the background. But we don't need that type of authorization we only need the users location when the user is using our app.
            locationManager.requestWhenInUseAuthorization()
//            locationManager.requestAlwaysAuthorization()
        }
    }

}
















