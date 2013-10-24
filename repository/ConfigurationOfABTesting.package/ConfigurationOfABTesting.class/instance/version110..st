versions
version110: spec
	<version: '1.1' imports: #('1.0-baseline')>
	spec
		for: #common
		do: [ 
			spec blessing: #release.
			spec
				project: 'Seaside30' with: #stable;
				package: 'DHB' with: 'DHB-hfm.5';
				package: 'ABTesting' with: 'ABTesting-PaulDeBruicker.5' ].
	spec for: #gemstone do: [ spec package: 'DHB' with: 'DHB-PaulDeBruicker.6' ]