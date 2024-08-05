//
//  ViewController.swift
//  Counter
//
//  Created by Алексей Аксенов on 02.08.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private var count = 0
    
    @IBOutlet weak private var textLabel: UILabel!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var triangleButton: UIButton!
    @IBOutlet weak private var history: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "Значение счётчика: 0"
        history.text = "История изменений:" + "\n"
        self.history.isEditable = false
        let range = NSRange(location: history.text.count - 1, length: 0)
        history.scrollRangeToVisible(range)
    }
    
    private func dateFunc () -> String {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .short
        let dateTimeString = formatter.string(from: currentDateTime)
        return dateTimeString
    }
    
    @IBAction private func tapMinusButton(_ sender: Any) {
        count -= 1
        if count < 0 {
            count = 0
            history.text = history.text + "\(dateFunc()): попытка уменьшить значение счётчика ниже 0" + "\n"
        } else {
            history.text = history.text + "\(dateFunc()): значение изменено на -1" + "\n"
        }
        textLabel.text = "Значение счётчика: \(count)"
        
    }
    
    @IBAction private func tapPlusButton(_ sender: Any) {
        count += 1
        textLabel.text = "Значение счётчика: \(count)"
        history.text = history.text + "\(dateFunc()) : значение изменено на +1" + "\n"
    }
    
    
    @IBAction private func tapTriangleButton(_ sender: Any) {
        count = 0
        textLabel.text = "Значение счётчика: \(count)"
        history.text = history.text + "\(dateFunc()) : значение сброшено" + "\n"
    }
    
}


