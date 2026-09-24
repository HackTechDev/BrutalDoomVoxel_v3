@echo off

for /f %%d in ('powershell -NoProfile -Command "Get-Date -Format ddMM"') do set BUILD_DATE=%%d
set PK3_NAME=BrutalDoomVoxel_%BUILD_DATE%_v3.pk3

7z a -r -x!.git\ -ssw -tzip -mx9 %PK3_NAME% "*"

if exist %PK3_NAME% (
	copy %PK3_NAME% %userprofile%\Desktop\%PK3_NAME%
	del %PK3_NAME%
)
