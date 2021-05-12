//
//  _172_阶乘后的零.swift
//  数据结构与算法
//
//  Created by mxl on 2021/5/12.
//  https://leetcode-cn.com/problems/factorial-trailing-zeroes/

import Foundation

class FactorialTrailingZeroes: NSObject {
    
    override init() {
        super.init()
        
        let num = 158
        
        print(num,"的阶乘后面零的个数是：",self.trailingZeroes(num))
        
    }
    
    /**
     思路是拆分因子
     
     尾数中有0出现代表出现了10
     10拆分因子是 2x5
     
     判断这些数字里有多少个拆分因子后，因子中会出现 2x5,这些数字个数的和就是尾数0的个数
     
     小于5的整数尾部不会出现0，整数5的阶乘是第一个尾数出现0的整数，大于整数5的整数的阶乘里因子一定包含2，所以只需要统计拆分因子后存在一个5或者多个5的数字
     
     第一步：统计n/5，结果是n以内有多少个5的倍数，也就是1x5、2x5、3x5...,这些数拆分后都有1个因子5
     第二步：统计n/25，结果是n以内有多少个25的倍数，也就是1x5x5、2x5x5、3x5x5...,这些数拆分后都有2个因子5
     第三步：统计n/125，结果是n以内有多少个125的倍数，也就是1x5x5x5、2x5x5x5、3x5x5x5...,这些数拆分后都有3个因子5
     将这些结果相加，直到n/5^x等于零时，左右相加的结果就是所有包含因子5的数字的个数，它们相乘就会有多少个零
     
     */
    func trailingZeroes(_ n: Int) -> Int {
        var step = 5
        var num = 0
        while n/step > 0 {
            num = num + n/step
            step = step * 5
        }
        return num
    }
    
}
