//
//  ViewController.swift
//  flowerCollection
//
//  Created by seisaku on 2017/04/22.
//  Copyright © 2017年 seisaku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // ラベルがつながっているやつ
    @IBOutlet weak var flowerLabel: UILabel!
    // 背景画像用
    @IBOutlet weak var flowerImageView: UIImageView!
    
    @IBOutlet weak var ItemButtonObj: UIButton!
    @IBOutlet weak var itemButton: UIButton!
    var count:Int = 0
    let flowerName: [String] = ["部屋1", "部屋２", "部屋３"]
    let colors: [UIColor] = [UIColor.red, UIColor.blue, UIColor.yellow]
    let imageNames: [String] = ["image1", "image2", "image3"]
    let getItem = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushButton(_ sender: Any) {
        count += 1
        if count == flowerName.count {
            count = 0
        }
        //label の変更
        flowerLabel.text = flowerName[count]
        flowerLabel.textColor = colors[count]
        // image の変更
        flowerImageView.image = UIImage(named: imageNames[count])
        
        if getItem {
            ItemButtonObj.isEnabled=true
        }else{
            ItemButtonObj.isEnabled=false
        }
    }
  
    @IBAction func ItemButton(_ sender: Any) {
        if flowerName[count] == "部屋３" {
           print(itemButton)
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "next") as! NextViewController
            self.present(nextView, animated: true, completion: nil)

        }
    }

    @IBAction func AcquisitionButton(_ sender: Any) {
        if flowerName[count] == "部屋２" {
        // アラートを作成
        let alert = UIAlertController(
            title: "お知らせ",
            message: "アイテムを取得しました",
            preferredStyle: .alert)
            
            // アラートにボタンをつける
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            // アラート表示
            self.present(alert, animated: true, completion: nil)
            
            let getItem = true
            print(getItem)
        }
    
    }
    

}

