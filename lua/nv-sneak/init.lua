local cmd = vim.cmd

cmd "let g:sneak#label = 1"

-- case insensitive sneak
cmd "let g:sneak#use_ic_scs = 1"

-- immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
cmd "let g:sneak#s_next = 1"

-- remap so I can use , and ; with f and t
cmd "map gS <Plug>Sneak_,"
cmd "map gs <Plug>Sneak_;"

-- Cool prompts
-- let g:sneak#prompt = '🕵'
cmd "let g:sneak#prompt = '🔎 '"
