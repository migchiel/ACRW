Class {
	#name : #ACScript,
	#superclass : #Object,
	#category : #'ACRW-Scripts'
}

{ #category : #'as yet unclassified' }
ACScript >> getAllApiKeys [

	<script: 'self new getAllApiKeys'>
	| acapi |
	acapi := ACApi withApiKey: ACRWResource apiToken.
	(acapi getApiKeys collect: #name) inspect
]

{ #category : #'as yet unclassified' }
ACScript >> getAllProductTypes [

	<script: 'self new getAllProductTypes'>
	| acapi |
	acapi := ACApi withApiKey: ACRWResource apiToken.
	(acapi getProductTypes collect: #name) inspect
]

{ #category : #'as yet unclassified' }
ACScript >> getAllProducts [

	<script: 'self new getAllProducts'>
	| acapi |
	acapi := ACApi withApiKey: ACRWResource apiToken.
	(acapi getProducts collect: #name) inspect
]

{ #category : #'as yet unclassified' }
ACScript >> getAllSubProducts [

	<script: 'self new getAllSubProducts'>
	| acapi |
	acapi := ACApi withApiKey: ACRWResource apiToken.
	(acapi getSubProducts collect: #name) inspect
]
