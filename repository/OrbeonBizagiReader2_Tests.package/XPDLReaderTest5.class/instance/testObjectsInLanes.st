other
testObjectsInLanes
	| pool workflow lane1 |

	workflow := self getMainWorkflow.
	pool := workflow parentPool.

	lane1 := pool getLaneNamed: 'administrator' ifNone: [self assert: false].

	self assert: ((lane1 getAnyObjectNamed: 'start' ifNone: [self assert: false]) == workflow startNode).

	self assert: ((lane1 getAnyObjectNamed: 'end' ifNone: [self assert: false]) == workflow endNodes asArray last).

	self assert: ((lane1 getAnyObjectNamed: 'script' ifNone: [self assert: false]) == (workflow getScriptNamed: 'script' ifNone: [self assert: false])).

	self assert: ((lane1 getAnyObjectNamed: 'embedded-sub-proc' ifNone: [self assert: false]) == (workflow getSubprocessNamed: 'embedded-sub-proc' ifNone: [self assert: false])).

	self assert: ((lane1 getAnyObjectNamed: 'reusabe-sub-proc' ifNone: [self assert: false]) == (workflow getSubprocessNamed: 'reusabe-sub-proc' ifNone: [self assert: false])).