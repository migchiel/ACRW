Class {
	#name : #ACProductEndPoint,
	#superclass : #ACApiEndpoint,
	#category : #'ACRW-Endpoints'
}

{ #category : #'actions api' }
ACProductEndPoint >> delete [

	^ [:c | c 
		  method: #DELETE;
		  contentReader: nil;
		  contentWriter: nil;
		  accept: ZnMimeType any]
]

{ #category : #'actions api' }
ACProductEndPoint >> get [

	^ httpClient get
]

{ #category : #'actions api' }
ACProductEndPoint >> getBlock [

	self configureConnection.
	^ [:c | c
		  forJsonREST;
		  method: #GET]
]

{ #category : #'actions api' }
ACProductEndPoint >> patch [
]

{ #category : #configuration }
ACProductEndPoint >> pathBlock [

	^ [ :c | c path: '/user/product' ]
]

{ #category : #'actions api' }
ACProductEndPoint >> post [ 


]

{ #category : #'actions api' }
ACProductEndPoint >> put [
]
