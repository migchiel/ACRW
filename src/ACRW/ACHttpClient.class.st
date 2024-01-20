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

{ #category : #accessing }
ACHttpClient >> apiKey: anApiKeyString [

	znClient setBearerAuthentication: anApiKeyString
]

{ #category : #'connection open/close' }
ACHttpClient >> apiLimitDelay [
	"retry wait time for HTTP 429, api rate limit (in seconds)"

	^ 64
]

{ #category : #'actions api' }
ACHttpClient >> applyOperationConfigBlock: anOperation [

	(apiEndPoint perform: (anOperation asLowercase , #Block) asSymbol)
		value: znClient
]

{ #category : #'actions api' }
ACHttpClient >> applyOperationResponseBlock: anOperation [

	^ apiEndPoint perform:
		  (anOperation asLowercase , #ResponseBlock) asSymbol
]

{ #category : #'as yet unclassified' }
ACHttpClient >> applyPathBlock [

	apiEndPoint pathBlock value: znClient
]

{ #category : #'as yet unclassified' }
ACHttpClient >> applyQueryBlock [

	apiEndPoint queryBlock value: znClient
]

{ #category : #'connection open/close' }
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
		  logToTranscript;yourself
]

{ #category : #'actions api' }
ACHttpClient >> delete [

	^ apiEndPoint content collect: [ :item |
		  self applyPathBlock;
		  applyOperationConfigBlock: #DELETE.
		  apiEndPoint deleteContentBlock value: znClient value: item.
		  (self applyOperationResponseBlock: #DELETE) value:
			  self executeRequest ]
]

{ #category : #'connection open/close' }
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

	self applyPathBlock;
	applyQueryBlock;
	applyOperationConfigBlock: #GET.
	^ (self applyOperationResponseBlock: #GET) value: self executeRequest
]

{ #category : #initialization }
ACHttpClient >> initialize [

	signalProgress := false.
	znClient := self createZnClient.
	znClient url: apiEndPoint url;setBearerAuthentication: apiEndPoint apiKey
]

{ #category : #'actions api' }
ACHttpClient >> performOperation: anOperation [

	self
		applyPathBlock;
		applyOperationConfigBlock: anOperation.
	^ apiEndPoint content collect: [ :item |
			self applyQueryBlock.
		  apiEndPoint createContentBlock value: znClient value: item.
		  (self applyOperationResponseBlock: anOperation) value:
			  self executeRequest ]
]

{ #category : #'actions api' }
ACHttpClient >> post [

	^ self performOperation: #POST
	
]

{ #category : #'actions api' }
ACHttpClient >> put [

	^ self performOperation: #PUT
]

{ #category : #'connection open/close' }
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
