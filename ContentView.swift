//
//  ContentView.swift
//  MusiLife
//
//  Created by Kirat Gill on 2023-06-20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        UIViewControllerWrapper {
            ViewController()
        }
    }
}

struct UIViewControllerWrapper<Content: UIViewController>: UIViewControllerRepresentable {
    typealias UIViewControllerType = Content

    let viewControllerProvider: () -> Content

    init(_ viewControllerProvider: @escaping () -> Content) {
        self.viewControllerProvider = viewControllerProvider
    }

    func makeUIViewController(context: Context) -> Content {
        return viewControllerProvider()
    }

    func updateUIViewController(_ uiViewController: Content, context: Context) {}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
