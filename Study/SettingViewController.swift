//
//  SettingViewController.swift
//  Study
//
//  Created by 平井健三 on 2019/07/28.
//  Copyright © 2019 平井健三. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    //UIPickerVIewに表示するデータをArrayに追加する
    let settingArray: [Int] = [300, 600, 900, 1200, 1500]
    //設定値を覚えるキーを設定
    let settingKey = "timer_value"
    
    
    
    
    
    @IBOutlet weak var timerSettingPicker: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerSettingPicker.delegate = self
      
    
        
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        
        for row in 0..<settingArray.count {
            if settingArray[row] == timerValue {
                timerSettingPicker.selectRow(row, inComponent: 0, animated: true)
            }
            
        }

        // Do any additional setup after loading the view.
    }
    @IBAction func decisionButtonAction() {
        //前画面に戻る
        _ = navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return String(settingArray[row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let settings = UserDefaults.standard
        settings.setValue(settingArray[row], forKey: settingKey)
        settings.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
