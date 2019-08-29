//
//  alert.swift
//  Study
//
//  Created by 平井健三 on 2019/07/28.
//  Copyright © 2019 平井健三. All rights reserved.
//

import Foundation
class Alarm{
    var selectedWakeUpTime:Date?
    
    var sleepTimer: Timer?
    var seconds = 0
    
    //アラーム/タイマーを開始
    func runTimer(){
        //calculateIntervalにユーザーが入力した日付を渡す、返り値をsecondsに代入
        seconds = calculateInterval(userAwakeTime: selectedWakeUpTime!)
        
        if sleepTimer == nil{
            //タイマーをセット、一秒ごとにupdateCurrentTimeを呼ぶ
            sleepTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    //一秒ごとにsleepTimerに呼ばれる
    @objc private func updateTimer(){
        if seconds != 0{
            //secondsから-1する
            seconds -= 1
        }else{
            //タイマーを止める
            sleepTimer?.invalidate()
            //タイマーにnil代入
            sleepTimer = nil
            //TODO:音を鳴らす
        }
}
    private func calculateInterval(userAwakeTime:Date)-> Int{
        //タイマーの時間を計算する
        var interval = Int(userAwakeTime.timeIntervalSinceNow)
        
        if interval < 0{
            //落とし穴 ②の解決策
            interval = 86400 - (0 - interval)
        }
        //落とし穴 ③の解決策
        let calendar =  Calendar.current
        let seconds = calendar.component(.second, from: userAwakeTime)
        return interval - seconds
    }
}

func stopTimer(){
    //sleepTimerがnilじゃない場合
    if sleepTimer != nil {
        //タイマーを止める
        sleepTimer?.invalidate()
        //タイマーにnil代入
        sleepTimer = nil
    }else{
        //タイマーを止める
        audioPlayer.stop()
    }
}

do {
    //AVAudioPlayerを作成
    audioPlayer = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
    // バックグラウンドでもオーディオ再生可能にする
    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
    try AVAudioSession.sharedInstance().setActive(true)
    
} catch {
    print("Could not load file")
}
//再生
audioPlayer.play()

