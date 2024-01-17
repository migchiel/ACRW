Class {
	#name : #ACAuditLogEndPoint,
	#superclass : #ACApiEndpoint,
	#category : #'ACRW-Endpoints'
}

{ #category : #'actions api' }
ACAuditLogEndPoint >> getResponseBlock [

	^ [ :r | r  ]
]

{ #category : #configuration }
ACAuditLogEndPoint >> pathBlock [

	^ [ :c | c path: '/user/audit/log/details/page?page=0&size=2000' ]
]
