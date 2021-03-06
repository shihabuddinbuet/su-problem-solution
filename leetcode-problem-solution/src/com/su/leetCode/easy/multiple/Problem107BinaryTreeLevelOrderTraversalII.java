package com.su.leetCode.easy.multiple;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Deque;
import java.util.LinkedList;
import java.util.List;

public class Problem107BinaryTreeLevelOrderTraversalII {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	
	public List<List<Integer>> levelOrderBottom(TreeNode root) {
		List<List<Integer>> levelOrderValues = new ArrayList<List<Integer>>();
        if(root == null){
        	return levelOrderValues;
        }
        
        Deque<TreeNode> dq = new LinkedList<>();
        dq.push(root);
        List<Integer> levelValues = new ArrayList<Integer>();
        levelValues.add(root.val);
        levelOrderValues.add(levelValues);
        while(!dq.isEmpty()){
        	int size = dq.size();
        	levelValues = new ArrayList<Integer>();
        	while(size > 0){
        		size --;
        		TreeNode currNode = dq.pop();
        		if(currNode.left != null){
        			levelValues.add(currNode.left.val);
        			dq.addLast(currNode.left);
        		}
        		
        		if(currNode.right != null){
        			levelValues.add(currNode.right.val);
        			dq.addLast(currNode.right);
        		}
        	}
        	if(!levelValues.isEmpty()){
        		levelOrderValues.add(levelValues);
        	}
        }
        Collections.reverse(levelOrderValues);
        return levelOrderValues;
    }
}
