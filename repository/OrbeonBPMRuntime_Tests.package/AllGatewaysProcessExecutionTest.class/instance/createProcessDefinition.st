other
createProcessDefinition
	| xpdlReader processGenerator |

	xpdlReader := XPDLProcessDefinitionTemplate xpdlReaderForAllGatewaysProcess.

	processGenerator := BpmProcessGenerator on: xpdlReader xpdlPackages.
	processGenerator mapProcess: 'all gateways' toApplication: (self getApplicationManagerClass getAnyApplicationNamed: 'ue');
		generateAllProcess.

	processGenerator processes do: [:each | each addToCache].

	^processGenerator getProcessDefinitionNamed: 'all gateways' ifNone: [self assert: false].