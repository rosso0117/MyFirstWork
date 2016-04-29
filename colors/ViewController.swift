//
//  ViewController.swift
//  Color
//
//  Created by Tomohiro Yoshida on 2016/02/23.
//  Copyright © 2016年 Tomohiro Yoshida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let rgbaCount = 4
    let rgbaTitles = ["Red", "Green", "Blue", "Alpha"]
    let barHeight = UIApplication.sharedApplication().statusBarFrame.size.height
    let initialValueOfSlider:Float = 0.5
    
    var colorView:UIView!
    var colorViewRGBAValues = [CGFloat]()
    
    var rgbaViewArray = [UIView]()
    var rgbaLabelArray = [UILabel]()
    var rgbaSliderArray = [UISlider]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        colorViewRGBAValues = Array(count: rgbaCount, repeatedValue: CGFloat(initialValueOfSlider))
        //colorView
        colorView = UIView(frame: CGRectMake(0, 0, 180, 180))
        colorView.layer.position = CGPoint(x:self.view.bounds.width/2,
                                           y:self.view.frame.height/4 + barHeight)
        colorView.layer.masksToBounds = true
        colorView.layer.cornerRadius = 90.0
        colorView.backgroundColor = UIColor(red: colorViewRGBAValues[0],
                                            green: colorViewRGBAValues[1],
                                            blue: colorViewRGBAValues[2],
                                            alpha: colorViewRGBAValues[3])
        self.view.addSubview(colorView)
        
        //rgbaView
        for index in 0 ..< rgbaCount {
            let myView = UIView()
            let yPos = CGFloat(index)
            let xyPos = CGPoint(x: self.view.bounds.width * 4/10,
                y: self.view.bounds.height * (7 + yPos) / 12)
            myView.frame = CGRect(x:0, y:0, width:26, height:26)
            myView.layer.position = xyPos
            myView.layer.masksToBounds = true
            myView.layer.cornerRadius = 13.0
            myView.tag = index
            myView.backgroundColor = setEachViewColor(myView.tag)
            rgbaViewArray.append(myView)
            self.view.addSubview(myView)
        }
        
        //rgbaLabel
        for index in 0 ..< rgbaCount {
            let myLabel = UILabel()
            let yPos = CGFloat(index)
            let xyPos = CGPoint(x: self.view.bounds.width/8,
                y: self.view.bounds.height * (7 + yPos) / 12)
            myLabel.frame = CGRectMake(0, 0, self.view.bounds.width/4, 26)
            myLabel.layer.position = xyPos
            myLabel.textAlignment = .Right
            myLabel.tag = index
            rgbaViewArray.append(myLabel)
            myLabel.text = rgbaTitles[index]
            self.view.addSubview(myLabel)
        }

        //rgbaSlider
        for index in 0 ..< rgbaCount {
            let mySlider = UISlider()
            let yPos = CGFloat(index)
            let xyPos = CGPoint(x: self.view.bounds.width * 7/10, y: self.view.bounds.height * (7 + yPos) / 12)
            mySlider.frame = CGRectMake(0, 0, self.view.bounds.width/3, 20)
            mySlider.layer.position = xyPos
            mySlider.minimumValue = 0.0
            mySlider.maximumValue = 1.0
            mySlider.value = initialValueOfSlider
            mySlider.addTarget(self, action: #selector(valueChanged(_:)), forControlEvents: .ValueChanged)
            mySlider.tag = index
            rgbaSliderArray.append(mySlider)
            self.view.addSubview(mySlider)
        }
    }
    
    
    func valueChanged(slider: UISlider){
        let changedValue = CGFloat(slider.value)
        
        switch slider.tag {
        case 0:
            rgbaViewArray[0].backgroundColor = UIColor(red: changedValue, green: 0.0,
                                              blue: 0.0, alpha: 1.0)
            colorViewRGBAValues[0] = changedValue
        case 1:
            rgbaViewArray[1].backgroundColor = UIColor(red: 0.0, green: changedValue,
                                                blue: 0.0, alpha: 1.0)
            colorViewRGBAValues[1] = changedValue
        case 2:
            rgbaViewArray[2].backgroundColor = UIColor(red: 0.0, green: 0.0,
                                               blue: changedValue, alpha: 1.0)
            colorViewRGBAValues[2] = changedValue
        case 3:
            rgbaViewArray[3].backgroundColor = UIColor(red: 0.0, green: 0.0,
                                                blue: 0.0, alpha: changedValue)
            colorViewRGBAValues[3] = changedValue
        default:
            break
        }
        
        colorView.backgroundColor = UIColor(red: colorViewRGBAValues[0],
                                            green: colorViewRGBAValues[1],
                                            blue: colorViewRGBAValues[2],
                                            alpha: colorViewRGBAValues[3])
    }
    
    func setEachViewColor(tag: Int) -> UIColor {
        let initialEachValue = CGFloat(initialValueOfSlider)
        switch tag {
        case 0:
            return UIColor(red: initialEachValue, green: 0.0,
                           blue: 0.0, alpha: 1.0)
        case 1:
            return UIColor(red: 0.0, green: initialEachValue,
                           blue: 0.0, alpha: 1.0)
        case 2:
            return UIColor(red: 0.0, green: 0.0,
                           blue: initialEachValue, alpha: 1.0)
        case 3:
            return UIColor(red: 0.0, green: 0.0,
                           blue: 0.0, alpha: initialEachValue)
        default:
            return UIColor.blackColor()
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

