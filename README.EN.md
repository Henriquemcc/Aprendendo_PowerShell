[Versão em Português](README.md)

# Learning how to use PowerShell

This repository contains the files developed during the PowerShell course held on
the [Alura Cursos Online](https://alura.com.br) platform.

## Alura's Official Repository

The official files for the course, developed by the instructor, are available in the GitHub repository of this Alura
course:

[PowerShell parte 1: Começando com a linguagem de scripting moderna](https://github.com/alura-cursos/powershell).

## Courses

The courses in which these files were developed:

[PowerShell parte 1: Começando com a linguagem de scripting moderna](https://cursos.alura.com.br/course/powershell-parte1)
.

## PowerShell + Jupyter Notebook

Some files developed during the classes were moved to Jupyter Notebooks with PowerShell Kernel. To use Jupyter Notebooks
with PowerShell Kernel, follow those steps:

### 1 - Check if Python3 is installed on your machine:

Open a new Windows PowerShell's window and type the following command:

```
python3 --version
```

If Python 3 is installed, it's version will be printed.

Example:

```
Python 3.9.6
```

If Python 3 is not installed:

On Windows 10 you can download Python from [Microsoft Store](https://www.microsoft.com/store/productId/9P7QFQMJRFP7).

In any other versions or if you prefer, you can download from [Python website](https://www.python.org/downloads/).

### 2 - Install Jupyter Notebooks

In a new Windows PowerShell's window, type the following command:

```
pip install jupyterlab
```

### 3 - Install PowerShell Kernel

In a new Windows PowerShell's window type the following commands:

```
pip install powershell_kernel
```

```
python -m powershell_kernel.install
```

### 4 - Running PowerShell Kernel on Jupyter Notebooks

Open a Windows PowerShell's windows on the folder where you want to run Jupyter Notebooks and type the following
command:

```
jupyter notebook
```

Now your default web browser will be opened running Jupyter.