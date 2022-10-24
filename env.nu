export-env {
	let-env NU_BOOKMARKS = (
		if ($file | path exists) { open $file } else { {} }
		| transpose k v
		| get -i k | default []
	)
}
