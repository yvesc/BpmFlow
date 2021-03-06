other
testInOutTransitions2
	| process transition task1 task2 |

	process := self getProcess2Workflow.

	task1 := process getTaskNamed: 'Task 3' ifNone: [self assert: false].
	task2 := process getTaskNamed: 'Task 4' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'tr: start t3' ifNone: [self assert: false].
	self assert: (process startNode outTransitions last == transition).
	self assert: (task1 inTransitions last == transition).

	transition := process getTransitionNamed: 'tr: t3 t4' ifNone: [self assert: false].
	self assert: (task1 outTransitions first == transition).
	self assert: (task2 inTransitions first == transition).

	task1 := process getTaskNamed: 'Task 4' ifNone: [self assert: false].
	task2 := process getTaskNamed: 'Task 5' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'tr: t4 t5' ifNone: [self assert: false].
	self assert: (task1 outTransitions first == transition).
	self assert: (task2 inTransitions first == transition).

	task1 := process getTaskNamed: 'Task 5' ifNone: [self assert: false].
	task2 := process getTaskNamed: 'Task 8' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'tr: t5 t8' ifNone: [self assert: false].
	self assert: (task1 outTransitions last == transition).
	self assert: (task2 inTransitions first == transition).

	task2 := process getTaskNamed: 'Task 6' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'tr: t5 t6' ifNone: [self assert: false].
	self assert: (task1 outTransitions first == transition).
	self assert: (task2 inTransitions first == transition).

	task1 := process getTaskNamed: 'Task 6' ifNone: [self assert: false].
	task2 := process getTaskNamed: 'Task 7' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'tr: t6 t7' ifNone: [self assert: false].
	self assert: (task1 outTransitions first == transition).
	self assert: (task2 inTransitions first == transition).

	task1 := process getTaskNamed: 'Task 8' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'tr: t8 end2' ifNone: [self assert: false].
	self assert: (task1 outTransitions last == transition).
	self assert: (process endNodes asArray last inTransitions last == transition).

	task1 := process getTaskNamed: 'Task 6' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'tr: t6 end1' ifNone: [self assert: false].
	self assert: (task1 outTransitions last == transition).
	self assert: (process endNodes asArray first inTransitions last == transition).

	task1 := process getTaskNamed: 'Task 7' ifNone: [self assert: false].
	transition := process getTransitionNamed: 'tr: t7 end2' ifNone: [self assert: false].
	self assert: (task1 outTransitions last == transition).
	self assert: (process endNodes asArray last inTransitions first == transition).