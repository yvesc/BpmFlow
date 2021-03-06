other
printSystemRoleStructure
	| structure stream |

	structure := self getSystemRoleStructure.
	stream := PrintStream on: String new.

	structure do: [:each | 
		stream nextPutAll: each applicationName, ';'.
		stream nextPutAll: each printApplicationType, ';'.
		stream nextPutAll: each role name, ';'.
		stream nextPutAll: each printRoleType, ';'.
		stream nextPutAll: each user username.
		stream nextPutAll: String lf.
 ].

	^stream contents