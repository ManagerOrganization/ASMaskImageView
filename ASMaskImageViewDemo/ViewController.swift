//
//  ViewController.swift
//  ASMaskImageViewDemo
//
//  Created by zkhCreator on 8/21/16.
//  Copyright © 2016 zkhCreator. All rights reserved.
//

import UIKit
import ASMaskImageView

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    var touchView:MaskView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = getRadiusImage(UIColor.red, radius: 5, size: CGSize(width: 200, height: 200))

        touchView = MaskView.init(image:image,frame: CGRect.init(origin: CGPoint(x: 0,y: 0), size: image.size))
//        touchView?.frame = CGRect(x: 100, y: 100, width: 100, height: 20)
        touchView?.maskBackgroundColor = UIColor.orange
        //        添加到父View
        self.view.addSubview(touchView!)
        
        //        添加移动手势
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(ViewController.move(_:)))
        touchView!.addGestureRecognizer(gesture)
        
        //        将对应的label加入touchView中
        touchView!.maskViewArray.append(label1)
        touchView!.maskViewArray.append(label2)
        touchView!.maskViewArray.append(label3)

        touchView?.changeMoveImage()
    }
    
    func move(_ gesture:UIPanGestureRecognizer) {
        touchView?.center = gesture.location(in: self.view)
        
        touchView?.changeMoveImage()
        
    }
    
    func getRadiusImage(_ color:UIColor,radius:CGFloat,size:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        
//        绘制圆角
        context?.move(to: CGPoint(x: 0, y: 0))
        context?.addArc(tangent1End: CGPoint(x:0,y:size.width), tangent2End: CGPoint(x:size.width,y:size.height), radius: radius)
        context?.addArc(tangent1End: CGPoint(x:size.width,y:size.height), tangent2End: CGPoint(x:size.width,y:0), radius: radius)
        context?.addArc(tangent1End: CGPoint(x:size.width,y:0), tangent2End: CGPoint(x:0,y:0), radius: radius)
        context?.addArc(tangent1End: CGPoint(x:0,y:0), tangent2End: CGPoint(x:0,y:size.height), radius: radius)
        context?.fillPath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image!
    }
    
}

