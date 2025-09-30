@echo off
color a
echo ================================
echo   Subiendo archivos a GitHub
echo ================================
echo.

REM Verificar si existe la carpeta .git
if not exist ".git" (
    echo No se encontro un repositorio Git inicializado.
    echo.
    set /p inicializar="Deseas inicializar un nuevo repositorio? (s/n): "
    
    if /i "%inicializar%"=="s" (
        echo.
        echo Inicializando repositorio Git...
        git init
        
        echo.
        set /p repo_url="Ingresa la URL del repositorio remoto: "
        git remote add origin %repo_url%
        
        echo.
        echo Repositorio inicializado correctamente!
        echo.
    ) else (
        echo.
        echo Operacion cancelada.
        pause
        exit /b
    )
)

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