$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location -Path $scriptPath

function TestarCommandPrecedence {
    Write-Output "Testando o CommandPrecedence:"
    Write-Output ""

    Set-Location -Path "../Aula1"

    Write-Output "Tentando executar o scrpt batch da aula passada sem o ""CommandPrecedence""..."
    try {
        reiniciarServicoByteBankSrv01.bat
    }
    catch {
        Write-Error $_
    }

    Write-Output "Tentando executar o script bash da aula passada com o ""CommandPrecedence""..."
    try {
        ./reiniciarServicoByteBankSrv01.bat
    }
    catch {
        Write-Error $_
    }

    Write-Output "Tentando executar o ping por meio de: ""ping google.com"""
    try {
        ping google.com -n 10
    }
    catch {
        $_
    }

    Set-Location -Path (Split-Path -Path $scriptPath)

    Write-Output "----------------------------------------------------------------------------------------------------------------------"
}

function TestarFuncaoGetType {

    Write-Output "Testando a função Get-Type"
    Write-Output ""

    Write-Output "$($env:Path.GetType())"
    Write-Output ""

    Write-Output "----------------------------------------------------------------------------------------------------------------------"
}

function MostrarVariavelPath {

    Write-Output "Mostrando a variável de ambiente Path"
    Write-Output ""

    Write-Output "Mostrando a variável de ambiente Path no Prompt de Comando:"
    Write-Output ""
    try {
        cmd /C "echo %PATH%"
    }
    catch {
        Write-Error $_
    }
    Write-Output ""

    Write-Output "Mostrando a variável de ambiente no PowerShell:"
    Write-Output ""
    Write-Output $env:Path
    Write-Output ""

    Write-Output "Mostrando a variável de ambiente no PowerShell com quebra de linha:"
    Write-Output ""
    $variavelAmbientePath = $env:Path.Split(";")
    foreach ($caminho in $variavelAmbientePath) {
        Write-Output $caminho
    }
    Write-Output ""

    Write-Output "----------------------------------------------------------------------------------------------------------------------"
}

function TestarFuncaoGetMember {
    
    Write-Output "Testando a função Get-Member"
    Write-Output ""

    $membros = Get-Member -InputObject $env:Path

    foreach ($membro in $membros) {
        Write-Output $membro
    }
    Write-Output ""

    Write-Output "----------------------------------------------------------------------------------------------------------------------"
}

function  Main {
    TestarCommandPrecedence
    TestarFuncaoGetType
    MostrarVariavelPath 
    TestarFuncaoGetMember  
}

Main