@ECHO OFF
echo Buscando o servico "ByteBank Interface Service" no servidor SRV01
sc \\SRV01 query "ByteBank Interface Service" | find /i "state" | find /i "running"

echo Verificando se o servico "ByteBank Interface Service" esta sendo executado
IF %ERRORLEVEL% NEQ 0 (
    echo O servico "ByteBank Interface Service" nao esta sendo executado no servidor
) ELSE (
    echo Parando o servico "ByteBank Interface Service"...
    sc \\SRV01 stop "ByteBank Interface Service" > NUL

    echo Iniciando o servico "ByteBank Interface Service"...
    sc \\SRV01 start "ByteBank Interface Service" > NUL

    echo O Servico "ByteBank Interface Service" foi reiniciado com sucesso!
)