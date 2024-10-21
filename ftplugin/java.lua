local config = {
	cmd = { '/opt/homebrew/bin/jdtls' },
	root_dir = vim.fs.dirname(vim.fs.find({'gradle', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
