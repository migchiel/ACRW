Class {
	#name : #ACProductTypeEndPoint,
	#superclass : #ACApiEndpoint,
	#category : #'ACRW-Endpoints'
}

{ #category : #'as yet unclassified' }
ACProductTypeEndPoint >> pathBlock [

	^ [ :c | c path: '/user/product-type' ]
]
