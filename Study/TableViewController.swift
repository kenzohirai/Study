//
//  TableViewController.swift
//  Study
//
//  Created by 平井健三 on 2019/07/27.
//  Copyright © 2019 平井健三. All rights reserved.
//

import UIKit
import Charts

class TableViewController: UITableViewController {
    
     let recordData: UserDefaults = UserDefaults.standard
    
    // cellのlabelに書く文字列
    let name1: [String] = ["数学", "国語", "英語", "理科", "社会"]
    
    
   
    
    // 遷移先のViewControllerに渡す変数
    var giveData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var rect = view.bounds
        rect.origin.y = 325
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
        let set = PieChartDataSet(entries: entries, label: "")
        chartView.data = PieChartData(dataSet: set)
        view.addSubview(chartView)
        // グラフの色
        set.colors = ChartColorTemplates.vordiplom()
        // グラフのデータの値の色
        set.valueTextColor = UIColor.black
        // グラフのデータのタイトルの色
        set.entryLabelColor = UIColor.black
        
        
    }
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    
    // sectionの数を返す関数
override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // sectionごとのcellの数を返す関数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return name1.count
        }
        else {
            return 0
        }
    }
    
    // sectionの高さを返す関数
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // sectionに載せる文字列を返す関数
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "教科を選択"
    }
    
    // cellの情報を書き込む関数
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        // ここでcellのlabelに値を入れています。
        if indexPath.section == 0 {
            cell.name.text = name1[indexPath.item]
        }
        
        return cell
    }
    
    // cellが押されたときに呼ばれる関数
    // 画面遷移の処理もここで書いている
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 押されたときのcellのlabelの文字列をViewControllerに渡したいので、一旦、giveDataに入れとく
        if indexPath.section == 0 {
            giveData = name1[indexPath.item]
        } else {
            
        }
        // Segueを使った画面遷移を行う関数
        performSegue(withIdentifier: "segue", sender: nil)
    }
    
    // 遷移先のViewControllerにデータを渡す関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let vc = segue.destination as! ViewController
            vc.receiveData = giveData
            
        }
    }

}

    
    
    
   

