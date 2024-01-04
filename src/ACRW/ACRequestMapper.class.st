Class {
	#name : #ACRequestMapper,
	#superclass : #Object,
	#instVars : [
		'requests'
	],
	#category : #'ACRW-Core'
}

{ #category : #accessing }
ACRequestMapper >> apiGetApiKeys [

	^ [ :connection |
	  connection
		  path: '/user/apikey';
		  method: #GET;
		  forJsonREST ]
]

{ #category : #accessing }
ACRequestMapper >> apiGetProducts [

	^ [ :connection |
	  connection
		  path: '/user/product';
		  method: #GET;
		  forJsonREST ]
]

{ #category : #accessing }
ACRequestMapper >> apiGetSubProducts [

	^ [ :connection |
	  connection
		  path: '/api/sub-product';
		  method: #GET;
		  forJsonREST ]
]

{ #category : #'as yet unclassified' }
ACRequestMapper >> configure: aConnection for: anApiEndPoint [

	(requests at: anApiEndPoint) value: aConnection 
]

{ #category : #'as yet unclassified' }
ACRequestMapper >> initialize [

	| apiCalls |
	requests := Dictionary new.
	apiCalls := self class selectors select: [ :s | s beginsWith: #api ].
	apiCalls do: [ :apiCall |
		| method |
		method := apiCall allButFirst: 3.
		requests at: method uncapitalized put: (self perform: apiCall) ]
]
