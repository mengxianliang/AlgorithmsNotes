//
//  _235_二叉搜索树的最近公共祖先.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/21.
//  https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

import Foundation

class LowestCommonAncestorOfBST: NSObject {
    
    override init() {
        super.init()
        
        /// 创建测试二叉树
        let node2 = TreeNode(2)
        let node8 = TreeNode(8)
        let node14 = TreeNode(14)
        
        let node6 = TreeNode(6, node2, node8)
        let node13 = TreeNode(13, nil, node14)
        
        let node10 = TreeNode.init(10, node6, node13)
        node10.printBinaryTree(.levelOrder)
        
        let node = lowestCommonAncestor(node10, node6, node10)
        print("[6,10]最近公共祖先是：\(node?.val ?? 0)")
    }
    
    
    /**
     测试二叉树结构
        10
       / \
      6   13
     / \   \
    2   8   14
     思路：递归，如果都比root大，则root = root.left
     如果都比root小，则root = root.right
     */
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        
        if root == nil  {return root}
        
        var root = root
        
        /// 相等的话直接返回
        if root!.val == p!.val {
            return p
        }
        
        if root!.val == q!.val {
            return q
        }
        
        /// 如果root在中间，返回中间
        if p!.val < root!.val && q!.val > root!.val  {
            return root
        }
        
        /// 如果都小于root，则root = root.left
        if p!.val < root!.val && q!.val < root!.val{
            root = lowestCommonAncestor(root?.left, p, q)
        }
        
        /// 如果都大于root，则root = root.right
        if p!.val > root!.val && q!.val > root!.val{
            root = lowestCommonAncestor(root?.right, p, q)
        }
        
        return root
    }
    
}
