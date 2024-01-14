Class {
	#name : #ACProductEndPoint,
	#superclass : #ACApiEndpoint,
	#category : #'ACRW-Endpoints'
}

{ #category : #configuration }
ACProductEndPoint >> pathBlock [

	^ [ :c | c path: '/user/product' ]
]
