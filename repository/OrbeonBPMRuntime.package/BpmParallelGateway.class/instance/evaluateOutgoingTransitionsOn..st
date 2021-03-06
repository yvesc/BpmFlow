other
evaluateOutgoingTransitionsOn: aBpmProcessInstance
	"The receiver is Splitting and only one of all out going transition is going to be instantiated"

	"in parallel gateway no conditions are evaluated, all outgoing transitions are instantiated"

	self getOutTransitionDefinitions do: [:each | aBpmProcessInstance createNewTransition: each from: self].

	self getOutTransitionDefinitions isEmpty 
	ifTrue: [self defaultTransition 
				ifNotNil: [:trDefinition | aBpmProcessInstance createNewTransition: trDefinition from: self]	
				ifNil: [self signal: (NoNextArtifactBpmException signal: 'No next Task to execute')]].