distribution
getCurrentTaskQuantityDistributionnFrom: startDate to: endDate satisfying: conditionBlock
	| filteredAssignments |

	filteredAssignments := self getCurrentAssigments select: [:each | ((startDate <= each creationDate) and: [each creationDate <= endDate]) and: [conditionBlock asBpmBlock value: each process]].

	^self getTaskQuantityDistributionIn: filteredAssignments