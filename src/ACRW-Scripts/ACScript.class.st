Class {
	#name : #ACScript,
	#superclass : #Object,
	#category : #'ACRW-Scripts'
}

{ #category : #scripting }
ACScript >> getAllApiKeys [

	<script: 'self new getAllApiKeys'>
	| acapi |
	acapi := ACApi new.
	(acapi getApiKey collect: #name) inspect
]

{ #category : #scripting }
ACScript >> getAllProductTypes [

	<script: 'self new getAllProductTypes'>
	| acapi |
	acapi := ACApi new.
	(acapi getProductType collect: #name) inspect
]

{ #category : #scripting }
ACScript >> getAllProducts [

	<script: 'self new getAllProducts'>
	| acapi |
	acapi := ACApi new.
	(acapi getProduct collect: #name) inspect
]

{ #category : #scripting }
ACScript >> getAllSubProducts [

	<script: 'self new getAllSubProducts'>
	| acapi |
	acapi := ACApi new.
	(acapi getSubProduct collect: #name) inspect
]
