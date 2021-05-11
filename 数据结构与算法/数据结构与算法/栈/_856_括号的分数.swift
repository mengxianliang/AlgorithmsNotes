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
     
     (())() - 3
     
     */
    /**
     找到成对的()时加分
     找到左括号时，level*2 找到又括号时，level/2，找到成对括号时代表需要加分，score += level
     */
    func scoreOfParentheses(_ S: String) -> Int {
        //总得分
        var score = 0
        //括号等级
        var level = 1
        //上一次循环的括号
        var lastS = "("
        for s1 in S {
            if s1 == "(" {
                level = level*2
            }else {
                level = level/2;
                if lastS == "(" {
                    score = score + level
                }
            }
            lastS = String(s1)
        }
        return score
    }
    
    
    //用栈的思想
    func scoreOfParentheses2(_ S: String) -> Int {
        
        var arr = [Int]()
        //入栈当前分数
        arr.append(0)
        for s1 in S {
            if s1 == "(" {
                arr.append(0)
            }else {
                
                let level: Int = arr.last ?? 0
                arr.removeLast()
                
                let score: Int = arr.last ?? 0
                arr.removeLast()
                arr.append(score + max(level * 2, 1))
            }
        }
        let score: Int = arr.last!
        return score
    }
}
