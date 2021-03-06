process
renderTransitionDataOn: html for: aBpmArtifactInstance

	html anchor class: 'process-transition-icon-collapse';
		callback: [self switchOpenCloseTransition: aBpmArtifactInstance]; 
		with: [html image url: (SEWAFIconLibrary / (self collapseIconFor: aBpmArtifactInstance));
								title: (self collapseTitleFor: aBpmArtifactInstance);
								altText: (self collapseTitleFor: aBpmArtifactInstance)].

	html header with: [html strong: aBpmArtifactInstance printFormLargeNameForWebButton].
	html header with: [html strong: ('Task Data' translateFor: self session user)].

	((self displayModeFor: aBpmArtifactInstance) = #collapsed) ifTrue: [^self].

	aBpmArtifactInstance isTask 
	ifTrue: [^self renderTransitionFormDataOn: html for: aBpmArtifactInstance].

	aBpmArtifactInstance isSubprocessDefinition
	ifTrue: [^self renderTransitionSubProcessDataOn: html for: aBpmArtifactInstance].

	^self renderTransitionGatewayDataOn: html for: aBpmArtifactInstance