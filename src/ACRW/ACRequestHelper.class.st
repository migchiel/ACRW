Class {
	#name : #ACRequestHelper,
	#superclass : #Object,
	#instVars : [
		'requests'
	],
	#category : #'ACRW-Core'
}

{ #category : #accessing }
ACRequestHelper >> apiGetApiKeys [

	^ [ :connection |
	  connection
		  path: '/user/apikey';
		  method: #GET;
		  forJsonREST ]
]

{ #category : #accessing }
ACRequestHelper >> apiGetProducts [

	^ [ :connection |
	  connection
		  path: '/user/product';
		  method: #GET;
		  forJsonREST ]
]

{ #category : #accessing }
ACRequestHelper >> apiGetSubProducts [

	^ [ :connection |
	  connection
		  path: '/api/sub-product';
		  method: #GET;
		  forJsonREST ]
]

{ #category : #'as yet unclassified' }
ACRequestHelper >> configure: aConnection for: anApiEndPoint [

	(requests at: anApiEndPoint) value: aConnection 
]

{ #category : #'as yet unclassified' }
ACRequestHelper >> initialize [

	| apiCalls |
	requests := Dictionary new.
	apiCalls := self class selectors select: [ :s | s beginsWith: #api ].
	apiCalls do: [ :apiCall |
		| method |
		method := apiCall allButFirst: 3.
		requests at: method uncapitalized put: (self perform: apiCall) ]
]
