.586 
.MODEL FLAT, C 
.CODE 
func PROC C x:qword 
fld x;st(0)=x 
fld st;st(0)=st(1)=x 
fsincos;st(0)=sin(x) st(1)=cos(x) st(2)=x 
fsub st(1),st(0) 
;fyl2x 
ret 
func ENDP 
END