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
	factory := ACApiFactory
]

{ #category : #tests }
ACApiFactoryTest >> testDetermineEndPoint [

	self
		assert: (factory determineEndPoint: 'getProduct')
		equals: 'Product'.
	self
		assert: (factory determineEndPoint: 'createProduct:')
		equals: 'Product'.
	self
		assert: (factory determineEndPoint: 'createSubProduct')
		equals: 'SubProduct'
]

{ #category : #tests }
ACApiFactoryTest >> testEndPointFor [

	self
		assert: (factory endPointFor: 'getProduct')
		equals: ACProductEndPoint.
	self
		assert: (factory endPointFor: 'getSubProduct') 
		equals: ACSubProductEndPoint
]
