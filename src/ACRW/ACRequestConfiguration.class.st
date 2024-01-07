Class {
	#name : #ACRequestConfiguration,
	#superclass : #Object,
	#instVars : [
		'configuration'
	],
	#category : #'ACRW-Core'
}

{ #category : #'as yet unclassified' }
ACRequestConfiguration class >> connectionConfig: aConnectionConfig contentConfig: aContentConfig resultConfig: aResultConfig [

	^ self new connectionConfig: aConnectionConfig;contentConfig: aContentConfig;resultConfig: aResultConfig 
]

{ #category : #'as yet unclassified' }
ACRequestConfiguration >> connectionConfig [

	^ configuration at: 'connectionConfig'
]

{ #category : #'as yet unclassified' }
ACRequestConfiguration >> connectionConfig: aConnectionConfiguration [

	configuration at: 'connectionConfig' put: aConnectionConfiguration 
]

{ #category : #'as yet unclassified' }
ACRequestConfiguration >> contentConfig [

	^ configuration at: 'contentConfig' 
]

{ #category : #'as yet unclassified' }
ACRequestConfiguration >> contentConfig: aContentConfiguration [

	configuration at: 'contentConfig' put: aContentConfiguration 
]

{ #category : #initialization }
ACRequestConfiguration >> initialize [ 

	configuration := Dictionary new.
]

{ #category : #'as yet unclassified' }
ACRequestConfiguration >> resultConfig [

	^ configuration at: 'resultConfig' 
]

{ #category : #'as yet unclassified' }
ACRequestConfiguration >> resultConfig: aResultConfiguration [

	configuration at: 'resultConfig' put: aResultConfiguration 
]
