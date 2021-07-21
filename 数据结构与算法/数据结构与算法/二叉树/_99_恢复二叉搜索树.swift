//
//  _99_恢复二叉搜索树.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/21.
//  https://leetcode-cn.com/problems/recover-binary-search-tree/




import Foundation

class RecoverBST {
    
    init() {
        
        /// 创建测试二叉树
        let node3 = TreeNode(3)
        
        let node1 = TreeNode(4)
        let node4 = TreeNode(1, node3, nil)
        
        let node2 = TreeNode(2, node1, node4)
        node2.printBinaryTree(.inorder)
        
        recoverTree(node2)
        node2.printBinaryTree(.inorder)
    }
    
    /**
     测试二叉树结构
        2
       / \
      1   4
         /
        3
     
     输入错误结构：
         3
        / \
       1   4
          /
         2
     或：
         2
        / \
       4   1
          /
         3
     
     思路：中序遍历得到从小到大排列的节点，再次遍历判断前后大小，得到交换的两个节点
     
     思考：Morris 中序遍历？
     */
    
    func recoverTree(_ root: TreeNode?) {
        let res = inorderTraversal(root)
        print("res = \(res)")
        
        var node1: TreeNode? = nil
        var node2: TreeNode? = nil
        
        for i in 0..<res.count {
            
            if i == res.count - 1 {continue}
            
            let node = res[i]
            let next = res[i + 1]
            
            if node.val > next.val {
                if node1 == nil {
                    node1 = node
                }
            }
            
            if next.val < node.val {
                node2 = next
            }
        }
        
        let temp = node1?.val
        node1?.val = node2?.val ?? 0
        node2?.val = temp ?? 0
        
        
    }
    
    func inorderTraversal(_ root: TreeNode?) -> [TreeNode] {
        
        if root == nil {return []}
        
        var stack = [TreeNode]()
        var root = root
        
        /// 存放中序遍历的数据
        var res = [TreeNode]()
        
        while root != nil || !stack.isEmpty {
            /// 先遍历左子树
            while root != nil {
                /// 根节点入栈，左子树再入栈
                stack.append(root!)
                root = root?.left
            }
            
            /// 遍历节点出栈
            root = stack.last
            stack.removeLast()
            
            res.append(root!)
            
            /// 再遍历右子树
            root = root?.right
        }
        return res
    }
}
