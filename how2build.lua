local function builder()
    local b = _G.builder()
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
    }
    b.sflags = b.sflags..' '..os.capture('gnustep-config --objc-flags')
    b.build_dir = '.aite_build'
    return b
end

function default()
    local b = builder()
    b.src = 'main.m'
    b.output = 'a.out'
    b:link(b:compile())
end

function clean()
    os.pexecute('rm -rf .aite_build a.out')
end
