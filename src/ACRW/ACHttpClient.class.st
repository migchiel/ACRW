Class {
	#name : #ACHttpClient,
	#superclass : #Object,
	#instVars : [
		'znClient',
		'signalProgress',
		'apiEndPoint'
	],
	#category : #'ACRW-Core'
}

{ #category : #'instance creation' }
ACHttpClient class >> with: anApiEndPoint [

	^ self basicNew apiEndPoint: anApiEndPoint;initialize
]

{ #category : #accessing }
ACHttpClient >> apiEndPoint: anApiEndPoint [

	apiEndPoint := anApiEndPoint 
]

{ #category : #'as yet unclassified' }
ACHttpClient >> apiKey: anApiKeyString [

	znClient setBearerAuthentication: anApiKeyString
]

{ #category : #'as yet unclassified' }
ACHttpClient >> apiLimitDelay [
	"retry wait time for HTTP 429, api rate limit (in seconds)"

	^ 64
]

{ #category : #'as yet unclassified' }
ACHttpClient >> clientExecute [

	^ znClient
			  ifFail: [ :exception |
				  ((exception isKindOf: ZnHttpUnsuccessful) and: [
						   #( 429 ) includes: exception response code ]) ifTrue: [
						  self recoverFromApiLimit.
						  exception signaler execute ] ];
			  execute 
]

{ #category : #initialization }
ACHttpClient >> createZnClient [

	^ ZnClient new
		  systemPolicy;
		  logLevel: 3;
		  signalProgress: false;
		  autoResetEntityMethods: #( HEAD DELETE GET );
		  logToTranscript
]

{ #category : #'actions api' }
ACHttpClient >> delete [

	apiEndPoint deleteBlock value: znClient.
	^ apiEndPoint content collect: [ :item |
			apiEndPoint pathBlock value: znClient.
		  apiEndPoint deleteContentBlock value: znClient value: item.
		  znClient execute ]
]

{ #category : #'as yet unclassified' }
ACHttpClient >> executeRequest [

	znClient signalProgress: signalProgress.
	signalProgress
		ifTrue: [
			UIManager default informUserDuring: [ :bar |
				bar label: 'Performing API call...'.
				[ ^ self clientExecute ]
					on: HTTPProgress
					do: [ :progress |
						bar label: progress printString.
						progress isEmpty ifFalse: [ bar current: progress percentage ].
						progress resume ] ] ]
		ifFalse: [ ^ self clientExecute  ]
]

{ #category : #'actions api' }
ACHttpClient >> get [

	apiEndPoint pathBlock value: znClient.
	apiEndPoint getBlock value: znClient.
	^ self executeRequest
]

{ #category : #initialization }
ACHttpClient >> initialize [

	signalProgress := false.
	znClient := self createZnClient.
	znClient url: apiEndPoint url.
	znClient setBearerAuthentication: apiEndPoint apiKey
]

{ #category : #'actions api' }
ACHttpClient >> post [

	apiEndPoint pathBlock value: znClient.
	apiEndPoint postBlock value: znClient.
	^ apiEndPoint content collect: [ :item |
		  apiEndPoint createContentBlock value: znClient value: item.
		  znClient execute ]
]

{ #category : #'actions api' }
ACHttpClient >> put [

	apiEndPoint pathBlock value: znClient.
	apiEndPoint putBlock value: znClient.
	^ apiEndPoint content collect: [ :item |
		  apiEndPoint createContentBlock value: znClient value: item.
		  znClient execute ]
]

{ #category : #'as yet unclassified' }
ACHttpClient >> recoverFromApiLimit [

	1 to: self apiLimitDelay do: [ :each |
		HTTPProgress
			signal:
				'API Rate limit hit,delaying for ' , self apiLimitDelay asString
				, ' seconds...'
			amount: each
			total: self apiLimitDelay.
		(Delay forSeconds: 1) wait ]
]

{ #category : #accessing }
ACHttpClient >> url: aUrl [

	znClient url: aUrl
]
