//
//  ThreePickerViewController.swift
//  MultiplePickerViewTest
//
//  Created by Terry Yang on 2017/6/18.
//  Copyright © 2017年 terryyamg. All rights reserved.
//

import UIKit

class ThreePickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker3: UIPickerView!
    
    //第一輪
    var list1  = ["亞洲","歐洲"]
    //第二輪
    var list21 = ["日本","台灣"]
    var list22 = ["英國","德國","義大利"]
    //第三輪
    var list211 = ["東京","沖繩","北海道"]
    var list212 = ["台北","台中","台南","高雄","台東"]
    var list221 = ["倫敦"]
    var list222 = ["柏林"]
    var list223 = ["羅馬"]
    
    //init
    var island : String = "亞洲"
    var country : String = "日本"
    var city : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        picker3.delegate = self
        picker3.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //幾個滾輪
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    //確認各個滾輪有幾筆
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //component - 第幾個滾輪
        switch(component){
        case 0:
            return list1.count
        case 1:
            return island == "亞洲" ? list21.count : list22.count
        case 2:
            switch country {
            case "日本":
                return list211.count
            case "台灣":
                return list212.count
            case "英國":
                return list221.count
            case "德國":
                return list222.count
            case "義大利":
                return list223.count
            default:
                return 0
            }
        default:
            return 0
        }
    }
    
    //放入內容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch(component){
        case 0:
            return list1[row]
        case 1:
            //true: 回傳第二輪的亞洲內容 false: 回傳第二輪的歐洲內容
            return island == "亞洲" ? list21[row] : list22[row]
        case 2:
            switch country {
            case "日本":
                return list211[row]
            case "台灣":
                return list212[row]
            case "英國":
                return list221[row]
            case "德國":
                return list222[row]
            case "義大利":
                return list223[row]
            default:
                return nil
            }
        default:
            return nil
        }
    }
    
    //回傳選擇的字串
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            island = list1[row]
            updateCountry(0)
            updateCity(0)
            print("洲: \(island)")
            //選擇第一個滾輪後-重新載入
            pickerView.reloadAllComponents()
            //第二個與第三個滾輪回到第一個項目
            pickerView.selectRow(0, inComponent: 1, animated: true)
            pickerView.selectRow(0, inComponent: 2, animated: true)
        case 1:
            updateCountry(row)
            updateCity(0)
            print("國: \(country)")
            //選擇第二個滾輪後-重新載入
            pickerView.reloadAllComponents()
            //第三個滾輪回到第一個項目
            pickerView.selectRow(0, inComponent: 2, animated: true)

        case 2:
            updateCity(row)
            print("城: \(city)")
        default:
            print("無")
        }
        
    }
    
    func updateCountry(_ row: Int){
        if island == "亞洲" {
            country = list21[row]
        } else {
            country = list22[row]
        }
    }
    
    func updateCity(_ row: Int){
        switch country {
        case "日本":
            city = list211[row]
        case "台灣":
            city = list212[row]
        case "英國":
            city = list221[row]
        case "德國":
            city = list222[row]
        case "義大利":
            city = list223[row]
        default:
            print("無")
        }
        
    }
    
}

