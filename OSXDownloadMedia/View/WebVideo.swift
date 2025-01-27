//
//  WebVideo.swift
//  OSXDownloadMedia
//
//  Created by Angelos Staboulis on 27/1/25.
//

import Foundation
import WebKit
import Cocoa
import SwiftUI
struct WebVideo:NSViewRepresentable{
    typealias NSViewType = WKWebView
    var urlVideo = String()
    
    func makeNSView(context: Context) -> WKWebView {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsAirPlayForMediaPlayback = true
        webConfiguration.mediaTypesRequiringUserActionForPlayback = []
        let webView = WKWebView(frame: .zero,configuration: webConfiguration)
        if let urlMain = URL(string:urlVideo) {
            webView.load(URLRequest(url: urlMain))
        }
        return webView
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
    }
    

    
 
}
