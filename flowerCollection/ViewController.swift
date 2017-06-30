//
//  ViewController.swift
//  flowerCollection
//
//  Created by seisaku on 2017/04/22.
//  Copyright © 2017年 seisaku. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {

    // ラベルがつながっているやつ
    @IBOutlet weak var flowerLabel: UILabel!
    // 背景画像用
    @IBOutlet weak var flowerImageView: UIImageView!
    
    @IBOutlet weak var ItemButtonObj: UIButton!
    @IBOutlet weak var itemButton: UIButton!
    var count:Int = 0
    let flowerName: [String] = ["部屋1","部屋2","部屋3","部屋4","部屋5"]
    let colors: [UIColor] = [UIColor.red, UIColor.blue, UIColor.yellow]
    let imageNames: [String] = ["image2", "image1", "image4", "image6", "image3"]
    @IBOutlet weak var item1Obj: UIImageView!
    @IBOutlet weak var item2Obj: UIImageView!
    @IBOutlet weak var item3Obj: UIImageView!

    var ItemUse: [Bool] = [false]
    
    var getNumber1Item = false{
        willSet {
            item1Obj.isHidden=true

        }
        didSet {
            item1Obj.isHidden = false
        }
    }
    var getNumber2Item = false{
        willSet {
            item1Obj.isHidden=true
        }
        didSet {
            item1Obj.isHidden = false
        }
    }
    var getNumber3Item = false{
        willSet {
            item1Obj.isHidden=true
        }
        didSet {
            item1Obj.isHidden = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(ViewController.tap(_:)))
        // デリゲートをセット
        tapGesture.delegate = self;
        self.view.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushButton(_ sender: Any) {
        if count >= 0 && count <= 3{
            count += 1
        }

        flowerImageView.image = UIImage(named: imageNames[count])
    }
    
    @IBAction func backbutton(_ sender: Any) {
        if count >= 1 && count <= 4{
            count -= 1
        }
        
        flowerImageView.image = UIImage(named: imageNames[count])
    }
    
    func tap(_ sender: UITapGestureRecognizer){
        print("タップ")
        let image = UIImage(named: imageNames[count])!
        
        //表示されている画像のタップ座標用変数
        var tapPoint = CGPoint(x: 0, y: 0)
        //元の画像のタップ座標用変数
        var originalTapPoint = CGPoint(x: 0, y: 0)
        
        //ImageView上のタップ座標を取得
        tapPoint = sender.location(in: flowerImageView)
        
        //サイズの倍率を算出し、UIImage上でのタップ座標を求める
        originalTapPoint.x = image.size.width/flowerImageView.frame.width * tapPoint.x
        originalTapPoint.y = image.size.height/flowerImageView.frame.height * tapPoint.y
        
        print(round(originalTapPoint.x))
        print(round(originalTapPoint.y))
        //銀の鍵取得
        if flowerName[count] == "部屋1" && round(originalTapPoint.x) > 1076 && round(originalTapPoint.x) < 1280 && round(originalTapPoint.y) > 1685 && round(originalTapPoint.y) < 1778 && getNumber1Item == false{
            // アラートを作成
            let alert = UIAlertController(
                title: "お知らせ",
                message: "銀の鍵を取得しました",
                preferredStyle: .alert)
            // アラートにボタンをつける
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            // アラート表示
            self.present(alert, animated: true, completion: nil)
            self.getNumber1Item = true
        //銀の鍵使用
        }else if flowerName[count] == "部屋2" && round(originalTapPoint.x) > 590 && round(originalTapPoint.x) < 1655 && round(originalTapPoint.y) > 2670 && round(originalTapPoint.y) < 2980 && getNumber1Item == true{
            // アラートを作成
            let alert = UIAlertController(
                title: "お知らせ",
                message: "銀の鍵を使用しました。牢屋の中を探索できます。",
                preferredStyle: .alert)
            // アラートにボタンをつける
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            // アラート表示
            self.present(alert, animated: true, completion: nil)
            self.getNumber1Item = false
            
            // アイテム使用の判定を追加
            ItemUse[0] = true
        //金の鍵取得
        }else if flowerName[count] == "部屋2" && round(originalTapPoint.x) > 350 && round(originalTapPoint.x) < 625 && round(originalTapPoint.y) > 1125 && round(originalTapPoint.y) < 1350 && getNumber2Item == false && ItemUse[0] == true {

            // アラートを作成
            let alert = UIAlertController(
                title: "お知らせ",
                message: "金の鍵を取得しました",
                preferredStyle: .alert)
            // アラートにボタンをつける
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            // アラート表示
            self.present(alert, animated: true, completion: nil)
            self.getNumber2Item = true
            //ブラックライト取得
        }else if flowerName[count] == "部屋4" && round(originalTapPoint.x) > 1050 && round(originalTapPoint.x) < 1200 && round(originalTapPoint.y) > 1850 && round(originalTapPoint.y) < 2000 && getNumber3Item == false{
            // アラートを作成
            let alert = UIAlertController(
                title: "お知らせ",
                message: "ブラックライトを取得しました",
                preferredStyle: .alert)
            // アラートにボタンをつける
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            // アラート表示
            self.present(alert, animated: true, completion: nil)
            self.getNumber3Item = true
        //ゲームオーバー
        }else if flowerName[count] == "部屋4" && round(originalTapPoint.x) > 600 && round(originalTapPoint.x) < 1700 && round(originalTapPoint.y) > 250 && round(originalTapPoint.y) < 1850 && getNumber3Item == true {
        //画像紐づけて
            //let storyboard: UIStoryboard = self.storyboard!
            //let nextView = storyboard.instantiateViewController(withIdentifier: "next") as! NextViewController
            //self.present(nextView, animated: true, completion: nil)
            
            //コンプリート
        //画像変えて
        }else if flowerName[count] == "部屋5" && round(originalTapPoint.x) > 1023 && round(originalTapPoint.x) < 1180 && round(originalTapPoint.y) > 1160 && round(originalTapPoint.y) < 1348 && getNumber2Item == true {
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "next") as! NextViewController
            self.present(nextView, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(
                title: "お知らせ",
                message: "何も起きませんでした。",
                preferredStyle: .alert)
            // アラートにボタンをつける
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            // アラート表示
            self.present(alert, animated: true, completion: nil)
        }
    }
}

