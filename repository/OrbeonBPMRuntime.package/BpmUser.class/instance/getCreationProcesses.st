processes
getCreationProcesses
	"Answer a collection of process definitions <BpmTopProcessDefinition> where the receiver has creation permission"

	^self getProcessDefinitionLatestVersions select: [:each | each canCreateProcessInstance: self]