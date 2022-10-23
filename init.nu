# Directory Bookmark
def 'complete name' [] {
	$env | get -i NU_BOOKMARKS | default []
}

export def-env bm [
	--add(-a)     # add the PWD as bookmark
	--delete(-d)  # delete the bookmark
	--list(-l)    # list bookmarks
	--print(-p)   # print the bookmark content
	name?: string@'complete name' # the bookmark name
] {
	let file = (
		$env.NU_PACKER_CFG
		| get -i bookmarks.file
		| default $'($env.NU_PACKER_HOME)/directory_bookmarks.nuon'
	)
	let marks = (if ($file | path exists) { open $file } else { {} })
	let-env NU_BOOKMARKS = ($marks | transpose k v | get -i k | default [])
	let-env PWD = (
		if $list {
			print $marks
			$env.PWD
		} else if $name != null {
			if $add {
				$marks | upsert $name $env.PWD | save $file
				$env.PWD
			} else if $delete {
				$marks | reject $name | save $file
				$env.PWD
			} else if $print {
				print ($marks | get -i $name)
				$env.PWD
			} else {
				if $name in $marks {$marks | get $name
				} else {$env.PWD}
			}
		} else {
			print -e 'Missing argument: name (string)'
			$env.PWD
		}
	)
}
