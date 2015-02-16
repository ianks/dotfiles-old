" Mark syntax errors with :signs
let g:syntastic_enable_signs=1

" Automatically jump to the error when saving the file
let g:syntastic_auto_jump=0

" Show the error list automatically
let g:syntastic_auto_loc_list=1

" Don't check on quitting
let g:syntastic_check_on_wq = 0

" Error symbol
let g:syntastic_error_symbol = "✗"

" Syntax checkers
let g:syntastic_ruby_checkers=['rubocop', 'mri']
let g:syntastic_python_checkers=['pep8', 'pylint', 'python']
let g:syntastic_javascript_checkers=['jshint', 'eslint']
let g:syntastic_scala_checkers=['scalac', 'scalastyle']
let g:syntastic_java_checkers=['javac', 'checkstyle']

" scalastyle
let g:syntastic_scala_scalastyle_jar='/usr/local/Cellar/scalastyle/0.6.0/libexec/scalastyle_2.10-0.6.0-batch.jar'
let g:syntastic_scala_scalastyle_config_file='~/.yadr/stylecheckers/scalastyle.xml'

" checkstyle
let g:syntastic_java_checkstyle_classpath='/usr/local/Cellar/checkstyle/6.2/libexec/checkstyle-6.2-all.jar'
let g:syntastic_java_checkstyle_conf_file='~/.yadr/stylecheckers/checkstyle.xml'
