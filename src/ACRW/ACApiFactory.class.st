Class {
	#name : #ACApiFactory,
	#superclass : #Object,
	#category : #'ACRW-Core'
}

{ #category : #'as yet unclassified' }
ACApiFactory class >> determineAction: aString [

	^ aString first: ((aString findFirst: #isUppercase) - 1)
]

{ #category : #'as yet unclassified' }
ACApiFactory class >> determineEndPoint: aString [

	^ (aString trimLeft: #isLowercase) allButLast
]

{ #category : #'as yet unclassified' }
ACApiFactory class >> endPointFor: anApiEndPoint [

	| endPoint |
	endPoint := self determineEndPoint: anApiEndPoint.
	^ self class environment at: ('AC' , endPoint , 'EndPoint') asSymbol
]
