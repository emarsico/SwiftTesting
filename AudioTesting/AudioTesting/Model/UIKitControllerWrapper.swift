//
//  UIKitControllerWrapper.swift
//  AudioTesting
//
//  Created by Vision Solutions on 4/28/24.
//

import Foundation
import UIKit
import SwiftUI

struct UIKitViewControllerWrapper: UIViewControllerRepresentable {
    @EnvironmentObject var handler: ViewControllerManager
    
    func makeUIViewController(context: Context) -> ViewController {
        let viewController = ViewController()
        handler.viewController = viewController
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // unnecessary due to static 100 BPM
    }
}
