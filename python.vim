let b:ale_fixers = {'python': ['isort', 'autopep8', 'yapf', 'autoimport'],'*': ['remove_traling_lines', 'trim_witespace']}
let b:ale_linters = {'python': ['flake8', 'mypy']}
let b:ale_python_mypy_auto_pipenv = 1
let b:ale_fix_on_save = 1
