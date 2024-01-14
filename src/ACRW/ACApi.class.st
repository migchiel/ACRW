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
ACApi >> createProduct: aProductCollection [

	^ (ACApiFactory endPointFor: thisContext selector) new create: aProductCollection
]

{ #category : #accessing }
ACApi >> createSubProduct: aSubProductCollection [

	^ (ACApiFactory endPointFor: thisContext selector) new create:
		  aSubProductCollection
]

{ #category : #accessing }
ACApi >> deleteProduct: aProductCollection [

	^ (ACApiFactory endPointFor: thisContext selector) new delete: aProductCollection
]

{ #category : #accessing }
ACApi >> getApiKey [

	^ ((ACApiFactory endPointFor: thisContext selector) 
	withUrl: url
		   andApiKey: apiKey) get
]

{ #category : #accessing }
ACApi >> getAuditLog [

	^ ((ACApiFactory endPointFor: thisContext selector) 
	withUrl: url
		   andApiKey: apiKey) get
]

{ #category : #accessing }
ACApi >> getProduct [

	^ ((ACApiFactory endPointFor: thisContext selector) withUrl: url andApiKey: apiKey) get
]

{ #category : #accessing }
ACApi >> getProductElastic [

	^ ((ACApiFactory endPointFor: thisContext selector)
		   withUrl: url
		   andApiKey: apiKey) get
]

{ #category : #accessing }
ACApi >> getProductType [

	^ ((ACApiFactory endPointFor: thisContext selector) 
	withUrl: url
		   andApiKey: apiKey) get
]

{ #category : #accessing }
ACApi >> getProject [

	^ ((ACApiFactory endPointFor: thisContext selector) 
	withUrl: url
		   andApiKey: apiKey) get
]

{ #category : #accessing }
ACApi >> getSubProduct [

	^ ((ACApiFactory endPointFor: thisContext selector) 
		   withUrl: url
		   andApiKey: apiKey) get
]

{ #category : #accessing }
ACApi >> getSubProductElastic [

	^ (ACApiFactory endPointFor: thisContext selector) new get
]

{ #category : #accessing }
ACApi >> getSubProductType [

	^ ((ACApiFactory endPointFor: thisContext selector) 
	withUrl: url
		   andApiKey: apiKey) get
]

{ #category : #accessing }
ACApi >> updateProduct: aProductCollection [

	^ (ACApiFactory endPointFor: thisContext selector) new update: aProductCollection
]

{ #category : #accessing }
ACApi >> url: aUrl [

	url := aUrl 
]
