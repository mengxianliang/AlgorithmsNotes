//
//  _226_翻转二叉树.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/19.
//  https://leetcode-cn.com/problems/invert-binary-tree/


/**
输入：
     4
   /   \
  2     7
 / \   / \
1   3 6   9
 
输出：
     4
   /   \
  7     2
 / \   / \
9   6 3   1
 
目标：所有子树的左右节点交换位置
 */

import Foundation

class InvertBinaryTree: NSObject {
    
    override init() {
        super.init()
        
        let node1 = TreeNode(1)
        let node3 = TreeNode(3)
        let node6 = TreeNode(6)
        let node9 = TreeNode(9)
        
        let node2 = TreeNode(2, node1, node3)
        let node7 = TreeNode(7, node6, node9)
        
        let node4 = TreeNode.init(4, node2, node7)
        
        node4.printBinaryTree()
        
        let root = invertTree4(node4)
        
        root?.printBinaryTree()
    }
    
    /// 方法一：前序遍历（先访问自己，再访问左右节点）
    func invertTree1(_ root: TreeNode?) -> TreeNode? {
        
        if root == nil {return root}
    
        /// 交换左右子树
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        
        /// 访问左右子树
        invertTree1(root?.left)
        invertTree1(root?.right)
        
        return root
    }
    
    /// 方法二：后续遍历（先访问左右节点，再访问自己）
    func invertTree2(_ root: TreeNode?) -> TreeNode? {
        
        if root == nil {return root}
    
        /// 访问左右子树
        invertTree2(root?.left)
        invertTree2(root?.right)
        
        /// 交换左右子树
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        
        return root
    }
    
    /// 方法三：中续遍历（先访问左节点，再访问自己，最后访问右节点）
    func invertTree3(_ root: TreeNode?) -> TreeNode? {
        
        if root == nil {return root}
    
        /// 访问左子树
        invertTree3(root?.left)
        
        /// 交换左右子树
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        
        /// 访问右子树（已经交换过了，left就是之前的right）
        invertTree3(root?.left)
        
        return root
    }
    
    /// 方法四：层序遍历
    func invertTree4(_ root: TreeNode?) -> TreeNode? {
        
        if root == nil {return root}

        /// 创建一个队列，让root入队
        var queue = [TreeNode]()
        queue.append(root ?? TreeNode(0))
        
        print("层序遍历root = \(root?.val ?? 0)")
        
        while !queue.isEmpty {
            
            /// 第一个节点出队
            let node = queue.first
            queue.removeFirst()
            
            /// 交换左右子树
            let temp = node?.left
            node?.left = node?.right
            node?.right = temp
            
            print("层序遍历currentNode = \(node?.val ?? 0)")
            
            /// 左子树入队
            if node?.left != nil {
                queue.append((node?.left)!)
            }
            
            /// 右子树入队
            if node?.right != nil {
                queue.append((node?.right)!)
            }
        }
        return root
    }
}
