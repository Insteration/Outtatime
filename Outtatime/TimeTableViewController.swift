//
//  TimeTableViewController.swift
//  Outtatime
//
//  Created by Artem Karmaz on 2/27/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class TimeTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, DataDelegate {
    
    
    @IBOutlet var timers: [UIPickerView]!
    @IBOutlet var timerLabels: [UILabel]!
    
    var hours = [0, 0, 0]
    var minutes = [0, 0, 0]
    var seconds = [0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timers.forEach {
            $0.delegate = self
            $0.dataSource = self
        }
        
        createTimeData()
    }
    
    // MARK:- Picker View Delegates
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return Time.hour.count
        } else if component == 1 {
            return Time.minutes.count
        }
        return Time.seconds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return String(Time.hour[row])
        } else if component == 1 {
            return String(Time.minutes[row])
        }
        return String(Time.seconds[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 && timers.index(of: pickerView) == 0 {
            for i in 1..<3 {
                timers[i].selectRow((row + i) % 24, inComponent: 0, animated: true)
            }
            hours[0] = row
            hours[1] = (row + 1) % 24
            hours[2] = (row + 2) % 24

        }
        
        if component == 1 && timers.index(of: pickerView) == 0 {
            print("OK")
            
            for i in 1..<3 {
                timers[i].selectRow((row) % 60, inComponent: 1, animated: true)
            }
            minutes[0] = row
            minutes[1] = row
            minutes[2] = row
        }
        
        if component == 2 && timers.index(of: pickerView) == 0 {
            print("OK")
            
            for i in 1..<3 {
                timers[i].selectRow((row) % 60, inComponent: 2, animated: true)
            }
            seconds[0] = row
            seconds[1] = row
            seconds[2] = row
        }
        
        
        
        timerLabels[0].text = "Time set up is \(hours[0]):\(minutes[0]):\(seconds[0])"
        timerLabels[1].text = "Time set up is \(hours[1]):\(minutes[1]):\(seconds[1])"
        timerLabels[2].text = "Time set up is \(hours[2]):\(minutes[2]):\(seconds[2])"

        
//        if component == 0 && timers.index(of: pickerView) == 1 {
//            for i in 1..<3 {
//                timers[i].selectRow((row - i) % 24, inComponent: 0, animated: true)
//            }
//            timerLabels[0].text = "Hour is \((row - 1) % 24)"
//            timerLabels[1].text = "Hour is \(row)"
//            timerLabels[2].text = "Hour is \((row + 1) % 24)"
//        }
        
        print("select is \(row), compomemt \(component)")
    }
    

    // MARK: - Table view data source
    
    
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
