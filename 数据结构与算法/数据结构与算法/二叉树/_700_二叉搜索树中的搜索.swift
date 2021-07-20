//
//  _700_二叉搜索树中的搜索.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/20.
//  https://leetcode-cn.com/problems/search-in-a-binary-search-tree/


/**
 测试二叉树结构
    5
   / \
  3   6
 / \   \
2   4   7
 
 迭代思路：层序遍历
 
 递归思路：比较法，如果较小则在左子树中搜索，如果较大则在右子树中搜索
 
 */

import Foundation

class SearchInBST: NSObject {
    
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
        
        let root = searchBST(node5, 3)
        root?.printBinaryTree()
    }
    
    /// 迭代
    func searchBST1(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {return root}
        
        var queue = [TreeNode]()
        queue.append(root!)
        
        while !queue.isEmpty {
            let node = queue.first
            queue.removeFirst()
            
            print("currentNode = \(node!.val)")
            
            if node?.val == val {
                return node
            }
            
            if node?.left != nil {
                queue.append(node!.left!)
            }
            
            if node?.right != nil {
                queue.append(node!.right!)
            }
            
        }
        
        return nil
    }
    
    /// 递归
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil || root!.val == val {
            return root
        }
        
        if val > root!.val {
            return searchBST(root?.right, val)
        }
        
        if val < root!.val {
            return searchBST(root?.left, val)
        }
        return nil
    }
}
