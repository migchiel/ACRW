Class {
	#name : #ACSubProductEndPoint,
	#superclass : #ACApiEndpoint,
	#category : #'ACRW-Endpoints'
}

{ #category : #'as yet unclassified' }
ACSubProductEndPoint >> configureConnection [

^ connection
				  path: '/api/sub-product';
				  forJsonREST 
]

{ #category : #'actions api' }
ACSubProductEndPoint >> get [

	self configureConnection.
	^ connection
		  forJsonREST;
		  method: #GET
]
