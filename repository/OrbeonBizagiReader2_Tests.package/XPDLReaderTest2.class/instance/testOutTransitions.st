test proc 1 inout transitions
testOutTransitions
	| process transition task1 gateway |

	process := self getTestCaseWorkflow.
	transition := process getTransitionNamed: 'start-case' ifNone: [self assert: false].
	self assert: (process startNode outTransitions last == transition).

	task1 := process getTaskNamed: 'test-case' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'run-test' ifNone: [self assert: false].
	self assert: (task1 outTransitions last == transition).

	task1 := process getTaskNamed: 'execute-test' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'evaluate-issue' ifNone: [self assert: false].
	self assert: (task1 outTransitions last == transition).

	gateway := process getGatewayNamed: 'is-issue' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'test-ok' ifNone: [self assert: false].
	self assert: (gateway outTransitions last == transition).

	gateway := process getGatewayNamed: 'is-issue' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'report-issue' ifNone: [self assert: false].
	self assert: (gateway outTransitions first == transition).

	task1 := process getTaskNamed: 'analyze-issue-report' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'evaluate-report' ifNone: [self assert: false].
	self assert: (task1 outTransitions last == transition).

	gateway := process getGatewayNamed: 'accept-issue' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'reject-issue' ifNone: [self assert: false].
	self assert: (gateway outTransitions first == transition).

	gateway := process getGatewayNamed: 'accept-issue' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'fix' ifNone: [self assert: false].
	self assert: (gateway outTransitions last == transition).

	task1 := process getSubprocessNamed: 'fix-issue' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'test-again' ifNone: [self assert: false].
	self assert: (task1 outTransitions last == transition).