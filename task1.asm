include irvine32.inc
.data
str1 db "Value not Found",0
str2 db "First positive numer: ",0
array SWORD -3,-6,-1,-10,10,30,40,4
sentinel SWORD 0
.code
main proc
call clrscr
mov esi,OFFSET array
mov ecx,lengthof array
next:
test WORD PTR [esi],8000h  ;perform AND operation of values of array with binary of 8000h to find first +ve num
pushfd                            ;push the state of all flags in stack
add esi,TYPE array                 ;increment the value of array (iterate the value)
popfd                               ;pop the state of flag that is stored in stack
loopnz next                         ;loop remain continue till zero flag is on
jnz quit                             ;if zero flag is not on it will jump to this label
sub esi,TYPE array
movsx eax,WORD PTR[esi]               ; display the value
mov edx,OFFSET str2
call writestring
call crlf 
call WriteInt
call crlf
exit
quit:

mov edx,OFFSET str1
call writestring

exit
main endp
end main
