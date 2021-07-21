//
//  _530_二叉搜索树的最小绝对差.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/20.
//  https://leetcode-cn.com/problems/minimum-absolute-difference-in-bst/

import Foundation

class MinimumDifferenceInBTS: NSObject {
    
    override init() {
        super.init()
        /// 创建测试二叉树
        let node2 = TreeNode(2)
        let node4 = TreeNode(4)
        let node7 = TreeNode(7)
        
        let node3 = TreeNode(3, node2, node4)
        let node6 = TreeNode(6, nil, node7)
        
        let node5 = TreeNode.init(5, node3, node6)
        node5.printBinaryTree(.levelOrder)
        
        let miniDif = getMinimumDifference(node5)
        print("二叉搜索树的最小绝对差是：\(miniDif)")
    }
    
    
    /**
     测试二叉树结构
        5
       / \
      3   6
     / \   \
    2   4   7
     
     思路：二叉搜索树中序遍历【递归】，结果一定是从小到大，挨个比较两个相邻节点间的差值
     */
    
    var arr = [Int]()
    
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        
        var miniDif = Int.max
        
        inorderTraversal(root)
        
        print("arr = \(arr)")
        
        for i in 0..<arr.count {
            
            if i == arr.count - 1 {
                break
            }
            
            let a = arr[i]
            let b = arr[i + 1]
            
            if b - a < miniDif {
                miniDif = b - a
            }
        }
        
        
        return miniDif
    }
    
    /// 递归中序遍历
    func inorderTraversal(_ root: TreeNode?) {
        if root == nil {return}
        inorderTraversal(root!.left)
        arr.append(root!.val)
        inorderTraversal(root!.right)
    }
}
