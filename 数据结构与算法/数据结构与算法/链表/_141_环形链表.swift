//
//  _141_环形链表.swift
//  数据结构与算法
//
//  Created by mxl on 2021/4/27.
//  https://leetcode-cn.com/problems/linked-list-cycle/

import Foundation

class LinkedListCycle: NSObject {
    
    override init() {
        super.init()
        
        /// 保存链表的head
        let head = ListNode.LinkedList()
        
        /// 设置一个环
        head?.next?.next?.next = head
        
        if hasCycle(head) {
            print("链表有环")
        }else {
            print("链表没有环")
        }
        
    }
    
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {return false}
        /// 慢指针
        var slow = head
        /// 快指针
        var fast = head?.next
        /// 让两个指针跑圈，如果有环的话，一定能遇到
        while fast != nil && fast?.next != nil {
            slow = slow?.next ?? nil
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
        }
        return false
    }
    
}
