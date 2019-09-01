//
//  StartViewController.swift
//  Study
//
//  Created by 平井健三 on 2019/08/24.
//  Copyright © 2019 平井健三. All rights reserved.
//

import UIKit
import Charts



class StartViewController: UIViewController {
    
    let recordData: UserDefaults = UserDefaults.standard
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        var rect = view.bounds
        rect.origin.y = 400
        rect.size.height = 300
        let chartView = PieChartView(frame: rect)
        
        // 取り出します
        let mathRecordArray: [Dictionary<String, Any>]  = recordData.object(forKey:"mathRecordArray") as? [Dictionary<String, Any>] ?? []
        var mathTime: Float = 0.0
        for i in 0 ..< mathRecordArray.count {
            let studyRecord = StudyRecord(mathRecordArray[i])
            mathTime += studyRecord.time
        }
        let japaneseRecordArray: [Dictionary<String, Any>] = recordData.object(forKey: "japaneseRecordArray") as? [Dictionary<String, Any>] ?? []
        var japaneseTime: Float = 0.0
        for i in 0..<japaneseRecordArray.count {
            let studyRecord2 = StudyRecord(japaneseRecordArray[i])
            japaneseTime += studyRecord2.time
        }
        let englishRecordArray: [Dictionary<String, Any>] =
            recordData.object(forKey: "englishRecordArray") as? [Dictionary<String, Any>] ?? []
        var englishTime: Float = 0.0
        for i in 0..<englishRecordArray.count {
            let studyRecord3 = StudyRecord(englishRecordArray[i])
            englishTime += studyRecord3.time
        }
        let scienceRecordArray: [Dictionary<String, Any>] = recordData.object(forKey: "scienceRecordArray") as? [Dictionary<String, Any>] ?? []
        var scienceTime: Float = 0.0
        for i in 0..<scienceRecordArray.count {
            let studyRecord = StudyRecord(scienceRecordArray[i])
            scienceTime += studyRecord.time
        }
        let societyRecordArray: [Dictionary<String, Any>] =
            recordData.object(forKey: "sociologyRecordArray") as?[Dictionary<String, Any>] ?? []
        var societyTime: Float = 0.0
        for i in 0..<societyRecordArray.count {
            let studyRecord = StudyRecord(scienceRecordArray[i])
            societyTime += studyRecord.time
        }
        
        let entries = [
            PieChartDataEntry(value: Double(mathTime), label: "数学"),
            PieChartDataEntry(value: Double(japaneseTime), label: "国語"),
            PieChartDataEntry(value: Double(englishTime), label: "英語"),
            PieChartDataEntry(value: Double(scienceTime), label: "理科"),
            PieChartDataEntry(value: Double(societyTime), label: "社会")
       
        ]
        let set = PieChartDataSet(entries: entries, label: "Data")
        chartView.data = PieChartData(dataSet: set)
        view.addSubview(chartView)
        // グラフの色
        set.colors = ChartColorTemplates.vordiplom()
        // グラフのデータの値の色
        set.valueTextColor = UIColor.black
        // グラフのデータのタイトルの色
        set.entryLabelColor = UIColor.black


    }
   
    
   
        
        
        // Do any additional setup after loading the view.
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
