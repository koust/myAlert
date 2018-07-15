//
//  MyAlertController.swift
//  myAlert
//
//  BATUHAN SAYGILI
//  Github.com/koust
//
//  Copyright © 2018 Batuhan Saygili. All rights reserved.
//

import UIKit

public class MyAlertController: UIViewController {

    
    public var bgColor = UIColor.white
    public var textColor = UIColor.black
    public var yourView: UIView?
    public var titleFontSize: CGFloat = 16
    public var subTitleFontSize: CGFloat = 13
    public var fontName:String = "Avenir-Light"
    
    private var viewHeight:Int = 80
    private let myView = UIView()
    private let myBigTitle = UILabel()
    private let mySubTitle = UILabel()
    
    private func createView(bigTitle:String,subTitle:String){
        // For View
        myView.frame = CGRect(x: 10, y: -81,width: Int(UIScreen.main.bounds.width-20), height: self.viewHeight)
        myView.backgroundColor = bgColor
        myView.layer.cornerRadius = 10
        myView.clipsToBounds = true
        myView.tag = 100
        
        
        myView.addSubview(myBigTitle)
        myView.addSubview(mySubTitle)
        // For Big Title
        myBigTitle.text = bigTitle
        myBigTitle.textColor = textColor
        myBigTitle.textAlignment = .left
        myBigTitle.font = UIFont(name: fontName, size: titleFontSize)
        
        myBigTitle.translatesAutoresizingMaskIntoConstraints = false
        myBigTitle.topAnchor.constraint(equalTo: myView.topAnchor , constant:15).isActive = true
        myBigTitle.leftAnchor.constraint(equalTo: myView.leftAnchor , constant:10).isActive = true
        myBigTitle.rightAnchor.constraint(equalTo: myView.rightAnchor , constant:10).isActive = true
        // For Sub Title
        mySubTitle.text = subTitle
        mySubTitle.textColor = textColor
        mySubTitle.textAlignment = .left
        mySubTitle.font = UIFont(name: fontName, size: subTitleFontSize)
        
        mySubTitle.translatesAutoresizingMaskIntoConstraints = false
        mySubTitle.topAnchor.constraint(equalTo: myBigTitle.bottomAnchor , constant:6).isActive = true
        mySubTitle.leftAnchor.constraint(equalTo: myView.leftAnchor , constant:10).isActive = true
        mySubTitle.rightAnchor.constraint(equalTo: myView.rightAnchor , constant:10).isActive = true
        
        
        self.yourView?.addSubview(myView)
        
        viewShowAnimation()
        swipeToClose()
    }

    
    public func show(title:String,subtitle:String){
        createView(bigTitle: title,subTitle: subtitle)
    }
    
    
    
    public func show(title:String,subtitle:String,delay:Int){
        createView(bigTitle: title,subTitle:subtitle)
        closeToDelay(delayTime: delay)
    }

    
    public func close(){
        UIView.animate(withDuration: 0.4, delay:0, options: [],animations: {
            self.myView.center.y = CGFloat(-(self.viewHeight*2))
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                if let viewWithTag = self.yourView?.viewWithTag(100) {
                    viewWithTag.removeFromSuperview()
                }
            }
            
        },
                       completion: nil
        )

    }
    
    private func closeToDelay(delayTime:Int){
        
        // Animation
        viewAnimation(delayTime: delayTime)
        // Remove View
        DispatchQueue.main.asyncAfter(deadline:.now() + TimeInterval(delayTime)) {
            if(self.myView.center.y == CGFloat(-(self.viewHeight*2))){
                self.close()
            }
        }
    }
    
    private func swipeToClose(){
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeUp.direction = .up
        self.myView.addGestureRecognizer(swipeUp)
    }
    
    
    private func viewAnimation(delayTime:Int){
        UIView.animate(withDuration: 0.8, delay: TimeInterval(delayTime)-1, options: [],animations: {
          self.myView.center.y = CGFloat(-(self.viewHeight*2))
        },
          completion: nil
        )
    }
    
    
    private func viewShowAnimation(){
        UIView.animate(withDuration: 0.3, delay:0, options: [],animations: {
            self.myView.center.y = CGFloat(80)
        },
                       completion: nil
        )
    }
    
    @objc  private func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizerDirection.up {
            close()
        }
    }
}
