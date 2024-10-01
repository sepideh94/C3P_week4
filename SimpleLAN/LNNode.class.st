Class {
	#name : 'LNNode',
	#superclass : 'Object',
	#classVars : [
		'name',
		'nextNode'
	],
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'visiting' }
LNNode >> accept: aPacket [
"Having received aPacket, send it on. This is the default
behavior. My subclasses may override me to do something special."
self send: aPacket
]

{ #category : 'testing' }
LNNode >> hasNextNode [

	 ^ nextNode notNil.
]

{ #category : 'initialization' }
LNNode >> initialize [
    super initialize.
    name := nil.  "Set the default name to nil or 'unnamed'"
    nextNode := nil.  "Ensure that nextNode starts as nil"
]

{ #category : 'accessing' }
LNNode >> name [

	^ name.

]

{ #category : 'as yet unclassified' }
LNNode >> name: aName [
    name := aName.

]

{ #category : 'as yet unclassified' }
LNNode >> nextNode [
    ^ nextNode.
]

{ #category : 'as yet unclassified' }
LNNode >> nextNode: aNextNode [
    nextNode := aNextNode.
]

{ #category : 'printing' }
LNNode >> printOn: aStream [ 
    aStream nextPutAll: (name ifNil: ['unnamed'] ifNotNil: [name]).
    aStream nextPutAll: ' -> '.
    nextNode
        ifNil: [aStream nextPutAll: '\']
        ifNotNil: [aStream nextPutAll: nextNode name].



]

{ #category : 'instructions' }
LNNode >> send: aPacket [
nextNode ifNotNil: [
self name trace.
' sends a packet to: ' 
trace.
nextNode name traceCr.
nextNode accept: aPacket ]
]
