Class {
	#name : #ACAuditLogFilterEndPoint,
	#superclass : #ACApiEndpoint,
	#category : #'ACRW-Endpoints'
}

{ #category : #configuration }
ACAuditLogFilterEndPoint >> pathBlock [

	^ [ :c | c path: '/user/audit/log/filters' ]
]
