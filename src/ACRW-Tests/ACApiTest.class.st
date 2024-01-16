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

{ #category : #test }
ACApiTest >> createSubProductCollection: aProductId [
	| subProducts |
	subProducts := Set new.
	
	10 timesRepeat: [  subProducts add: (self newSubProduct: aProductId first id)].
	^ subProducts asArray  
]

{ #category : #'helper methods' }
ACApiTest >> newProduct [

	^ ACProduct new
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

{ #category : #'helper methods' }
ACApiTest >> newSubProduct: anId [

	^ (ACSubProduct
		  withProductId: anId)
		  name: 'Test-SubProduct-' , UUID new asString;
		  description: self newSubProductDescription;yourself
]

{ #category : #'helper methods' }
ACApiTest >> newSubProductDescription [

	^ 'ACRW-Test-SubProduct'
]

{ #category : #running }
ACApiTest >> setUp [

	super setUp.
	acapi := ACRWResource current acapi
]

{ #category : #test }
ACApiTest >> testCreateDeleteProducts [

	| testCollection testResults |
	self longTestCase.
	testCollection := Array with: self newProduct.
	testResults := acapi createProducts: testCollection.
	self assert: testResults size equals: 1.
	4 seconds wait.
	acapi deleteProducts: testResults.
	4 seconds wait.
]

{ #category : #test }
ACApiTest >> testCreateDeleteSubProducts [

	| productCollection testResults subProductCollection subProducts |
	self longTestCase.
	productCollection := Array with: self newProduct.
	testResults := acapi createProducts: productCollection.
	self assert: testResults size equals: 1.
	subProductCollection := self createSubProductCollection: testResults.
	subProducts := acapi createSubProducts: subProductCollection.
	4 seconds wait.
	acapi deleteProducts: testResults.
	4 seconds wait
]

{ #category : #test }
ACApiTest >> testGetApiKeys [

	| keys |
	keys := acapi getApiKeys.
	self assert: (keys anySatisfy: [ :key |
			 key initials = ACRWResource apiKeyfingerPrint ])
]

{ #category : #test }
ACApiTest >> testGetAuditLogs [

	self assert: acapi getAuditLogs size equals: 100
]

{ #category : #test }
ACApiTest >> testGetProductTypes [

	self assert: acapi getProductTypes size equals: 7
]

{ #category : #test }
ACApiTest >> testGetSubProductTypes [

	self assert: acapi getSubProductTypes size equals: 10
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
