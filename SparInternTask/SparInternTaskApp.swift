//
//  SparInternTaskApp.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 17.08.2024.
//

import SwiftUI

@main
struct SparInternTaskApp: App {
    @StateObject var viewModel = ContentViewVM()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
