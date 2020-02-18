function default()
    local b
    if ffi.os == 'Linux' then
        b = _G.builder()
        b.compiler = 'clang-8'
        local prefix = '/usr/GNUstep/Local/Library'
        b.include_dirs = {
            prefix..'/Headers',
        }
        b.library_dirs = {
            prefix..'/Libraries',
        }
        b.libraries = {
            'objc',
            'gnustep-base',
            'gnustep-gui',
            'dispatch',
        }
        b.sflags = b.sflags..' '..os.capture('gnustep-config --objc-flags')
    elseif ffi.os == 'OSX' then
        b = _G.builder('apple')
        b.sdk = 'macosx'
        b.compiler = 'clang'
        b.frameworks = {
            'Cocoa',
        }
        b.library_dirs = {
            '/usr/local/lib',
        }
    else
        error('unsupported os'..ffi.os)
    end
    b.libraries = b.libraries or {}
    table.insert(b.libraries, 'luajit')

    if os.getenv('LDVERBOSE') then
        b.ldflags = b.ldflags..' -Wl,--verbose'
    end

    b.output = fs.mkdir('Yo.app')..'/Yo'
    b.src = 'main.m'
    b.build_dir = '.aite_build'
    b:link(b:compile())

    -- write Info.plist
    local f = io.open('Yo.app/Info.plist', 'w')
    f:write[[
    {
        NSExecutable = "Yo";
        NSPrincipalClass = "NSApplication";
    }
    ]]
    f:close()
end

function clean()
    os.pexecute('rm -rf .aite_build Yo.app')
end
