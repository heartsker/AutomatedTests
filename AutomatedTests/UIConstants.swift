//
//  UIConstants.swift
//  TheHatGame
//
//  Created by Daniel Pustotin on 25.08.2021.
//

import SwiftUI

let screen = UIScreen.main.bounds.size
let screenReversed = CGSize(width: -screen.width, height: -screen.height)
let screen_2_3 = CGSize(width: screen.width * 2 / 3, height: screen.height * 2 / 3)
let screenReversed_2_3 = CGSize(width: -screen.width * 2 / 3, height: -screen.height * 2 / 3)
let screen_4_5 = CGSize(width: screen.width * 4 / 5, height: screen.height * 4 / 5)
let screenReversed_4_5 = CGSize(width: -screen.width * 4 / 5, height: -screen.height * 4 / 5)

let cornerRadiusBig: CGFloat = 25.0
let cornerRadiusSmall: CGFloat = 10.0
let shadowRadiusBig: CGFloat = 10.0

// MARK: Carousel view constants
let spacing: CGFloat = screen.width / 15
let edgeCardWidth: CGFloat = screen.width / 15
let cardHeight: CGFloat = screen_2_3.height
