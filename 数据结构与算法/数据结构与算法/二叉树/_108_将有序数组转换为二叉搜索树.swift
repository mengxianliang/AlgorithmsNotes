//
//  _108_将有序数组转换为二叉搜索树.swift
//  数据结构与算法
//
//  Created by mxl on 2021/7/21.
//  https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree/

import Foundation

class ConvertSortedArrayToBST: NSObject {
    
    override init() {
        super.init()
        
        let nums = [0,1,2,3,4,5]
        print("有序数组：\(nums)")
        
        let root = sortedArrayToBST(nums)
        root?.printBinaryTree(.levelOrder)
        
    }
    
    /**
     思路：
     有序数组和二叉搜索树的中序遍历排序方式一致，所以可以取数组的中间元素作为根节点，
     再取左侧剩余元素重复上面步骤作为左子树，再取后面剩余元素组成右子树
     
     保证左右子树的高度差不大于1
     
     */
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return treeNodeHelper(nums, 0, nums.count - 1)
    }
    
    /// 递归方法
    func treeNodeHelper(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {return nil}
        
        /// 取中间值得到根节点
        let midIndex = (left + right)/2
        let root = TreeNode(nums[midIndex])
        
        /// 设置左右子树
        root.left = treeNodeHelper(nums, left, midIndex - 1)
        root.right = treeNodeHelper(nums, midIndex + 1, right)
        return root
    }
    
}
