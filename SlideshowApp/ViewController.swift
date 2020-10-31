//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 田中達也 on 2020/10/20.
//  Copyright © 2020 yanata.denmai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var slideshow: UIImageView!
    
    
    var timer: Timer!
    
    var timer_sec: Float = 0
    
    var counter:Int = 0
    
    
    
  @IBOutlet weak var oStartPause: UIButton!   //stopslide
  @IBOutlet weak var ostartslide: UIButton!   //startslide
    @IBOutlet weak var ostopslide: UIButton!    //backslide
    
    var imageArray:[UIImage] = [
        UIImage(named: "image1")!,
        UIImage(named: "image2")!,
        UIImage(named: "image3")!,
    ]
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         
    
    
        self.slideshow.image = imageArray[0]
    }
    
    @objc func updateTimer(_ timer: Timer) {
          self.timer_sec += 2

        
        
        
        counter = counter + 1
        // 現在用意している画像は3枚なので、カウンターが2より大きくなったら0にする
        if ( counter > 2 ) {
            counter = 0
        }
        if ( counter == 0 ) {
            self.slideshow.image = imageArray[0]
            // カウンターが0の場合はimageName1の画像を表示する
        }
        else if ( counter == 1 ) {
            self.slideshow.image = imageArray[1]
            // カウンターが1の場合はimageName2の画像を表示する
        }
        else if ( counter == 2 ) {
            self.slideshow.image = imageArray[2]
            // カウンターが2の場合はimageName3の画像を表示する
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    // segueから遷移先のResultViewControllerを取得する
    let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        
        expansionViewController.img = slideshow.image
        
        
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    
    @IBAction func startslide(_ sender: Any) {
        
         counter = counter + 1
           // 現在用意している画像は3枚なので、カウンターが2より大きくなったら0にする
           if ( counter > 2 ) {
               counter = 0
           }
        if ( counter == 0 ) {
            self.slideshow.image = imageArray[0]                // カウンターが0の場合はimageName1の画像を表示する
           }
           else if ( counter == 1 ) {
            self.slideshow.image = imageArray[1]                // カウンターが1の場合はimageName2の画像を表示する
           }
           else if ( counter == 2 ) {
            self.slideshow.image = imageArray[2]                // カウンターが2の場合はimageName3の画像を表示する

            // カウンターを1足して次の画像を表示させる
        }
    }
    
    @IBAction func backslide(_ sender: Any) {
         // カウンターを1足して次の画像を表示させる
                 counter = counter - 1
                 
         // 現在用意している画像は3枚なので、カウンターが2より大きくなったら0にする
                   if ( counter < 0 ) {
                       counter = 2
                   }
                   if ( counter == 2 ) {
                       self.slideshow.image = imageArray[2]                   }
                   else if ( counter == 1 ) {
                    self.slideshow.image = imageArray[1]
                   }
                   else if ( counter == 0 ) {
                    self.slideshow.image = imageArray[0]
        }
    }
    
    @IBAction func stopslide(_ sender: Any) {
    
    
        
        
        
        if (timer == nil){
           timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            ostartslide.isEnabled = false
            oStartPause.setTitle("停止", for: .normal)
        }
        else {
            ostartslide.isEnabled = true
            oStartPause.setTitle("再生", for: .normal)
            timer.invalidate()
            timer = nil
            
        }
    }
    
        
    
}

