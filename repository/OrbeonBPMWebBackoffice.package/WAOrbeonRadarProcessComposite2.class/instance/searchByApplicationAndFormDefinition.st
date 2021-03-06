searching
searchByApplicationAndFormDefinition
	| application |
	 "searchCollectionResult := OrbeonFormProcessDefinition getProcessInstancesOf: self getSelectedApplication ofFormNamed: self getSelectedFormDefinition."

	application := self getApplicationManagerClass getAnyApplicationNamed: (self searchValueAt: 'application') ifNone: [nil].
	application ifNil: [^searchCollectionResult := #()].

	searchCollectionResult := BpmRunningTasksMatrix getAllAvailableTaskAssignmentsIn: (OrderedCollection with: application).

	searchCollectionResult := (searchCollectionResult select: [:each | each process hasTaskNamed: self getSelectedFormDefinition])
											collect: [:each | each process]