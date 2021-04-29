//
//  _204_计数质数.swift
//  数据结构与算法
//
//  Created by mxl on 2021/4/28.
//  https://leetcode-cn.com/problems/count-primes/

import Foundation

class CountPrimes: NSObject {
    
    override init() {
        super.init()
        let n = 111
        print(n,"以内的质数个数是",self.countPrimes2(n))
    }
    
    //枚举方法，每个数遍历一遍比自己小的数
    func countPrimes(_ n: Int) -> Int {
        var primesNum = 0
        if n <= 1 {
            return primesNum
        }
        for i in 2..<n {
            var isPrimes = true
            for j in 2..<i {
                if i%j == 0 {
                    isPrimes = false
                    break
                }
            }
            if isPrimes {
                print(i,"是质数");
                primesNum = primesNum + 1
            }
        }
        return primesNum
    }
    
    //埃氏筛
    func countPrimes1(_ n: Int) -> Int {
        if n <= 1 {
            return 0
        }
        //创建一个都是1的数组，元素包含0到n-1，假设都是质数
        var primesArr = [Int](repeating: 1, count: n)
        //创建计数器
        var num = 0;
        //抛出数字0和1，从2开始循环计算
        for i in 2..<n {
//            print(String(format: "i = %d", i))
            //如果数组里元素是1，代表是质数
            if primesArr[i] == 1 {
                //计数器加一
                num += 1
                //如果i是质数，则代表n以内的i*2、i*3、i*4都不是质数，将这些数字在数组中的位置标记为0
                if i * i < n {
                    for j in stride(from: i * i, to: n, by: i) {
//                        print(String(format: "j = %d", j))
                        primesArr[j] = 0
                    }
                }
            }
        }
        return num
    }
    
    //递归 枚举
    func countPrimes2(_ n: Int) -> Int {
        if n <= 2 {
            return 0
        }
        var primesNum = countPrimes2(n - 1)
        for i in 2..<n {
            var isPrimes = true
            for j in 2..<i {
                if i%j == 0 {
                    isPrimes = false
                    break
                }
            }
            if isPrimes {
                print(i,"是质数");
                primesNum += 1
            }
        }
        
        
//        for i in 2..<n {
//            var isPrimes = true
//            for j in 2..<i {
//                if i%j == 0 {
//                    isPrimes = false
//                    break
//                }
//            }
//            if isPrimes {
//                print(i,"是质数");
//                primesNum = primesNum + 1
//            }
//        }
        return primesNum
    }
}
