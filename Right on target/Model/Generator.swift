//
//  Generator.swift
//  Right on target
//
//  Created by MyMacBook on 07.07.2022.
//

import Foundation

protocol GeneratorProtocol {
  func getRandomValue() -> Int
}

class NumberGenerator: GeneratorProtocol {
  
  var startRangeValue: Int
  var endRangeValue: Int
  init?(startValue: Int, endValue: Int) {
    guard startValue <= endValue else {
      return nil
    }
    startRangeValue = startValue
    endRangeValue = endValue
  }
  func getRandomValue() -> Int {
    (startRangeValue...endRangeValue).randomElement()!
  }
}
