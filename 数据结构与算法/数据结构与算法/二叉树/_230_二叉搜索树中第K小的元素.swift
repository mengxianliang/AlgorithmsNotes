//
//  _230_二叉搜索树中第K小的元素.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/21.
//  https://leetcode-cn.com/problems/kth-smallest-element-in-a-bst/

import Foundation

class KthSmallestElementInBST: NSObject {
    
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
        
        let num = kthSmallest(node10, 2)
        print("第2小的的节点是：\(num)")
        
    }
    
    /**
     测试二叉树结构
        10
       / \
      6   13
     / \   \
    2   8   14
     思路：中序遍历得到从小到大排列的节点，第k次遍历就是第k小的元素
     
     */
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        
        var stack = [TreeNode]()
        stack.append(root!)
        
        var root = root
        
        var count = 1
        
        var smallest = Int.min
        
        while root != nil || !stack.isEmpty {
            
            /// 先遍历左子树
            while root != nil {
                stack.append(root!)
                root = root?.left
            }
            
            /// 遍历节点出栈
            root = stack.popLast()
            print("第\(count)次，node = \(root!.val)")
            if count == k {/// 当循环次数count和k相等时，得到的就是第k小的节点
                smallest = root!.val
                break
            }
            count += 1
            
            /// 再遍历右子树
            root = root?.right
        }
        
        return smallest
        
    }
}
