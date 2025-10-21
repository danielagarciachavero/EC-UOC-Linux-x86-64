##Install software
echo "---------------------------------"
echo "-   Install new software        -"
echo "---------------------------------"
sudo apt install -y -q geany geany-plugins yasm xterm build-essential cmake build-essential extra-cmake-modules libkf5i18n5 libkf5iconthemes5 libkf5iconthemes-dev libkf5xmlgui5 libkf5xmlgui-dev oxygen-icon-theme breeze-gtk-theme breeze-icon-theme
sudo apt update
sudo apt upgrade -y -q
echo "Ok"

echo "---------------------------------"
echo "-   Config kdbg                 -"
echo "---------------------------------"
cp kdbg-3.0.1.tar.gz $HOME
cd $HOME
tar -xvf kdbg-3.0.1.tar.gz
cd kdbg-3.0.1
cmake .
make 
sudo make install

##Setup gdb Intel notation
echo "set disassembly-flavor intel" > $HOME/.gdbinit

##Create configuration file for kdbg
mkdir $HOME/.kde/share/config -p
echo "[Debugger]
DebuggerCmdStr=gdb --fullname

[LastSession]
Width0Locals=100
Width0Watches=100

[MainWindow]
State=AAAA/wAAAAD9AAAAAgAAAAEAAAFaAAABWPwCAAAAAfsAAAAMAEwAbwBjAGEAbABzAQAAAD8AAAFYAAAAbQD///8AAAADAAAFAAAAAR38AQAAAAL8AAAAAAAAAwkAAADeAP////oAAAAAAQAAAAX7AAAACgBTAHQAYQBjAGsBAAAAAP////8AAABUAP////sAAAAWAEIAcgBlAGEAawBwAG8AaQBuAHQAcwEAAAAA/////wAAAN4A////+wAAAAwATwB1AHQAcAB1AHQBAAAAAP////8AAABUAP////sAAAAMAE0AZQBtAG8AcgB5AQAAAAD/////AAAAbAD////7AAAAEgBSAGUAZwBpAHMAdABlAHIAcwEAAAAA/////wAAAFQA/////AAAAw8AAAHxAAAAxQD////6AAAAAAEAAAAC+wAAAA4AVwBhAHQAYwBoAGUAcwEAAAAA/////wAAAMUA////+wAAAA4AVABoAHIAZQBhAGQAcwEAAAIeAAABWQAAAFQA////AAADoAAAAVgAAAAEAAAABAAAAAgAAAAI/AAAAAEAAAACAAAAAQAAABYAbQBhAGkAbgBUAG8AbwBsAEIAYQByAQAAAAAAAAN3AAAAAAAAAAA=
ToolBarsMovable=Disabled

[OutputWindow]
TermCmdStr=xterm -name kdbgio -title %T -e sh -c %C

[Preferences]
BackTimeout=1000
HeaderFileFilter=*.h *.hh *.hpp *.h++
PopForeground=false
SourceFileFilter=*.c *.cc *.cpp *.c++ *.C *.CC
TabWidth=0" > $HOME/.config/kdbgrc

echo "
[Appearance]
color_scheme_path=
custom_palette=false
icon_theme=breeze
style=gtk2

[Fonts]
fixed=@Variant(\0\0\0@\0\0\0\x16\0U\0\x62\0u\0n\0t\0u\0 \0M\0o\0n\0o@$\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\x10)
general=@Variant(\0\0\0@\0\0\0\f\0U\0\x62\0u\0n\0t\0u@$\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\x10)

[Interface]
activate_item_on_single_click=1
buttonbox_layout=0
cursor_flash_time=1000
dialog_buttons_have_icons=1
double_click_interval=400
gui_effects=@Invalid()
menus_have_icons=true
stylesheets=@Invalid()
toolbutton_style=4
underline_shortcut=1
wheel_scroll_lines=3

[SettingsWindow]
geometry=@ByteArray(\x1\xd9\xd0\xcb\0\x2\0\0\0\0\x4\xa1\0\0\x1n\0\0\a\x84\0\0\x4\x36\0\0\x4\xa1\0\0\x1\x8a\0\0\a\x84\0\0\x4\x36\0\0\0\0\0\0\0\0\n\0)
" > $HOME/.config/qt5ct/qt5ct.conf

echo "Ok"

echo "---------------------------------"
echo "-   Config geany                -"
echo "---------------------------------"
##Create filetypes.asm at $HOME/.config/geany/filedefs 
mkdir $HOME/.config/geany/filedefs -p
echo "# For complete documentation of this file, please see Geany's main documentation
[styling]
# Edit these in the colorscheme .conf file instead

# foreground;background;bold;italic
default=0x000000;0xffffff;false;false
comment=0x808080;0xffffff;false;false
number=0x007f00;0xffffff;false;false
string=0xff901e;0xffffff;false;false
operator=0x000000;0xffffff;false;false
identifier=0x880000;0xffffff;false;false
cpuinstruction=0x111199;0xffffff;true;false
mathinstruction=0x7f0000;0xffffff;true;false
register=0x000000;0xffffff;true;false
directive=0x3d670f;0xffffff;true;false
directiveoperand=0xff901e;0xffffff;false;false
commentblock=0x808080;0xffffff;false;false
character=0xff901e;0xffffff;false;false
stringeol=0x000000;0xe0c0e0;false;false
extinstruction=0x007f7f;0xffffff;false;false

[keywords]
# all items must be in one line
# this is by default a very simple instruction set; not of Intel or so
instructions=adc add and call cmp dec div idiv imul in inc int iret ja jae jb jbe je jne jg jge jl jle jnbe jnb jnae jna jz jnz jnle jnl jnge jng jc jnc jo jno js jns jmp loop mov movsx movsxd movzx mul neg not out or pop push ret rol ror sal sar sbb shl shr sub test xchg xor
registers=rax eax ax ah al rbx ebx bx bh bl rcx ecx cx ch cl rdx edx dx dh dl rsi esi si sil rdi edi di dil rbp ebp bp bpl rsp esp sp spl r8 r8d r8w r8b r9 r9d r9w r9b r10 r10d r10w r10b r11 r11d r11w r11b r12 r12d r12w r12b r13 r13d r13w r13b r14 r14d r14w r14b r15 r15d r15w r15b rip eip ip
directives=cpu .data .bss .text org list nolist page equivalent word dword qword text equ section global extern %macro %endmacro db dw dd dq movsb stosb resb resw resd resq byte %1 %2 %3 %4 %5 %6 %7 %8 %9 %10


[settings]
# default extension used when saving files
extension=asm

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# single comments, like # in this file
comment_single=;
# multiline comments
#comment_open=
#comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[indentation]
#width=4
# 0 is spaces, 1 is tabs, 2 is tab & spaces
#type=1

" > $HOME/.config/geany/filedefs/filetypes.asm
echo "Ok"

