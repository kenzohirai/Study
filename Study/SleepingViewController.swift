//
//  SleepingViewController.swift
//  Study
//
//  Created by 平井健三 on 2019/07/28.
//  Copyright © 2019 平井健三. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class SleepingViewController: UIViewController {
    
    @IBOutlet var countDownLabel: UILabel!
    
    //タイマー変数を宣言
    var timer : Timer?
    //経過時間の変数を作成
    var count = 0
    //設定値を扱うキーを設定
    let settingKey = "timer_value"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UserDefaultsのインスタンスを生成
        let settings = UserDefaults.standard
        //初期値を登録
        settings.register(defaults: [settingKey:60])

        // Do any additional setup after loading the view.
    }
    @IBAction func settingButtonAction() {
        
        if let nowTimer = timer {
            if nowTimer.isValid == true{
                nowTimer.invalidate()
            }
        }
        performSegue(withIdentifier: "a", sender: nil)
    }
    @IBAction func sleepButtonAction() {
        
        if let nowTimer = timer{
            if nowTimer.isValid == true {
                return
            }
        }
        //タイマーをスタート
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerInterrupt(_:)), userInfo: nil, repeats: true)
        
    }
    @IBAction func awakeButtonAction(_ sender: Any) {
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                nowTimer.invalidate()
            }
            
        }
       
    }
    
    //画面切り替えのタイミングで処理を行う
    override func viewDidAppear(_ animated: Bool) {
        count = 0
        _ = displayUpDate()
    }
    //画面を更新する
    func displayUpDate() -> Int {
        //UserDefaultsのインスタンスを生成
        let settings = UserDefaults.standard
        //取得した時間をtimer_valueに移す
        let timerValue = settings.integer(forKey: settingKey)
        //残り時間を生成
        let remainCount = timerValue - count
        //remainCountをラベルに表示
        countDownLabel.text = "残り\(remainCount)秒"
        
        
        //残り時間を戻り値に設定
        return remainCount
    }
    
    func vibrate() {
         AudioServicesPlaySystemSound(SystemSoundID(1304))
        
    }
    
    //経過時間を処理
    @objc func timerInterrupt(_ timer: Timer) {
        //経過時間にプラス1をしていく
        count += 1
        //残り時間0でタイマー停止
        if displayUpDate() == 0 {
            //初期化
            count = 0
            //タイマー停止
            timer.invalidate()
            //音を出す
            vibrate()
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
