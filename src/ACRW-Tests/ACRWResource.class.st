Class {
	#name : #ACRWResource,
	#superclass : #TestResource,
	#instVars : [
		'acapi'
	],
	#category : #'ACRW-Tests-Resources'
}

{ #category : #'as yet unclassified' }
ACRWResource class >> apiKeyfingerPrint [


^ self apiToken last: 4
]

{ #category : #'as yet unclassified' }
ACRWResource class >> apiToken [

	^ Smalltalk os environment at: 'acapi_token'
]

{ #category : #accessing }
ACRWResource >> acapi [

	^ acapi
]

{ #category : #setup }
ACRWResource >> setUp [

	super setUp.
	acapi := ACApi withApiKey: self class apiToken
]
