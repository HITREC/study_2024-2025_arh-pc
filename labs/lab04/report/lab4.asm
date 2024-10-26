; lab4.asm
SECTION .data 
	lab4: DB 'Arslan Annagulyew',10 
	
	lab4Len: EQU $-lab4

SECTION .text ; Начало секции кода 
	GLOBAL _start

_start: ; Точка входа в программу
	mov eax,4 ; Системный вызов для записи (sys_write)
	mov ebx,1 ; Описание файла'1' - стандартный вывод 
	mov ecx,lab4 ; Адрес строки lab4 в ecx
	mov edx,lab4Len ; Размер строки lab4
	int 80h ; вызов ядра

	mov eax,1 ; Системный вызов для выхода (sys_exit)
	mov ebx,0 ; Выход с кодом возврата '0' (без ошибок)
	int 80h ; Вызов ядра