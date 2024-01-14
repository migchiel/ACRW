Class {
	#name : #ACApi,
	#superclass : #Object,
	#instVars : [
		'url',
		'apiKey'
	],
	#category : #'ACRW-Core'
}

{ #category : #'as yet unclassified' }
ACApi class >> apiTokenFromEnvironment [

	^ Smalltalk os environment at: 'acapi_token'
]

{ #category : #'as yet unclassified' }
ACApi class >> connectTo: aUrl withApiKey: anApiKey [

	| acapi |
	acapi := self basicNew
		         url: aUrl;
		         apiKey: anApiKey.
	^ acapi
]

{ #category : #'as yet unclassified' }
ACApi class >> connectUsingApiKey: anApiKeyString [

	^ self connectTo: self defaultArmorCodeInstance withApiKey: anApiKeyString
]

{ #category : #'as yet unclassified' }
ACApi class >> defaultArmorCodeInstance [

	^ 'https://app.armorcode.com'
]

{ #category : #'instance creation' }
ACApi class >> new [

	^ self
		  connectTo: self defaultArmorCodeInstance
		  withApiKey: self apiTokenFromEnvironment
]

{ #category : #'as yet unclassified' }
ACApi class >> withApiKey: anApiKeyString [

^ self connectTo: self defaultArmorCodeInstance  withApiKey: anApiKeyString
]

{ #category : #accessing }
ACApi >> apiKey: anApiKey [

	apiKey := anApiKey 
]

{ #category : #construction }
ACApi >> createApiEndPoint: anEndPointMethod [

^ ((ACApiFactory endPointFor: anEndPointMethod)
		   withUrl: url
		   andApiKey: apiKey)
]

{ #category : #accessing }
ACApi >> createProduct: aProductCollection [

	^ (self createApiEndPoint: thisContext selector)  create: aProductCollection
]

{ #category : #accessing }
ACApi >> createSubProduct: aSubProductCollection [

	^ (ACApiFactory endPointFor: thisContext selector) create:
		  aSubProductCollection
]

{ #category : #accessing }
ACApi >> deleteProduct: aProductCollection [

	^ (self createApiEndPoint: thisContext selector) delete: aProductCollection
]

{ #category : #accessing }
ACApi >> getApiKey [

	^ (self createApiEndPoint: thisContext selector)
		   get
]

{ #category : #accessing }
ACApi >> getAuditLog [

	^ (self createApiEndPoint: thisContext selector) get
]

{ #category : #accessing }
ACApi >> getProduct [

	^ (self createApiEndPoint: thisContext selector) get
]

{ #category : #accessing }
ACApi >> getProductElastic [

	^ (self createApiEndPoint: thisContext selector)
		   get
]

{ #category : #accessing }
ACApi >> getProductType [

	^ (self createApiEndPoint: thisContext selector)
		    get
]

{ #category : #accessing }
ACApi >> getProject [

	^ (self createApiEndPoint: thisContext selector) get
]

{ #category : #accessing }
ACApi >> getSubProduct [

	^ (self createApiEndPoint: thisContext selector) get
]

{ #category : #accessing }
ACApi >> getSubProductElastic [

	^ (self createApiEndPoint: thisContext selector) new get
]

{ #category : #accessing }
ACApi >> getSubProductType [

	^ (self createApiEndPoint: thisContext selector) get
]

{ #category : #accessing }
ACApi >> updateProduct: aProductCollection [

	^ (self createApiEndPoint: thisContext selector) update: aProductCollection
]

{ #category : #accessing }
ACApi >> url: aUrl [

	url := aUrl 
]
