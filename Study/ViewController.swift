//
//  ViewController.swift
//  Study
//
//  Created by 平井健三 on 2019/07/27.
//  Copyright © 2019 平井健三. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var studyImage: UIImageView!
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    
     @IBOutlet weak var label: UILabel!
    var receiveData: String = ""
    var dictKey = ""
    var receiveData2: String = ""
    var receiveData3: String = ""
    var receiveData4: String = ""
    var receiveData5: String = ""
    
    
    let recordData: UserDefaults = UserDefaults.standard
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if receiveData == "数学" {
            dictKey = "mathRecordArray"
        }
        if receiveData == "国語"{
            dictKey = "japaneseRecordArray"
        }
        if receiveData == "英語" {
            dictKey = "englishRecordArray"
        }
        if receiveData == "理科"{
            dictKey = "scienceRecordArray"
        }
        if receiveData == "社会" {
            dictKey = "sociologyRecordArray"
        }
        
       
        
        label.text = receiveData
        // Do any additional setup after loading the view.
    }
    @objc func up() {
        count = count + 0.01
        timerLabel.text = String(format: "%.2f", count)
    }
    @IBAction func showActivityView(_ sender: UIBarButtonItem){
        let controller = UIActivityViewController(activityItems: [studyImage.image], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func stopWatchStart() {
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        
    }
    @IBAction func stopWatchStop() {
        if timer.isValid{
            timer.invalidate()
        }
        
    }
    @IBAction func stopWatchReset() {
        if timer.isValid{
            timer.invalidate()
            
        }
        count = 0.00
        timerLabel.text = "0.00"
    }
    
    @IBAction func record() {
        let record = StudyRecord(subject: label.text!, time: count)
        
        var recordArray = recordData.object(forKey: dictKey) as? [Dictionary<String, Any>] ?? []
        recordArray.append(record.dict)
        recordData.set(recordArray, forKey: dictKey)
        
        
        // TODO: UserdDefaultsから配列を取得
        // 取得した配列にrecordを追加
        // UserDefaultsに配列を保存
//
        recordData.set(label.text, forKey: "studyRecord")
        recordData.set(timerLabel.text, forKey: "timerRecord")
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
