# vhs tape for the AFK Gremlin promo GIF.
# Install vhs:  brew install vhs   (https://github.com/charmbracelet/vhs)
# Record:       vhs demo/demo.tape   ->   writes demo/afk-gremlin.gif
#
# Run it from the REPO ROOT so the relative paths resolve.

Output demo/afk-gremlin.gif

Set Shell bash
Set FontSize 20
Set Width 1120
Set Height 620
Set Padding 28
Set Theme "Dracula"
Set TypingSpeed 55ms
Set PlaybackSpeed 1.0

# --- silent setup: friendly prompt + put ./demo on PATH ---
Hide
Type 'PS1="❯ "' Enter
Type 'export PATH="$PWD/demo:$PATH"' Enter
Type 'clear' Enter
Show

Sleep 900ms
Type "afk 2 hours, errands, funny"
Sleep 700ms
Enter
Sleep 3.5s
Type "# it refuses to invent fake emergencies 👻"
Sleep 1.6s
Enter
Sleep 1.2s
