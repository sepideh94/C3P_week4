Class {
	#name : 'LNNodeTest',
	#superclass : 'TestCase',
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'tests' }
LNNodeTest >> testHasNextNode [


   " self deny: LNNode new hasNextNode."

	| node |
	node:= LNNode new.
	node hasNextNode 
]

{ #category : 'tests' }
LNNodeTest >> testName [
| node |
node := LNNode new.
node name: #PC1.
self assert: node name equals: #PC1
]

{ #category : 'tests' }
LNNodeTest >> testPrintingJustInitializedNode [
self
assert: LNNode new printString
equals: 'unnamed -> \'
]

{ #category : 'tests' }
LNNodeTest >> testPrintingWithANextNode [
    self assert: (LNNode new
        name: 'LNNode1';
        nextNode: (LNNode new name: 'PC1')) printString
    equals: 'LNNode1 -> PC1'.
]

{ #category : 'tests' }
LNNodeTest >> testPrintingWithoutNextNode [
self
assert: (LNNode new
name: 'LNNode1';
printString)
equals: 'LNNode1 -> \'
]
