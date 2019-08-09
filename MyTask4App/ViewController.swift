//
//  ViewController.swift
//  MyTask4App
//
//  Created by VERTEX24 on 2019/08/07.
//  Copyright © 2019 VERTEX24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   // datePickerの定義
    @IBOutlet weak var datePicker: UIDatePicker!
    // 占い結果を表示するところ
    @IBOutlet weak var textView: UITextView!
    // 血液型を選んでもらうやつ
    @IBOutlet weak var bloodButton: UISegmentedControl!
    // sliderのやつ
    @IBOutlet weak var sliderBar: UISlider!
    // sliderの数字を表示するとこ
    @IBOutlet weak var numLabel: UILabel!
    // datePickerでの占い結果
    let fortune1View: [String] = ["あなたは日本の山に愛されています","あなたはブラジルの川に愛されています","あなたはイタリアの海に愛されています" ]
    // 血液型での占い結果
    let fortune2View: [String] = ["歩きスマホをしてたら電柱にぶつかる1日になります","目の前で電車のドアが閉まるかも","トイレットペーパーがトイレットペーパーがすべて切れるかも","タイプの店員さんから連絡先を聞かれるかも"]
    // sliderでの占い結果
    let fortune3View: [String] = ["ラッキーアイテムは焼き芋です。","ラッキーアイテムはsoyjoyです","ラッキーアイテムはコーヒーです」"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // textViewをいじれせないようにする
        textView.isUserInteractionEnabled = false
        // numLabelをいじれせないようにする
        numLabel.isUserInteractionEnabled = false
    }
    
    // slierが動かされたとき下のLabelにその数字を表示する
    @IBAction func moveSlider(_ sender: UISlider) {
        numLabel.text = String(Int(sliderBar.value))
    }
    
    
    // 占いボタンが押されたときの動作
    @IBAction func button(_ sender: UIButton) {
        // 呼び出した結果をtextViewに表示する
        textView.text = fortune1() + fortune2() + fortune3()
    }
    
    // datePickerの数字から占い結果を取り出す関数
    func fortune1 () -> String {
        // datePickerから年のみを取り出す
        let year = Calendar.current.component(.year, from: datePicker.date)
        // datePickerから月のみを取り出す
        let month = Calendar.current.component(.month, from: datePicker.date)
        // datePickerから日のみを取り出す
        let day = Calendar.current.component(.day, from: datePicker.date)
        // 年月日それぞれの値を足し合わせる
        let dateTotal: Int = year + month + day
        // 足した合計を3で割ってあまりによって条件分岐
        if dateTotal % 3 == 0{
            return fortune1View[0]
        }else if dateTotal % 3 == 1{
            return fortune1View[1]
        }else {
            return fortune1View[2]
        }
    }
    
    func fortune2 () -> String {
        let bloodType = bloodButton.selectedSegmentIndex
        return fortune2View[bloodType]
    }
    
    func fortune3 () -> String {
        let sliderNum = Int(sliderBar.value)
        if sliderNum % 3 == 0 {
            return fortune3View[0]
        }else if sliderNum % 3 == 1{
            return fortune3View[1]
        }else {
            return fortune3View[2]
        }
    }
    
    
    
}

