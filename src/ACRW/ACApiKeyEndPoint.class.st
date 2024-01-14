Class {
	#name : #ACApiKeyEndPoint,
	#superclass : #ACApiEndpoint,
	#category : #'ACRW-Endpoints'
}

{ #category : #configuration }
ACApiKeyEndPoint >> pathBlock [

	^ [ :c | c path: '/user/apikey' ]
]
