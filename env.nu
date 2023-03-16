export-env {
	let file = (
		$env.NU_PACKER_CFG
		| get bookmarks?.file?
		| default $'($env.NU_PACKER_HOME)/directory_bookmarks.nuon'
	)
	let-env NU_BOOKMARKS = (
		if ($file | path exists) { open $file } else { {} }
		| transpose k v
		| get k? | default []
	)
}
