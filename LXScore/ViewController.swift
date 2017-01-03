//
//  ViewController.swift
//  LXScore
//
//  Created by SinodomMac02 on 16/9/23.
//  Copyright © 2016年 李响. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
             var  la = UILabel()
             var  lb = UILabel()
             var  lc = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
            let dd = LXScoreView()
            dd.addTarget(self, action: #selector(didChangeValue(score:)), for: UIControlEvents.valueChanged)
            dd.backgroundColor = UIColor.white
            dd.frame = CGRect(x: 20, y: 100 , width: 200, height: 40)
            self.view.addSubview(dd)

            la = UILabel()
            la.text = " 3.5 星分"
            la.textAlignment = NSTextAlignment.center
            la.backgroundColor = UIColor.red
            la.frame = CGRect(x: 240, y: 100, width: 100, height: 40)
            self.view.addSubview(la)

            let ee = LXScoreView()
            ee.addTarget(self, action: #selector(ChangeValue(score:)), for: UIControlEvents.valueChanged)
            ee.backgroundColor = UIColor.white
            ee.frame = CGRect(x: 20, y: 100 + 60 , width: 200, height: 40)
            self.view.addSubview(ee)

            lc = UILabel()
            lc.text = " 3.5 星分"
            lc.textAlignment = NSTextAlignment.center
            lc.backgroundColor = UIColor.red
            lc.frame = CGRect(x: 240, y: 100 + 60, width: 100, height: 40)
            self.view.addSubview(lc)

            lb = UILabel()
            lb.text = " 3.5 星分"
            lb.textAlignment = NSTextAlignment.center
            lb.backgroundColor = UIColor.red
            lb.frame = CGRect(x: 240, y: 100 + 120, width: 100, height: 40)
            self.view.addSubview(lb)

            let ff = LXScoreView()
            ff.addTarget(self, action: #selector(hangeValue(score:)), for: UIControlEvents.valueChanged)
            ff.backgroundColor = UIColor.white
            ff.frame = CGRect(x: 20, y: 100 + 120 , width: 200, height: 40)
            self.view.addSubview(ff)
        
    }
    
    @objc private func didChangeValue(score  : LXScoreView){
        
        la.text = " \(score.value) 星分"
    }
    
    @objc private func ChangeValue(score  : LXScoreView){
          lc.text = " \(score.value) 星分"
      
    }
    @objc private func hangeValue(score  : LXScoreView){
        
       lb.text = " \(score.value) 星分"
        
     }
  }

