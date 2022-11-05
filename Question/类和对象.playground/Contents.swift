import UIKit

let arr: [Int] = [1, 2 ,3, 4]

//类
class Person{
    //属性property
    var name: String
    //初始化函数/初始化构造器
    init(_ name: String) {
        self.name = name
    }
    //方法method
    func walk(){
        print("走路")
    }
}
//把类(class)实例化/初始化-->得到对象object/实例instance
let person1 = Person("李四")
person1.name
person1.walk()
let person2 = Person("张三")

//diceimageview.image = UIImage(named: "abc")
//class UIImageView{
//    //...
//}
