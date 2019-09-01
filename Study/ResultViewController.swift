//
//  ResultViewController.swift
//  Study
//
//  Created by 平井健三 on 2019/08/24.
//  Copyright © 2019 平井健三. All rights reserved.
//

import UIKit
import Accounts


class ResultViewController: UIViewController {
    @IBOutlet var resultSubject: UILabel!
    @IBOutlet var resultTimer: UILabel!
    
    
    
    let recordData: UserDefaults = UserDefaults.standard


    override func viewDidLoad() {
        super.viewDidLoad()
        resultSubject.text = recordData.object(forKey: "studyRecord") as? String
        resultTimer.text = recordData.object(forKey: "timerRecord") as? String
        
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func dismissButton() {
        navigationController?.dismiss(animated: true, completion: nil)

    }
    @IBAction func shareRecord(){
        // 共有する項目
        let text = "\(resultSubject.text ?? "")を\(resultTimer.text ?? "")秒勉強しました!! #StudyCafe"
        let encodedText = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        if let encodedText = encodedText,
            let url = URL(string: "https://twitter.com/intent/tweet?text=\(encodedText)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
        
        let activityItems = [resultSubject, resultTimer] as [Any]
        
        // 初期化処理
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        // 使用しないアクティビティタイプ
        let excludedActivityTypes = [
            UIActivity.ActivityType.postToFacebook,
            UIActivity.ActivityType.postToTwitter,
            UIActivity.ActivityType.message,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.print
        ]
        
        activityVC.excludedActivityTypes = excludedActivityTypes
        
        // UIActivityViewControllerを表示
        self.present(activityVC, animated: true, completion: nil)
        
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
}

