query variables
isDoubleBarChart

	^(self searchValueAt: 'chart-type' ifAbsent: [nil]) = ('Double Bar Chart' translateFor: self session user)