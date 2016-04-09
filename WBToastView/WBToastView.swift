//
//  WBToastView.swift
//  WBToastView
//
//  Created by Zwb on 16/4/9.
//  Copyright © 2016年 zwb. All rights reserved.
//

import UIKit

class WBToastView: UIView {
    
    // 外部接口
    internal var font:CGFloat?  // 字体大小 (默认字体大小为15)
    internal var color:UIColor?  // 背景颜色(默认为黑色，透明度为0.5)
    internal var distance:CGFloat?  // 设置距离顶部或则底部要显示的距离
    internal var disapperTime:CGFloat? // 设置toast显示的时间，多久之后消失
    
    // 内部接口
    private let textLabel = UILabel()
    private var toastWindows = UIWindow()
    private var textString:NSString?
    // 顶部显示
    internal func showTop(string:NSString) -> Void{
        textString=string
        toastWindows=UIApplication.sharedApplication().keyWindow!
        creatToast()
        let y = distance==nil ? 60 : distance
        self.frame = CGRectMake(CGRectGetMidX(toastWindows.screen.bounds)-getWidth()/2, y!, getWidth(), getHeight())
        toastWindows.addSubview(self)
        hiddeToas()
    }
    // 中间显示
    internal func showCenter(string:NSString) -> Void{
        textString=string
        toastWindows=UIApplication.sharedApplication().keyWindow!
        creatToast()
        self.center = toastWindows.center
        toastWindows.addSubview(self)
        hiddeToas()
    }
    // 底部显示
    internal func showBottom(string:NSString) -> Void{
        textString=string
        toastWindows=UIApplication.sharedApplication().keyWindow!
        creatToast()
        let y = distance==nil ? 60 : distance
        self.frame = CGRectMake(CGRectGetMidX(toastWindows.screen.bounds)-getWidth()/2, CGRectGetHeight(toastWindows.screen.bounds)-getHeight()-y!, getWidth(), getHeight())
        toastWindows.addSubview(self)
        hiddeToas()
    }
    
    
    // 隐藏
    private func hiddeToas()->Void{
        // 延时调用
        let s = disapperTime==nil ? 1.5 : disapperTime
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(Double(s!) * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue()) { 
            UIView.animateWithDuration(0.5, animations: {
                self.transform = CGAffineTransformMakeScale(0.0001, 0.0001)
                self.alpha=0
            }) { (flag) in
                self.removeFromSuperview()
            }
        }
        
    }
    
    private func creatToast()->Void{
        // 设置view
        self.frame = CGRectMake(0, 0, toastWindows.screen.bounds.size.width, 10)
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.backgroundColor = color==nil ? UIColor ( red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6 ):color
        // 根据输入的文字，设置文本的高度
        let sizeBounding = NSString.init(string: textString!)
        let rect = sizeBounding.sizeWithSize(CGSizeMake(getWidth(), 1000), andFont: UIFont.systemFontOfSize(font==nil ? 15 : font!))
        // 改变view大小
        self.bounds = CGRectMake(0, 0, rect.width, rect.height+20)
        // 设置label
        textLabel.frame=self.bounds
        textLabel.text = textString! as String
        textLabel.font = font==nil ? UIFont.systemFontOfSize(15) : UIFont.systemFontOfSize(font!)
        textLabel.textColor = UIColor.whiteColor()
        textLabel.textAlignment = .Center
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .ByTruncatingTail
        self.addSubview(textLabel)
    }
    
    /* 根据输入的文字，设置文本的高度 (因swift bug导致该函数不能运行，因此在这里导入OC语言)
    private func sizeWithString(string:NSString, font:UIFont)->CGSize{
        var rect = CGRect()
        let options:NSStringDrawingOptions = .TruncatesLastVisibleLine | .UsesFontLeading | .UsesLineFragmentOrigin
        rect = string.boundingRectWithSize(CGSizeMake(getWidth()-20, 1000), options:options , attributes: [NSFontAttributeName:font,NSForegroundColorAttributeName:UIColor.whiteColor()], context: nil)
        return rect.size
    }
     */
    
    private func getWidth()->CGFloat{
        return self.bounds.size.width
    }
    private func getHeight()->CGFloat{
        return self.bounds.size.height
    }
}
