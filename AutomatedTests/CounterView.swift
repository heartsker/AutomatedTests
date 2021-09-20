//
//  CounterView.swift
//  AutomatedTests
//
//  Created by Daniel Pustotin on 19.09.2021.
//

import SwiftUI

struct CounterView: View {
	@EnvironmentObject var game: Game

    var body: some View {

		VStack() {

			ForEach(game.colors.sorted(by: { $0.key.description < $1.key.description}), id: \.key) { color, count in
				HStack {
					Circle()
						.fill(color)
						.frame(width: 50, height: 50)

					Text("\(color.description.uppercased()): \(count)")

					Spacer()
				}
				.padding()
			}
		}
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
			.environmentObject(Game())
    }
}
