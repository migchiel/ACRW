Class {
	#name : #ACProductEndPoint,
	#superclass : #ACApiEndpoint,
	#category : #'ACRW-Endpoints'
}

{ #category : #'actions api' }
ACProductEndPoint >> create: aCollection [

	content := aCollection.
	httpClient post
]

{ #category : #'actions api' }
ACProductEndPoint >> delete: aCollection [

	content := aCollection.
	httpClient delete
]

{ #category : #configuration }
ACProductEndPoint >> pathBlock [

	^ [ :c | c path: '/user/product' ]
]
