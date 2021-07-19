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
    
    
    func printBinaryTree() {
        print("打印二叉树，根节点：\(self.val)")
        printBinaryTreeWithRoot(self)
    }
    
    private func printBinaryTreeWithRoot(_ root: TreeNode?) {
        if root == nil {return}
        
        print("currentNode = \(root?.val ?? 0)")
        
        printBinaryTreeWithRoot(root?.left)
        printBinaryTreeWithRoot(root?.right)
        
    }
}
