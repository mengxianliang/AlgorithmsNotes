//
//  ListNode.swift
//  数据结构与算法
//
//  Created by mxl on 2021/4/27.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    func logLinkedList() {
        var node: ListNode? = self
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
    
    //创建一个单项列表
    class func LinkedList() -> ListNode? {
        let node1 = ListNode.init(1, nil)
        let node2 = ListNode.init(2, node1)
        let node3 = ListNode.init(3, node2)
        let node4 = ListNode.init(4, node3)
        let node5 = ListNode.init(5, node4)
        return node5
    }
    
    deinit {
//        print(self.val,"deinit")
    }
}
