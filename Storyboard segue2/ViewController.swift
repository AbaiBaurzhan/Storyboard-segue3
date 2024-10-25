//
//  ViewController.swift
//  Storyboard segue2
//
//  Created by Абай Бауржан on 23.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
           super.viewDidLoad()
       }
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "SecondVC" {
               if let vc = segue.destination as? SecondViewController {
                   vc.startDate = startDatePicker.date
                   vc.endDate = endDatePicker.date
               }
           }
       }
   }

