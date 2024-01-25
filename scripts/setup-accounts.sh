#!/bin/bash

## Now add some entries
echo "Adding User jdoe"
ldapadd -D "cn=Directory Manager" -w password -H ldap://localhost:3389 -x <<EOF
dn: uid=jdoe,cn=users,cn=accounts,${DS_SUFFIX_NAME}
uid: jdoe
givenName: John
objectClass: inetorgperson
sn: Doe
cn: John Doe
EOF

echo "Adding Group testgrp"
ldapadd -D "cn=Directory Manager" -w password -H ldap://localhost:3389 -x <<EOF
dn: cn=testgrp,cn=groups,cn=accounts,${DS_SUFFIX_NAME}
cn: testgrp
objectclass: groupOfNames
member: uid=jdoe,ou=People,${DS_SUFFIX_NAME}
EOF
