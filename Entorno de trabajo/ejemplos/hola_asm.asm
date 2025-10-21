                                ;1: archivo hola_asm.asm
section .data                   ;2: Inicio de la  sección de datos
  msg db "Hola!",10             ;3: El 10 corresponde al código ASCII
                                ;4: del salto de línea
                                ;5: 
section .text                   ;6: Inicio de la sección de código
  global printHola              ;7: Esta directiva es para hacer visible 
                                ;8: una etiqueta para el compilador de C
                                ;9:
  printHola:                    ;10: Nombre de la subrutina de ensamblador
                                ;11: que llamaremos desde el programa en C
                                ;12: Mostrar un mensaje
  mov rax,4                     ;13: Pone el valor 4 en el registro rax para hacer
                                ;14: la llamada a la función write (sys_write)
  mov rbx,1                     ;15: Pone el valor 1 en el registro rbx
                                ;16: para indicar el descriptor que hace  
                                ;17: referencia a la salida estándar
  mov rcx,msg                   ;18: Pone la dirección de la variable msg 
                                ;19: en el registro rcx
  mov rdx,6                     ;20: Pone la longitud del mensaje incluido el 10 
                                ;21: del final en el registro rdx
  int 80h                       ;22: llamada al sistema operativo
                                ;23:
  ret                           ;24: retorno de llamada a subrutina.
                                ;25:
