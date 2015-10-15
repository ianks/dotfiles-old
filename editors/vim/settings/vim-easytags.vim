let g:easytags_async = 1
let g:easytags_dynamic_files = 1
let g:easytags_auto_highlight = 0
let g:easytags_include_members = 1
let g:easytags_events = ['BufWritePost']

if executable('jsctags')
  let g:easytags_languages = {
  \   'javacript': {
  \     'cmd': 'jsctags',
  \       'args': [],
  \       'fileoutput_opt': '-f',
  \       'stdout_opt': '-f-',
  \       'recurse_flag': ''
  \   }
  \}
else
  echoe 'CTags: jsctags not installed. `npm install -g git+https://github.com/ramitos/jsctags.git`'
endif

if executable('ripper-tags')
  let g:easytags_languages = {'ruby': {'cmd': 'ripper-tags'}}
else
  echoe 'CTags: ripper-tags not installed. `gem install ripper-tags`'
endif
