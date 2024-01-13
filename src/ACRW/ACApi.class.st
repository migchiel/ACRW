Class {
	#name : #ACApi,
	#superclass : #Object,
	#instVars : [
		'httpClient'
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

	^ httpClient performRequest: #getApiKeys
]

{ #category : #accessing }
ACApi >> getAuditLogEntries [

	^ httpClient performRequest: #getAuditLogEntries 
]

{ #category : #accessing }
ACApi >> getProductTypes [

	^ httpClient performRequest: #getProductTypes
]

{ #category : #accessing }
ACApi >> getProducts [

	^ httpClient performRequest: #getProducts
]

{ #category : #accessing }
ACApi >> getProductsElastic [

	^ httpClient performRequest: #getProductsElastic
]

{ #category : #accessing }
ACApi >> getProjects [

	^ httpClient performRequest: #getProjects
]

{ #category : #accessing }
ACApi >> getSubProductTypes [

	^ httpClient performRequest: #getSubProductTypes
]

{ #category : #accessing }
ACApi >> getSubProducts [

	^ httpClient performRequest: #getSubProducts
]

{ #category : #accessing }
ACApi >> getSubProductsElastic [

	^ httpClient performRequest: #getSubProductsElastic
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
