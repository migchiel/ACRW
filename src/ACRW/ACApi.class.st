Class {
	#name : #ACApi,
	#superclass : #Object,
	#instVars : [
		'url',
		'apiKey',
		'connection'
	],
	#category : #'ACRW-Core'
}

{ #category : #'as yet unclassified' }
ACApi class >> connectTo: aUrl withApiKey: anApiKey [

	| acapi |
	acapi := self basicNew.
	acapi
		setUrl: aUrl;
		setApiKey: anApiKey;
		initialize.
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
ACApi >> getApiKeys [

	^ connection
		  path: '/user/apikey';
		  method: #GET;
		  forJsonREST;execute 
]

{ #category : #initialization }
ACApi >> initialize [

	connection := ZnClient new
		              systemPolicy;
		              logLevel: 3;
		              numberOfRetries: 3;
		              autoResetEntityMethods: #( HEAD DELETE GET );
		              logToTranscript;
										setBearerAuthentication: apiKey;
										url: url
]

{ #category : #initialization }
ACApi >> setApiKey: anApiKeyString [

	apiKey := anApiKeyString 
]

{ #category : #initialization }
ACApi >> setUrl: anUrl [

	url := anUrl  
]
