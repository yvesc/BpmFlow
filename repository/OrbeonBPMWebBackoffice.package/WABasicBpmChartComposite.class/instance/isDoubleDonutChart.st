other
isDoubleDonutChart

	^(self searchValueAt: 'chart-type' ifAbsent: [nil]) = 'Double Donut Chart'