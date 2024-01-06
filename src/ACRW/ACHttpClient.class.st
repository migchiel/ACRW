Class {
	#name : #ACHttpClient,
	#superclass : #Object,
	#instVars : [
		'requestHelper',
		'znClient'
	],
	#category : #'ACRW-Core'
}

{ #category : #'as yet unclassified' }
ACHttpClient >> apiKey: anApiKeyString [

	znClient setBearerAuthentication: anApiKeyString
]

{ #category : #'as yet unclassified' }
ACHttpClient >> apiLimitDelay [
	"retry wait time for HTTP 429, api rate limit (in seconds)"

	^ 64
]

{ #category : #initialization }
ACHttpClient >> createHTTPClient [

	^ ZnClient new
		  systemPolicy;
		  logLevel: 3;
			 signalProgress: true; 
		  autoResetEntityMethods: #( HEAD DELETE GET );
		  logToTranscript
]

{ #category : #'as yet unclassified' }
ACHttpClient >> executeRequest [

	UIManager default informUserDuring: [ :bar |
		bar label: 'Performing API call...'.
		[
		^ znClient
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
ACHttpClient >> initialize [

	znClient := self createHTTPClient.
	requestHelper := ACRequestHelper for: znClient
]

{ #category : #'as yet unclassified' }
ACHttpClient >> performRequest: anApiEndPoint [

	requestHelper configureConnectionFor: anApiEndPoint.
	^ self executeRequest
]

{ #category : #'as yet unclassified' }
ACHttpClient >> performRequest: anApiEndPoint with: aCollection [

	requestHelper configureConnectionFor: anApiEndPoint.
	^ aCollection collect: [ :item |
		             requestHelper
			             prepareWith: item
			             for: anApiEndPoint.
		             self executeRequest ]
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

{ #category : #accessing }
ACHttpClient >> znClient [

	^ znClient
]
