"
An ACApiTest is a test class for testing the behavior of ACApi
"
Class {
	#name : #ACApiTest,
	#superclass : #TestCase,
	#instVars : [
		'acapi'
	],
	#category : #'ACRW-Tests-Core'
}

{ #category : #accessing }
ACApiTest class >> resources [

	^ { ACRWResource }
]

{ #category : #running }
ACApiTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"
	self timeLimit: 900 seconds.
	 acapi := ACRWResource current acapi
]

{ #category : #tests }
ACApiTest >> testGetApiKeys [

	| keys |
	keys := acapi getApiKeys.
	self assert:
		(keys anySatisfy: [ :key | key initials = ACRWResource apiKeyfingerPrint ])
]

{ #category : #tests }
ACApiTest >> testGetApiKeysHttp429 [

	| keys |
	10 timesRepeat: [ keys := acapi getApiKeys ].
	self assert:
		(keys anySatisfy: [ :key | key initials = ACRWResource apiKeyfingerPrint ])
]

{ #category : #test }
ACApiTest >> testGetProductTypes [

	self assert: acapi getProductTypes size equals: 6
]

{ #category : #tests }
ACApiTest >> testGetProducts [

	self assert: acapi getProducts size equals: 2
		
]

{ #category : #test }
ACApiTest >> testGetSubProductTypes [

	self assert: acapi getSubProductTypes size equals: 10
]

{ #category : #test }
ACApiTest >> testGetSubProducts [

	self assert: acapi getSubProducts size equals: 2
]
