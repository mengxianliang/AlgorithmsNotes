//
//  _69_x的平方根.swift
//  数据结构与算法
//
//  Created by mxl on 2021/5/12.
//  https://leetcode-cn.com/problems/sqrtx/

import Foundation

class Sqrtx: NSObject {
    
    override init() {
        super.init()
        
        let x = 1
        
        let sqrt = self.mySqrt(x)
        
        print(x,"的平方根是",sqrt)
    }
    
    //二分法遍历
    func mySqrt(_ x: Int) -> Int {
        if x == 0 || x == 1 {
            return x
        }
        var low = 0
        var height = x
        while low <= height {
            let mid = (low + height)/2
            if mid*mid <= x && (mid + 1)*(mid + 1) > x {//如果找到了直接输出
                return mid
            }else if mid*mid > x {//如果目标数字小于中间变量，用mid替换height
                height = mid
            }else  {//其他，用mid代替low
                low = mid
            }
        }
        return 0
    }
    
}
