# Neovim

As commonly known, Neovim is a highly customizable text editor, based on Vim.

It is flexible in a way that allows each individual to have their unique editor, tailored to their needs. This results in an increase in productivity and perspective regarding how everything comes together.

## Table of Contents

<!--toc:start-->

- [Plugin Manager](#plugin-manager)
- [Plugin Structure](#plugin-structure)
- [Plugin List](#plugin-list)
- [Searching and Navigation](#searching-and-navigation)
  - [telescope.nvim](#telescopenvim)
  - [harpoon](#harpoon)
- [Text Manipulation](#text-manipulation)
  - [autoclose.nvim](#autoclosenvim)
  - [comments.nvim](#commentsnvim)
  - [todo-comments.nvim](#todo-commentsnvim)
  - [undotree](#undotree)
  - [Keymaps](#keymaps)
- [Syntax Highlighting](#syntax-highlighting)
  - [treesitter.nvim](#treesitternvim)
- [Language Servers](#language-servers)
  - [mason.nvim](#masonnvim)
  - [mason-lspconfig.nvim](#mason-lspconfignvim)
  - [nvim-lspconfig](#nvim-lspconfig)
  - [roslyn.nvim](#roslynnvim)
  - [nvim-cmp, luasnip, cmp-nvim-lsp](#nvim-cmp-luasnip-cmp-nvim-lsp)
- [Formatters](#formatters)
- [Diagnosing and Debugging](#diagnosing-and-debugging)
  - [trouble.nvim](#troublenvim)
  - [nvim-dap](#nvim-dap)
- [Databases](#databases)
- [Gitflow](#gitflow)
  - [lazygit.nvim](#lazygitnvim)
  - [advanced-git-search.nvim](#advanced-git-searchnvim)
  - [gitsigns.nvim](#gitsignsnvim)
- [Network Client](#network-client)
- [Templating](#templating)
- [Misc](#misc)
  - [noice-nvim](#noice-nvim)
  - [rose-pine/neovim](#rose-pineneovim)
  - [vim-be-good](#vim-be-good)
  <!--toc:end-->

## <a id='plugin-manager'></a> Plugin Manager

The plugin manager I use is called [lazy.nvim](https://github.com/folke/lazy.nvim).
This allows me to have a standard place to manage my plugins. For installation, you can check its documentation.

In order to use it, we need to load `lazy.nvim` every time we open Neovim.
The way it's done is through a `lua` file called `init.lua`:

```lua
require("acikgozb/lazy")
```

This lua import redirects Neovim to a file called [lazy.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/lazy.lua).

In here, we have the `lazy.nvim` setup and a couple of other things to mention.
First, we have this:

```lua
require("acikgozb")
```

This import points Neovim to [init.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/init.lua). This is done through Lua's file resolution.
Inside `init.lua`, we have another import, which points to [remap.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/remap.lua) in the same directory:

```lua
require("acikgozb.remap")
```

This file loads the custom mappings I have for Vim specific things, such as the leader key or relative line numbers.
It's important to load the mappings before `lazy.nvim` so that everything works correctly regarding plugin keymaps.

The things after the remaps are standard `lazy.nvim` installation, nothing special there.

The main thing that triggers everything else is this specific line:

```lua
require("acikgozb.plugins")
```

This line instructs Neovim to include **everything** inside `./lua/acikgozb/plugins` directory.
At this point, we are done with installing `lazy.nvim`, and start registering the plugins.

## <a id='plugin-structure'></a> Plugin Structure

Every plugin under `./lua/acikgozb/plugins` directory is written in a very specific way which allows `lazy.nvim` to automatically recognize and register them.

Here is a basic structure of a lua file under `plugins` directory:

```lua
return {
    "<plugin-url>",
    dependencies = {"dep1-url", "dep2-url"},
    config = function()
    end
}
```

Here are the key points:

- The first field specifies the plugin url which `lazy.nvim` pulls from.
- The `dependencies` field specifies the dependencies which the main plugin needs to work properly. Some plugins do not need dependencies, so this field is optional.
- The `config` field is a function which is mostly used to initialize a plugin with custom options. This is the main place where I set up the plugin based on my needs.

There are many more fields and different ways of initializing a plugin. Please refer to `lazy.nvim`'s documentation for details.

With the structure in mind, it's time to talk about which plugins are used.

## <a id='plugin-list'></a> Plugin List

In this section, every single plugin will be explained in detail.
If you want to use my Neovim configuration, please read here first before installing it.

The plugins can be grouped like below:

- Searching and Navigation
- Text Manipulation
- Syntax Highlighting
- Language Servers
- Formatters
- Diagnosing and Debugging
- Databases
- Gitflow
- Network Client
- Templating
- Misc

### <a id='searching-and-navigation'></a> Searching and Navigation

Navigation is key in today's world where we're dealing with many different files due to the fact that it enables maintainable, organized, decoupled code.
Therefore, having a smooth navigation matters a lot more than one would imagine.

In my Neovim configuration, I have 2 main plugins which satisfies my navigation needs:

- `telescope.nvim`
- `harpoon.nvim`

Unlike the most IDE's and other Neovim configurations where the buffer is filled with a navigation tree on the side, and tabs on the above, I choose to only have the text in front of me.
The visual clutter that comes with navigation tree's and buffer tabs affects my focus, therefore I simply refuse to add these to my configuration.

How, then, I navigate through a large project? Enter fuzzy finding and file marking.

#### <a id='telescopenvim'></a> telescope.nvim

`telescope.nvim` is one of the most popular plugins in Neovim world and is recommended by nearly all dedicated users of the editor.
In it's simplest form, it is a fuzzy finder with a previewer which allows users to quickly find what they need.

The fuzzy finder is not limited to searching files only, it can be really extendible to find what you want. You can search for:

- Files,
- Symbols,
- String usages,
- Old buffers you modified,
- Text in your current buffer,
- Git history,
- and many more!

I'm using the basic configuration with custom keymaps. To improve the performance, instead of the default `find` command, I'm using `ripgrep` and `fzf`.

You can see the keymaps and the rest of the configuration inside [telescope.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/telescope.lua).

#### <a id='harpoon'></a> harpoon

Whilst `telescope.nvim` allows us to find pretty much anything we need, it becomes cumbersome to **always** search a file in order to navigate to it.

Most of the time, while working on a feature, there are key files which we constantly switch between.
For this situation, `telescope` hinders the experience instead of improving it.

What if there was a way to _mark_ these files and then later jump directly to them? Enter `harpoon`.

This plugin basically manages a list of files for future usage. You can add any file to the list, and then later on directly jump (harpoon) into them via basic keymaps.

I'm using the basic configuration with custom keymaps. For details, please check [harpoon.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/harpoon.lua).

### <a id='text-manipulation'></a> Text Manipulation

When it comes to the text we're editing, there are some small things which hinders the overall experience if left unsolved.
I'm pretty sure there are tons of plugins I didn't see or didn't add. My idea is to keep things simple and only add if I feel like I need it.

Therefore, in this category I only have 4 small plugins:

- `autoclose.nvim`
- `comments.nvim`
- `todo-comments.nvim`
- `undotree`

Along with these plugins, I also have some keymaps for even better experience.

#### <a id='autoclosenvim'></a> autoclose.nvim

This plugin is used to automatically add closing characters for `', ", (, [, {` characters.

I'm using the default configuration, which is enough for my needs. Keep in mind that due to vim motions, some people prefer to not have this.
For me I got used to it, and I can't break some of my old IDE habits, therefore I decided to keep it as is.

For details, please check [autoclose.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/autoclose.lua).

#### <a id='commentsnvim'></a> comments.nvim

This plugin is used to automatically comment out a line or a block of text, regardless of the language itself.

I'm using the default options, with the keymaps below:

- Normal mode, `<Space>gcc` to comment out an entire line.
- Visual mode, `<Space>gc` to comment out the selection (can be one line or a block).

For details, please check [comment.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/comment.lua).

#### <a id='todo-commentsnvim'></a> todo-comments.nvim

This plugin is used to colorize certain types of comments, such as `TODO`s, `NOTEs`, `WARNs`, `FIX` and more.
In addition to coloring, this plugin synergizes really well with `telescope.nvim`, which allows me to quickly find all the `TODO`s in a project.

I'm using the default settings from the documentation, with only one keymap for now:

- Normal mode, `<Space>tt` to toggle the fuzzy finding of `TODO`s in a project.

Since the plugin is loaded in a lazy way, the coloring won't take effect until `<Space>tt` is used.

For details, please check [comment.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/comment.lua).

#### <a id='undotree'></a> undotree

`undotree` is a plugin I use to have a global history of text changes for a single buffer.
Since I disabled swap files in Vim, I wanted another place to be able to revert stuff if something goes wrong.

The configuration is really basic and can be found under [undotree.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/undotree.lua).

#### <a id='keymaps'></a> Keymaps

Here is a list of keymaps in `remap.lua` which helps me with text manipulation:

- Moving highlighted lines,
- Keeping the paste register same after pasting text,
- Putting yanked text to system register to not lose it after pasting.

### <a id='syntax-highlighting'></a> Syntax Highlighting

As all developers agree, having a good syntax highlighting improves the readability of the code, therefore enhance productivity.

I only have one plugin for syntax highlighting, which is the most used one in Neovim community: `treesitter.nvim`.

#### <a id='treesitternvim'></a> treesitter.nvim

This plugin enables me to have syntax highlighting based on installed language plugins.

The configuration is pretty standard and can be found on it's documentation.
Here is a list of syntax highlighted languages for my own needs:

- Bash
- Golang
- Make
- YAML
- JSON
- Markdown
- Ruby
- C
- C#
- JavaScript
- TypeScript
- HTML
- SQL
- Vimdoc

### <a id='language-servers'></a> Language Servers

Probably the most complex configuration regarding Neovim is setting up the language servers.

In Neovim, there is a little bit setup that needs to be done which enables language servers.
The configuration can be found under [lsp.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/lsp.lua).

Basically, in this sector we have 2 main concepts:

- The actual language server for each supported language,
- The autocomplete engine for each language.

#### <a id='masonnvim'></a> mason.nvim

`mason.nvim` is the main plugin I use to have a standardized way of installing language servers (LSP), formatters, linters, and debug adapters.
The default configuration is used for `mason.nvim`.

Keep in mind that any tool installed with `mason.nvim` will be available for Neovim only.
There are some tools under `dotfiles` repository that are installed also globally, making them available outside Neovim.
These are mainly linters and formatters. Please refer to [dotfiles installation](dotfiles-installation) for more information.

#### <a id='mason-lspconfignvim'></a> mason-lspconfig.nvim

This is another dependency required to enable LSP support in Neovim.
The LSP's I need are listed under `ensure_installed` field in `mason-lspconfig.nvim` setup, and contains:

- Golang
- Bash
- YAML
- Lua
- JavaScript / TypeScript
- HTML
- Docker / Docker-Compose

Keep in mind that you can install additional LSP's via `:Mason` command. Listing an LSP in here does not mean that LSP will be installed automatically.

#### <a id='nvim-lspconfig'></a> nvim-lspconfig

This is the bare bones default Neovim plugin which enables everything that is mentioned above.

The main gist happen within this plugin's setup, which is used to setup all of our LSP's.

The important point here is that we have 2 functions called `onAttach` and `capabilities`:

- `onAttach` function defines the keymaps I use when an LSP attaches to a buffer (usually done through buffer's file type). By using this function for all LSP's, we enable one set of keymaps that can be used in every file.
- `capabilities` function enables autocomplete for a given LSP.

Most of the LSP's I use are setup in a way that only contains `onAttach` and `capabilities`, but some LSP's are configured in detail, such as `yamlls`, `ansiblels`, `tsserver` and `gopls`.

#### <a id='roslynnvim'></a> roslyn.nvim

Unfortunately, the main C# LSP supported by `mason.nvim` is really slow and provides sub-optimal experience in large projects.

Due to this fact, a separate plugin called [roslyn.nvim](https://github.com/jmederosalvarado/roslyn.nvim) is added specifically for C# for better performance, by trading some of the features that comes with default LSP `omnisharp`.

#### <a id='nvim-cmp-luasnip-cmp-nvim-lsp'></a> nvim-cmp, luasnip, cmp-nvim-lsp

These plugins are used to enable autocomplete while modifying a text.

The default configurations are used for each tool to enable autocomplete. Most people prefer to have snippets as well, but I did not find them useful, therefore not added them to autocomplete list.

I would highly recommend reading their documentation to understand how autocomplete is designed.

### <a id='formatters'></a> Formatters

Regarding formatting, Neovim community used to recommend [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim), however the plugin has been archived in 2023.

Now, there are forks of `null-ls`, or different plugins which provides more or less the same experience when it comes to formatting.

My personal choice was to use [conform.nvim](https://github.com/stevearc/conform.nvim) for it's simplicity and extensibility. To see the configuration, you can check [format.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/format.lua).

The main use case for me is to format after save, which `conform.nvim` provides quite easily.

However, as I used the default configuration, especially for YAML formatting, I realized that the default formatter removes the blank lines in YAML files, which I used for grouping things.

Therefore, I needed to customize the `yamlfmt` to make it not remove the blank lines. Fortunately, it's quite easy to do with `conform.nvim`, all it takes is to point the custom `yamlfmt` configuration file which I have as [.yamlfmt.yml](https://github.com/acikgozb/dotfiles/blob/main/yamlfmt/.yamlfmt.yml).

That is the only custom configuration I used for `conform.nvim`, the rest is pretty standard.

### <a id='diagnosing-and-debugging'></a> Diagnosing and Debugging

Having a smooth experience regarding troubleshooting is pretty important especially when the projects get bigger and bigger.

In this section, I have 2 main plugins to tackle this issue:

- `trouble.nvim`
- `nvim-dap`

#### <a id='troublenvim'></a> trouble.nvim

This plugin allows me to see all the potential issues within a project.
You can see the configuration in [trouble.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/trouble.lua), it's pretty basic.

#### <a id='nvim-dap'></a> nvim-dap

Probably one of the best features of modern IDE's is the fact that they have superior debugging capabilities.

Personally, this is the place where I feel like Neovim lacks a little bit. Fortunately, this is not the case for every single language.

The main way the debugging is set up is via a plugin called [nvim-dap](https://github.com/mfussenegger/nvim-dap). You can see the configuration in [debugging.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/debugging.lua).

This plugin allows me to attach a debug protocol to the current buffer. By doing this, I can:

- Put breakpoints anywhere,
- Step into/over/out from one place to another,
- See the runtime variables,
- Toggle REPL to modify runtime variables

I'm using the basic configuration with keymaps set for my taste.

Most of the people who use `nvim-dap` also uses [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) to have a similar experience with modern IDEs.

For me, this visual addon clutters the UI way more than I would like to. That is why I removed the UI plugin shortly after, and added [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text).

The virtual text plugin just allows me to see the runtime variables directly on the buffer, just like how it is done in Jetbrains IDE's.

Also, when it comes to debugging, it kind of works similarly to LSP's. For each language, we need to add their DAP configurations.

I mainly use Golang, TypeScript and C#. So:

- For TypeScript, the things I do are quite easy most of the time, so I haven't needed a debugger for now.
- For C#, there is debugging support only with Omnisharp which is not really performant in big projects. Therefore **there is no debugging support for C# in this configuration for now.**

Fortunately, for Golang there is an excellent debug adapter called [nvim-dap-go](https://github.com/leoluz/nvim-dap-go).

This plugin requires `dlv` to be in `$PATH`. It can be customizable, but for me the default configurations were enough so I did not change much.

With this debug adapter, it allows me to have a smooth experience in debugging Golang projects. In addition to the default keymaps provided by `nvim-dap`, this plugin enables me to debug a test straight from Neovim.

### <a id='databases'></a> Databases

When I first dived in Neovim, I wanted to move everyting to terminal.
The actual IDE part was more or less straightforward, but when the time came for a database client, things started to get a little blurry.

There are not many database plugins to choose from, the first one I saw was called [vim-dadbod](https://github.com/tpope/vim-dadbod) by Tim Pope.

I tried to use this plugin first, however it felt a bit cumbersome to work with. This feeling is probably a skill issue on my end, but after a short while I stopped using it.

Later on, when I started researching again, I stumbled upon another plugin called [nvim-dbee](https://github.com/kndndrj/nvim-dbee).

The UI of this plugin is written with `Lua`, and the backend is written with `Golang`. As a result, it feels a lot faster than `vim-dadbod` and easier to configure.

Here is a comparison between `nvim-dbee` and `vim-dadbod`:

- `nvim-dbee` feels a lot more responsive than `vim-dadbod`,
- `nvim-dbee` has a nice, easy to use UI where as for `vim-dadbod` additional plugins are required to have a UI
- `vim-dadbod` supports more DB clients than `nvim-dbee`,
- `vim-dadbod` escapes special characters in connection strings (mainly passwords), where as `nvim-dbee` fails to connect.

Based on the comparison above, I decided to stick with `nvim-dbee` for now, trading functionality in favor of developer experience.

I must say this part of my configuration is the weakest link of the entire Neovim configuration and needs a lot of work.

Unfortunately, using a DB client such as DataGrip is superior to `nvim-dbee`, for the time being.

I will probably focus on this issue and experiment more on `vim-dadbod` to make the experience a bit better. Until that happens, I'm sticking to `nvim-dbee`.

The configuration for `nvim-dbee` can be found under [database.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/database.lua).

The important thing in here is, I specified the DB connections via an environment variable called `DB_CONNECTIONS`.

This variable is not added to version control, simply because it contains company specific DB connections which should not be version controlled.

If you install this repository, you can define a `env.sh` under `~/.config/zsh/secrets` and set `DB_CONNECTIONS` in there.

### <a id='gitflow'></a> Gitflow

As a developer, having a smooth gitflow is paramount for productivity.
This is one of the main topics I was researching when I first started my Neovim configuration.

For those who know, Git experience in Jetbrains IDE's are pretty much perfect. The 3 way conflict window, the ease of doing regular git operations (pull, push, merge) and case specific stuff (reset, cherry-pick etc.) is simply amazing.

Therefore to simulate more or less the same, I started researching about Git plugins and quickly found `vim-fugitive`.

This is a lightweight wrapper around regular git commands and allows them to be executed via Neovim.

Most people swear by it, but personally, in this topic I prefer to have a simple UI, especially for merge conflicts.

That is why for this topic, I'm using the plugins below:

- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)
- [advanced-git-search](https://github.com/aaronhallaert/advanced-git-search.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

#### <a id='lazygitnvim'></a> lazygit.nvim

This is the main Git client I'm using within Neovim. It's actually a CLI tool called `lazygit`, and the plugin just enables it in a floating window on top of the current buffer.

Compared to `vim-fugitive`, `lazygit.nvim` provides everything I need:

- A visual guidance about Git operations,
- Simple keymaps and easy to find the documentation if I can't remember them,
- Provides a smooth experience for merge conflicts,

And a lot more which I do not use for now.

I have to say, if you are a guy who mainly uses the terminal for Git, then `vim-fugitive` will be the superior plugin for you.

I usually prefer CLI tools but somehow for Git I keep using GUI's, that is why I went with `lazygit.nvim`. The configuration can be found under [lazygit.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/lazygit.lua).

However, there are a couple more plugins which I use to have a complete experience.

#### <a id='advanced-git-searchnvim'></a> advanced-git-search.nvim

The one thing I keep using, especially when I work with a legacy project is the Git history.

Before changing anything, I prefer to first understand why the code was written in that way.
It can also be said for situations where the code itself makes no sense, only to find out that it was written like that due to a technical debt in somewhere else.

The history can be checked through `lazygit`, but I like to do it in a reverse way.

Instead of searching for files and then search through the commits that affects the text, I prefer to highlight the text I'm working on, and then find the commits associated with it.

Therefore, I needed another plugin for Git history, and then encountered with [advanced-git-search.nvim](https://github.com/aaronhallaert/advanced-git-search.nvim).

This plugin is specifically focused on Git history, the thing that makes it better is how it is integrated with `telescope.nvim` and `fzf`.

Since for navigation and general searching I use fuzzy finding, it made perfect sense to use fuzzy finding for searching Git commits as well.

There are several commands that it provides, but the one I needed was `DiffCommitLine` command. Therefore the configuration is the default one, only that I added a custom user command to check the diff for visual selection.

The configuration can be found under [gitsearch.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/gitsearch.lua).

#### <a id='gitsignsnvim'></a> gitsigns.nvim

This is the final plugin I use for my Gitflow, and this one is targeted to another problem I encountered as I used `lazygit.nvim` and `advanced-git-search.nvim`.

When I edit a code, sometimes I like to see the diff between the current change and the previous version.

This can be done through `lazygit` as well, however to do so I have to find the file I changed, and search through the changes to find the diff.

For simple files that approach is ok, but for larger files with multiple changes inside them, it becomes cumbersome to search through `lazygit`.

At the end, I just wanted to highlight the text, and see the difference.

With a little researching, I stumbled upon [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim), which perfectly does what I needed.

This plugin adds "signs" next to the line numbers so that a developer can understand whether that text is added, changed, or deleted.

And with a simple keymap, the changes that's done on the "hunk" can be previewed in a floating window.

Even better, if desired, the changes can be reverted with a simple keymap!

Actually, `gitsigns.nvim` can do a lot more (it can toggle git blame as well!), but I cover the other features via `lazygit` and `advanced-git-search`, so the configuration for `gitsigns.nvim` is actually pretty simple.

The configuration can be found under [gitsigns.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/gitsigns.lua).

### <a id='network-client'></a> Network Client

This topic is one of the niche ones I have in my Neovim configuration.

It is important to have a reliable network client while working in tech. Throughout my career I had always leaned into using a well known client called Postman.

However, in time I realized that I actually use very little of it. As long as I can send a request with custom body and headers, I'm good to go.

I do not use Postman collections, or it's environment variables, or any other advanced features simply because I am just fine without them.

Adding this to the fact that I prefer to not break the flow while working in terminal (switching to Postman and using mouse etc.), I decided to move this topic in Neovim and started researching.

That is when I found a plugin called [vim-rest-console](https://github.com/diepm/vim-rest-console).

This plugin does what I just need, it attaches to a buffer as long as it's filetype is `rest`.

From there, all it takes is to define the host, the headers, and the optional body and you are good to go.
It executes the request and shows the result on a side pane, and if needed the output can be copied around.

So for me, the advantages:

- I did not want to use Postman collections simply because it is a vendor lock in feature. I did not want to depend on it in every project.
- I started creating `rest` files associated with the things I do.
  With these files, I can group the requests, use environment variables for easier maintenance, and basically automate the whole process.

Basically, with this plugin I can simulate the features I use in Postman, with the ability to enhance them by having a perfect integration with Linux tools.

The configuration for vim rest console can be found under [rest.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/rest.lua). Since the plugin is written with Vimscript, the configuration is a bit different than Lua plugins and mainly consists of setting global variables.

### <a id='templating'></a> Templating

One of the most beautiful things regarding Neovim is that it is not a standalone tool like any other IDE.

By being tightly integrated into the terminal, it enables us to use the full power of Linux under the hood. This is what makes this editor far more flexible than any other.

As I kept using Neovim, I started to realize this fact and began searching the ways I could improve my local development environment even more.

This fact had let me to a new topic called templating.

Templating in its most basic form is to have a schema for anything that can be used later on, which results in less repetition.
For me, as I have been studying infrastructure for the past 6 months, I've found out that:

- There is little to earn when it comes to memorizing fields in configuration files. Instead of memorizing, learning the "why"'s and "how"'s for a specific tool are more important to me.
- Most of the configurations regarding the tools I use for infrastructure are more or less the same, with minor changes.
- The README's I write can be grouped under certain categories.

Thats when I got the idea of creating little templates and using them while editing text in Neovim.

With this idea, a new personal project was born - [tempgen.nvim](https://github.com/acikgozb/tempgen.nvim).
The motivation can be read from it's documentation.

By using this plugin, I have a central place for my templates which I can reference from every single buffer.
The only requirement is to have the same filetypes so it's not possible to use a README template for a Github Actions workflow.

The configuration is pretty simple and can be found under [templates.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/templates.lua).

### <a id='misc'></a> Misc

The final plugin group I have is misc, things that are "nice to have" and more about the actual visuals.
This part is probably the most personal one in the entire list.

Here are the plugins I use for this category:

- [noice.nvim](https://github.com/folke/noice.nvim)
- [rose-pine/neovim](https://github.com/rose-pine/neovim)
- [vim-be-good](https://github.com/ThePrimeagen/vim-be-good)

#### <a id='noicenvim'></a> noice-nvim

This plugin is a UI plugin which allows us to have different UI elements when it comes to messages, notifications, searching and command pallette.

I tried to use the default configurations but later on found out that I dislike having floating messages and notifications.

So I only use the floating command line from this plugin, which puts the command line in the top-middle of the current buffer.

The configuration can be found under [noice.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/noice.lua).

#### <a id='rose-pineneovim'></a> rose-pine/neovim

This is the main Neovim theme I use, and the colorscheme is also applied to my `tmux` configuration.
Most people swear by `catppuccin`, but I dislike the vibrant pastel colors.

There is no right or wrong when it comes to themes. It's just my personal preference. You can check the configuration under [theme.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/theme.lua).

#### <a id='vim-be-good'></a> vim-be-good

This plugin is from one of my favourite content creator called ThePrimeagen.

This is the main plugin I used back when I was learning Vim motions.
I did not remove this for nostalgic reasons, so feel free to play around it if you wish to install my Neovim configuration.

The configuration is the most simplest one in my entire Neovim setup and can be found under [vimbegood.lua](https://github.com/acikgozb/dotfiles/blob/main/nvim/lua/acikgozb/plugins/vimbegood.lua).
