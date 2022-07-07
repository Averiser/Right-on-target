//
//  Game.swift
//  Right on target
//
//  Created by MyMacBook on 06.07.2022.
//

import Foundation

protocol GameProtocol {
  // number of scored pointss
  var score: Int { get }
  // secret value
  var currentSecretValue: Int { get }
  // check whether game is over or not
  var isGameEnded: Bool { get }
  
  func restartGame()
  
  func startNewRound()
  
  func calculateScore(with value: Int)
}

class Game: GameProtocol {
  
  var score: Int = 0
  
  var currentSecretValue: Int = 0
  
  private var minSecretValue: Int
  private var maxSecretValue: Int
  
  private var lastRound: Int
  private var currentRound: Int = 1
  
  var isGameEnded: Bool {
    if currentRound >= lastRound {
     return true
    } else {
     return false
    }
  }
  
  init?(startValue: Int, endValue: Int, rounds: Int) {
    // Стартовое значение для выбора случайного числа не может быть больше конечного
    guard startValue <= endValue else {
      return nil
    }
    minSecretValue = startValue
    maxSecretValue = endValue
    lastRound = rounds
    currentSecretValue = getNewSecretValue()
  }
  
  func restartGame() {
    currentRound = 0
    score = 0
    startNewRound()
  }
  
  func startNewRound() {
    currentSecretValue = getNewSecretValue()
    currentRound += 1
  }
  
  // Загадать и вернуть новое случайное значение
  private func getNewSecretValue() -> Int {
    (minSecretValue...maxSecretValue).randomElement()!
  }
  
  func calculateScore(with value: Int) {
    if value > currentSecretValue {
      score += 50 - value + currentSecretValue
    } else if value < currentSecretValue {
      score += 50 - currentSecretValue + value
    } else {
      score += 50
    }
  }
}
