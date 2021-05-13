//
//  _225_用队列实现栈.swift
//  数据结构与算法
//
//  Created by mxl on 2021/5/13.
//

import Foundation

class MyStack {
    
    //声明两个队列，用于相互转换元素
    var queue1: Array = [Int]()
    var queue2: Array = [Int]()

    /** Initialize your data structure here. */
    init() {

    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        if queue1.isEmpty && queue2.isEmpty {
            queue1.append(x)
        }else if queue1.isEmpty {
            queue2.append(x)
        }else {
            queue1.append(x)
        }
        self.logInfo("push")
    }
    
    /** Removes the element on top of the stack and returns that element. */
    //代表元素都存在queue1中，queue1中的出末尾元素外其他元素pop，push到queue2中
    func pop() -> Int {
        var top = 0
        if !queue1.isEmpty {
            while queue1.count > 1 {
                queue2.append(queue1.first!)
                queue1.removeFirst()
                logInfo("挪动queue1->queue2")
            }
            top = queue1.first!
            queue1.removeFirst()
        }else if !queue2.isEmpty {
            while queue2.count > 1 {
                queue1.append(queue2.first!)
                queue2.removeFirst()
                logInfo("挪动queue2->queue1")
            }
            top = queue2.first!
            queue2.removeFirst()
        }
        self.logInfo("pop")
        return top
    }
    
    /** Get the top element. */
    func top() -> Int {
        self.logInfo("top")
        
        if !self.queue1.isEmpty {
            return self.queue1.last!
        }
        
        if !self.queue2.isEmpty {
            return self.queue2.last!
        }
        
        
        return 0
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        logInfo("empty")
        return self.queue1.isEmpty && self.queue2.isEmpty
    }
    
    func logInfo(_ option: String) -> () {
        print(option,"queue1 = ",queue1,"queue2 = ",queue2)
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
