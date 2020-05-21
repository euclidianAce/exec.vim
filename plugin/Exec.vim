
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
endfunction

function! Exec#Exec()
	" Runs the code and redirects it's output to a buffer
	let out = system("./" . bufname("%") . " 2>&1")
	call s:OutBuffer()
	call append(0, split(out, '\v\n'))
endfunction

nnoremap <silent> <leader>run :call Exec#Exec()<CR>
