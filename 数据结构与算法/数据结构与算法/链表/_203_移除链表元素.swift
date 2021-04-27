//
//  _203_移除链表元素.swift
//  数据结构与算法
//
//  Created by mxl on 2021/4/27.
//  https://leetcode-cn.com/problems/remove-linked-list-elements/

import Foundation

class RemoveLinkedListElemets: NSObject {
    
    override init() {
        super.init()
        
        let node1 = ListNode.init(3, nil)
        let node2 = ListNode.init(3, node1)
        let node3 = ListNode.init(3, node2)
        let node4 = ListNode.init(3, node3)
        let node5 = ListNode.init(3, node4)
        
        //保存链表的head
        var head: ListNode? = node5
        head?.logLinkedList()
        head = self.removeElements2(head, 3)
        self.logLinkedList(listNode: head)
    }
    
    
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return head
        }
        
        var newHead = head
        var lastNode = head
        var currentNode = head
        while currentNode != nil {
            //如果是头
            if currentNode?.val == val && currentNode === newHead {
                newHead = currentNode?.next;
                currentNode = currentNode?.next;
                lastNode = currentNode;
            }else if currentNode?.val == val {
                //先删除currentNode
                lastNode?.next = currentNode?.next;
                currentNode = currentNode?.next;
            }else {
                lastNode = currentNode;
                currentNode = currentNode?.next
            }
        }
        return newHead
    }
    
    //官方做法
    func removeElements2(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return head
        }
        //设置一个哨兵节点，保证链表有头
        let sentinel = ListNode.init()
        sentinel.next = head;
        
        var lastNode: ListNode? = sentinel
        var currentNode = head
        
        while currentNode != nil {
            if currentNode?.val == val {
                lastNode?.next = currentNode?.next;
            }else {
                lastNode = currentNode
            }
            currentNode = currentNode?.next
        }
        return sentinel.next
    }
    
    
    func logLinkedList(listNode: ListNode?) {
        var node: ListNode? = listNode
        let string = NSMutableString.init(string: "[")
        while node != nil {
            string.appendFormat("%d", node?.val as! CVarArg)
            if node?.next != nil {
                string.append(", ")
            }
            node = node?.next
        }
        string.append("]")
        print(string)
    }
    
}

