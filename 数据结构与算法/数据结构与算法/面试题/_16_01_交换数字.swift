//
//  _16_01_交换数字.swift
//  数据结构与算法
//
//  Created by mxl on 2021/5/12.
//  https://leetcode-cn.com/problems/swap-numbers-lcci/

import Foundation

class SwapNumbers: NSObject {
    
    override init() {
        super.init()
        
        let numbers = [1,2]
        print("交换前的数组",numbers)
        print("交换后的数组",self.swapNumbers(numbers))
    }
    
    func swapNumbers(_ numbers: [Int]) -> [Int] {
        
        var a = numbers[0]
        var b = numbers[1]
        
        //保存a + b 的值
        a = a + b
        //执行以下代码后，b就保存了a的值(a - b 等价于 a + b - b)
        b = a - b
        //执行以下代码后，a就保存了b的值(a - b 等价于 a + b - a)
        a = a - b
        
        return [a,b]
        
    }
    
}
