pushd "%~dp0"

rm -rf _build && mkdir -p _build
set "DESTDIR=%CD%\_install"

meson setup _build || goto :exit_script
meson compile -C _build || goto :exit_script
meson install -C _build || goto :exit_script

:exit_script
popd
exit /b %ERRORLEVEL%
