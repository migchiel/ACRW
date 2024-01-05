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

{ #category : #'helper methods' }
ACApiTest >> newProduct [

	^ NeoJSONObject new
		  name: 'Test-Product-' , UUID new asString;
		  description: self newProductDescription;
		  type: (NeoJSONObject new
				   type: 'Web Application';
				   id: 1)
]

{ #category : #'helper methods' }
ACApiTest >> newProductDescription [

	^ 'ACRW-Test-Product'
]

{ #category : #running }
ACApiTest >> setUp [

	super setUp.
	acapi := ACRWResource current acapi
]

{ #category : #test }
ACApiTest >> testCreateDeleteProducts [

	| testCollection testResults |
	testCollection := Array with: self newProduct.
	testResults := acapi createProducts: testCollection.
	self assert: testResults size equals: 1.
	acapi deleteProducts: testResults
]

{ #category : #test }
ACApiTest >> testCreateProducts [

	self testCreateDeleteProducts 
]

{ #category : #test }
ACApiTest >> testDeleteProducts [

	self testCreateDeleteProducts 
]

{ #category : #test }
ACApiTest >> testGetApiKeys [

	| keys |
	keys := acapi getApiKeys.
	self assert:
		(keys anySatisfy: [ :key | key initials = ACRWResource apiKeyfingerPrint ])
]

{ #category : #test }
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

{ #category : #test }
ACApiTest >> testGetProducts [

	self assert: acapi getProducts size equals: 2
		
]

{ #category : #test }
ACApiTest >> testGetProjects [

	self assert: acapi getProjects size equals: 5
]

{ #category : #test }
ACApiTest >> testGetSubProductTypes [

	self assert: acapi getSubProductTypes size equals: 10
]

{ #category : #test }
ACApiTest >> testGetSubProducts [

	self assert: acapi getSubProducts size equals: 2
]

{ #category : #test }
ACApiTest >> testUpdateProducts [

	| testCollection testResults |
	testCollection := Array with: self newProduct.
	testResults := acapi createProducts: testCollection.
	self assert: testResults size equals: 1.
	self
		assert: testResults first description
		equals: self newProductDescription.
	testResults first description:
		testResults first description asUppercase.
	testResults := acapi updateProducts: testResults.
	self assert: testResults size equals: 1.
	self
		assert: testResults first description
		equals: self newProductDescription asUppercase.
	acapi deleteProducts: testResults
]
