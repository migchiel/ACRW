"
An ACApiTest is a test class for testing the behavior of ACApi
"
Class {
	#name : #ACApiTest,
	#superclass : #TestCase,
	#instVars : [
		'acapi'
	],
	#category : #'ACRW-Tests-Core'
}

{ #category : #accessing }
ACApiTest class >> resources [

	^ { ACRWResource }
]

{ #category : #running }
ACApiTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"
	self timeLimit: 900 seconds.
	 acapi := ACRWResource current acapi
]

{ #category : #tests }
ACApiTest >> testPlaceHolder [

	| keys |
	keys := acapi getApiKeys.
	self assert: (keys anySatisfy: [ :key |
			 key initials = (ACRWResource apiToken last: 4) ])
]
