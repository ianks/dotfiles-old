" Mark syntax errors with :signs
let g:syntastic_enable_signs=1

" Automatically jump to the error when saving the file
let g:syntastic_auto_jump=0

" Show the error list automatically
let g:syntastic_auto_loc_list=1

" Don"t check on quitting
let g:syntastic_check_on_wq = 0

" Error symbol
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_warning_symbol = "⚠"

" Syntax checkers
let g:syntastic_ruby_checkers=["rubocop", "mri"]
let g:syntastic_python_checkers=["pep8", "pylint", "python"]
let g:syntastic_javascript_checkers=["eslint"]
let g:syntastic_scala_checkers=["scalac", "scalastyle"]
let g:syntastic_java_checkers=["javac", "checkstyle"]

" scalastyle
if filereadable("/usr/local/Cellar/scalastyle/0.6.0/libexec/scalastyle_2.10-0.6.0-batch.jar")
  let g:syntastic_scala_scalastyle_jar="/usr/local/Cellar/scalastyle/0.6.0/libexec/scalastyle_2.10-0.6.0-batch.jar"
elseif filereadable("/usr/share/java/scalastyle/scalastyle-batch_2.10.jar")
  let g:syntastic_scala_scalastyle_jar="/usr/share/java/scalastyle/scalastyle-batch_2.10.jar"
endif

let g:syntastic_scala_scalastyle_config_file="~/.yadr/scala/scalastyle.xml"

" checkstyle
if filereadable("/usr/local/Cellar/checkstyle/6.2/libexec/checkstyle-6.2-all.jar")
  let g:syntastic_java_checkstyle_classpath="/usr/local/Cellar/checkstyle/6.2/libexec/checkstyle-6.2-all.jar"
elseif filereadable("/opt/checkstyle/checkstyle-5.9-all.jar")
  let g:syntastic_java_checkstyle_classpath="/opt/checkstyle/checkstyle-5.9-all.jar"
endif

let g:syntastic_java_checkstyle_conf_file="~/.yadr/langs/java/checkstyle.xml"
