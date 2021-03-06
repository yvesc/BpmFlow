other
testInOutTransitions3
	| process transition task1 task2 |

	process := self getProcess3Workflow.

	task1 := process getTaskNamed: 'Task 9' ifNone: [self assert: false].
	task2 := process getTaskNamed: 'Task 10' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'tr: start t9' ifNone: [self assert: false].
	self assert: (process startNode outTransitions last == transition).
	self assert: (task1 inTransitions last == transition).

	transition := process getTransitionNamed: 'tr: t9 t10' ifNone: [self assert: false].
	self assert: (task1 outTransitions first == transition).
	self assert: (task2 inTransitions first == transition).

	task1 := process getTaskNamed: 'Task 10' ifNone: [self assert: false].
	task2 := process getTaskNamed: 'Task 11' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'tr: t10 t11' ifNone: [self assert: false].
	self assert: (task1 outTransitions first == transition).
	self assert: (task2 inTransitions first == transition).

	task1 := process getTaskNamed: 'Task 11' ifNone: [self assert: false].
	task2 := process getTaskNamed: 'Task 12' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'tr: t11 t12' ifNone: [self assert: false].
	self assert: (task1 outTransitions last == transition).
	self assert: (task2 inTransitions first == transition).

	task1 := process getTaskNamed: 'Task 12' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'tr: t12 end' ifNone: [self assert: false].
	self assert: (task1 outTransitions last == transition).
	self assert: (process endNodes asArray last inTransitions last == transition).