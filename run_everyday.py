from shutil import copy

git = 'D:\\GIT\\dotfiles\\git'
git_bash = 'D:\\GIT\\dotfiles\\git-bash'
starship = 'D:\\GIT\\dotfiles\\starship'
terminal = 'D:\\GIT\\dotfiles\\terminal'
vscode = 'D:\\GIT\\dotfiles\\vscode'
zsh = 'D:\\GIT\\dotfiles\\zsh'

copy('C:\\Users\\ankit\\.gitconfig',git)
#copy('C:\\Users\\ankit\\.bash_history',git_bash)
copy('C:\\Users\\ankit\\.bash_profile',git_bash)
copy('C:\\Users\\ankit\\.bashrc',git_bash)
copy('C:\\Users\\ankit\\.minttyrc',git_bash)
copy('C:\\Users\\ankit\\.config\\starship.toml',starship)
copy('C:\\Users\\ankit\\AppData\\Local\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json',terminal)
copy('C:\\Users\\ankit\\AppData\\Roaming\\Code\\User\\settings.json',vscode)
copy('C:\\Users\\ankit\\AppData\\Roaming\\Code\\User\\keybindings.json',vscode)
copy('C:\\Users\\ankit\\AppData\\Roaming\\Code\\User\\sync\\extensions\\lastSyncextensions.json',vscode)
copy('C:\\Users\\ankit\\.zshrc',zsh)
copy('C:\\Users\\ankit\\.p10k.zsh',zsh)

print("Backup Complete")