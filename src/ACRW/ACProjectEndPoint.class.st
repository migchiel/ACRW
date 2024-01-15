Class {
	#name : #ACProjectEndPoint,
	#superclass : #ACApiEndpoint,
	#category : #'ACRW-Endpoints'
}

{ #category : #configuration }
ACProjectEndPoint >> pathBlock [

	^ [ :c | c path: '/user/project' ]
]
