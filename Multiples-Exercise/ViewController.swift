//
//  ViewController.swift
//  Multiples-Exercise
//
//  Created by Ricki Hassan on 25/07/2016.
//  Copyright © 2016 Tapp That Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var multipleDisplayLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    var userInput = 0
    var multiple = 1
    var result = 0

    @IBAction func onPlayButtonTapped(_ sender: UIButton) {
        
        if Int(inputTextField.text!) != nil && Int(inputTextField.text!) != 0 {
            userInput = Int(inputTextField.text!)!
            toggleInitialElements()
            toggleMainElements()
        } else {
            showAlert()
        }
    }
    
    @IBAction func onAddButtonTapped(_ sender: UIButton) {
        result = userInput * multiple
        multipleDisplayLabel.text = "\(userInput) x \(multiple) = \(result)"
        multiple += 1
        if isGameOver() {
            restartGame()
        }
    }
    
    
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Please enter a valid number into the box to begin!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it!", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func toggleInitialElements () {
        if logo.isHidden == false {
            logo.isHidden = true
            inputTextField.isHidden = true
            playButton.isHidden = true
        } else {
            logo.isHidden = false
            inputTextField.isHidden = false
            playButton.isHidden = false
        }
        
    }
    
    func toggleMainElements () {
        if multipleDisplayLabel.isHidden == true {
            multipleDisplayLabel.isHidden = false
            addButton.isHidden = false
        } else {
            multipleDisplayLabel.isHidden = true
            addButton.isHidden = true
        }

    }
    
    func isGameOver () -> Bool {
        if multiple > 13 {
            return true
        } else {
            return false
        }
    }
    
    func restartGame () {
        if isGameOver() {
            toggleMainElements()
            toggleInitialElements()
            multiple = 1
            result = 0
            inputTextField.text = ""
            multipleDisplayLabel.text = "Press Add to Add!"
        }
    }
}
