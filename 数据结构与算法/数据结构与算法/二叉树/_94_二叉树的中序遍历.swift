//
//  _94_二叉树的中序遍历.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/21.
//  https://leetcode-cn.com/problems/binary-tree-inorder-traversal/

import Foundation

class InorderTraversalBT: NSObject {
    
    override init() {
        super.init()
        
        let node1 = TreeNode(1)
        let node3 = TreeNode(3)
        let node6 = TreeNode(6)
        let node9 = TreeNode(9)
        
        let node2 = TreeNode(2, node1, node3)
        let node7 = TreeNode(7, node6, node9)
        
        let node4 = TreeNode.init(4, node2, node7)
        node4.printBinaryTree(.levelOrder)
        
        let res = inorderTraversal(node4)
        print("中序遍历结果是：\(res)")
        
    }
    
    /**
     二叉树结构
     输入：
         4
       /   \
      2     7
     / \   / \
    1   3 6   9
     */
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        
        if root == nil {return []}
        
        var stack = [TreeNode]()
        var root = root
        
        /// 存放中序遍历的数据
        var res = [Int]()
        
        while root != nil || !stack.isEmpty {
            /// 先遍历左子树
            while root != nil {
                /// 根节点入栈，左子树再入栈
                print("\(root!.val) 入栈")
                stack.append(root!)
                root = root?.left
            }
            
            /// 节点出栈
            root = stack.last
            stack.removeLast()
            
            print("\(root!.val) 出栈")
            
            res.append(root!.val)
            
            /// 再遍历右子树
            root = root?.right
        }
        return res
    }
}
