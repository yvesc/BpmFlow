query variables
isNumberOfUsersDistribution

	^(self searchValueAt: 'distribution' ifAbsent: [nil]) = ('Number of Users' translateFor: self session user)