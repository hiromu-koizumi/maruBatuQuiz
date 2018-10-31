//
//  ViewController.swift
//  superMaruBatuApp
//
//  Created by 小泉大夢 on 2018/10/28.
//  Copyright © 2018 小泉大夢. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var resultArray = [[String: Any]]()
    var resultMarubatu = [String]()
    
//    resultArray = [
//
//    0:
//
//    [
//    "question":"もんだいぶん",
//    "answer": true
//    ],
//
//
//
//    1:
//
//    [
//    "question":"もんだいぶん",
//    "answer": true
//    ],
//
//
//
//
//    2:
//
//    [
//    "question":"もんだいぶん",
//    "answer": true
//    ]
//
//    ]
//
//
    
    
    @IBOutlet weak var label: UILabel!
    
    var correct: Int = 0
    
    var currentQuestinNum: Int = 0
    
    var questions: [[String: Any]] = []
    
   
    
    func showQuestion(){
        let question = questions[currentQuestinNum]
        
        
        
        if let que = question["question"] as? String{
            print("移動後の問題文2\(que)")
            label.text = que
            
        }
    }
    
    
    //回答のときの処理
    func checkAnswer(yourAnswer:Bool){
        let question = questions[currentQuestinNum]
        print("\(question)")
        if let ans = question["answer"] as? Bool {
            print("\(ans)")
            if yourAnswer == ans{
                currentQuestinNum += 1
                correct += 1
                
                showAlert(message: "正解")
            }else{
                //不正解
                currentQuestinNum += 1
                showAlert(message: "不正解")
            }
            
        }
        if currentQuestinNum >= questions.count{
            
            correct = 0
            currentQuestinNum = 0
            
        }
        showQuestion()
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let savedData = UserDefaults.standard.object(forKey: "hoge") {
//            print("savedData:\(savedData)")
//
//        }else {
//
//            label.text = "なにもありませんよ"
//        }
       UserDefaults.standard.removeObject(forKey: "hoge")
        
        
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "hoge") != nil {
            
            
            questions = UserDefaults.standard.object(forKey: "hoge") as! [[String : Any]]
            print("移動後の問題文\(questions)")
            
            
            showQuestion()
        }else {
            label.text = "なにもありませんよ"
        }
        //テキストフィールドの文字をresultArrayに格納
// if UserDefaults.standard.object(forKey: "hoge") != nil {
//            print("移動後の問題文\(questions)")
//
//
//        showQuestion()
//
//
//
//        }
       
    }
    
    
    @IBAction func unwindToFirstView(segue:UIStoryboardSegue){
        
    }
    
    @IBAction func yesButton(_ sender: Any) {if UserDefaults.standard.object(forKey: "hoge") != nil {
        checkAnswer(yourAnswer: true)
    }
    }

    @IBAction func noButton(_ sender: Any) {
        if UserDefaults.standard.object(forKey: "hoge") != nil {
        checkAnswer(yourAnswer: false)
    }
    }}

