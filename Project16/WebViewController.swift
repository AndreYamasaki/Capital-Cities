//
//  WebViewController.swift
//  Project16
//
//  Created by user on 02/08/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var wiki: String!
    var name: String!
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let placeWiki = wiki else { return }
        guard let placeName = name else { return }
        
        title = placeName
        
        guard let wikiURL = URL(string: placeWiki) else { return }
        webView.load(URLRequest(url: wikiURL))

    }

}
