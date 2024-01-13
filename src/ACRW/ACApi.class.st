Class {
	#name : #ACApi,
	#superclass : #Object,
	#category : #'ACRW-Core'
}

{ #category : #'as yet unclassified' }
ACApi class >> apiTokenFromEnvironment [

	^ Smalltalk os environment at: 'acapi_token'
]

{ #category : #'as yet unclassified' }
ACApi class >> connectTo: aUrl withApiKey: anApiKey [

	| acapi |
	acapi := self basicNew.
	acapi initialize.
	acapi httpClient
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
ACApi >> createProducts: aProductCollection [

	^ httpClient performRequest: #createProducts with: aProductCollection
]

{ #category : #accessing }
ACApi >> createSubProducts: aSubProductCollection [

	^ httpClient performRequest: #createSubProducts with: aSubProductCollection
]

{ #category : #accessing }
ACApi >> deleteProducts: aProductCollection [

	^ httpClient performRequest: #deleteProducts with: aProductCollection
]

{ #category : #accessing }
ACApi >> getApiKeys [

	^ ACApiFactory endPointFor: thisContext selector
]

{ #category : #accessing }
ACApi >> getAuditLogs [

	^ ACApiFactory endPointFor: thisContext selector
]

{ #category : #accessing }
ACApi >> getProductTypes [

	^ ACApiFactory endPointFor: thisContext selector
]

{ #category : #accessing }
ACApi >> getProducts [

	^ (ACApiFactory endPointFor: thisContext selector) get
]

{ #category : #accessing }
ACApi >> getProductsElastic [

	^ ACApiFactory endPointFor: thisContext selector
]

{ #category : #accessing }
ACApi >> getProjects [

	^ ACApiFactory endPointFor: thisContext selector
]

{ #category : #accessing }
ACApi >> getSubProductTypes [

	^ ACApiFactory endPointFor: thisContext selector
]

{ #category : #accessing }
ACApi >> getSubProducts [

	^ ACApiFactory endPointFor: thisContext selector
]

{ #category : #accessing }
ACApi >> getSubProductsElastic [

	^ ACApiFactory endPointFor: thisContext selector
]

{ #category : #accessing }
ACApi >> httpClient [

	^ httpClient
]

{ #category : #initialization }
ACApi >> initialize [

	httpClient := ACHttpClient new
]

{ #category : #accessing }
ACApi >> updateProducts: aProductCollection [

	^ httpClient performRequest: #updateProducts with: aProductCollection
]
