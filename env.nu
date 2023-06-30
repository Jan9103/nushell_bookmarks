export-env {
	let file = (
		$env.NU_PACKER_CFG
		| get -i bookmarks.file
		| default $'($env.NU_PACKER_HOME)/directory_bookmarks.nuon'
	)
	load-env {NU_BOOKMARKS: (
		if ($file | path exists) { open $file } else { {} }
		| transpose k v
		| get -i k | default []
	)}
}
