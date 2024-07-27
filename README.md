**About**
This vim configuration has all the essential features required for code editing,Syntax highlighting, suggestions for different languages, file-explorer(using mouse actions and keyboard both),  auto-completion for languages like c/c++, js, ts, go/golang, python, html, java etc.

**Setup**
To use this configuation install the following dependencies.
1. Nodejs(required for code suggestions and code-completion)
```bash
    # nvm installation
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    source ~/.bashrc
    nvm list-remote # to see the list of all the node version, choose the LTS version, currently it is 20
    nvm install 20 # install the current LTS version #20
    #check the node and npm versions
    node --version # node version
    npm --version
```
2. vim-plug installation (Source : https://github.com/junegunn/vim-plug)
    This configuration uses `vim-plug` as the plugin manager, and without its installation this configuration won't be as comprehensive as suggested and one might run into errors.
    Install the configuration for vim-plug, make sure you have curl and git installed.
    ```bash
        # For Linux and Macos
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```
3. File path resolution
    Follow the following path resolution instruction as to move the vim config file to correct location.
    ```bash
        # make sure you are in the vim-config directory
        # move the content of vim-config file to correct location
        cp .vimrc ~/.vimrc

        # open the vim-config file in vim(vim only)
        vim ~/.vimrc
    ```
    Once inside the vim with `.vimrc` file open, run `:PlugInstall` in the command mode, this would install all the plugins/dependencies required in this vim-config. Once done with installation, exit the vim using `:wqa`, if this does give any errors, do exit by using `qa`
4. Install the language servers(additional installation for each language suggestion)
    This is required for auto-completion and suggestions, also to see the definitions of any term like vscode, to go to the definition of a particular term.
    ```bash
    # open the vim-config file in vim(vim only)
    vim ~/.vimrc

    # run the following instruction in command mode
    :CocInstall coc-tsserver coc-pyright coc-go coc-clangd coc-html coc-css coc-json coc-vimlsp coc-emmet coc-sql coc-sh coc-yaml coc-docker coc-eslint coc-prettier coc-java
    ```
After all the instructions and installations are followed/done, exit the vim and open any project, you should see the configurations working.
