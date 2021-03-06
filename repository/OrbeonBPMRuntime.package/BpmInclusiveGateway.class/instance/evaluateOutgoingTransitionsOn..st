other
evaluateOutgoingTransitionsOn: aBpmProcessInstance
	"The receiver is Splitting and only one of all out going transition is going to be instantiated based on the evaluation of the condition"
	| nextTransitionsDef |

	nextTransitionsDef := OrderedCollection new.

	self getOutTransitionDefinitions do: [:trDefinition | 
		(trDefinition evaluateConditionIn: aBpmProcessInstance)
		ifTrue: [nextTransitionsDef add: trDefinition]. 
	].

	nextTransitionsDef do: [:each | aBpmProcessInstance createNewTransition: each from: self].

	nextTransitionsDef isEmpty 
	ifTrue: [self defaultTransition 
					ifNotNil: [:trDefinition | aBpmProcessInstance createNewTransition: trDefinition from: self]
					ifNil: [self signal: (NoNextArtifactBpmException signal: 'No next Task to execute')]].