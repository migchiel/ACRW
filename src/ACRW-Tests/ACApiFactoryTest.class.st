"
An ACApiFactoryTest is a test class for testing the behavior of ACApiFactory
"
Class {
	#name : #ACApiFactoryTest,
	#superclass : #TestCase,
	#instVars : [
		'factory'
	],
	#category : #'ACRW-Tests-Core'
}

{ #category : #running }
ACApiFactoryTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	factory := ACApiFactory new
]

{ #category : #tests }
ACApiFactoryTest >> testDetermineAction [

	self assert: (factory determineAction: 'getProducts') equals: 'get'.
	self
		assert: (factory determineAction: 'createSubProducts')
		equals: 'create'.
	 
]

{ #category : #tests }
ACApiFactoryTest >> testDetermineEndPoint [

	self
		assert: (factory determineEndPoint: 'getProducts')
		equals: 'Product'.
	self
		assert: (factory determineEndPoint: 'createSubProducts')
		equals: 'SubProduct'
]

{ #category : #test }
ACApiFactoryTest >> testEndPointFor [

	self
		assert: (factory endPointFor: 'getProducts') class
		equals: ACProductEndPoint.
	self
		assert: (factory endPointFor: 'getSubProducts') class
		equals: ACSubProductEndPoint
]
