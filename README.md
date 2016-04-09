# WBToastView
####Swift 编写的一款toast提示框，与Android的Toast相似，可在屏幕顶部、底部、中间位置显示，根据实际情况可自定义其他属性

使用教程
=======
* 初始化

        // 初始化
        let toast = WBToastView()
        // 设置文本，必填
        let string = "家里的减肥了卡上就放大看垃圾收电费按时jlasjdklfjadlskjflkasdjfu asdfadsjfosdajflsdajflkasdjflkasdjflkasdjlfkasjdfkljasdkfljadsfasdfasdfasdfadgtetqwetqwetqwetqwetqwtqwtqwtqwetqweqweiujqwejllfjdkfljadsklfjlakdsjfklajdsfkljasdlkfjlkadsjflaskdjfijqwejrjklejasdklfjkdlsafasdfadsasdfadsfasdf"
        
* 设置属性

         // 设置其他属性(可不设置)
        toast.font = 17  // 设置字体的大小(默认为15)
        toast.color = UIColor.brownColor() //设置背景颜色(默认为黑色，透明度为0.6)
        toast.disapperTime = 2   // 设置显示的时间(默认为1.5s)
        toast.distance = 50  // 在顶部或底部显示时，设置距离顶部或底部的距离(默认为60)
        
* 调用

        // 在顶部显示
        toast.showTop(string)
        // 在中间显示
        //toast.showCenter(string)
        // 在底部显示
        //toast.showBottom(string)
        
效果图
=======
  ![gif](https://github.com/JsonBin/WBToastView/raw/master/WBToastView/toast.gif "toast效果图")
