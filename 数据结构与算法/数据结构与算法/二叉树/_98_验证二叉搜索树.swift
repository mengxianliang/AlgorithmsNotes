//
//  _98_验证二叉搜索树.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/20.
//  https://leetcode-cn.com/problems/validate-binary-search-tree/

import Foundation

class ValidateBST: NSObject {
    
    override init() {
        super.init()
        
        /// 创建测试二叉树
        let node2 = TreeNode(2)
        let node4 = TreeNode(4)
        let node7 = TreeNode(7)
        
        let node3 = TreeNode(3, node2, node4)
        let node6 = TreeNode(6, nil, node7)
        
        let node5 = TreeNode.init(5, node3, node6)
        node5.printBinaryTree()
        
        if isValidBST(node5) {
            print("这是一个二叉搜索树")
        }else {
            print("这不是一个二叉搜索树")
        }
    }
    
    
    /**
     测试二叉树结构
        5
       / \
      3   6
     / \   \
    2   4   7
     
     思路：二叉搜索树中序遍历，结果一定是从小到大，如果中间有比前一个小的话，就不是二叉搜索树
     */
    
    var arr = [Int]()
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        
        inOrderTraversalBinaryTreeWithRoot(root)
        
        print("arr = \(arr)")
        
        for i in 0..<arr.count {
            
            if i == arr.count - 1 {
                break
            }
            
            let a = arr[i]
            let b = arr[i + 1]
            
            if a >= b {
                return false
            }
        }
        
        
        return true
        
    }
    
    
    /// 中序遍历
    func inOrderTraversalBinaryTreeWithRoot(_ root: TreeNode?) {
        if root == nil {return}
        inOrderTraversalBinaryTreeWithRoot(root!.left)
        arr.append(root!.val)
        inOrderTraversalBinaryTreeWithRoot(root!.right)
    }
}
