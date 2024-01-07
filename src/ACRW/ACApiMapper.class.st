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

	^ ACRequestConfiguration
		  connectionConfig: [ :connection |
			  connection
				  path: '/user/product';
				  method: #POST;
				  forJsonREST ]
		  contentConfig: [ :connection :product |
		  connection contents: product ]
		  resultConfig: [ :response | response ]
]

{ #category : #'API - Deleting' }
ACApiMapper >> apiDeleteProducts [

	^ ACRequestConfiguration
		connectionConfig: [ :connection |
			connection
				path: '/user/product';
				method: #DELETE;
				contentReader: nil;
				contentWriter: nil;
				accept: ZnMimeType any ]
		contentConfig: [ :connection :product |
		connection addPath: product id asString ]
		resultConfig: [ :response | response ]
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetApiKeys [

	^ ACRequestConfiguration
		  connectionConfig: [ :connection |
			  connection
				  path: '/user/apikey';
				  method: #GET;
				  forJsonREST ]
		  contentConfig: [ :connection :apiKey |  ]
		  resultConfig: [ :response | response ]
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetAuditLogEntries [

	^ ACRequestConfiguration
		connectionConfig: [ :connection |
			connection
				path:
					'/user/audit/log/details/page?page=0&size=100&revisionType=CREATED';
				method: #GET;
				forJsonREST ]
		contentConfig: [ :content :logEntry |  ]
		resultConfig: [ :response | response ]
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetProductTypes [

	^ ACRequestConfiguration
		connectionConfig: [ :connection |
			connection
				path: '/user/product-type';
				method: #GET;
				forJsonREST ]
		contentConfig: [ :connection :productType |  ]
		resultConfig: [ :response | response ]
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetProducts [

	^ ACRequestConfiguration
		connectionConfig: [ :connection |
			connection
				path: '/user/product';
				method: #GET;
				forJsonREST ]
		contentConfig: [ :connection :content |  ]
		resultConfig: [ :response | response ]
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetProductsElastic [

	^ ACRequestConfiguration
		  connectionConfig: [ :connection |
			  connection
				  path: '/user/product/elastic?pageSize=99&pageNumber=0';
				  method: #GET;
				  forJsonREST ]
		  contentConfig: [ :connection :content |  ]
		  resultConfig: [ :response | response content ]
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetProjects [

	^ ACRequestConfiguration connectionConfig: [ :connection |
	  connection
		  path: '/user/project';
		  method: #GET;
		  forJsonREST ]
	 contentConfig:  [ :connection :project | ]
	resultConfig: [ :response | response ]
	
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetSubProductTypes [

	^ ACRequestConfiguration connectionConfig: [ :connection |
	  connection
		  path: '/user/sub-product-type';
		  method: #GET;
		  forJsonREST ]
	 contentConfig:  [ :connection : productType | ]
	resultConfig: [ :response | response ]
	
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetSubProducts [

	^ ACRequestConfiguration connectionConfig: [ :connection |
	  connection
		  path: '/api/sub-product';
		  method: #GET;
		  forJsonREST ]
	 contentConfig:  [ :connection :subropduct | ]
	resultConfig: [ :response | response ]
	
]

{ #category : #'API - Reading' }
ACApiMapper >> apiGetSubProductsElastic [

	^ ACRequestConfiguration
		  connectionConfig: [ :connection |
			  connection
				  path: '/user/sub-product/elastic?pageSize=99&pageNumber=0';
				  method: #GET;
				  forJsonREST ]
		  contentConfig: [ :connection :subProduct |  ]
		  resultConfig: [ :response | response content ]
]

{ #category : #'API - Updating' }
ACApiMapper >> apiUpdateProducts [

	^ ACRequestConfiguration connectionConfig: [ :connection |
		  connection
			  path: '/user/product';
			  method: #PUT;
			  forJsonREST ]
	 contentConfig:  [ :connection :content | connection contents: content ]
	resultConfig: [ :response | response ]
	
]

{ #category : #configuration }
ACApiMapper >> configurationFor: anApiEndPoint [

	^ (self lookupConfigFor: anApiEndPoint) connectionConfig
]

{ #category : #configuration }
ACApiMapper >> lookupConfigFor: anEndPoint [

	^ self perform: self class apiPrefix , anEndPoint capitalized
]

{ #category : #configuration }
ACApiMapper >> prepareContentFor: anApiEndPoint [

	^ (self lookupConfigFor: anApiEndPoint) contentConfig 
]

{ #category : #configuration }
ACApiMapper >> responseBlockFor: anApiEndPoint [

	^ (self lookupConfigFor: anApiEndPoint) resultConfig 
]
