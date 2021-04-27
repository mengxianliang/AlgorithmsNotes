//
//  _83_ 删除排序链表中的重复元素.swift
//  数据结构与算法
//
//  Created by mxl on 2021/4/27.
//  https://leetcode-cn.com/problems/remove-duplicates-from-sorted-list/

import Foundation

class RemoveDuplicates: NSObject {
    
    override init() {
        super.init()
        
        let node1 = ListNode.init(0, nil)
        let node2 = ListNode.init(0, node1)
        let node3 = ListNode.init(0, node2)
        let node4 = ListNode.init(-1, node3)
        let node5 = ListNode.init(-1, node4)
        
        //保存链表的head
        var head: ListNode? = node5
        head?.logLinkedList()
        head = self.deleteDuplicates(head)
        head?.logLinkedList()
        
    }
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {

        if head == nil {
            return head
        }
        //设置临时节点
        var currentNode = head;
        //最后一个节点不循环
        while currentNode?.next != nil {
            print("遍历了一次")
            if currentNode?.val == currentNode?.next?.val {
                currentNode?.next = currentNode?.next?.next
            }else {
                currentNode = currentNode?.next
            }
        }
        return head
    }
    
    
}
