condition evaluation
basicEvaluateConditionIn: aBpmProcessInstance
	"The receiver evaluates the condition <conditionToRun> in the context of the object <aBpmProcessInstance>"

	^conditionToRun evaluateConditionIn: aBpmProcessInstance.