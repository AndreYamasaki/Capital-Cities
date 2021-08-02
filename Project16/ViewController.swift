//
//  ViewController.swift
//  Project16
//
//  Created by user on 02/08/21.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    //MARK: - Attributes

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Type", style: .plain, target: self, action: #selector(chooseMapType))
        
        let london = Capital(title: "Londom", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1725), info: "Home to the 2012 summer olympics", wiki: "https://en.wikipedia.org/wiki/London")
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), info: "Founded over a thousands years ago", wiki: "https://en.wikipedia.org/wiki/Oslo")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), info: "Often called the city of light", wiki: "https://en.wikipedia.org/wiki/Paris")
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), info: "Has a whole country inside it", wiki: "https://en.wikipedia.org/wiki/Rome")
        let washington = Capital(title: "Washington", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself", wiki: "https://en.wikipedia.org/wiki/Washington,_D.C.")
        let rio = Capital(title: "Rio de Janeiro", coordinate: CLLocationCoordinate2D(latitude: -22.9035, longitude: -43.2096), info: "Famous fo its beachs", wiki: "https://en.wikipedia.org/wiki/Rio_de_Janeiro")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington, rio])
    }
    
    //MARK: - Methods
    
//Challenge 2: Add a UIAlertController that lets users specify how they want to view the map.
    @objc func chooseMapType() {
        let ac = UIAlertController(title: "Choose a type for your map", message: "", preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "satellite", style: .default, handler: { (action) in
            self.mapView.mapType = .satellite
        }))
        ac.addAction(UIAlertAction(title: "hybrid", style: .default, handler: { (action) in
            self.mapView.mapType = .hybrid
        }))
        ac.addAction(UIAlertAction(title: "standart", style: .default, handler: { (action) in
            self.mapView.mapType = .hybrid
        }))
        present(ac, animated: true)
    }
    
    //MARK: - MapKit Delegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard annotation is Capital else {return nil}
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
//Challenge 1: Change the pinTintColor property to your favorite UIColor.
        if let pin = annotationView as? MKPinAnnotationView {
            pin.pinTintColor = UIColor.black
        }
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard let capital = view.annotation as? Capital else { return }
        
//Challenge 3: Modify the callout button so that pressing it shows a new view controller with a web view, taking users to the Wikipedia entry for that city.
        if let vc = storyboard?.instantiateViewController(identifier: "WebView") as? WebViewController {
            vc.wiki = capital.wiki
            vc.name = capital.title
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
//        let placeName = capital.title
//        let placeInfo = capital.info
//
//        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "Ok", style: .default))
//        present(ac, animated: true)
    }

}

