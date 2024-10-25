//
//  SecondViewController.swift
//  Storyboard segue2
//
//  Created by Абай Бауржан on 23.10.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var remainingTimePicker: UIDatePicker!
    
    @IBOutlet weak var startDayLabel: UILabel!
    @IBOutlet weak var endDayLabel: UILabel!
    @IBOutlet weak var remainingDayLabel: UILabel!
    
    var startDate: Date!
    var endDate: Date!
        
    var timer = Timer()
    var isTimerRunning = false
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            startDatePicker.date = startDate
            endDatePicker.date = endDate
            
            remainingTimePicker.date = startDatePicker.date
            
            updateDayLabels()
        }
        
        func updateDayLabels() {
            startDayLabel.text = weekDayAbbreviation(from: startDatePicker.date)
            endDayLabel.text = weekDayAbbreviation(from: endDatePicker.date)
            remainingDayLabel.text = weekDayAbbreviation(from: remainingTimePicker.date)
        }

        @objc func countTime() {
            if remainingTimePicker.date < endDatePicker.date {
                remainingTimePicker.date = remainingTimePicker.date.addingTimeInterval(1)
                remainingDayLabel.text = weekDayAbbreviation(from: remainingTimePicker.date)
            } else {
                timer.invalidate()
            }
        }
        
        @IBAction func startTimer(_ sender: Any) {
            if isTimerRunning {
                return
            }
            
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
            isTimerRunning = true
        }
        
        @IBAction func stopTimer(_ sender: Any) {
            timer.invalidate()
            isTimerRunning = false
        }
        
        @IBAction func restartTimer(_ sender: Any) {
            timer.invalidate()
            isTimerRunning = false

            remainingTimePicker.date = startDatePicker.date
            remainingDayLabel.text = weekDayAbbreviation(from: remainingTimePicker.date) // Обновляем день недели
        }
        
        @IBAction func datePickerChanged(_ sender: UIDatePicker) {
            if sender == startDatePicker {
                remainingTimePicker.date = startDatePicker.date
            } else {
               
                if endDatePicker.date <= startDatePicker.date {
                    endDatePicker.date = startDatePicker.date.addingTimeInterval(3600)
                }
            }
            
   
            updateDayLabels()
        }
        
        func weekDayAbbreviation(from date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.dateFormat = "EEE"
            
            return dateFormatter.string(from: date).uppercased()
        }
    }
