require("gitlab").setup()
local gitlab = require("gitlab")
local set_keymaps = require("util").set_keymaps
set_keymaps({
  b = { gitlab.choose_merge_request, "Choose merge request" },
  r = { gitlab.review, "Review" },
  s = { gitlab.summary, "Summary" },
  A = { gitlab.approve, "Approve" },
  R = { gitlab.revoke, "Revoke" },
  -- c = { gitlab.create_comment, "create comment" },
  c = { gitlab.create_multiline_comment, "Create multiline comment" },
  C = { gitlab.create_comment_suggestion, "Create comment suggestion" },
  O = { gitlab.create_mr, "Create mr" },
  m = { gitlab.move_to_discussion_tree_from_diagnostic, "Move to discussion tree from diagnostic" },
  n = { gitlab.create_note, "Create note" },
  d = { gitlab.toggle_discussions, "Toggle discussions" },
  aa = { gitlab.add_assignee, "Add assignee" },
  ad = { gitlab.delete_assignee, "Delete assignee" },
  la = { gitlab.add_label, "Add label" },
  ld = { gitlab.delete_label, "Delete label" },
  ra = { gitlab.add_reviewer, "Add reviewer" },
  rd = { gitlab.delete_reviewer, "Delete reviewer" },
  p = { gitlab.pipeline, "Pipeline" },
  o = { gitlab.open_in_browser, "Open in browser" },
  M = { gitlab.merge, "Merge" },
  u = { gitlab.copy_mr_url, "Copy MR URL" },
  P = { gitlab.publish_all_drafts, "Publish all drafts" },
  D = { gitlab.toggle_draft_mode, "Toggle draft mode" },
}, { prefix = "<leader>gl", mode = { "n" }, group_name = "Gitlab" })
