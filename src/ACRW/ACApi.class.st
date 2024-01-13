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

{ #category : #accessing }
ACApi >> createProducts: aProductCollection [

	^ (ACApiFactory endPointFor: thisContext selector) new create: aProductCollection
]

{ #category : #accessing }
ACApi >> createSubProducts: aSubProductCollection [

	^ (ACApiFactory endPointFor: thisContext selector) new create:
		  aSubProductCollection
]

{ #category : #accessing }
ACApi >> deleteProducts: aProductCollection [

	^ (ACApiFactory endPointFor: thisContext selector) new delete: aProductCollection
]

{ #category : #accessing }
ACApi >> getApiKeys [

	^ (ACApiFactory endPointFor: thisContext selector) new get
]

{ #category : #accessing }
ACApi >> getAuditLogs [

	^ (ACApiFactory endPointFor: thisContext selector) new get
]

{ #category : #accessing }
ACApi >> getProductTypes [

	^ (ACApiFactory endPointFor: thisContext selector) new get
]

{ #category : #accessing }
ACApi >> getProducts [

	^ ((ACApiFactory endPointFor: thisContext selector) withUrl: url andApiKey: apiKey) get
]

{ #category : #accessing }
ACApi >> getProductsElastic [

	^ ACApiFactory endPointFor: thisContext selector
]

{ #category : #accessing }
ACApi >> getProjects [

	^ (ACApiFactory endPointFor: thisContext selector)new get
]

{ #category : #accessing }
ACApi >> getSubProductTypes [

	^ (ACApiFactory endPointFor: thisContext selector) new get
]

{ #category : #accessing }
ACApi >> getSubProducts [

	^ (ACApiFactory endPointFor: thisContext selector) new get
]

{ #category : #accessing }
ACApi >> getSubProductsElastic [

	^ (ACApiFactory endPointFor: thisContext selector) new get
]

{ #category : #accessing }
ACApi >> updateProducts: aProductCollection [

	^ (ACApiFactory endPointFor: thisContext selector) new update: aProductCollection
]

{ #category : #accessing }
ACApi >> url: aUrl [

	url := aUrl 
]
