return {
    settings = {
        cmd = {
             "verible-verilog-ls"
        },
        root_dir = function() return vim.loop.cwd() end
    },
}
