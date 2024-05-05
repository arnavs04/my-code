# Different Ways Of Creating Python Environment for Projects- Conda, Virtualenv, Python

## 1. With Python
Using Python's built-in venv module is a straightforward way to create a virtual environment for your projects. Here's a breakdown of the steps:
1. Creating the Virtual Environment:
```bash
python -m venv myenv
```
This command creates a new virtual environment named myenv in the current directory. The -m venv part invokes Python's venv module to handle the virtual environment creation.

2. Activating the Virtual Environment:
```bash
myenv\Scripts\activate
```
After the virtual environment is created, you need to activate it. This command sets up your terminal session to use the Python interpreter and packages installed within the virtual environment.

3. Installing Dependencies:
```bash
pip install -r requirements.txt
```
Once the virtual environment is activated, you can use pip to install dependencies listed in the requirements.txt file. This ensures that your project's dependencies are isolated within the virtual environment.

>This approach is convenient because it uses Python's built-in capabilities, making it easy to set up and manage virtual environments without the need for additional tools. However, it's worth noting that using venv directly doesn't provide the same level of environment management features as tools like Conda or Virtualenvwrapper.


## 2. With Virtualenv

Make sure you have installed it using
```bash
pip install virtualenv
```
1. Creating the Virtual Environment:
```bash
virtualenv -p python3 virtual_env
```
This command creates a new virtual environment named virtual_env in the current directory.

2. Activating the Virtual Environment:
```bash
virtual_env\Scripts\activate
```
After the virtual environment is created, you need to activate it. This command sets up your terminal session to use the Python interpreter and packages installed within the virtual environment.

In case you need to deactivate:
```bash
deactivate
```

3. Installing Dependencies:
```bash
pip install -r requirements.txt
```
Once the virtual environment is activated, you can use pip to install dependencies listed in the requirements.txt file. This ensures that your project's dependencies are isolated within the virtual environment.

## 2. With Conda

1. Open a Terminal (Command Prompt for Windows)

Open your terminal or command prompt. You can usually find it in your operating system's applications or use the search feature.

2. Install Conda (If not installed)

If you don't have Conda installed, you can download and install it from the [official Conda website](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html).

3. Create a New Environment

```bash
# Replace 'myenv' with your desired environment name and 'python=3.8' with your desired Python version
conda create --name myenv python=3.8
```
4. Activate the Environment

```bash
conda activate myenv
```
5. Installing the Packages

```bash
conda install --file requirements.txt
```
6. Deactivate the Environment

```bash
conda deactivate
```