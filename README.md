telnetd
=======

Simple ruby telnet server with build in commands.

Commands available
==================
- Cat
- Cd
- Dir
- Exit
- Help
- Pwd
- Uptime
- Touch

Commands planned
==================
- Broadcast
- Copy
- Del
- Exec
- Fileinfo
- Mkdir
- Move
- Stats
- Who

Known Issues
============
- (Solved) Cat cmd does not handle line breaks correct
- (Solved) Commands with backspaces are not correct handled. Eg. "kat\b\b\bcat"
