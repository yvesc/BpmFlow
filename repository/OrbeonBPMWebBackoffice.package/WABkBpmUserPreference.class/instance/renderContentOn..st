other
renderContentOn: html

	html div id: 'user-preferences'; class: 'centered-unique-form float-left';
		with: [html form with: [
					html fieldSet with:[
						html legend with: [html strong: ('Lists' translateFor: self session user)].
						self renderDisplayPagingSizeOn: html.
						html submitButton callback: [self savePreferences]; with: ('Save Preferences' translateFor: self session user).
					].
				].
		].
	html div id: 'user-preferences-2'; class: 'centered-unique-form float-left';
		with: [html form with: [
					html fieldSet with:[
						html legend with: [html strong: ('Backcolors' translateFor: self session user)].
						self renderListBackcolorOn: html.
						html submitButton callback: [self savePreferences]; with: ('Save Preferences' translateFor: self session user).
					].
				].
		].