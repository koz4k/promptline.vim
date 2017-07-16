fun! promptline#presets#koz4k#get()
  return {
        \'a' : [ promptline#slices#host() ],
        \'b' : [ '$USER',  ],
        \'c' : [ promptline#slices#cwd() ],
        \'x' : [ promptline#slices#python_virtualenv() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}
endfun
