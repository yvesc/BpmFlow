other
renderOptionListOn: html

	html radioGroup
		callback: [:value | self onRadioButtonChanged: value];
		selected: listType;
		with: [ :group |
			self elements do: [ :each |
				html label: [ 
					group radioButton onChange: 'submit()'; value: each.
					html text: each ].] ].