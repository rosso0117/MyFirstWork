//
//  ViewController.swift
//  Color
//
//  Created by Tomohiro Yoshida on 2016/02/23.
//  Copyright © 2016年 Tomohiro Yoshida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var colorView:UIView!
    
    private var redView:UIView!
    private var greenView:UIView!
    private var blueView:UIView!
    private var alphaView:UIView!
    private var rgbaView:[UIView]!
    
    private var redLabel:UILabel!
    private var greenLabel:UILabel!
    private var blueLabel:UILabel!
    private var alphaLabel:UILabel!
    private var rgbaLabel:[UILabel]!
    
    private var redSlider:UISlider!
    private var greenSlider:UISlider!
    private var blueSlider:UISlider!
    private var alphaSlider:UISlider!
    private var rgbaSlider:[UISlider]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //colorView
        colorView = UIView(frame: CGRectMake(0, 0, 180, 180))
        colorView.layer.position = CGPoint(x:self.view.bounds.width/2, y:self.view.frame.height/4 + 20)
        colorView.layer.masksToBounds = true
        colorView.layer.cornerRadius = 90.0
        self.view.addSubview(colorView)
        
        //rgbaView
        
        redView = UIView()
        greenView = UIView()
        blueView = UIView()
        alphaView = UIView()
        rgbaView = [redView,greenView,blueView,alphaView]
        
        
        for (index, rgbaV) in rgbaView.enumerate(){
            let yPos = CGFloat(index)
            let xyPos = CGPoint(x: self.view.bounds.width * 4/10, y: self.view.bounds.height * (7 + yPos) / 12)
            rgbaV.frame = CGRect(x:0, y:0, width:26, height:26)
            rgbaV.layer.position = xyPos
            rgbaV.layer.masksToBounds = true
            rgbaV.layer.cornerRadius = 13.0
            self.view.addSubview(rgbaV)
        }
        
        
        //rgbaLabel
        
        redLabel = UILabel()
        redLabel.text = "Red"
        
        greenLabel = UILabel()
        greenLabel.text = "Green"
        
        blueLabel = UILabel()
        blueLabel.text = "Blue"
        
        alphaLabel = UILabel()
        alphaLabel.text = "Alpha"
        
        rgbaLabel = [redLabel, greenLabel, blueLabel, alphaLabel]
        for(index, label) in rgbaLabel.enumerate() {
            let yPos = CGFloat(index)
            let xyPos = CGPoint(x: self.view.bounds.width/8, y: self.view.bounds.height * (7 + yPos) / 12)
            label.frame = CGRectMake(0, 0, self.view.bounds.width/4, 26)
            label.layer.position = xyPos
            label.textAlignment = .Right
            self.view.addSubview(label)
        }
        
        //rgbaSlider
        
        redSlider = UISlider()
        greenSlider = UISlider()
        blueSlider = UISlider()
        alphaSlider = UISlider()
        
        rgbaSlider = [redSlider, greenSlider, blueSlider, alphaSlider]
        
        for (index, slider) in rgbaSlider.enumerate() {
            let yPos = CGFloat(index)
            let xyPos = CGPoint(x: self.view.bounds.width * 7/10, y: self.view.bounds.height * (7 + yPos) / 12)
            slider.frame = CGRectMake(0, 0, self.view.bounds.width/3, 20)
            slider.layer.position = xyPos
            slider.minimumValue = 0.0
            slider.maximumValue = 1.0
            slider.value = 1.0
            slider.addTarget(self, action: #selector(rgbaChange(_:)), forControlEvents: .ValueChanged)
            slider.addTarget(self, action: #selector(colorChange(_:)), forControlEvents: .ValueChanged)
            self.view.addSubview(slider)
        }
        
    }
    
    
    func rgbaChange(slider: UISlider) -> CGFloat{
        let changedValue = CGFloat(slider.value)
        var rChanged, gChanged, bChanged, aChanged:CGFloat
        
        
        switch slider {
        case redSlider:
            redView.backgroundColor = UIColor(red: changedValue, green: 0.0, blue: 0.0, alpha: 1.0)
            rChanged = changedValue
            return rChanged
        case greenSlider:
            greenView.backgroundColor = UIColor(red: 0.0, green: changedValue, blue: 0.0, alpha: 1.0)
            gChanged = changedValue
            return gChanged
        case blueSlider:
            blueView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: changedValue, alpha: 1.0)
            bChanged = changedValue
            return bChanged
        case alphaSlider:
            alphaView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: changedValue)
            aChanged = changedValue
            return aChanged
        default:
            return changedValue
        }
        
    }
    
    
    func colorChange(slider:UISlider){
        let changedValue = CGFloat(slider.value)
        let rChanged = rgbaChange(redSlider)
        let gChanged = rgbaChange(greenSlider)
        let bChanged = rgbaChange(blueSlider)
        let aChanged = rgbaChange(alphaSlider)
        switch slider {
        case redSlider:
            colorView.backgroundColor = UIColor(red: changedValue, green: gChanged, blue: bChanged, alpha: aChanged)
        case greenSlider:
            colorView.backgroundColor = UIColor(red: rChanged, green: changedValue, blue: bChanged, alpha: aChanged)
        case blueSlider:
            colorView.backgroundColor = UIColor(red: rChanged, green: gChanged, blue: changedValue, alpha: aChanged)
        case alphaSlider:
            colorView.backgroundColor = UIColor(red: rChanged, green: gChanged, blue: bChanged, alpha: changedValue)
        default:
            break;
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

