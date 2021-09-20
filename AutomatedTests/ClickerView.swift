//
//  ClikerView.swift
//  AutomatedTests
//
//  Created by Daniel Pustotin on 20.09.2021.
//

import SwiftUI

struct ClickerView: View {
	@EnvironmentObject var game: Game
    var body: some View {
		ZStack {
			Background { location in
				print(location)
				
				game.add(ball: Ball(position: location))
			}

			ForEach(game.balls, id: \.self) { ball in
				Circle()
					.frame(width: 50, height: 50)
					.foregroundColor(ball.color)
					.position(ball.position)
					.onTapGesture {
						game.changeColor(ball: ball)
					}
			}
		}
    }
}

struct Background: UIViewRepresentable {
	var tappedCallback: ((CGPoint) -> Void)

	func makeUIView(context: UIViewRepresentableContext<Background>) -> UIView {
		let v = UIView(frame: .zero)
		let gesture = UITapGestureRecognizer(target: context.coordinator,
											 action: #selector(Coordinator.tapped))
		v.addGestureRecognizer(gesture)
		return v
	}

	class Coordinator: NSObject {
		var tappedCallback: ((CGPoint) -> Void)
		init(tappedCallback: @escaping ((CGPoint) -> Void)) {
			self.tappedCallback = tappedCallback
		}
		@objc func tapped(gesture:UITapGestureRecognizer) {
			let point = gesture.location(in: gesture.view)
			self.tappedCallback(point)
		}
	}

	func makeCoordinator() -> Background.Coordinator {
		return Coordinator(tappedCallback:self.tappedCallback)
	}

	func updateUIView(_ uiView: UIView,
					  context: UIViewRepresentableContext<Background>) {
	}

}

struct ClikerView_Previews: PreviewProvider {
    static var previews: some View {
        ClickerView()
    }
}
