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
			with: [
				spec requires: #( 'NeoJSON' 'ZTimestamp' ) ];
			package: 'ACRW-Tests'
			with: [ spec requires: #( 'ACRW' ) ];
			group: 'Core' with: #( 'ACRW' );
			group: 'Tests' with: #( 'ACRW-Tests' ) ]
]

{ #category : #initialization }
BaselineOfACRW >> setUpDependencies: spec [

	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON/repository' ];
		baseline: 'ZTimestamp'
		with: [ spec repository: 'github://svenvc/ztimestamp' ];
		baseline: 'NeoCSV'
		with: [ spec repository: 'github://svenvc/NeoCSV/repository' ]
]
