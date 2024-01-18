Class {
	#name : #ACApiEndpoint,
	#superclass : #Object,
	#instVars : [
		'httpClient',
		'url',
		'apiKey',
		'content'
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

{ #category : #accessing }
ACApiEndpoint >> content [

	^ content
]

{ #category : #'actions api' }
ACApiEndpoint >> create: aCollection [

	content := aCollection.
	^ httpClient post
]

{ #category : #'as yet unclassified' }
ACApiEndpoint >> createContentBlock [

	^ [ :c :d | c contents: d ]
]

{ #category : #'actions api' }
ACApiEndpoint >> delete: aCollection [

	content := aCollection.
	^ httpClient delete
]

{ #category : #'actions api' }
ACApiEndpoint >> deleteBlock [

	^ [ :c |
	  c
		  method: #DELETE;
		  contentReader: nil;
		  contentWriter: nil;
		  accept: ZnMimeType any ]
]

{ #category : #'actions api' }
ACApiEndpoint >> deleteContentBlock [

	^ [ :c :d | c addPath: d id asString ]
	
]

{ #category : #'actions api' }
ACApiEndpoint >> deleteResponseBlock [

	^ [ :r | r ]
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

{ #category : #'actions api' }
ACApiEndpoint >> getResponseBlock [

	^ [ :r | r ]
]

{ #category : #initialization }
ACApiEndpoint >> initialize [

	httpClient := ACHttpClient with: self
]

{ #category : #configuration }
ACApiEndpoint >> pathBlock [ 

	^ self subclassResponsibility 
]

{ #category : #'actions api' }
ACApiEndpoint >> postBlock [

	^ [ :c |
	  c
		  forJsonREST;
		  method: #POST ]
]

{ #category : #'actions api' }
ACApiEndpoint >> postResponseBlock [

	^ [ :r | r ]
]

{ #category : #'actions api' }
ACApiEndpoint >> putBlock [

	^ [ :c |
	  c
		  forJsonREST;
		  method: #PUT ]
]

{ #category : #'actions api' }
ACApiEndpoint >> putResponseBlock [

	^ [ :r | r ]
]

{ #category : #'actions api' }
ACApiEndpoint >> queryBlock [

	^ [ :c |  ]
]

{ #category : #updating }
ACApiEndpoint >> update: aCollection [

	content := aCollection.
	^ httpClient put
]

{ #category : #accessing }
ACApiEndpoint >> url [

	^ url
]

{ #category : #accessing }
ACApiEndpoint >> url: aUrl [

	url := aUrl
]
