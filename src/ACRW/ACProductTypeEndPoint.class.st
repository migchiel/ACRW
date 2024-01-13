Class {
	#name : #ACProductTypeEndPoint,
	#superclass : #ACApiEndpoint,
	#category : #'ACRW-Endpoints'
}

{ #category : #'as yet unclassified' }
ACProductTypeEndPoint >> setPath [

	^ [:c | c path: '/user/product-type']
]
