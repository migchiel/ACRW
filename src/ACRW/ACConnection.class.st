Class {
	#name : #ACConnection,
	#superclass : #Object,
	#instVars : [
		'connection',
		'requestHelper'
	],
	#category : #'ACRW-Core'
}

{ #category : #'as yet unclassified' }
ACConnection >> apiKey: anApiKeyString [

	connection setBearerAuthentication: anApiKeyString
]

{ #category : #'as yet unclassified' }
ACConnection >> apiLimitDelay [
	"retry wait time for HTTP 429, api rate limit (in seconds)"

	^ 64
]

{ #category : #accessing }
ACConnection >> connection [ 

	^ connection
]

{ #category : #'as yet unclassified' }
ACConnection >> executeRequest [

	UIManager default informUserDuring: [ :bar |
		bar label: 'Performing API call...'.
		[
		^ connection
			  ifFail: [ :exception |
				  ((exception isKindOf: ZnHttpUnsuccessful) and: [
						   #( 429 ) includes: exception response code ]) ifTrue: [
						  self recoverFromApiLimit.
						  exception signaler execute ] ];
			  execute ]
			on: HTTPProgress
			do: [ :progress |
				bar label: progress printString.
				progress isEmpty ifFalse: [ bar current: progress percentage ].
				progress resume ] ]
]

{ #category : #initialization }
ACConnection >> initialize [

requestHelper := ACRequestHelper new.
	connection := ZnClient new
		              systemPolicy;
		              logLevel: 3;
		              numberOfRetries: 3;
		              autoResetEntityMethods: #( HEAD DELETE GET );
		              logToTranscript;
		              yourself
]

{ #category : #'as yet unclassified' }
ACConnection >> performRequest: anApiEndPoint [

	requestHelper configure: connection for: anApiEndPoint.
	^ self executeRequest
]

{ #category : #'as yet unclassified' }
ACConnection >> recoverFromApiLimit [

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
ACConnection >> url: aUrl [

	connection url: aUrl
]
