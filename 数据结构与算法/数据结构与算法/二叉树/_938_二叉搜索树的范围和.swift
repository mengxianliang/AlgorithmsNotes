//
//  _938_二叉搜索树的范围和.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/21.
//  https://leetcode-cn.com/problems/range-sum-of-bst/

import Foundation

class RangeSumOfBST: NSObject {
    
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
        
        let rangeSum = rangeSumBST(node10, 2, 13)
        print("二叉搜索树的范围和,range:(\(2),\(13)),sum:\(rangeSum)")
        
    }
    
    /**
     测试二叉树结构
        10
       / \
      6   13
     / \   \
    2   8   14
     思路：二叉搜索树中序遍历【迭代】，结果一定是从小到大,遍历到low开始相加，知道high结束
     
     官方：广度优先、深度优先？
     
     */
    
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        
        var sum = 0
        
        var stack = [TreeNode]()
        var root = root
        
        while root != nil || !stack.isEmpty {
            
            /// 左子树入栈
            while root != nil {
                stack.append(root!)
                root = root?.left
            }
            
            /// 节点出栈
            root = stack.popLast()
            
            if root!.val > high {break}
            
            if root!.val >= low && root!.val <= high {
                sum += root!.val
            }
            
            /// 右子树入栈
            root = root?.right
        }
        
        return sum
    }
}
