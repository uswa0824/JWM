import SwiftUI

struct PortraitContentView<Content: View>: UIViewControllerRepresentable {
    let rootView: Content

    func makeUIViewController(context: Context) -> PortraitHostingController<Content> {
        PortraitHostingController(rootView: rootView)
    }

    func updateUIViewController(_ uiViewController: PortraitHostingController<Content>, context: Context) {
        // No update logic needed.
    }
}
