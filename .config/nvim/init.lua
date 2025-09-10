

require('set')
require('remap')
require('config.lazy')

-- NOT to be commited to any Repo
require('local')

vim.filetype.add({
    extension = {
        http = 'http',
    },
    filetype = {
        ['.http'] = 'http',
    }
})
