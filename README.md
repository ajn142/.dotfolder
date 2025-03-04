# .dotfolder

> Where do you keep your dotfiles? In your *dotfolder*.

-- adapted from [u/ValiantBear](https://www.reddit.com/r/linux4noobs/comments/sk5fm5/how_do_you_manage_your_dotfiles/hvmcduq/) on reddit.

Using these dotfiles (a work in progress):

0. (Optional) Fork the repo so you control your files.
1. Clone the repo (I recommend via git)
2. Use gnu `stow` to symlink the files into your home directory
`stow -vnR . #dry-run`
`stow -vR . #actually deploy`
3. (Optional) Install things like ble.sh and atuin.sh to take advantage of the things I did in the dotfiles.