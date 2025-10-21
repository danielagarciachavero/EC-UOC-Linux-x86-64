                                ;1: archivo hola.asm
section .data                   ;2: Inicio de la  sección de datos
  msg db "Hola!",10             ;3: El 10 corresponde al código ASCII
                                ;4: del salto de línea
								;5:
section .text                   ;6: Inicio de la sección de código
  global main                   ;7: Esta directiva es para hacer visible 
                                ;8: una etiqueta para el compilador de C
                                ;9:
  main:                         ;10: Por defecto el compilador de C reconoce cómo
								;11: punto de inicio del programa la etiqueta main
								;12: Mostrar un mensaje
  mov rax,4                     ;13: Pone el valor 4 en el registro rax para hacer
                                ;14: la llamada a la función write (sys_write)
  mov rbx,1                     ;15: Pone el valor 1 en el registro rbx
								;16: indica el descriptor que hace referencia  
                                ;17: a la salida estándar
  mov rcx,msg                   ;18: Pone la dirección de la variable msg 
                                ;19: en el registro rcx
  mov rdx,6                     ;20: Pone la longitud del mensaje incluido el 10 
                                ;21: del final en el registro rdx
  int 80h                       ;22: llamada al sistema operativo
								;23: devuelve el control al terminal
                                ;24: del sistema operativo
  mov rax,1                     ;25: Pone el valor 1 en el registro rax
                                ;26: para llamar a la función exit (sys_exit)
  mov rbx,0                     ;27: Pone el valor 0 en el registro rbx indica
                                ;28: el código de retorno (0 = sin errores)
  int 80h                       ;29: llamada al sistema operativo
								;30:
