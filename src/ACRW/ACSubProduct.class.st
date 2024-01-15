Class {
	#name : #ACSubProduct,
	#superclass : #ACDto,
	#category : #'ACRW-DTO'
}

{ #category : #'as yet unclassified' }
ACSubProduct class >> forProduct: aProduct [

	^ self withProductId: aProduct id
]

{ #category : #'as yet unclassified' }
ACSubProduct class >> withProductId: anId [

	^ self new
		  product: anId
]

{ #category : #'as yet unclassified' }
ACSubProduct >> product: aProductId [

	super product: (NeoJSONObject new id: aProductId)
]
