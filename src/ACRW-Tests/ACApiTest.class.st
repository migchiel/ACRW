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
	self longTestCase.
	testCollection := Array with: self newProduct.
	testResults := acapi createProduct: testCollection.
	self assert: testResults size equals: 1.
	4 seconds wait.
	acapi deleteProduct: testResults
]

{ #category : #test }
ACApiTest >> testGetApiKeys [

	| keys |

	keys := acapi getApiKey.
	self assert: (keys anySatisfy: [ :key |
			 key initials = ACRWResource apiKeyfingerPrint ])
]

{ #category : #test }
ACApiTest >> testGetApiKeysHttp429 [

	| keys |
	10 timesRepeat: [ keys := acapi getApiKey ].
	self assert:
		(keys anySatisfy: [ :key | key initials = ACRWResource apiKeyfingerPrint ])
]

{ #category : #test }
ACApiTest >> testGetAuditLogEntries [

	self assert: acapi getAuditLog content size equals: 100
]

{ #category : #test }
ACApiTest >> testGetProductTypes [

	self assert: acapi getProductType size equals: 6
]

{ #category : #test }
ACApiTest >> testGetProducts [

	self assert: acapi getProduct size equals: 1
		
]

{ #category : #test }
ACApiTest >> testGetProductsElastic [

	self assert: acapi getProductElastic size equals: 11
]

{ #category : #test }
ACApiTest >> testGetProjects [

	self assert: acapi getProject size equals: 1
]

{ #category : #test }
ACApiTest >> testGetSubProductTypes [

	self assert: acapi getSubProductType size equals: 10
]

{ #category : #test }
ACApiTest >> testGetSubProducts [

	self assert: acapi getSubProduct size equals: 0
]

{ #category : #test }
ACApiTest >> testUpdateProducts [

	| testCollection testResults |
	testCollection := Array with: self newProduct.
	testResults := acapi createProduct: testCollection.
	self assert: testResults size equals: 1.
	self
		assert: testResults first description
		equals: self newProductDescription.
	testResults first description:
		testResults first description asUppercase.
	testResults := acapi updateProduct: testResults.
	self assert: testResults size equals: 1.
	self
		assert: testResults first description
		equals: self newProductDescription asUppercase.
	acapi deleteProduct: testResults
]
