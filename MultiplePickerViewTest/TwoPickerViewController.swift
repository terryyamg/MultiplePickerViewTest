//
//  TwoPickerViewController.swift
//  MultiplePickerViewTest
//
//  Created by Terry Yang on 2017/6/18.
//  Copyright © 2017年 terryyamg. All rights reserved.
//

import UIKit

class TwoPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker2: UIPickerView!
    
    //第一輪
    var list1  = ["亞洲","歐洲"]
    //第二輪
    var list21 = ["日本","台灣"]
    var list22 = ["英國","德國","義大利"]
    
    var island:String = "亞洲"
    var country:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        picker2.delegate = self
        picker2.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //幾個滾輪
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //確認各個滾輪有幾筆
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //component - 第幾個滾輪
        switch component {
        case 0:
            return list1.count
        case 1:
            return island == "亞洲" ? list21.count : list22.count
        default:
            return 0
        }
    }
    
    //放入內容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return list1[row]
        case 1:
            return island == "亞洲" ? list21[row] : list22[row]
        default:
            return nil
        }
    }
    
    //回傳選擇的字串
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            island = list1[row]
            print("洲: \(island)")
            //選擇第一個滾輪後-重新載入第二個滾輪筆數與內容
            pickerView.reloadAllComponents()
        case 1:
            if island == "亞洲" {
                country = list21[row]
            } else {
                country = list22[row]
            }
            print("國: \(country)")
        default:
            print("無")
        }
        
    }
}

