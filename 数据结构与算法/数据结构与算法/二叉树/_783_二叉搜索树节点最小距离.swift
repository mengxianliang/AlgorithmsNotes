//
//  _783_二叉搜索树节点最小距离.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/21.
//  https://leetcode-cn.com/problems/minimum-distance-between-bst-nodes/

import Foundation

class MinimumDistanceBetweenBST: NSObject {
    
    override init() {
        super.init()
        
        /// 创建测试二叉树
        let node2 = TreeNode(2)
        let node8 = TreeNode(8)
        let node14 = TreeNode(14)
        
        let node6 = TreeNode(6, node2, node8)
        let node13 = TreeNode(13, nil, node14)
        
        let node10 = TreeNode.init(10, node6, node13)
        node10.printBinaryTree()
        
        let miniDif = minDiffInBST(node10)
        print("二叉搜索树节点最小距离：\(miniDif)")
    }
    
    
    /**
     测试二叉树结构
        10
       / \
      6   13
     / \   \
    2   8   14
     思路：二叉搜索树中序遍历【迭代】，结果一定是从小到大，挨个比较两个相邻节点间的差值
     */
    
    func minDiffInBST(_ root: TreeNode?) -> Int {
        
        if root == nil {return 0}
        
        /// 保存遍历结果
        var res = [Int]()
        
        /// 差值
        var diff = Int.max
        
        /// 保存计算中的节点
        var stack = [TreeNode]()
        /// root转成可变
        var root = root
        
        while root != nil || !stack.isEmpty {
            
            /// 先遍历左子树
            while root != nil {
                stack.append(root!)
                root = root?.left
            }
            
            /// 出栈
            root = stack.last
            stack.removeLast()
            
            /// 判断差值大小
            if res.count > 0 {
                let currentDiff = root!.val - res.last!
                print("currentDiff = \(res.last!), diff = \(diff)")
                if currentDiff < diff {
                    diff = currentDiff
                    print("更新diff = \(diff)")
                }
            }
            
            /// 保存遍历结果
            res.append(root!.val)
            
            print("中序遍历,当前节点：\(root!.val)")
            
            /// 遍历右子树
            root = root?.right
            
        }
        
        return diff
    }
}
