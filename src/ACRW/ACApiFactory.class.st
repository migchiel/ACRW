Class {
	#name : #ACApiFactory,
	#superclass : #Object,
	#category : #'ACRW-Core'
}

{ #category : #'as yet unclassified' }
ACApiFactory class >> determineEndPoint: aString [
	| endPoint |
	
  endPoint := aString trimLeft: #isLowercase.
  endPoint last = $: ifTrue: [ ^ endPoint allButLast ].
	^ endPoint
		  
]

{ #category : #'as yet unclassified' }
ACApiFactory class >> endPointFor: anApiEndPoint [

	| endPoint |
	endPoint := self determineEndPoint: anApiEndPoint.
	^ self class environment at: ('AC' , endPoint , 'EndPoint') asSymbol
]
