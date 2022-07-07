//
//  ViewController.swift
//  Right on target
//
//  Created by MyMacBook on 03.07.2022.
//

import UIKit

class ViewController: UIViewController {
  
  // the essence "Game"
  var game: Game!

  @IBOutlet var slider: UISlider!
  @IBOutlet var label: UILabel!
  
  // MARK: - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let generator = NumberGenerator(startValue: 1, endValue: 50)!
// create an instance of essence Game
    game = Game(valueGenerator: generator, rounds: 5)
    // update value of secret number
    updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
  }
  
  // MARK: - Interlocking View - Model
  
  @IBAction func checkNumber() {

    // Calculate points per round
    game.currentRound.calculateScore(with: Int(slider.value))
    // Check whether game is over or not
    if game.isGameEnded {
      showAlertWith(score: game.score)
      game.restartGame()
    } else {
      game.startNewRound()
    }
    // Update current secret number
    updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
  }
  

// MARK: - Updating View
  
  private func updateLabelWithSecretNumber(newText: String) {
    label.text = newText
  }
  
  // MARK: - Rendering of a popup screen
  private func showAlertWith(score: Int) {
    let alert = UIAlertController(
      title: "Game over",
      message: "You scored \(score) points!",
      preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Try from the very beginning", style: .default, handler: nil))
    present(alert, animated: true, completion: nil)
  }
  
}

