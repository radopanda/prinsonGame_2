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
    
    var count:Int = 0
    let flowerName: [String] = ["部屋1", "部屋２", "部屋３"]
    let colors: [UIColor] = [UIColor.red, UIColor.blue, UIColor.yellow]
    let imageNames: [String] = ["image1", "image2", "image3"]
    
    
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
    }


}

