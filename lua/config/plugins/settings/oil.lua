return {
  default_file_explorer = true,
  watch_for_changes = true,
  view_options = { show_hidden = true },
  skip_confirm_for_simple_edits = true,
  columns = {
    "icon",
    "size",
  },
  float = {
    padding = 2,
    max_width = 90,
    max_height = 30,
  },
  git = {
    add = function(path)
      return true
    end,
    rm = function(path)
      return true
    end,
    mv = function(src_path, dest_path)
      return true
    end,
  },
}
