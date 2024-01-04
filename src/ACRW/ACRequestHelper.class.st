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
ACRequestHelper >> apiGetProductTypes [

	^ [ :connection |
	  connection
		  path: '/user/product-type';
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
ACRequestHelper >> apiGetSubProductTypes [

	^ [ :connection |
	  connection
		  path: '/user/sub-product-type';
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
ACRequestHelper >> apiPrefix [

	^ #api
]

{ #category : #'as yet unclassified' }
ACRequestHelper >> configurationBlockFor: apiCall [

	^ self perform: apiCall
]

{ #category : #'as yet unclassified' }
ACRequestHelper >> configure: aConnection for: anApiEndPoint [

	(requests at: anApiEndPoint) value: aConnection 
]

{ #category : #'as yet unclassified' }
ACRequestHelper >> getSupportedApiEndpoints [

	^ self class selectors select: [ :s | s beginsWith: self apiPrefix ]
]

{ #category : #'as yet unclassified' }
ACRequestHelper >> initialize [

	| apiEndPoints |
	requests := Dictionary new.
	apiEndPoints := self getSupportedApiEndpoints.
	apiEndPoints do: [ :endPoint |
		| apiEndPoint |
		apiEndPoint := endPoint allButFirst: 3.
		requests
			at: apiEndPoint uncapitalized
			put: (self configurationBlockFor: endPoint) ]
]
