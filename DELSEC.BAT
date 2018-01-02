@echo off
::Este es el inicio del programa
::si el primer parametro es igual a "/?" este llevara a la ayuda
::si el primer parametro es un archivo llevara al menu
::si no hay ningun parametro saldra automaticamente
:inicio
if "%1" == "/?" goto ayuda
if "%1" == "*.*" goto copia
if "%1" == "" goto fin

:copia
::corta los archivos en la carpeta recolector que se le han dicho, como en la papelera de windows una vez acaba vuelve al inicio
mkdir c:\users\%username%\desktop\recolector\
move %1 c:\users\%username%\desktop\recolector\%1
shift
goto elegir

:elegir
:: menu en el que se marcan las dos opciones
echo     ____  ________   _____ ____________
echo    / __ \/ ____/ /  / ___// ____/ ____/
echo   / / / / __/ / /   \__ \/ __/ / /     
echo  / /_/ / /___/ /______/ / /___/ /___   
echo /_____/_____/_____/____/_____/\____/   
echo                                    
echo Menu principal
echo 1 borrar los archivos
echo 2 lista los archivos
echo espere 10 segundos para hacer un listado de la carpeta recolector
choice /m "seleccione una opcion" /c:12 /t 10 /d 2
if errorlevel 2 goto listar 
if errorlevel 1 goto borra 


:ayuda
:: muestra un echo con la ayuda
echo este programa hace la misma funcion que la papelera de windows
goto fin

:borra
:: aqui se borran los archivos
cd "c:\users\%username%\desktop\recolector\"
del /f /q *.*
goto fin
cd..

:listar
:: lista los archivos
cd "c:\users\%username%\desktop\recolector\"
dir
goto fin
cd..

:fin
:: manda al usuario al escritorio
cd "c:\users\%username%\desktop\"
