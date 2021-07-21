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

    Get-Member -InputObject $env:Path
    Write-Output ""

    Write-Output "----------------------------------------------------------------------------------------------------------------------"
}

function TestarFuncaoGetAlias {
    
    Write-Output "Testando a função Get-Alias"
    Write-Output ""

    Write-Output "Mostrando todos os alias:"
    Write-Output ""
    Get-Alias
    Write-Output ""

    Write-Output "Mostrando os alias que mais utilizo:"
    Get-Alias -Name "ls"
    Get-Alias -Name "dir"
    Get-Alias -Name "cd"
    Get-Alias -Name "rm"
    Get-Alias -Name "clear"
    Get-Alias -Name "cp"
    Get-Alias -Name "mv"

    Write-Output "----------------------------------------------------------------------------------------------------------------------"
    
}

function TestarFuncaoGetCommand {
    Write-Output "Testando a função Get-Command"
    Write-Output ""

    Write-Output "Get-Command com parâmetro -Verb ""*rename*"""
    Get-Command -Verb "*rename*"
    Write-Output ""

    Write-Output "----------------------------------------------------------------------------------------------------------------------"
}

function TestarFuncaoGetHelp {
    Write-Output "Testando a função Get-Help"
    Write-Output ""

    Write-Output "Get-Help com parâmetro -Name ""Rename-Item"""
    Get-Help -Name "Rename-Item"
    Write-Output ""

    Write-Output "----------------------------------------------------------------------------------------------------------------------"
}

function TestarParametroWhatIf {
    Write-Output "Testando o parâmetro -WhatIf"
    Write-Output ""

    Write-Output "Rename-Item com o parâmetro -WhatIf"
    Rename-Item -Path "a.bat" -NewName "a_migrando_Henrique.bat" -WhatIf
    Write-Output ""

    Write-Output "----------------------------------------------------------------------------------------------------------------------"
}

function TestarFuncaoUpdateHelp {
    
    Write-Output "Testando a função Update-Help"
    Write-Output ""

    Update-Help
    Write-Output ""

    Write-Output "----------------------------------------------------------------------------------------------------------------------"
}

function  Main {
    TestarCommandPrecedence
    TestarFuncaoGetType
    MostrarVariavelPath 
    TestarFuncaoGetMember 
    TestarFuncaoGetAlias
    TestarFuncaoGetCommand
    TestarFuncaoGetHelp
    TestarParametroWhatIf
    TestarFuncaoUpdateHelp
}

Main