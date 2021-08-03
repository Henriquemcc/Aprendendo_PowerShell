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

Caso o Python 3 não esteja instalado:

No Windows 10 você pode baixar o Python através
da [Microsoft Store](https://www.microsoft.com/store/productId/9P7QFQMJRFP7).

Nas outras versões ou se preferir, você pode baixar através do [site do Python](https://www.python.org/downloads/).

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