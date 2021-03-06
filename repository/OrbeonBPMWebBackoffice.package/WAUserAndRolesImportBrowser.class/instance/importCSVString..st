other
importCSVString: csvString
	"The receiver separate the contents of <csvString> by String lf.  
	And each line is put as aString in <componentValues> variable.
	key: 1 value: first line, key: n value: line n
	Each line is separated by ';' "
	| rows |

	self initializeComponentValues.
	rows := csvString subStrings: String lf.
	(rows size = 1) ifTrue: [^self sewafTableForImportedData information: 'Wrong File Format' color: 'red'].
	"first row are titles"
	"where <key> is a counter (1,2,3,..,n) and <eachRow> is a string of values separated by ; 
	(application; application type; role; username)"
	(rows allButFirst reject: [:each | each trimBlanks isEmpty])  
		keysAndValuesDo: [:key :eachRow | | csvValues |
			csvValues := eachRow subStrings: ';'.
			(csvValues size = 5)
			ifTrue: [self addValue: eachRow named: key]
			ifFalse: [self initializeComponentValues.
				^self sewafTableForImportedData information: 'Wrong File Format' color: 'red'].
		].

	self sewafTableForImportedData information: 'File Processed' color: 'green'.
	importedConfigurationBatchList items: OrderedCollection new