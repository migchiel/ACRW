Class {
	#name : #ACProductElasticEndPoint,
	#superclass : #ACApiEndpoint,
	#category : #'ACRW-Endpoints'
}

{ #category : #configuration }
ACProductElasticEndPoint >> pathBlock [

	^ [ :c | c path: '/user/product/elastic?pageSize=99&pageNumber=0' ]
]
