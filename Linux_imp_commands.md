### Linux Important commands

1. Vi file edittor commands

`vi filename` (To open file edittor in linux)

Shift + g (To go to end of file)

gg (To go to bginning of file)

dd (To delete current cursur line)

d<number> (To delete number of line below current cursur)

Shift + d (press twice) (To delete all the lines from file)


2.  Terminal history

`history` (Show all history commands)

`cat ~/.bash_history` (Show all history commands)

**`history -c && history -w` (Delete all history and save to .bash_history)**

`history -d <command_number>` (remove specific command from history)

**`unset HISTFILE` (To temporarily disable the saving of command history for our current session)**

`export HISTIGNORE="ls:cd:clear"` (ignore commands like ls, cd, and clear from recording in history)

`reset` (reset terminal history)

3. Encrypt linux script file

Encrypt:

  `gpg -c script.sh`

Decrypt:

  `gpg -d script.sh.gpg > decrypted_script.sh`


4. To make several files unable to alter for users other than the superuser.

`lsattr <filename>` (list the file attribute)

`chattr +i <filename>` (set chattr to file attribute it makes file immutable)

`chattr -i <filename>`  (unset or remove chattr from file)

`chattr -R +i <folder>` (set chattr to folder attribute it makes folder immutable)

`chattr -i <folder>`  (unset or remove chattr from folder)


5. Linux command to check the user password expiring in upcoming 7 days
   
`ED=$(chage -l test|grep 'Password expires'|awk '{print $4,$5,$6}');TD=$(date -d '+7days' +%m/%d/%Y);if [[ $(date -d "$ED" +%s) < $(date -d "$TD" +%s) ]];then echo -e "\033[31mUnsafe- $ED\033[0m";else echo -e "\033[32mSafe - $ED\033[0m";fi`
