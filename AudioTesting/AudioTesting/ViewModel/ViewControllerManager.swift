//
//  ViewControllerManager.swift
//  AudioTesting
//
//  Created by Vision Solutions on 4/28/24.
//

import Foundation

class ViewControllerManager: ObservableObject {
    var viewController: ViewController?

    func toggleTempo() {
        viewController?.toggleTempo()
    }
}
