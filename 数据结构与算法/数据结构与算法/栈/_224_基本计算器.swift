//
//  _224_基本计算器.swift
//  数据结构与算法
//  前、中、后缀表达式博客：https://www.cnblogs.com/chensongxian/p/7059802.html
//  Created by mxl on 2021/5/11.
//  https://leetcode-cn.com/problems/basic-calculator/

import Foundation

class BasicCalculator: NSObject {
    
    override init() {
        super.init()
        
//        let s = "(1+(4+5+2)-3)+(6+8)"
//        let s = " 2-1 + 2 "
//        let s = "11+((2+3)+4)-5"
//        let s = "2147483647"
//        let s = "-2+ 1"
        let s = "1-(+1+1)"
        
        print("中置表达式",s)
        
        let result = self.calculate(s)
        
        print("计算结果是",result)
        
    }
    
    /**
     1+((2+3)+4)-5
     转化过程
     s1 1 2 3
     s2 + ( ( +
     遇到)
     s1 1 2 3 + 4
     s2 + ( +
     遇到)
     s1 1 2 3 + 4 +
     s2 +
     遇到-
     s1 1 2 3 + 4 + + 5
     s2 -
     最后
     s1 1 2 3 + 4 + + 5 -
     s2
     */
    
    /**
     逆波兰表达式 1 2 3 + 4 + + 5 -
     运算过程
     1 2 3 +
     1 5 4 +
     1 9 +
     10 5 -
     5
     */
    
    //1+((2+3)+4)-5
    func calculate(_ s: String) -> Int {
        
        //第一步：格式化表达式
        //去掉空格
        var s1 = s.replacingOccurrences(of: " ", with: "")
        //避免首位是负数，在前面拼接一个零
        s1 = s1.replacingOccurrences(of: "(+", with: "(0+")
        s1 = s1.replacingOccurrences(of: "(-", with: "(0-")
        
        //保存逆波兰表达式的栈（表达式栈）
        var numStack = [String]()
        numStack.append("0")

        //保存计算符号的栈，最后会清空（符号栈）
        var symbolStack = [String]()

        //判断上是否需要拼接到上一个字符上
        var needAppendNum = true
        
        //遍历表达式 1+((2+3)+4)-5
        for str in s1 {
            if str == "(" {//左括号直接压入符号栈
                
                //有符号穿插，不需要拼接数字
                needAppendNum = false
                
                symbolStack.append(String(str))
            }else if str == "+" || str == "-" {
                //有符号穿插，不需要拼接数字
                needAppendNum = false
                
                //如果符号栈为空或栈顶元素是左括号，直接将运算符号压入栈顶
                if symbolStack.isEmpty || symbolStack.last == "(" {
                    symbolStack.append(String(str))
                }else {//如果符号栈栈顶已经存在运算符，需要把运算符弹出,压入表达式栈，再将新的符号压入符号栈顶
                    numStack.append(symbolStack.last!)
                    symbolStack.removeLast()
                    symbolStack.append(String(str))
                }
            } else if str == ")" {
                
                //有符号穿插，不需要拼接数字
                needAppendNum = false
                
                //如果是右括号，需要遍历符号栈，将栈内符号依次弹出并压入表达式栈，知道找到左括号，并移除左括号
                while symbolStack.last != "(" {
                    numStack.append(symbolStack.last!)
                    symbolStack.removeLast()
                }
                symbolStack.removeLast()
            }else {//数字直接压入表达式栈
                if numStack.isEmpty {
                    numStack.append(String(str))
                }else if needAppendNum {//如果不是运算符，代表是数字，需要和上一位数字组合
                    var lastNumStr: String = numStack.last!
                    lastNumStr.append(String(str))
                    numStack.removeLast()
                    numStack.append(lastNumStr)
                }else {//如果被打断，直接插入
                    numStack.append(String(str))
                }
                
                //添加新数字，如果没有被符号穿插，代表需要拼接
                needAppendNum = true
            }
        }

        print("tempStack = ",symbolStack,"numStatic = ",numStack)

        while symbolStack.count > 0 {
            numStack.append(symbolStack.last!)
            symbolStack.removeLast()
        }

        print("完整的逆波兰表达式为",numStack)

        return self.evalRPN(numStack)
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
