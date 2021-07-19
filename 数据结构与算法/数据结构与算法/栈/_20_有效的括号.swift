//
//  _20_有效的括号.swift
//  数据结构与算法
//
//  Created by mxl on 2021/5/10.
//  https://leetcode-cn.com/problems/valid-parentheses/

import Foundation

class ValidParentheses: NSObject {
    
    override init() {
        super.init()
//        let s = "{[()]}"
        let s = "(("
        let valid = self.isValid2(s);
        if valid {
            print(s,"是有效括号")
        }else {
            print(s,"不是有效括号")
        }
        
    }
    
    /// 方法一：替换
    func isValid1(_ s: String) -> Bool {
        if s.count%2 != 0 {
            return false
        }
        var str = s
        while str.contains("{}") || str.contains("[]") || str.contains("()") {
            str = str.replacingOccurrences(of: "{}", with: "")
            str = str.replacingOccurrences(of: "[]", with: "")
            str = str.replacingOccurrences(of: "()", with: "")
        }
        return str.count == 0
    }
    
    
    /// 方法一：栈的思想
    func isValid2(_ s: String) -> Bool {
        if s.count%2 != 0 {
            return false
        }
        var arr = [String]()
        for s1 in s {
            /// 判断是否是左括号，左括号直接入栈
            if s1 == "{" || s1 == "[" || s1 == "(" {
                arr.append(String(s1))
            }else {/// 其他为右括号
                /// 如果栈为空，代表没有左括号，则返回失败
                if arr.count == 0 {
                    return false
                }
                /// 找出栈里面最后的元素
                let left = arr.last
                /// 判断是否
                if left == "{" && s1 != "}" {return false}
                if left == "[" && s1 != "]" {return false}
                if left == "(" && s1 != ")" {return false}
                arr.removeLast()
            }
        }
        /// 如果不是空，则代表左右括号不匹配
        return arr.isEmpty
    }
    
    
}
