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
        node5.printBinaryTree()
        
        let miniDif = getMinimumDifference(node5)
        print("二叉搜索树的最小绝对差是：\(miniDif)")
    }
    
    var arr = [Int]()
    
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        
        var miniDif = Int.max
        
        inOrderTraversalBinaryTreeWithRoot(root)
        
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
    
    /// 中序遍历
    func inOrderTraversalBinaryTreeWithRoot(_ root: TreeNode?) {
        if root == nil {return}
        inOrderTraversalBinaryTreeWithRoot(root!.left)
        arr.append(root!.val)
        inOrderTraversalBinaryTreeWithRoot(root!.right)
    }
}
