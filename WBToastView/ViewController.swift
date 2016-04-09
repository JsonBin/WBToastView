//
//  ViewController.swift
//  WBToastView
//
//  Created by Zwb on 16/4/9.
//  Copyright © 2016年 zwb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 初始化
        let toast = WBToastView()
        // 设置文本，必填
        let string = "家里的减肥了卡上就放大看垃圾收电费按时jlasjdklfjadlskjflkasdjfu asdfadsjfosdajflsdajflkasdjflkasdjflkasdjlfkasjdfkljasdkfljadsfasdfasdfasdfadgtetqwetqwetqwetqwetqwtqwtqwtqwetqweqweiujqwejllfjdkfljadsklfjlakdsjfklajdsfkljasdlkfjlkadsjflaskdjfijqwejrjklejasdklfjkdlsafasdfadsasdfadsfasdf"
        
        // 设置其他属性(可不设置)
        toast.font = 17  // 设置字体的大小(默认为15)
        toast.color = UIColor.brownColor() //设置背景颜色(默认为黑色，透明度为0.6)
        toast.disapperTime = 2   // 设置显示的时间(默认为1.5s)
        toast.distance = 50  // 在顶部或底部显示时，设置距离顶部或底部的距离(默认为60)
        
        
        // 在顶部显示
        toast.showTop(string)
        // 在中间显示
//        toast.showCenter(string)
        // 在底部显示
//        toast.showBottom(string)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

