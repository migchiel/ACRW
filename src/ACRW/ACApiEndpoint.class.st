Class {
	#name : #ACApiEndpoint,
	#superclass : #Object,
	#instVars : [
		'httpClient',
		'url',
		'apiKey'
	],
	#category : #'ACRW-Endpoints'
}

{ #category : #'instance creation' }
ACApiEndpoint class >> withUrl: aUrl andApiKey: anApiKey [

	^ self basicNew
		  url: aUrl;
		  apiKey: anApiKey;initialize
]

{ #category : #accessing }
ACApiEndpoint >> apiKey [

	^ apiKey
]

{ #category : #accessing }
ACApiEndpoint >> apiKey: anApiKey [

	apiKey := anApiKey
]

{ #category : #'actions api' }
ACApiEndpoint >> create: aCollection [

	^ self subclassResponsibility
]

{ #category : #'actions api' }
ACApiEndpoint >> delete: aCollection [

^ [ :c |
	  c
		  method: #DELETE;
		  contentReader: nil;
		  contentWriter: nil;
		  accept: ZnMimeType any ]
]

{ #category : #'actions api' }
ACApiEndpoint >> get [

	^ httpClient get
]

{ #category : #'actions api' }
ACApiEndpoint >> getBlock [ 

^ [ :c |
	  c
		  forJsonREST;
		  method: #GET ]
]

{ #category : #initialization }
ACApiEndpoint >> initialize [

	httpClient := ACHttpClient with: self
]

{ #category : #'actions api' }
ACApiEndpoint >> patch: aCollection [

	^ [  ]
]

{ #category : #configuration }
ACApiEndpoint >> pathBlock [ 

	^ self subclassResponsibility 
]

{ #category : #'actions api' }
ACApiEndpoint >> post: aCollection [

	^ [  ]
]

{ #category : #'actions api' }
ACApiEndpoint >> put: aCollection [

	^ [  ]
]

{ #category : #'actions api' }
ACApiEndpoint >> update: aCollection [

	^ self subclassResponsibility
]

{ #category : #accessing }
ACApiEndpoint >> url [

	^ url
]

{ #category : #accessing }
ACApiEndpoint >> url: aUrl [

	url := aUrl
]
