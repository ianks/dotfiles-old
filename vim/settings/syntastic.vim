" Mark syntax errors with :signs
let g:syntastic_enable_signs=1

" Automatically jump to the error when saving the file
let g:syntastic_auto_jump=0

" Show the error list automatically
let g:syntastic_auto_loc_list=1

" Syntax checkers
let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_python_checkers=['pep8', 'pylint', 'python']
let g:syntastic_javascript_checkers=['jshint']
