//
//  TreeNode.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/19.
//

import UIKit

class TreeNode: NSObject {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public override init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    
    var pringStr = ""
    func printBinaryTree() {
        pringStr = ""
//        printBinaryTreeWithRoot(self)
        printBinaryTreeBySequenceTraversal(self)
        print("打印二叉树----"+pringStr)
    }
    
    /// 前序遍历打印
    private func preorderTraversalBinaryTreeWithRoot(_ root: TreeNode?) {
        if root == nil {return}
        preorderTraversalBinaryTreeWithRoot(root!.left)
        pringStr.append("\(root!.val) ")
        preorderTraversalBinaryTreeWithRoot(root!.right)
    }
    
    /// 层序遍历打印
    private func printBinaryTreeBySequenceTraversal(_ root: TreeNode?) {
        if root == nil {return}
        
        var queue = [TreeNode]()
        queue.append(root!)
        
        while !queue.isEmpty {
            
            let node = queue.first
            queue.removeFirst()
            pringStr.append("\(node!.val) ")
            
            if node?.left != nil {
                queue.append((node?.left)!)
            }
            
            if node?.right != nil {
                queue.append((node?.right)!)
            }
            
        }
        
        
    }
}
