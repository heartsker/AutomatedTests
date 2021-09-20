//
//  GameView.swift
//  AutomatedTests
//
//  Created by Daniel Pustotin on 20.09.2021.
//

import SwiftUI

struct GameView: View {
	@EnvironmentObject var game: Game

	var body: some View {
		VStack {
			ClickerView()
				.frame(height: screen.height / 2)
				.glassmorphism()

			Spacer()

			CounterView()
				.glassmorphism()
		}
		.sheet(isPresented: $game.solved) {
			GameOverView()
		}
	}
}

struct GameView_Previews: PreviewProvider {
	static var previews: some View {
		GameView()
	}
}
