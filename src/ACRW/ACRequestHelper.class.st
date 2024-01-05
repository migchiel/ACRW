Class {
	#name : #ACRequestHelper,
	#superclass : #Object,
	#instVars : [
		'apiMapper',
		'connection'
	],
	#category : #'ACRW-Core'
}

{ #category : #'as yet unclassified' }
ACRequestHelper class >> for: aConnection [

	^ self new connection: aConnection
]

{ #category : #'as yet unclassified' }
ACRequestHelper >> configureConnectionFor: anApiEndPoint [
	"Get the configuration block for the endpoint and inject the connection to get the connection configured"

	(apiMapper configurationFor: anApiEndPoint) value: connection
]

{ #category : #accessing }
ACRequestHelper >> connection: aConnection [

	connection := aConnection 
]

{ #category : #'as yet unclassified' }
ACRequestHelper >> initialize [

	apiMapper := ACApiMapper new.
]

{ #category : #'as yet unclassified' }
ACRequestHelper >> prepareWith: item for: anApiEndPoint [
	"Get the request content setup block for the endpoint and inject both the connection and the item data to get the request configured"

	(apiMapper prepareContentFor: anApiEndPoint)
		value: connection
		value: item
]
