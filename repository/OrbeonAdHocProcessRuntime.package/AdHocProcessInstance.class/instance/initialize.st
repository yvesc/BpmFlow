other
initialize

	super initialize.

	currentSteps := OrderedCollection new.
	executedSteps := OrderedCollection new.
	createdTime := TimeStamp current.