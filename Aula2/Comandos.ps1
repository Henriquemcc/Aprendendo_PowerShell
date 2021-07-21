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

function TestarFuncaoGetAlias {
    
    Write-Output "Testando a função Get-Alias"
    Write-Output ""

    Write-Output "Mostrando todos os alias:"
    $todosAlias = Get-Alias
    foreach ($alias in $todosAlias) {
        Write-Output $alias.DisplayName
        Write-Output ""
    }
    Write-Output ""

    Write-Output "Mostrando os alias que mais utilizo:"
    Write-Output ""
    Write-Output (Get-Alias -Name "ls").DisplayName
    Write-Output ""
    Write-Output (Get-Alias -Name "dir").DisplayName
    Write-Output ""
    Write-Output (Get-Alias -Name "cd").DisplayName
    Write-Output ""
    Write-Output (Get-Alias -Name "rm").DisplayName
    Write-Output ""
    Write-Output (Get-Alias -Name "clear").DisplayName
    Write-Output ""
    Write-Output (Get-Alias -Name "cp").DisplayName
    Write-Output ""
    Write-Output (Get-Alias -Name "mv").DisplayName
    Write-Output ""

    Write-Output "----------------------------------------------------------------------------------------------------------------------"
    
}

function  Main {
    TestarCommandPrecedence
    TestarFuncaoGetType
    MostrarVariavelPath 
    TestarFuncaoGetMember 
    TestarFuncaoGetAlias 
}

Main