//
//  AlermSetViewController.swift
//  Study
//
//  Created by 平井健三 on 2019/07/27.
//  Copyright © 2019 平井健三. All rights reserved.
//

import UIKit

class AlermSetViewController: UIViewController {
    
    let alarm = Alarm()
    
    @IBOutlet var sleepTimePicker: UIDatePicker!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        sleepTimePicker.datePickerMode = UIDatePicker.Mode.time
      
        sleepTimePicker.setDate(Date(), animated: false)
        // Do any additional setup after loading the view.
    }
        
       override func viewDidAppear(_ animated: Bool) {
            //AlarmでsleepTimerがnilじゃない場合
            if alarm.sleepTimer != nil{
                //再生されているタイマーを止める
                alarm.sleepTimer()
            }
        }
        
    
    
   
    
    @IBAction func alarmBtnWasPressed(_ sender: UIButton) {
        alarm.selectedWakeUpTime = sleepTimePicker.date
        alarm.runTimer()
        performSegue(withIdentifier: "setToSleeping", sender: nil)
        
        if seconds != 0{
            //secondsから-1する
            seconds -= 1
        }else{
            //タイマーを止める
            sleepTimer?.invalidate()
            //タイマーにnil代入
            sleepTimer = nil
            //音源のパス
            let soundFilePath = Bundle.main.path(forResource: "", ofType: "")!
            //パスのURL
            let sound:URL = URL(fileURLWithPath: soundFilePath)
            do {
                //AVAudioPlayerを作成
                audioPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
            } catch {
                print("Could not load file")
            }
            //再生
            audioPlayer.play()
        }
    }
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
