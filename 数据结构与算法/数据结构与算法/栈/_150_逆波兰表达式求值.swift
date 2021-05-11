//
//  _150_逆波兰表达式求值.swift
//  数据结构与算法
//  前、中、后缀表达式博客：https://www.cnblogs.com/chensongxian/p/7059802.html
//  Created by mxl on 2021/5/11.
//  https://leetcode-cn.com/problems/evaluate-reverse-polish-notation/

import Foundation

class EvalRPN: NSObject {
    
    override init() {
        super.init()
        
//        let tokens = ["4","13","5","/","+"]
//        let tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
        let tokens = ["+10","1","+"]
        print(tokens,"逆波兰计算表达式计算结果是：",self.evalRPN(tokens))
        
    }
    
    func evalRPN(_ tokens: [String]) -> Int {
        //保存数字的栈
        var numbers = [Int]()
        
        for str in tokens {
            if str == "+" {
                //栈顶
                let last = numbers.last!
                numbers.removeLast()
                
                //次栈顶
                let last1 = numbers.last!
                numbers.removeLast()
                
                //将次栈顶op栈顶的结果入栈
                let result = last1 + last
                numbers.append(result)
                
            }else if str == "-" {
                
                //栈顶
                let last = numbers.last!
                numbers.removeLast()
                
                //次栈顶
                let last1 = numbers.last!
                numbers.removeLast()
                
                //将次栈顶op栈顶的结果入栈
                let result = last1 - last
                numbers.append(result)
                
            }else if str == "*" {
                
                //栈顶
                let last = numbers.last!
                numbers.removeLast()
                
                //次栈顶
                let last1 = numbers.last!
                numbers.removeLast()
                
                //将次栈顶op栈顶的结果入栈
                let result = last1 * last
                numbers.append(result)
                
            }else if str == "/" {
                
                //栈顶
                let last = numbers.last!
                numbers.removeLast()
                
                //次栈顶
                let last1 = numbers.last!
                numbers.removeLast()
                
                //将次栈顶op栈顶的结果入栈
                let result = last1 / last
                numbers.append(result)
                
            }else {
                let val1 = Int(str)!
                numbers.append(val1)
            }
        }
        
        return numbers.last!
    }
    
}
