# C/C++
- Mark preprocessor if regions as greyed out if false.
  This way it is easier to see if a section of code is compiled or not.
- Swap between header and source file

# LSP
- Remove duplicate entries from LSP (e.g. from LSP and TS)
- Sort suggestions beter (e.g. LSP first)
- Fix hover window still showing after switching files without moving cursor first
- Undo on rename does not undo everything (only 1 rename)
- More entries appear when typing the name of a member (e.g. after a `.` the list of members appears, but if typing 1 more character, then more other suggestions appear)

# Refactor
- Probably be a good idea to refactor map_telescope to a new function/file which is not "really"
  dependent on Telescope/nvim-mapper. We could check if we have these requirements and
  then use them, or if we do not just use the default nvim remapping functions.
  This way we can define mappings anywhere we want, yet still have them show up in :Telescope mapper

# Search
List of search results

# Folding
Disable folding all for input files that are shorter than the buffer.

# Dashboard
Remove rendering of nezuko when new file is opened

# Updates
- vim.lsp.diagnostic.show_line_diagnostics is deprecated, use vim.diagnostic.open_float instead.
    - Mapped to <LEADER>dd

# Fixes
- Fix which-key getting loaded automatically instead of having to manually call `which-key.load()` in `init.lua`
    - Might have something to do with packer and lazy loading
- PossessionSave gets an error when a terminal is open in a buffer

# UI
- Extend airline bar to include more of the path of the file instead of just the file name.


# Rewrite of lazy
- Add keybind for `:Trouble`


- 30/10/2023 Add menu popup via telescope or something for quick actions with LSP (example, rust might generate 100 quick actions to generate trait impl's)
- 04/12/2023 Rustfmt very slow sometimes, takes upwards of couple of seconds
