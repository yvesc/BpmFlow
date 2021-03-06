render
renderProcessVersionsComboOn: html
	| procVersions versions |

	procVersions := BpmProcessDefinition getAllProcessesNamed: self getProcessName in: self getApplicationName.

	versions := procVersions collect: [:each | each version printString].

	self renderGenericActiveComboOn: html withList: (#('All') , versions) forVariable: 'version' label: ('Version' translateFor: self session user).

	(self hasSearchValueAt: 'version') ifFalse: [self addSearchValue: 'All' named: 'version'].