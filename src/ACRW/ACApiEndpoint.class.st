Class {
	#name : #ACApiEndpoint,
	#superclass : #Object,
	#instVars : [
		'httpClient'
	],
	#category : #'ACRW-Endpoints'
}

{ #category : #'instance creation' }
ACApiEndpoint class >> with: aConnection [

	^ self new connection: aConnection
]

{ #category : #'actions api' }
ACApiEndpoint >> create: aCollection [

	^ self subclassResponsibility
]

{ #category : #'actions api' }
ACApiEndpoint >> delete [

	^ self subclassResponsibility 
]

{ #category : #'actions api' }
ACApiEndpoint >> delete: aCollection [

	^ self subclassResponsibility
]

{ #category : #'actions api' }
ACApiEndpoint >> get [

	^ self subclassResponsibility 
]

{ #category : #initialization }
ACApiEndpoint >> initialize [

	httpClient := ACHttpClient with: self
]

{ #category : #'actions api' }
ACApiEndpoint >> patch [

	^ self subclassResponsibility 
]

{ #category : #configuration }
ACApiEndpoint >> pathBlock [ 

	^ self subclassResponsibility 
]

{ #category : #'actions api' }
ACApiEndpoint >> post [

	^ self subclassResponsibility 
]

{ #category : #'actions api' }
ACApiEndpoint >> put [

	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
ACApiEndpoint >> setupForUrl: aUrl withApiKey: anApiKey [

	httpClient url: aUrl.
	httpClient apiKey: anApiKey
]

{ #category : #'actions api' }
ACApiEndpoint >> update: aCollection [

	^ self subclassResponsibility
]
