#!/bin/bash

## Now add some entries
echo "Adding User jdoe"
ldapadd -D "cn=Directory Manager" -w ${DS_DM_PASSWORD} -H ldap://localhost:3389 -x <<EOF
dn: uid=jdoe,cn=users,cn=accounts,${DS_SUFFIX_NAME}
uid: jdoe
givenName: John
objectClass: inetorgperson
sn: Doe
cn: John Doe
EOF

echo "Adding Group testgrp"
ldapadd -D "cn=Directory Manager" -w ${DS_DM_PASSWORD} -H ldap://localhost:3389 -x <<EOF
dn: cn=testgrp,cn=groups,cn=accounts,${DS_SUFFIX_NAME}
cn: testgrp
objectclass: groupOfNames

EOF

echo "Add jdoe to group testgrp"
ldapmodify -D "cn=Directory Manager" -w ${DS_DM_PASSWORD} -H ldap://localhost:3389 -x <<EOF
dn: cn=testgrp,cn=groups,cn=accounts,${DS_SUFFIX_NAME}
changetype: modify
add: member
member: uid=jdoe,cn=users,cn=accounts,${DS_SUFFIX_NAME}
EOF

# TODO: memberOf https://www.port389.org/docs/389ds/design/memberof-plugin.html