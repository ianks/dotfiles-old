let lines = "require('node-bourbon').includePaths[0]"
let sass_include_paths = xolox#misc#str#trim(system('node -p', lines))
let g:syntastic_scss_sass_post_args = ['-I' . sass_include_paths]
