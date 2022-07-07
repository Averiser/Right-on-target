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
// create an instance of essence Game
    game = Game(startValue: 1, endValue: 50, rounds: 5)
    // update value of secret number
    updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
  }
  
  // MARK: - Interlocking View - Model
  
  @IBAction func checkNumber() {

    // Calculate points per round
    game.calculateScore(with: Int(slider.value))
    // Check whether game is over or not
    if game.isGameEnded {
      showAlertWith(score: game.score)
      game.restartGame()
    } else {
      game.startNewRound()
    }
    // Update current secret number
    updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
  }
  
  
//  lazy var secondViewController: SecondViewController = getSecondViewController()
//
//  private func getSecondViewController() -> SecondViewController {
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
//    return viewController as! SecondViewController
//  }
  
//  var number: Int = 0
//  var round: Int = 1
//  var points: Int = 0

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

