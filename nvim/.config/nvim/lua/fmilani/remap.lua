local nnoremap = require("fmilani.keymap").nnoremap

nnoremap("<CR>", ":nohl<CR><CR>")
nnoremap("<leader>e", ":NvimTreeToggle<CR>")

nnoremap("x", '"_x')

nnoremap("<leader>sv", "<C-w>v")
nnoremap("<leader>sh", "<C-w>s")
nnoremap("<leader>se", "<C-w>=")
nnoremap("<leader>sx", ":close<CR>")
nnoremap("<leader>sm", ":MaximizerToggle<CR>")

nnoremap("<leader>to", ":tabnew<CR>")
nnoremap("<leader>tx", ":tabclose<CR>")
nnoremap("<leader>tn", ":tabn<CR>")
nnoremap("<leader>tp", ":tabp<CR>")

local builtin = require("telescope.builtin")
nnoremap("<leader>ff", builtin.find_files)
nnoremap("<leader>fg", builtin.live_grep)
nnoremap("<leader>fc", builtin.grep_string)
nnoremap("<leader>fb", builtin.buffers)
nnoremap("<leader>fh", builtin.help_tags)
