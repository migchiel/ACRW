Class {
	#name : #ACSubProduct,
	#superclass : #ACDTO,
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

{ #category : #'accessing - variables' }
ACSubProduct >> product: aProductId [

	super product: (NeoJSONObject new id: aProductId)
]
