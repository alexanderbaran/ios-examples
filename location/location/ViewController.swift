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
    
//    var locationManager: CLLocationManager!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        locationManager = CLLocationManager()
        
//        view.addSubview(mapView)
//        mapView.fillSuperview()
        
        
//        // https://www.youtube.com/watch?v=Z272SMC9zuQ
//        if Bundle.main.object(forInfoDictionaryKey: "NSLocationWhenInUseUsageDescription") != nil {
//            print("Added NSLocationWhenInUseUsageDescription to Info.plist")
//        } else {
//            print("Not yet added NSLocationWhenInUseUsageDescription to Info.plist")
//        }
//
//        if Bundle.main.object(forInfoDictionaryKey: "NSLocationAlwaysUsageDescription") != nil {
//            print("Added NSLocationAlwaysUsageDescription to Info.plist")
//        } else {
//            print("Not yet added NSLocationAlwaysUsageDescription to Info.plist")
//        }
        
//        isAuthorizedToGetUserLocation()
        
        checkCoreLocationPermissions()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            // We are also saying startUpdatingLocation so we are calling a function every time the location is updated.
//            locationManager.startUpdatingLocation()
        }
    }
    
    // https://www.youtube.com/watch?v=uN7viWiCXUQ
    private func checkCoreLocationPermissions() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways {
            locationManager.startUpdatingLocation()
        } else if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else if CLLocationManager.authorizationStatus() == .restricted {
            // This app is not authorized to use location services. Two cases. The first case is maybe that the user doesn't allow this app to use CoreLocation service. That is when an alert pops up and asks the user to allow to use the service.
            // Put an alert and explain things here.
            print("Unauthorized to use location service.")
        } else {
            // CLLocationManager.authorizationStatus() == .denied
            // User denied it. Need to enable it in settings.
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations[0]
        locationManager.stopUpdatingLocation() // Get location once if you do not need to track. Saves battery.
        print(location)
    }
    
//    private func isAuthorizedToGetUserLocation() {
//        // https://developer.apple.com/documentation/corelocation/cllocationmanager/1423523-authorizationstatus
//        // https://developer.apple.com/documentation/corelocation/clauthorizationstatus
//        // Can also check for .authorizedAlways
//        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
//            // We could also request authorization for using the users location in the background. But we don't need that type of authorization we only need the users location when the user is using our app.
//            locationManager.requestWhenInUseAuthorization()
////            locationManager.requestAlwaysAuthorization()
//        }
//    }

//    // This function is called every time our users location is updated.
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        // All the locations are going to be stored in this locations array. We want the first element in the array, so the most recent position of our user.
//        let location: CLLocation = locations[0]
//        let latitude: CLLocationDegrees = location.coordinate.latitude
//        let longitude: CLLocationDegrees = location.coordinate.longitude
//        // For span we are only going to say how much we want our map to be zoomed in on our users location.
//        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.005, 0.005)
//        //        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
//        //        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.06, 0.06)
//        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
//        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
//        mapView.setRegion(region, animated: true)
//        // Add the blue dot.
//        mapView.showsUserLocation = true
//
//        // We can extract all kinds of information from our location variable.
//        print(location.altitude)
//        print(location.speed)
//        print(location.course)
//
//    }
    
    // This method will be called each time when a user changes his location access preference. Ø: It is called everytime the app starts.
    // https://www.youtube.com/watch?v=XyncTJdXbbw
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied {
            showLocationDisabledPopUp()
        }
//        if status == .authorizedWhenInUse {
//            print("User allowed us to access location.")
//            // Do whatever init activities here.
//        }
    }
    
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled", message: "In order to deliver pizza we need your location", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action: UIAlertAction) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didUpdateLocations is called but failed getting location:", error)
    }
    
}
















