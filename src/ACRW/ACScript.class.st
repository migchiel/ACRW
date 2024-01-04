Class {
	#name : #ACScript,
	#superclass : #Object,
	#category : #'ACRW-Scripts'
}

{ #category : #scripting }
ACScript >> getAllApiKeys [

	<script: 'self new getAllApiKeys'>
	| acapi |
	acapi := ACApi withApiKey: ACRWResource apiToken.
	(acapi getApiKeys collect: #name) inspect
]

{ #category : #scripting }
ACScript >> getAllProductTypes [

	<script: 'self new getAllProductTypes'>
	| acapi |
	acapi := ACApi withApiKey: ACRWResource apiToken.
	(acapi getProductTypes collect: #name) inspect
]

{ #category : #scripting }
ACScript >> getAllProducts [

	<script: 'self new getAllProducts'>
	| acapi |
	acapi := ACApi withApiKey: ACRWResource apiToken.
	(acapi getProducts collect: #name) inspect
]

{ #category : #scripting }
ACScript >> getAllSubProducts [

	<script: 'self new getAllSubProducts'>
	| acapi |
	acapi := ACApi withApiKey: ACRWResource apiToken.
	(acapi getSubProducts collect: #name) inspect
]
