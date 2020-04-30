//Question: You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
//Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

//Root: If node is root node.
//Leaf: If node is leaf node.
//Inner: If node is neither root nor leaf node.
//Sample Input


//Solution :  We are given a table BST with two columns, N(node), P(parent).

select DISTINCT(N),//The logic here is simple, N lists all the nodes in the tree, so we need to take the distinct nodes
     CASE WHEN P IS NULL THEN "Root" //Now for classification, for a node if the parent is NULL it is the root
          WHEN N IN (select P from BST) THEN "Inner" // When a number is in both N and P, it means it has a parent node and it is a parent node too, so inner
          ELSE "Leaf" END as "tree" //rest are leafs
from BST order by N;
