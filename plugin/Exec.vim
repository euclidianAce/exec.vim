
function! s:OutBuffer()
	if bufwinnr("__out__") > 0
		" jump to window if it already exists
		" also clear it
		exe "normal " . bufwinnr("__out__") . "\<C-w>\<C-w>"
		normal! gg"_dG
	else
		:10split __out__
	endif
	setlocal buftype=nofile
	setlocal noswapfile
	setlocal nobuflisted
endfunction

function! Exec#Exec()
	" Find read line 1 and look for shebang
	let l = getline(1)
	if l[0:1] == "#!"
		" Runs the code and redirects it's output to a buffer
		let out = system(l[2:-1] . " " . bufname("%") . " 2>&1")
		call s:OutBuffer()
		call append(0, split(out, '\v\n'))
	else
		echo "Insert a shebang (#!) comment at the top of this file to run"
	endif
endfunction

nnoremap <silent> <leader>run :call Exec#Exec()<CR>
