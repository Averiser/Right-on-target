//
//  ViewController.swift
//  Right on target
//
//  Created by MyMacBook on 03.07.2022.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var slider: UISlider!
  @IBOutlet var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("viewDidLoad")
    
    // let's generate a random number
    number = Int.random(in: 1...50)
    // transmit the value of the random number into Label
    label.text = String(number)
  }
  
  override func loadView() {
    print("loadView")
    super.loadView()
    
//    let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
//    versionLabel.text = "Version 1.1"
//    view.addSubview(versionLabel)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("viewDidAppear")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear")
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("viewWillDisappear")
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("viewDidDisappear")
  }
  
  lazy var secondViewController: SecondViewController = getSecondViewController()
  
  private func getSecondViewController() -> SecondViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
    return viewController as! SecondViewController
  }
  
  var number: Int = 0
  var round: Int = 1
  var points: Int = 0
  
  @IBAction func showNextScreen() {
    self.present(secondViewController, animated: true, completion: nil)
  }
  
  @IBAction func checkNumber() {
      // if game just begins
//    if round == 0 {
//      // let's generate a random number
//      number = Int.random(in: 1...50)
//      // transmit the value of the random number into Label
//      label.text = String(number)
//      round = 1
//    } else {
      // let's get the value on the slider
      let numSlider = Int(slider.value.rounded())
      // compare the value with the made-up one and count the score
      if numSlider > number {
        points += 50 - numSlider + number
      } else if numSlider < number {
        points += 50 - number + numSlider
      } else {
        points += 50
      }
      
      if round == 5 {
        let alert = UIAlertController(title: "Game over", message: "You scored \(points) points!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try from the very beginning", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        round = 1
        points = 0
      } else {
        round += 1
      }
      // generate a random number
      number = Int.random(in: 1...50)
      label.text = String(number)
//    }
  }


}

