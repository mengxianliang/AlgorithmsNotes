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
        
        let nums = [1,2,3,4,5,6,7,8]
        print("有序数组：\(nums)")
        
        let root = sortedArrayToBST(nums)
        root?.printBinaryTree()
        
    }
    
    /**
     
     
      5
    1   6
   2 7 3 8
  4
     
     
     思路：
     有序数组和二叉搜索树的中序遍历排序方式一致，所以可以取数组的中间院所作为根节点，
     保证左右子树的高度差不大于1
     
     */
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.count == 1 {return TreeNode(nums.first!)}
        
        let rootIndex = nums.count/2
        let root = TreeNode(nums[rootIndex])
        
        for num in nums {
            insertIntoBST(root, num)
        }
        return root
        
    }
    
    func insertIntoBST(_ root: TreeNode?, _ val: Int) {
        var current = root
        while current != nil {
            if val > current!.val{
                /// 如果右子树是空，则添加新的子树
                if current?.right == nil {
                    current?.right = TreeNode(val)
                    break
                }
                
                current = current?.right
            }
            
            if val < current!.val {
                /// 如果右子树是空，则添加新的子树
                if current?.left == nil {
                    current?.left = TreeNode(val)
                    break
                }
                current = current?.left
            }
            
            if val == current!.val {
                break
            }
        }
    }
}
