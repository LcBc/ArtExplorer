//
//  NetworkMonitor.swift
//  ArtExplorer
//
//  Created by Luis Barrios on 19/7/21.
//

import Foundation
import Network



class NetworkMonitor{
    static let sharedInstance = NetworkMonitor()
    let monitor = NWPathMonitor()
    var hasConnection = true
    private init(){
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.hasConnection = true
            } else {
                self.hasConnection = false
            }
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
    
}


