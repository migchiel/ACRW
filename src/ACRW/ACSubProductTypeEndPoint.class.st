Class {
	#name : #ACSubProductTypeEndPoint,
	#superclass : #ACApiEndpoint,
	#category : #'ACRW-Endpoints'
}

{ #category : #configuration }
ACSubProductTypeEndPoint >> pathBlock [

	^ [ :c | c path: '/user/sub-product-type' ]
]
