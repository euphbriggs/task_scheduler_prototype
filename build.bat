@ECHO OFF

ECHO Cleaning previous build assets
cargo clean --release -p task_scheduler_prototype

ECHO Building project
cargo build --release

IF ERRORLEVEL 1 (
    ECHO Build process failed: %ERRORLEVEL%
    EXIT /B
)

ECHO Copying XML File to target dir
COPY "CMD Prompt.xml" target\release\

ECHO.
ECHO [32mTo test:[0m
ECHO    - cd target\release
ECHO    - From an elevated terminal run:
ECHO        - task_scheduler_prototype.exe install
ECHO    - After the task has been installed, from an unelevated terminal run:
ECHO        - task_scheduler_prototype.exe
ECHO        - Expected: An elevated command prompt should appear without a UAC prompt