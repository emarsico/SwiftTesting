//
//  ViewControllerManager.swift
//  AudioTesting
//
//  Created by Vision Solutions on 4/28/24.
//

import Foundation

class ViewControllerHandler: ObservableObject {
    var viewController: ViewController?

    func toggleTempo() {
        viewController?.toggleTempo()
    }
}
