#!/bin/bash

## Note: we rely on "standard" LDAP schemas as defined in /usr/share/dirsrv/schema
echo "Creating Backend Database ${DS_BACKEND_NAME}"
dsconf localhost backend create --suffix="${DS_SUFFIX_NAME}" --be-name="${DS_BACKEND_NAME}"

# Add structure
echo "Adding example dcObject"
ldapadd -D "cn=Directory Manager" -w ${DS_DM_PASSWORD} -H ldap://localhost:3389 -x <<EOF
dn: ${DS_SUFFIX_NAME}
dc: ${DS_BACKEND_NAME}
objectClass: dcObject
EOF

# We are simulating freeipa LDAP so need freeipa flat schema
# See https://github.com/freeipa/freeipa/blob/master/install/share/bootstrap-template.ldif
echo "Adding accounts nsContainer"
ldapadd -D "cn=Directory Manager" -w ${DS_DM_PASSWORD} -H ldap://localhost:3389 -x <<EOF
dn: cn=accounts,${DS_SUFFIX_NAME}
changetype: add
objectClass: top
objectClass: nsContainer
cn: accounts
EOF

echo "Adding users nsContainer"
ldapadd -D "cn=Directory Manager" -w ${DS_DM_PASSWORD} -H ldap://localhost:3389 -x <<EOF
dn: cn=users,cn=accounts,${DS_SUFFIX_NAME}
changetype: add
objectClass: top
objectClass: nsContainer
cn: users
EOF

echo "Adding groups nsContainer"
ldapadd -D "cn=Directory Manager" -w ${DS_DM_PASSWORD} -H ldap://localhost:3389 -x <<EOF
dn: cn=groups,cn=accounts,${DS_SUFFIX_NAME}
changetype: add
objectClass: top
objectClass: nsContainer
cn: groups
EOF
