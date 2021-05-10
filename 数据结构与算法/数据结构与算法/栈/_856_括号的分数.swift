//
//  _856_括号的分数.swift
//  数据结构与算法
//
//  Created by mxl on 2021/5/10.
//  https://leetcode-cn.com/problems/score-of-parentheses/

import Foundation

class ScoreOfParentheses: NSObject {
    
    override init() {
        super.init()
        let s = "(()(()))"
        let score = self.scoreOfParentheses(s)
        print(s,"得分是",score)
    }

    /**
     () - 1
     
     ()() - 2
     
     (()) - 2
     
     ((())) - 4
     
     (()()) - 4
     
     (()(())) - 6
     
     */
    
    func scoreOfParentheses(_ S: String) -> Int {
        //保存左括号的栈
        var arr = [String]()
        //总得分
        var score = 0
        //括号层级
        var level = 1
        for s1 in S {
            if s1 == "(" {
                arr.append(String(s1))
//                if arr.count > 1 {
//                    level = level * 2
//                }
                print("1",arr)
            }else {
//                print(arr)
//                print("level = ",level)
//                score = score + level
//                level = level/2;
                arr.removeLast()
                print("2",arr)
            }
        }
        return score
    }
}
