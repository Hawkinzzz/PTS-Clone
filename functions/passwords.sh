#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################
blitzpasswordmain () {
pgclonevars

tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🌎 Primary Password ~ pgclone.pgblitz.com
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Set a Primary Password for data encryption! DO NOT forget the password!
If you do, we are UNABLE to recover all of your DATA! That is the primary
risk of encryption; forgetfulness will cost you!

Quitting? Type >>> exit
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
read -p '↘️  Type Main Password | Press [ENTER]: ' typed < /dev/tty

  if [[ "$typed" == "exit" || "$typed" == "Exit" || "$typed" == "EXIT" ]]; then clonestart; fi
  if [[ "$typed" == "" ]]; then blitzpasswordmain; fi
  primarypassword=$typed
  blitzpasswordsalt
}

blitzpasswordsalt () {
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🌎 SALT (Secondary Password) ~ pgclone.pgblitz.com
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
NOTE: We do not recommended using the same password!

Set a secondary password for data encryption! DO NOT forget the password!
If you do, we are UNABLE to recover all of your DATA! That is the primary
risk of encryption; forgetfulness will cost you!

Quitting? Type >>> exit
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
read -p '↘️  Type SALT Password | Press [ENTER]: ' typed < /dev/tty

  if [[ "$typed" == "exit" || "$typed" == "Exit" || "$typed" == "EXIT" ]]; then clonestart; fi
  if [[ "$typed" == "" ]]; then blitzpasswordsalt; fi

secondarypassword=$typed
blitzpasswordfinal

}

blitzpasswordfinal () {
tee <<-EOF

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🌎 Set Passwords ~ pgclone.pgblitz.com
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Are you happy with the following info? Type y or n!

Primary  : $primarypassword
Secondary: $secondarypassword

Quitting? Type >>> exit
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF

read -p '↘️  Type y or n | Press [ENTER]: ' typed < /dev/tty

if [[ "$typed" == "n" ]]; then mountsmenu;
elif [[ "$typed" == "y" ]]; then
echo $primarypassword > /var/plexguide/pgclone.password
echo $secondarypassword > /var/plexguide/pgclone.salt
clonestart;
else blitzpasswordmain; fi
}