//
//  GameModel.swift
//  AutomatedTests
//
//  Created by Daniel Pustotin on 19.09.2021.
//

import Foundation
import SwiftUI

struct Ball: Hashable {
	var position: CGPoint
	var color: Color
	func hash(into hasher: inout Hasher) {
		hasher.combine(position.x)
		hasher.combine(position.y)
		hasher.combine(color)
	}

	init(position: CGPoint) {
		self.position = position
		color = allColors.randomElement()!
	}

	mutating func changeColor() {
		color = allColors.filter({ $0 != color }).randomElement()!
	}
}

class Game: ObservableObject {
	@Published private(set) var colors: Dictionary<Color, Int> = [:]
	@Published private(set) var balls: [Ball] = []
	@Published var solved: Bool = false

	func add(ball: Ball) {
		balls.append(ball)
		colors[ball.color] = (colors[ball.color] ?? 0) + 1
		checkSolved()
	}

	func changeColor(ball: Ball) {
		colors[ball.color]! -= 1
		balls.removeAll(where: { $0 == ball })
		var new = ball
		new.changeColor()
		add(ball: new)
		checkSolved()
	}

	func checkSolved() {
		solved = balls.count != 0 && balls.count % allColors.count == 0 && colors.filter({ $0.value == balls.count / allColors.count }).count == allColors.count
	}

	func reset() {
		colors = [:]
		balls = []
		solved = false
	}
}
