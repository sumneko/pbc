local lm = require 'luamake'
local platform = require "bee.platform"

lm.arch = 'x64'

lm:import '3rd/bee.lua/make.lua'

lm:shared_library 'protobuf' {
    deps = {
        platform.OS == "Windows" and "lua54" or "lua",
    },
    sources = {
        'binding/lua53/pbc-lua53.c',
        'src/*.c',
    },
    includes = {
        'src',
        '.'
    },
    ldflags = {
        platform.OS == "Windows" and "/EXPORT:luaopen_protobuf_c",
    },
    flags = {
        '/TP',
        '/wd"4146"',
        '/wd"4273"',
        '/wd"4244"',
        '/wd"4018"',
        '/wd"4267"',
    },
    defines = {
        'NDEBUG',
        '_UNICODE',
        'UNICODE',
    },
    visibility = 'default',
}

lm:default {
    'protobuf',
}
