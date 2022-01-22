//
//  QuestionUI.swift
//  FatchData
//
//  Created by Chetu on 22/01/22.
//  Copyright © 2022 Chetu. All rights reserved.
//

import UIKit

class QuestionUI: UIViewController {
  
  var apimodal = [ApiModel] ()
  
  @IBOutlet weak var btnNext: UIButton!
  @IBOutlet weak var question_ui: UILabel!
  @IBOutlet weak var opt4: UIButton!
  @IBOutlet weak var opt3: UIButton!
  @IBOutlet weak var opt2: UIButton!
  @IBOutlet weak var opt1: UIButton!
  override func viewDidLoad() {
        super.viewDidLoad()

    
    callData()
      
       }
  
  
  
func callData() {
  
        ApiNetwork.shareInstance.CallDataFormServer(urlStrings: urlString)
         { (result) in
        
          for valIndex in result{
            
          self.apimodal.append(ApiModel(result: valIndex as! [String : Any]))
            print(valIndex)
          }
          
          getAndPrint()
  }
    
   func getAndPrint(){
    
    let values = apimodal[0]
    let questStore = values.result[question] as! String
     let corret_ans = values.result[correct_answer] as! String
    
    
    
    DispatchQueue.main.async {

        self.question_ui.text  = questStore
        

    }

  }
  
  
}
  

   
  
  
}

