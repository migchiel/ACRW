Class {
	#name : #ACSubProductEndPoint,
	#superclass : #ACApiEndpoint,
	#category : #'ACRW-Endpoints'
}

{ #category : #configuration }
ACSubProductEndPoint >> pathBlock [

	^ [ :c | c path: '/api/sub-product' ]
]
