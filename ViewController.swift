//
//  ViewController.swift
//  MusiLife
//
//  Created by Kirat Gill on 2023-06-18.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func getAccessTokenFromWebView() {
        guard let urlRequest = APIServices.shared.createAccessTokenRequest() else { return }
        let webview = WKWebView()
        
        webview.load(urlRequest)
        webview.navigationDelegate = self
        view = webview
    }

}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let urlString = webView.url?.absoluteString else { return }
        print(urlString)
        
      
    }
}
