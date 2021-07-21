//
//  TreeNode.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/19.
//

import UIKit


enum PrintMethod: String {
    case levelOrder = "层序遍历"
    case preorder = "前序遍历"
    case inorder = "中序遍历"
    case postorder = "后续遍历"
}


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
    func printBinaryTree(_ method: PrintMethod) {
        pringStr = ""
        switch method {
        case .levelOrder:
            levelOrderTraversal(self)
        case .preorder:
            preorderTraversal(self)
        case .inorder:
            inorderTraversal(self)
        case .postorder:
            postorderTraversal(self)
        }
        print("\(method)打印二叉树----" + pringStr)
    }
    
    
    
    /// 层序遍历打印
    private func levelOrderTraversal(_ root: TreeNode?) {
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
    
    
    /// 前续遍历打印
    func preorderTraversal(_ root: TreeNode?) {
        if root == nil {return}
        /// 访问根节点
        pringStr.append("\(root!.val) ")
        /// 访问左子树
        preorderTraversal(root?.left)
        /// 访问右子树
        preorderTraversal(root?.right)
    }
    
    /// 中续遍历打印
    func inorderTraversal(_ root: TreeNode?) {
        if root == nil {return}
        /// 访问左子树
        inorderTraversal(root?.left)
        /// 访问根节点
        pringStr.append("\(root!.val) ")
        /// 访问右子树
        inorderTraversal(root?.right)
    }
    
    
    /// 后续遍历打印
    func postorderTraversal(_ root: TreeNode?) {
        if root == nil {return}
        /// 访问左子树
        postorderTraversal(root?.left)
        /// 访问右子树
        postorderTraversal(root?.right)
        /// 访问根节点
        pringStr.append("\(root!.val) ")
    }
}
