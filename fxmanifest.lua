fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

name 'bradley-garages'
author 'https://velleb.com'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua',
}

client_scripts {
    'client/main.lua'
}

server_scripts {
     'server/main.lua',
     '@oxmysql/lib/MySQL.lua'
}