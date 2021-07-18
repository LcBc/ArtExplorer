//
//  HTMLView.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 17/7/21.
//

import SwiftUI
import WebKit

struct HTMLView: UIViewRepresentable {
    let string:String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.loadHTMLString(string, baseURL: nil)
    }
    
}
