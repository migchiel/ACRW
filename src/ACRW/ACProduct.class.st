Class {
	#name : #ACProduct,
	#superclass : #Object,
	#category : #'ACRW-Endpoints'
}

{ #category : #'as yet unclassified' }
ACProduct >> configureConnection [

	^ [ :connection |
	connection
		path: '/user/product';
		method: #GET;
		forJsonREST ]
]

{ #category : #'actions api' }
ACProduct >> delete [

]

{ #category : #'actions api' }
ACProduct >> get [
]

{ #category : #'actions api' }
ACProduct >> patch [

	
]

{ #category : #'actions api' }
ACProduct >> post [

	
]

{ #category : #'actions api' }
ACProduct >> put [

	
]
