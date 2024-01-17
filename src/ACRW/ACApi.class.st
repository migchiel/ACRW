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
ACApi >> createProducts: aProductCollection [

	^ (self createApiEndPoint: #Product) create:
		  aProductCollection
]

{ #category : #accessing }
ACApi >> createSubProducts: aSubProductCollection [

	^ (self createApiEndPoint: #SubProduct) create:
		  aSubProductCollection
]

{ #category : #accessing }
ACApi >> deleteProducts: aProductCollection [

	^ (self createApiEndPoint: #Product) delete:
		  aProductCollection
]

{ #category : #accessing }
ACApi >> getApiKeys [

	^ (self createApiEndPoint: #ApiKey) get
]

{ #category : #accessing }
ACApi >> getAuditLogFilters [

	^ (self createApiEndPoint: #AuditLogFilter) get
]

{ #category : #accessing }
ACApi >> getAuditLogs [

	| logEntries allEntries pages endPoint |
	allEntries := OrderedCollection new.
	endPoint := self createApiEndPoint: #AuditLog.
	logEntries := endPoint get.
	allEntries add: logEntries content.
	pages := logEntries totalPages - 1.
	pages timesRepeat: [
		allEntries add: endPoint get content ].
	^ allEntries
]

{ #category : #accessing }
ACApi >> getProductTypes [

	^ (self createApiEndPoint: #ProductType) get
]

{ #category : #accessing }
ACApi >> getProducts [

	^ (self createApiEndPoint: #Product) get
]

{ #category : #accessing }
ACApi >> getProductsElastic [

	^ (self createApiEndPoint: #ProductElastic) get
]

{ #category : #accessing }
ACApi >> getProjects [

	^ (self createApiEndPoint: #Project) get
]

{ #category : #accessing }
ACApi >> getSubProductTypes [

	^ (self createApiEndPoint: #SubProductType) get
]

{ #category : #accessing }
ACApi >> getSubProducts [

	^ (self createApiEndPoint: #SubProduct) get
]

{ #category : #accessing }
ACApi >> getSubProductsElastic [

	^ (self createApiEndPoint: #SubProductElastic) get
]

{ #category : #accessing }
ACApi >> updateProducts: aProductCollection [

	^ (self createApiEndPoint: #Product) update:
		  aProductCollection
]

{ #category : #accessing }
ACApi >> url: aUrl [

	url := aUrl 
]
