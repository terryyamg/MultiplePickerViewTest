//
//  OnePickerViewController.swift
//  MultiplePickerViewTest
//
//  Created by Terry Yang on 2017/6/18.
//  Copyright © 2017年 terryyamg. All rights reserved.
//

import UIKit

class OnePickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker1: UIPickerView!
    
    var list1 = ["亞洲","歐洲"] //第一輪
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        picker1.delegate = self
        picker1.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //幾個滾輪
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //確認各個滾輪有幾筆
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list1.count
    }
    
    //放入內容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list1[row]
    }
    
    //回傳選擇的字串
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("洲: \(list1[row])")
        
    }
}

