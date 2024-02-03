Class {
	#name : #BaselineOfACRW,
	#superclass : #BaselineOf,
	#category : #BaselineOfACRW
}

{ #category : #baselines }
BaselineOfACRW >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self setUpDependencies: spec.
		spec
			package: 'ACRW'
			with: [ spec requires: #( 'NeoJSON' 'ZTimestamp' 'NeoCSV') ];
			package: 'ACRW-Scripts' with: [ spec requires: #( 'ACRW' ) ];
			package: 'ACRW-Tests' with: [ spec requires: #( 'ACRW' ) ];
			group: 'Core' with: #( 'ACRW' );
			group: 'Scripting' with: #( 'ACRW-Scripts' );
			group: 'Tests' with: #( 'ACRW-Tests' ) ]
]

{ #category : #initialization }
BaselineOfACRW >> setUpDependencies: spec [

	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'https://github.com/svenvc/NeoJSON.git' ];
		baseline: 'ZTimestamp'
		with: [ spec repository: 'https://github.com/svenvc/ztimestamp.git' ];
		baseline: 'NeoCSV'
		with: [ spec repository: 'https://github.com/svenvc/NeoCSV.git' ]
]
