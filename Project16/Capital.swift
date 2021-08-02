//
//  Capital.swift
//  Project16
//
//  Created by user on 02/08/21.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var info: String
    var wiki: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String, wiki: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.wiki = wiki
    }

}
