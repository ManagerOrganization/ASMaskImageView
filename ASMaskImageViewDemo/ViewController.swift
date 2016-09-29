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

        let image = getRadiusImage(UIColor.redColor(), radius: 5, size: CGSize(width: 200, height: 200))

        touchView = MaskView.init(image:image,frame: CGRect.init(origin: CGPoint(x: 0,y: 0), size: image.size))
//        touchView?.frame = CGRect(x: 100, y: 100, width: 100, height: 20)
        touchView?.maskBackgroundColor = UIColor.orangeColor()
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
    
    func move(gesture:UIPanGestureRecognizer) {
        touchView?.center = gesture.locationInView(self.view)
        
        touchView?.changeMoveImage()
        
    }
    
    func getRadiusImage(color:UIColor,radius:CGFloat,size:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        
//        绘制圆角
        CGContextMoveToPoint(context, 0, 0)
        CGContextAddArcToPoint(context, 0, size.height, size.width, size.height, radius)
        CGContextAddArcToPoint(context, size.width, size.height, size.width, 0, radius)
        CGContextAddArcToPoint(context, size.width, 0, 0, 0, radius)
        CGContextAddArcToPoint(context, 0, 0, 0, size.height, radius)
        CGContextFillPath(context)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image
    }
    
}

