# Regular
txtblk="$(tput setaf 0 2>/dev/null)"  # Black
txtred="$(tput setaf 1 2>/dev/null)"  # Red
txtgrn="$(tput setaf 2 2>/dev/null)"  # Green
txtylw="$(tput setaf 3 2>/dev/null)"  # Yellow
txtblu="$(tput setaf 4 2>/dev/null)"  # Blue
txtpur="$(tput setaf 5 2>/dev/null)"  # Purple
txtcyn="$(tput setaf 6 2>/dev/null)"  # Cyan
txtwht="$(tput setaf 7 2>/dev/null)"  # White

# Bold
bldblk="$(tput setaf 0 2>/dev/null)$(tput bold 2>/dev/null)"  # Black
bldred="$(tput setaf 1 2>/dev/null)$(tput bold 2>/dev/null)"  # Red
bldgrn="$(tput setaf 2 2>/dev/null)$(tput bold 2>/dev/null)"  # Green
bldylw="$(tput setaf 3 2>/dev/null)$(tput bold 2>/dev/null)"  # Yellow
bldblu="$(tput setaf 4 2>/dev/null)$(tput bold 2>/dev/null)"  # Blue
bldpur="$(tput setaf 5 2>/dev/null)$(tput bold 2>/dev/null)"  # Purple
bldcyn="$(tput setaf 6 2>/dev/null)$(tput bold 2>/dev/null)"  # Cyan
bldwht="$(tput setaf 7 2>/dev/null)$(tput bold 2>/dev/null)"  # White

# Underline
undblk="$(tput setaf 0 2>/dev/null)$(tput smul 2>/dev/null)"  # Black
undred="$(tput setaf 1 2>/dev/null)$(tput smul 2>/dev/null)"  # Red
undgrn="$(tput setaf 2 2>/dev/null)$(tput smul 2>/dev/null)"  # Green
undylw="$(tput setaf 3 2>/dev/null)$(tput smul 2>/dev/null)"  # Yellow
undblu="$(tput setaf 4 2>/dev/null)$(tput smul 2>/dev/null)"  # Blue
undpur="$(tput setaf 5 2>/dev/null)$(tput smul 2>/dev/null)"  # Purple
undcyn="$(tput setaf 6 2>/dev/null)$(tput smul 2>/dev/null)"  # Cyan
undwht="$(tput setaf 7 2>/dev/null)$(tput smul 2>/dev/null)"  # White

# Background
bakblk="$(tput setab 0 2>/dev/null)"  # Black
bakred="$(tput setab 1 2>/dev/null)"  # Red
bakgrn="$(tput setab 2 2>/dev/null)"  # Green
bakylw="$(tput setab 3 2>/dev/null)"  # Yellow
bakblu="$(tput setab 4 2>/dev/null)"  # Blue
bakpur="$(tput setab 5 2>/dev/null)"  # Purple
bakcyn="$(tput setab 6 2>/dev/null)"  # Cyan
bakwht="$(tput setab 7 2>/dev/null)"  # White

# Reset
txtrst="$(tput sgr 0 2>/dev/null)"  # Text Reset
