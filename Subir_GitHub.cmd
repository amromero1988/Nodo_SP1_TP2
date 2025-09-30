@echo off

color a

echo ================================
echo   Subiendo archivos a GitHub
echo ================================
echo.

git add .

echo.
set /p mensaje="Escribe tu mensaje de commit: "

git commit -m "%mensaje%"

echo.
echo Subiendo cambios a GitHub...
git push origin main

echo.
if %errorlevel% equ 0 (
    echo ================================
    echo   Subida exitosa!
    echo ================================
) else (
    echo ================================
    echo   Hubo un error al subir
    echo ================================
)

echo.
pause