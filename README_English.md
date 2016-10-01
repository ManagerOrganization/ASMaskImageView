# ASMaskImageView



[![GitHub license](https://img.shields.io/badge/license-Apache%202-blue.svg)](https://raw.githubusercontent.com/zkh90644/ASMaskImageView/master/LICENSE)
[![pod](https://img.shields.io/badge/pod-v1.0.1-brightgreen.svg)](https://cocoapods.org/pods/ASMaskImageView)
[![blog](https://img.shields.io/badge/blog-%E7%AE%80%E4%B9%A6-orange.svg)](http://www.jianshu.com/users/b863d709977d/latest_articles)

[中文版本README.MD](https://github.com/zkh90644/ASMaskImageView/blob/master/README.md)

It's a simple maskView class,In order to get the view with UIImageView and Label.You can set the UIImageView with a png picture.

##Result Image
![showImage](https://github.com/zkh90644/ASMaskImageView/blob/master/Resource/show.gif)


##Install
**cocoapods**

```
pod 'ASMaskImageView', '~> 1.0.0'
use_frameworks!
```
##usage

Create a **MaskView Class**（this class is the subClass of UIImageView）

```
touchView = MaskView.init(image:UIImage.init(named: "1")!,frame: CGRect.init(origin: CGPoint(x: 0,y: 0), size: CGSize(width: 100, height: 100)))
```
or you can init with color and size to create a Rounded

```swift
touchView = MaskView.init(color:UIColor.redColor,radius:5,frame:CGRect.init(origin: CGPoint(x: 0,y: 0), size: CGSize(width: 100, height: 100))
```



Add UILabel which you want to get the mask View to the `maskViewArray` of `MaskView object`

```
touchView!.maskViewArray.append(label1)
touchView!.maskViewArray.append(label2)
touchView!.maskViewArray.append(label3)
```
when you want to get the maskView ,just use the `changeMoveImage` method

```
func move(gesture:UIPanGestureRecognizer)throws {
    touchView?.center = gesture.locationInView(self.view)
    try touchView?.changeMoveImage()
        
}
```



# ToDo

- [ ] use Dichotomy to calculate the value of the position to reduce the number of label ,to improve efficiency
- [ ] change the mind to creat image, just change the layer,instead of Image object to reduce the use of CPU.Change to use GPU.And Change parent class from UIImageView to UIView