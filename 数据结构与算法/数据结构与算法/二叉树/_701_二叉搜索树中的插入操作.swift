//
//  _701_二叉搜索树中的插入操作.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/20.
//  https://leetcode-cn.com/problems/insert-into-a-binary-search-tree/

import Foundation

class InsertIntoBST: NSObject {
    
    override init() {
        super.init()
        
        /// 创建测试二叉树
        let node4 = TreeNode(4)
        let node8 = TreeNode(8)
        let node14 = TreeNode(14)
        
        let node6 = TreeNode(6, node4, node8)
        let node12 = TreeNode(12, nil, node14)
        
        let node10 = TreeNode.init(10, node6, node12)
        node10.printBinaryTree()
        
        let root = insertIntoBST(node10, 11)
        root?.printBinaryTree()
        
    }
    
    /**
     测试二叉树结构
        10
       / \
      6   12
     / \   \
    4   8   14
     
     迭代思路：层序遍历
     比较插入val和当前节点的val，如果小于则插入左子树，如果大于则插入右子树
     
     */
    
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return TreeNode(val)
        }
        var current = root
        while current != nil {
            if val > current!.val{
                /// 如果右子树是空，则添加新的子树
                if current?.right == nil {
                    current?.right = TreeNode(val)
                    return root
                }
                
                current = current?.right
            }
            
            if val < current!.val {
                /// 如果右子树是空，则添加新的子树
                if current?.left == nil {
                    current?.left = TreeNode(val)
                    return root
                }
                
                current = current?.left
            }
        }
        
        return root
        
    }
}
