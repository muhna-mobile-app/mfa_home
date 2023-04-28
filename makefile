install-hooks:
    @git config core.hooksPath tools/hooks

uninstall-hooks:
    @git config --unset core.hooksPath

test-hooks:
    @dart test tools/hooks/test
