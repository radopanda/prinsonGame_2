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
    let flowerName: [String] = ["部屋1", "部屋２", "部屋３"]
    let colors: [UIColor] = [UIColor.red, UIColor.blue, UIColor.yellow]
    let imageNames: [String] = ["image1", "image2", "image3"]


    
    @IBOutlet weak var item1Obj: UIImageView!
    @IBOutlet weak var item2Obj: UIImageView!
    @IBOutlet weak var item3Obj: UIImageView!
    
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
        count += 1
        if count == flowerName.count {
            count = 0
        }
        //label の変更
  
        // image の変更
        flowerImageView.image = UIImage(named: imageNames[count])
    }
  
    @IBAction func ItemButton(_ sender: Any) {
        if flowerName[count] == "部屋３" {
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

    @IBAction func getItemButton(_ sender: Any) {
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
            
            self.getNumber1Item = true
        }else{
            let alert = UIAlertController(
                title: "お知らせ",
                message: "何もありません。",
                preferredStyle: .alert)
            // アラートにボタンをつける
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            // アラート表示
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    func tap(_ sender: UITapGestureRecognizer){
        
        print("タップ")
let image = UIImage(named: imageNames[count])!
        
//var myImageView = flowerImageView
        
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
        
        if flowerName[count] == "部屋２" && round(originalTapPoint.x) > 1076 && round(originalTapPoint.x) < 1280 && round(originalTapPoint.y) > 1685 && round(originalTapPoint.y) < 1778 && getNumber1Item == false{
            
            // アラートを作成
            
            let alert = UIAlertController(
                
                title: "お知らせ",
                
                message: "アイテムを取得しました",
                
                preferredStyle: .alert)
            
            // アラートにボタンをつける
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            // アラート表示
            
            self.present(alert, animated: true, completion: nil)
            
            self.getNumber1Item = true
            
            print(getNumber1Item)
            
        }else if flowerName[count] == "部屋３" && round(originalTapPoint.x) > 1023 && round(originalTapPoint.x) < 1180 && round(originalTapPoint.y) > 1160 && round(originalTapPoint.y) < 1348 && getNumber1Item == true {
            
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

