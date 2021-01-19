//
//  ViewController.swift
//  UberLocationSearch
//
//  Created by marco alonso on 19/01/21.
//

import UIKit
import MapKit
import FloatingPanel

class ViewController: UIViewController {

    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        title = "Mi App"
        
        let panel = FloatingPanelController()
        panel.set(contentViewController: SearchViewController())
        panel.addPanel(toParent: self)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }


}

