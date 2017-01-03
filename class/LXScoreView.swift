//
//  LXScoreView.swift
//  LXScore
//
//  Created by SinodomMac02 on 16/9/23.
//  Copyright © 2016年 李响. All rights reserved.
//

import UIKit

class LXScoreView: UIControl {
    
    var maximumValue : Int  =  5
    var  insideValue : CGFloat = 4
    var isFillColor : Bool = false
    
    var value : CGFloat = 0{
        didSet{
            self.sendActions(for: UIControlEvents.valueChanged)
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        for i in 0..<Int(self.maximumValue) {
            if  self.isFillColor  == true {
                 self.isFillColor = false
            }
            
                let rect = CGRect(x:  CGFloat(i) * 40 , y: rect.origin.y, width: rect.size.width/CGFloat(self.maximumValue), height: rect.size.height)
                    self.LXDrawFrame(rect: rect, tintColor: nil)
                }
        
                for j in 0..<Int(self.insideValue ){
                    self.LXDrawHalfFrame(rect: CGRect(x: CGFloat(j ) * 40, y: rect.origin.y, width: rect.size.width/CGFloat(self.maximumValue) , height: 40), tintColor: nil)
                }
        
                for j in 0..<Int(self.insideValue - 0.5){
                    if  self.isFillColor  == false {
                        self.isFillColor = true
                    }
            
                 self.LXDrawFrame(rect: CGRect(x: CGFloat(j) * 40, y: rect.origin.y, width: rect.size.width/CGFloat(self.maximumValue), height: 40), tintColor: nil)
        }
    }
    
    func LXDrawFrame(rect : CGRect , tintColor : UIColor?)  {
        let starPath = UIBezierPath()
        starPath.move(to: CGPoint(x:(rect.minX + 0.62723 * rect.width) , y: rect.minY + 0.37309 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.50000 * rect.width , y: rect.minY + 0.02500 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.37292 * rect.width , y: rect.minY + 0.37309 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.02500 * rect.width , y: rect.minY + 0.39112 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.30504 * rect.width , y: rect.minY + 0.62908 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.20642 * rect.width , y: rect.minY + 0.97500 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.50000 * rect.width , y: rect.minY + 0.78265 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.79358 * rect.width , y: rect.minY + 0.97500 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.69501 * rect.width , y: rect.minY + 0.62908 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.97500 * rect.width , y: rect.minY + 0.39112 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.62723 * rect.width , y: rect.minY + 0.37309 * frame.height))
        if self.isFillColor {
            UIColor.red.set()
            starPath.fill()
        }else{
            UIColor.red.set()
            starPath.stroke()
        }
    }
    
    
    func LXDrawHalfFrame(rect : CGRect , tintColor : UIColor?)  {
        let starPath = UIBezierPath()
        starPath.move(to: CGPoint(x:(rect.minX + 0.50000 * rect.width) , y: rect.minY + 0.02500 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.37292 * rect.width , y: rect.minY + 0.37309 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.02500 * rect.width , y: rect.minY + 0.39112 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.30504 * rect.width , y: rect.minY + 0.62908 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.20642 * rect.width , y: rect.minY + 0.97500 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.50000 * rect.width , y: rect.minY + 0.78265 * frame.height))
        starPath.addLine(to: CGPoint(x:rect.minX + 0.50000 * rect.width , y: rect.minY + 0.02500 * frame.height))
        UIColor.red.set()
        starPath.fill()
        
    }

    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        if !self.isFirstResponder {
            self.becomeFirstResponder()
        }
        self.LXHandleTouch(TOUCH: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.continueTracking(touch, with: event)
          self.LXHandleTouch(TOUCH: touch)
          return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
            if self.isFirstResponder {
                self.resignFirstResponder()
            }
          guard  let tou = touch else {
            return
            }
            self.LXHandleTouch(TOUCH: tou)
    }
    
    func LXHandleTouch(TOUCH : UITouch)  {
        let  cellWidth : CGFloat = self.bounds.size.width / 5
        let  location  : CGPoint = TOUCH.location(in: self)
        let   insideValue : CGFloat = location.x / cellWidth
        if Int(insideValue + 0.5) > Int(insideValue){
            self.value = CGFloat(Int(insideValue + 0.5))
            if  self.value > 5 {
               self.value = 5
            }
        }else if Int(insideValue + 0.5) == Int(insideValue) {
            if Int(insideValue + 0.5) == 0 && insideValue > 0.0{
            self.value = 0.5
            }
            else{
                if insideValue < 0 {
                     self.value = 0
                }else{
                      self.value = CGFloat(Int(insideValue + 0.5)) + 0.5
                }
            }
              if  self.value > 5 {
                 self.value = 5
             }
        }
                self.insideValue = insideValue + 1.0
                self.setNeedsDisplay()
    }
   
    override var canBecomeFirstResponder: Bool{
            return true
    }
}
