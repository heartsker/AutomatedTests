//
//  ContentView.swift
//  AutomatedTests
//
//  Created by Daniel Pustotin on 19.09.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		GameView()
			.environmentObject(Game())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
