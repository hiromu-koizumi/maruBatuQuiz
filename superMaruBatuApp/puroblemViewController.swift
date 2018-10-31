//
//  puroblemViewController.swift
//  superMaruBatuApp
//
//  Created by 小泉大夢 on 2018/10/28.
//  Copyright © 2018 小泉大夢. All rights reserved.
//

import UIKit



class puroblemViewController: UIViewController {
    
    var array = [String]()
    var questionsArray: [[String: Any]] = []
    var questionDict: [String: Any] = [:]

    @IBAction func back(_ sender: Any) {
       
    }
    @IBOutlet weak var textField: UITextField!
    
   
    //var result = [Bool]()

    
    
    @IBOutlet weak var marubatubutton: UISegmentedControl!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        
            if textField.text != "" {
                questionDict["question"] = textField.text
               // array.append(textField.text!)
                
                textField.text = ""
                
                print("問題文\(array)")
                
                
                if marubatubutton.selectedSegmentIndex == 0 {
                    questionDict["answer"] = true
                }else{
                    questionDict["answer"] = false
                    //result.append(false)
                    
                    
 print("答え\(questionDict)")
                }
                questionsArray.append(questionDict)
                UserDefaults.standard.set(questionsArray, forKey: "hoge")
//                var save: [String: Any] = [:]
//                save["question"] = array
//                save["answer"] = result
//
//                UserDefaults.standard.set(save, forKey: "hoge")
            }else{
                showAlert(message: "問題文を作成してください")
        }
              }
            
  

   
    @IBAction func remove(_ sender: Any) {
         UserDefaults.standard.removeObject(forKey: "hoge")
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

