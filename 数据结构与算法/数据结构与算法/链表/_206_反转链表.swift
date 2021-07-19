//
//  _206_反转链表.swift
//  数据结构与算法
//
//  Created by mxl on 2021/4/27.
//  https://leetcode-cn.com/problems/reverse-linked-list/

import Foundation

class ReverseLinkedList: NSObject {
    
    override init() {
        super.init()
        
        /// 保存链表的head
        var head = ListNode.LinkedList()
        
        /// 打印链表
        head?.logLinkedList()
        
        /// 递归反转链表
        head = self.reverseLinkedList(head)
        head?.logLinkedList()
        
    }

    /// 一般来说，递归需要有边界条件、递归前进段和递归返回段。当边界条件不满足时，递归前进；当边界条件满足时，递归返回。
    /// 递归方式反转链表
    func reverseLinkedList(_ head: ListNode?) -> ListNode? {
        
        /// 递归的边界条件
        if head == nil || head?.next == nil {
            return head
        }
        
        /// 调用递归方法
        let newHead = self.reverseLinkedList(head?.next);
        
        /// 处理反转逻辑,假设已经处理到倒数第二个节点，则反转第一个节点即可
        /// 反转倒数第二个节点的next
        head?.next?.next = head
        /// 再反转第一个节点的next
        head?.next = nil
        
        return newHead
    }
    
    /// 迭代方式反转链表
    func reverseLinkedList2(_ head: ListNode?) -> ListNode? {
        
        /// 边界条件
        if head == nil || head?.next == nil {
            return head
        }
        /// 保存旧链表的head
        var oldHead = head
        /// 建一个新的链表的head
        var newHead: ListNode? = nil
        
        while oldHead != nil {
            /// 保存旧链表的下一个节点
            let nextNode = oldHead?.next
            
            /// 反转当前head位置的节点
            oldHead?.next = newHead
            
            /// 保存已经反转节点为新链表的head
            newHead = oldHead
            
            /// 更新旧链表表头位置
            oldHead = nextNode
        }
        
        return newHead
    }
    
    
    
    
    
}
