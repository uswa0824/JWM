//  LandscapeHostingController.swift
//  JWM

import SwiftUI

class LandscapeHostingController<Content: View>: UIHostingController<Content> {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        // Allow only landscape orientations.
        return [.landscapeLeft, .landscapeRight]
    }
    
    override var shouldAutorotate: Bool {
        return false // Disable autorotation, lock to landscape
    }
}

struct LandscapeContentView<Content: View>: UIViewControllerRepresentable {
    let rootView: Content

    func makeUIViewController(context: Context) -> LandscapeHostingController<Content> {
        LandscapeHostingController(rootView: rootView)
    }

    func updateUIViewController(_ uiViewController: LandscapeHostingController<Content>, context: Context) {
        // No update logic needed.
    }
}
