Class {
	#name : #ACApiMapper,
	#superclass : #Object,
	#instVars : [
		'requests'
	],
	#category : #'ACRW-Core'
}

{ #category : #'as yet unclassified' }
ACApiMapper class >> apiPrefix [

	^ #api
]

{ #category : #accessing }
ACApiMapper >> apiCreateProducts [

	^ {
		  [ :connection |
		  connection
			  path: '/user/product';
			  method: #POST;
			  forJsonREST ].
		  [ :connection :content | connection contents: content ] }
]

{ #category : #'API - Deleting' }
ACApiMapper >> apiDeleteProducts [

	^ {
		  [ :connection |
		  connection
			  path: '/user/product';
			  method: #DELETE;
			  contentReader: nil;
			  contentWriter: nil;
			  accept: ZnMimeType any ].
		  [ :connection :aProduct | connection addPath: aProduct id asString ] }
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetApiKeys [

	^ { [:connection |
	  connection
		  path: '/user/apikey';
		  method: #GET;
		  forJsonREST ] }
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetProductTypes [

	^ { [:connection |
	  connection
		  path: '/user/product-type';
		  method: #GET;
		  forJsonREST ] }
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetProducts [

	^ { [:connection |
	  connection
		  path: '/user/product';
		  method: #GET;
		  forJsonREST ] }
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetProjects [

	^ { [:connection |
	  connection
		  path: '/user/project';
		  method: #GET;
		  forJsonREST ] }
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetSubProductTypes [

	^ { [:connection |
	  connection
		  path: '/user/sub-product-type';
		  method: #GET;
		  forJsonREST ] }
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetSubProducts [

	^ { [:connection |
	  connection
		  path: '/api/sub-product';
		  method: #GET;
		  forJsonREST ] }
]

{ #category : #'API - Updating' }
ACApiMapper >> apiUpdateProducts [

	^ {
		  [:connection |
		  connection
			  path: '/user/product';
			  method: #PUT;
			  forJsonREST ].
		  [ :connection :content | connection contents: content ] }
]

{ #category : #'as yet unclassified' }
ACApiMapper >> configurationFor: anApiEndPoint [

	^ (self lookupConfigFor: anApiEndPoint) first
]

{ #category : #'as yet unclassified' }
ACApiMapper >> lookupConfigFor: anEndPoint [

	^ self perform: self class apiPrefix , anEndPoint capitalized
]

{ #category : #'as yet unclassified' }
ACApiMapper >> prepareContentFor: anApiEndPoint [

	^ (self lookupConfigFor: anApiEndPoint) second
]
