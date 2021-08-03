[English Version](README.EN.md)

# Aprendendo a utilizar o PowerShell

Este repositório contém os arquivos desenvolvidos durante o curso online de PowerShell realizado na
plataforma [Alura Cursos Online](https://alura.com.br).

## Repositório Oficial da Alura

Os arquivos oficiais do curso, desenvolvidos pelo instrutor, estão disponíveis no repositório do Github deste curso da
Alura:

[PowerShell parte 1: Começando com a linguagem de scripting moderna](https://github.com/alura-cursos/powershell).

## Cursos

Os cursos em que estes arquivos foram desenvolvidos:

[PowerShell parte 1: Começando com a linguagem de scripting moderna](https://cursos.alura.com.br/course/powershell-parte1)
.

## PowerShell + Jupyter Notebook

Alguns arquivos desenvolvidos nas aulas foram migrados para o Jupyter Notebooks com o Kernel do PowerShell. Para
utilizar o Jupyter Notebooks com o Kernel do PowerShell, realize os seguintes passos

### 1 - Verifique se o Python 3 está instalado em sua máquina:

Abra uma nova janela do Windows PowerShell e digite o seguinte comando:

```
python3 --version
```

Caso o Python 3 esteja instalado, será impresso a sua versão.

Exemplo:

```
Python 3.9.6
```

Caso o Python 3 não esteja instalado, caso esteja utilizando o Windows 10, a Microsoft Store será aberta na página do
Python, bastando clicar em 'obter' para que o Python seja instalado na sua máquina.

Caso não esteja utilizando o Windows 10 ou não aparecer a página do Python na Microsoft Store, baixe o Python através do
site: [https://www.python.org/downloads/](https://www.python.org/downloads/).

### 2 - Instale o Jupyter Notebooks

Em uma nova janela do Windows PowerShell, digite o seguinte comando:

```
pip install jupyterlab
```

### 3 - Instale o Kernel do PowerShell

Em uma nova janela do Windows PowerShell, digite os seguintes comandos:

```
pip install powershell_kernel
```

```
python -m powershell_kernel.install
```

### 4 - Executando o Jupyter Notebooks com o Kernel do PowerShell

Abra uma janela do Windows PowerShell na pasta que deseja executar o Jupyter Notebook e digite o seguinte comando:

```
jupyter notebook
```

Agora será aberto o seu navegador padrão, e nele será rodado o Jupyter.