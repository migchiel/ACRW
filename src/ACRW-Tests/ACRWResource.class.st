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

	^ ACApi apiTokenFromEnvironment last: 4
]

{ #category : #accessing }
ACRWResource >> acapi [

	^ acapi
]

{ #category : #running }
ACRWResource >> setUp [

	super setUp.
	acapi := ACApi new
]
