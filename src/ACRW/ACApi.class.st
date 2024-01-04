Class {
	#name : #ACApi,
	#superclass : #Object,
	#instVars : [
		'connection'
	],
	#category : #'ACRW-Core'
}

{ #category : #'as yet unclassified' }
ACApi class >> connectTo: aUrl withApiKey: anApiKey [

	| acapi |
	acapi := self basicNew.
	acapi initialize.
	acapi connection
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

	self error:
		'Please use ''connectUsingApiKey:'' or ''connectTo: withApiKey:'''
]

{ #category : #'as yet unclassified' }
ACApi class >> withApiKey: anApiKeyString [

^ self connectTo: self defaultArmorCodeInstance  withApiKey: anApiKeyString
]

{ #category : #accessing }
ACApi >> connection [ 

	^ connection
]

{ #category : #accessing }
ACApi >> getApiKeys [

	 
	^ connection performRequest: #getApiKeys
]

{ #category : #accessing }
ACApi >> getProductTypes [

	^ connection performRequest: #getProductTypes
]

{ #category : #accessing }
ACApi >> getProducts [

	^ connection performRequest: #getProducts.
]

{ #category : #accessing }
ACApi >> getSubProductTypes [

	^ connection performRequest: #getSubProductTypes
]

{ #category : #accessing }
ACApi >> getSubProducts [

	^ connection performRequest: #getSubProducts.

]

{ #category : #initialization }
ACApi >> initialize [

	connection := ACConnection new
]
