query variables
isAverageTaskTimeDistribution

	^(self searchValueAt: 'distribution' ifAbsent: [nil]) = ('Average Time per Task' translateFor: self session user)