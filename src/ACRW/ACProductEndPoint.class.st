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

{ #category : #configuration }
ACProductEndPoint >> pathBlock [

	^ [ :c | c path: '/user/product' ]
]
