//
//  _876_链表的中间结点.swift
//  数据结构与算法
//
//  Created by mxl on 2021/4/27.
//  https://leetcode-cn.com/problems/middle-of-the-linked-list/

import Foundation

class MiddleOfTheLinkedList: NSObject {
    override init() {
        super.init()
        
        let node1 = ListNode.init(1, nil)
        let node2 = ListNode.init(2, node1)
        let node3 = ListNode.init(3, node2)
        let node4 = ListNode.init(4, node3)
        let node5 = ListNode.init(5, node4)
        let node6 = ListNode.init(6, node5)
        
        //保存链表的head
        let head: ListNode? = node6
        
        head?.logLinkedList()
        let node = middleNode3(head)
        node?.logLinkedList()
    }
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var tempNode = head
        let totalNum = numOfLinkedList(head)
        let mindelNum =  totalNum%2 == 0 ? totalNum/2 : totalNum/2+1;
        
        while tempNode != nil {
            let num = numOfLinkedList(tempNode)
            if  num == mindelNum{
                return tempNode
            }
            tempNode = tempNode?.next
        }
        
        return tempNode
    }
    
    func numOfLinkedList(_ node: ListNode?) -> Int {
        var num = 0
        var tempNode = node
        while tempNode != nil {
            num = num + 1
            tempNode = tempNode?.next
        }
        return num
    }
    
    //数组法
    func middleNode1(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var arr: Array<ListNode> = []
        var tempNode = head
        while tempNode != nil {
            arr.append(tempNode!)
            tempNode = tempNode?.next
        }
        
        return arr[arr.count/2]
    }
    
    //遍历指针法
    func middleNode2(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        //第一遍遍历，获取所有个数
        var totalNum = 0
        var tempNode = head
        while tempNode != nil {
            totalNum = totalNum + 1
            tempNode = tempNode?.next
        }
        
        var k = 0
        tempNode = head
        while k < totalNum/2 {
            k = k + 1
            tempNode = tempNode?.next
        }
        
        return tempNode
    }
    
    //快慢指针法
    func middleNode3(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var slow = head
        var fast = head
        while fast != nil || fast?.next != nil{
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
}
