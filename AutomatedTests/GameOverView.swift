//
//  GameOverView.swift
//  AutomatedTests
//
//  Created by Daniel Pustotin on 20.09.2021.
//

import SwiftUI

struct GameOverView: View {
	@EnvironmentObject var game: Game
    var body: some View {
		VStack {
			Text("You won!")
				.font(.largeTitle)
				.padding()

			Text("Want to play again?")
				.font(.title2)
				.padding()

			Button {
				game.reset()
			} label: {
				Image(systemName: "play.fill")
					.font(.largeTitle)
					.padding()
			}
			.frame(width: screen_2_3.width / 2)
			.glassmorphism()
		}

    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
    }
}
