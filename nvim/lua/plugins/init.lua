local G = require "global"
local g =  vim.g

-- DB UI
g["db_ui_env_variable_url"] = "DATABASE_URL"
g["db_ui_env_variable_name"] = "DATABASE_NAME"
g["db_ui_save_location"] = G.cache_dir .. "dadbod_queries"
g["db_ui_win_position"] = 'left'
g["db_ui_use_nerd_fonts"] = 1
g["db_ui_winwidth"] = 35

-- BarBar
--g["bufferline"].icon_default_file        = ''
--g["bufferline"].icon_separator_active    = '▎'
--g["bufferline"].icon_separator_inactive  = '▎'
--g["bufferline"].icon_close_tab           = ''
--g["bufferline"].icon_close_tab_modified  = '●'

-- Vsnip snippet directories
g["vsnip_snippet_dir"] = G.vim_path .. "snippets"

-- Vista
--- How each level is indented and what to prepend.
--- This could make the display more compact or more spacious.
--- e.g., more compact: ["▸ ", ""]
--- Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
g["vista_icon_indent"] = {"╰─▸ ", "├─▸ "}

--- Executive used when opening vista sidebar without specifying it.
--- See all the avaliable executives via `:echo g:vista#executives`.
g["vista_default_executive"] = 'ctags'

-- Set the executive for some filetypes explicitly. Use the explicit executive
-- instead of the default one for these filetypes when using `:Vista` without
-- specifying the executive.
g["vista_executive_for"] = {
    angular = 'nvim_lsp',
    bash = 'nvim_lsp',
    bib = 'nvim_lsp',
    docker = 'nvim_lsp',
    c = 'nvim_lsp',
    cpp = 'nvim_lsp',
    css = 'nvim_lsp',
    elm = 'nvim_lsp',
    graphql = 'nvim_lsp',
    html = 'nvim_lsp',
    json = 'nvim_lsp',
    latex = 'nvim_lsp',
    less = 'nvim_lsp',
    markdown = 'toc',
    php = 'nvim_lsp',
    purescript = 'nvim_lsp',
    python = 'nvim_lsp',
    rome = 'nvim_lsp',
    rust = 'nvim_lsp',
    sass = 'nvim_lsp',
    scss = 'nvim_lsp',
    sql = 'nvim_lsp',
    svelte = 'nvim_lsp',
    typescript = 'nvim_lsp',
    typescriptreact = 'nvim_lsp',
    yaml = 'nvim_lsp',
    vim = 'nvim_lsp',
    vue = 'nvim_lsp',
}

g["vista_disable_statusline"] = 1

-- Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
g["vista#renderer#enable_icon"] = 1

-- Endwise No default mapping
g["endwise_no_mappings"] = 1

if G.exists("/tmp/sway-colord/dawn") then
    g["dusk_til_dawn_sway_colord"] = true
end

-- Gutentags
g["gutentags_cache_dir"] = G.cache_dir .. '/tags'
g["gutentags_project_root"] = {'.root', '.git', '.svn', '.hg', '.project','go.mod', 'Cargo.toml', '.bzr', '_darcs', '_FOSSIL_', '.fslckout','tsconfig.js','jsconfig.js'}
g["gutentags_generate_on_write"] = 0
g["gutentags_generate_on_missing"] = 0
g["gutentags_generate_on_new"] = 0
g["gutentags_exclude_filetypes"] = {'defx', 'denite', 'vista', 'magit'}
g["gutentags_ctags_extra_args"] = {'--output-format=e-ctags'}
g["gutentags_ctags_exclude"] = {'*.json', '*.js', '*.ts', '*.jsx', '*.css', '*.less', '*.sass', '*.go', '*.dart', 'node_modules', 'dist', 'vendor'}

-- Dusk til Dawn
g["dusk_til_dawn_morning"] = 7
g["dusk_til_dawn_night"] = 19
g["space_nvim_transparent_bg"] = true

-- Prose
--g["lexical#thesaurus"] = {'~/.config/nvim/thesaurus/mthesaur.txt', '~/.config/nvim/moby_thesaurus.txt'}
g["lexical#dictionary"] = {'/usr/share/dict/words'}
g["lexical#spellfile"] = {'~/.config/nvim/spell/en.utf-8.add'}
g["lexical#thesaurus_key"] = '<leader>lt'
g["lexical#dictionary_key"] = '<leader>ld'

-- No default mapping for git_messenger
g["git_messenger_no_default_mappings"] = true

require("Dusk-til-Dawn").timeMan(
    function()
        require('indent_guides').setup(
    {
        even_colors = {fg = "#d3d3e7", bg = "#d3d3e7"},
        odd_colors = {fg = "#e7e5eb", bg = "#e7e5eb"},
        indent_space_guides = true,
        indent_tab_guides = true,
        indent_guide_size = 4
    }
)
require('indent_guides').indent_guides_enable()
    end,
    function()
        require('indent_guides').setup(
            {
                even_colors = {fg = "#5C5E61", bg = "#5C5E61"},
                odd_colors = {fg = "#434548", bg = "#434548"},
                indent_space_guides = true,
                indent_tab_guides = true,
                indent_guide_size = 4
            }
        )
        require('indent_guides').indent_guides_enable()
    end
)()

require"toggleterm".setup{
    size = 12,
    open_mapping = [[<a-t>]],
    shade_terminals = false,
    persist_size = true,
    direction = 'horizontal'
}

require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close
      },
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = ">",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      -- TODO add builtin options.
    },
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = {"target/*"},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`
  },
}

require('nvim-autopairs').setup()

require('compe').setup {
    enabled = true;
    debug = false;
    min_length = 2;
    preselect = "enable";
    source_timeout = 200;
    incomplete_delay = 400;
    allow_prefix_unmatch = false;
    source = {
      nvim_lsp = true;
      vim_dadbod_completion = true;
      vsnip = true;
      path = true;
      buffer = true;
    };
}

require 'plugins.lsp'
require 'plugins.which-key'
require 'plugins.statusline'
