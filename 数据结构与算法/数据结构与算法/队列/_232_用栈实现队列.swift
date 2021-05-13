//
//  _232_用栈实现队列.swift
//  数据结构与算法
//
//  Created by mxl on 2021/5/13.
//

import Foundation

class MyQueue {
    
    //入队栈
    var inStack: Array = [Int]()
    //出队栈
    var outStack: Array = [Int]()

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        //入队直接压入inStack
        inStack.append(x)
        self.logInfo("push")
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        self.check()
        let x: Int = outStack.last!
        outStack.removeLast()
        self.logInfo("pop")
        return x
    }
    
    /** Get the front element. */
    func peek() -> Int {
        self.check()
        self.logInfo("peek")
        return outStack.last!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        self.logInfo("empty")
        return inStack.isEmpty && outStack.isEmpty
    }
    
    //先判断outStack是否为空，如果是空则将inStack里的对象都压入outStatck中
    func check() -> () {
        if outStack.isEmpty {
            for i in inStack.reversed() {
                outStack.append(i)
            }
            inStack.removeAll()
        }
    }
    
    func logInfo(_ option: String) -> () {
        print(option,"inStatck = ",inStack,"outStatck = ",outStack)
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
