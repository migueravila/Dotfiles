# Emoji Selector

> #### Command name: `demoji`
>
> #### Developer: Luke Smith (And some minor changes by me)

### 📄 Usage:

You can run the demoji script (once you install it) and have a list of emojis, pick one in the dmenu and It'll copy to your clipboard. Now you can paste it wherever you want. You need **xclip** in orer to make it functional

### ⚙️ Installation:

Every script has It's own makefile. In the directory of the script you want to install, run `sudo make install` and It'll be installed in your `$PATH`.

Also you need to grab the emoji file and put it where you'll not move / delete it. And then change the path in the script `~/.local/share/txt/emoji`. So you can "charge" the emojis icons and list.
