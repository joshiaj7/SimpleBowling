TITLE proyek(.asm)

; This program
; Last update:

Include Irvine16.inc
.data
;////////////////////
;Penulisan Basic
;////////////////////
ent db 13,10,00
sps db ' ' ,00
bntg db '*' ,00
grs db '|' ,00
grsmrg db '/',00

;////////////////////
;Variabel
;////////////////////
totalnilai BYTE 0

;////////////////////
;Arah Motor
;////////////////////
naik BYTE    00100001b 
berenti BYTE 00100100b

;////////////////////
;Super Bowling
;////////////////////
bowl1 db 'OOOO  O  O  OOOO  OOOO  OOO ',00
bowl2 db 'O     O  O  O  O  O     O  O',00
bowl3 db 'OOOO  O  O  OOOO  OOOO  OOO ',00
bowl4 db '   O  O  O  O     O     O O ',00
bowl5 db 'OOOO  OOOO  O     OOOO  O  O',00

bowl6 db 'OOO  OOOO  O  O  O     O   O  O  OOOO',00
bowl7 db 'O  O O  O  O  O  O     O   O  O  O   ',00
bowl8 db 'OOO  O  O  O  O  O     O   OO O  O OO',00
bowl9 db 'O  O O  O  OOOO  O     O   O OO  O  O',00
bowl10 db'OOO  OOOO  O  O  OOOO  O   O  O  OOOO',00

fadea db '                                     ',00

;////////////////////
;Tulisan
;////////////////////
gameover db 'GAME OVER!',00
ttl db 'Total Nilai:',00
dibuat db 'Dibuat Oleh:',00
joshia db 'Joshia Tanuwidjaja | 2013-042-025',00
daniel db 'Daniel             | 2013-042-017',00

ronde1 db 'Ronde 1',00
ronde2 db 'Ronde 2',00
ronde3 db 'Ronde 3',00
ronde4 db 'Ronde 4',00
ronde5 db 'Ronde 5',00
mainlg db 'Apakah anda Ingin bermain lagi?[1/0] ',00


;////////////////////
;Kerangka Timer
;////////////////////
timer1 db '*************',00
timer2 db '* T I M E R *',00
timer3 db '*************',00
timer4 db '*           *',00
timer5 db '*           *',00
timer6 db '*           *',00
timer7 db '*************',00

;////////////////////
;Cetak Angka
;////////////////////

nol1 db ' OOO ',00
nol2 db ' O O ',00
nol3 db ' O O ',00
nol4 db ' O O ',00
nol5 db ' OOO ',00

satu1 db '   O ',00
satu2 db '   O ',00
satu3 db '   O ',00
satu4 db '   O ',00
satu5 db '   O ',00

dua1 db ' OOO ',00
dua2 db '   O ',00
dua3 db ' OOO ',00
dua4 db ' O   ',00
dua5 db ' OOO ',00

tiga1 db ' OOO ',00
tiga2 db '   O ',00
tiga3 db ' OOO ',00
tiga4 db '   O ',00
tiga5 db ' OOO ',00

empat1 db ' O O ',00
empat2 db ' O O ',00
empat3 db ' OOO ',00
empat4 db '   O ',00
empat5 db '   O ',00

lima1 db ' OOO ',00
lima2 db ' O   ',00
lima3 db ' OOO ',00
lima4 db '   O ',00
lima5 db ' OOO ',00

enam1 db ' OOO ',00
enam2 db ' O   ',00
enam3 db ' OOO ',00
enam4 db ' O O ',00
enam5 db ' OOO ',00

tujuh1 db ' OOO ',00
tujuh2 db '   O ',00
tujuh3 db '  O  ',00
tujuh4 db '  O  ',00
tujuh5 db '  O  ',00

delapan1 db ' OOO ',00
delapan2 db ' O O ',00
delapan3 db ' OOO ',00
delapan4 db ' O O ',00
delapan5 db ' OOO ',00

sembilan1 db ' OOO ',00
sembilan2 db ' O O ',00
sembilan3 db ' OOO ',00
sembilan4 db '   O ',00
sembilan5 db ' OOO ',00

;////////////////////
;Alamat Port
;////////////////////
portdata equ 378h
portcontrol equ 37ah
portstatus equ 379h

;/////////////////////
;Alamat Skor
;/////////////////////
skorx1 BYTE 11
skory1 BYTE 10

skorx2 BYTE 17
skory2 BYTE 10

skorx3 BYTE 23
skory3 BYTE 10

skorx4 BYTE 29
skory4 BYTE 10

skorx5 BYTE 35
skory5 BYTE 10

skortotalx1 BYTE 41
skortotaly1 BYTE 10

skortotalx2 BYTE 47
skortotaly2 BYTE 10

xp BYTE 0
yp BYTE 0

;/////////////////////
;Prototipe
;/////////////////////
papanskor PROTO
nol PROTO,x:BYTE,y:BYTE
satu PROTO,x:BYTE,y:BYTE
dua PROTO,x:BYTE,y:BYTE
tiga PROTO,x:BYTE,y:BYTE
empat PROTO,x:BYTE,y:BYTE
lima PROTO,x:BYTE,y:BYTE
enam PROTO,x:BYTE,y:BYTE
tujuh PROTO,x:BYTE,y:BYTE
delapan PROTO,x:BYTE,y:BYTE
sembilan PROTO,x:BYTE,y:BYTE
bordertimer PROTO
waktulempar PROTO
waktumotor PROTO
intro PROTO
tamat PROTO

;/////////////////////
;MAIN PROGRAM
;/////////////////////
.code
main PROC
	mov ax,@data
	mov ds,ax

	mov al, 00100100b
	mov dx, portcontrol
	out dx, al
	
	invoke intro 
	
mau:	call clrscr
	mov bx,1 
	mov totalnilai, 0
	
	invoke papanskor
	invoke bordertimer
	
ulang:	cmp bx, 6
	je totalsk
	
	cmp bx, 1
	je koorsatu
	cmp bx, 2
	je koordua
	cmp bx, 3
	je koortiga
	cmp bx, 4
	je koorempat
	cmp bx, 5
	je koorlima
	
koorsatu:
	push cx
	mov cl,skorx1
	mov xp,cl
	mov ch,skory1
	mov yp,ch
	pop cx

	push dx
	mov dl, 10
	mov dh, 7
	call gotoxy
	mov dx, offset ronde1
	call writestring
	pop dx
	jmp ahay
	
koordua:
	push cx
	mov cl,skorx2
	mov xp,cl
	mov ch,skory2
	mov yp,ch
	pop cx

	push dx
	mov dl, 10
	mov dh, 7
	call gotoxy
	mov dx, offset fadea
	call writestring
	
	mov dl, 16
	mov dh, 7
	call gotoxy
	mov dx, offset ronde2
	call writestring
	pop dx
	jmp ahay
	
koortiga:
	push cx
	mov cl,skorx3
	mov xp,cl
	mov ch,skory3
	mov yp,ch
	pop cx

	push dx
	mov dl, 10
	mov dh, 7
	call gotoxy
	mov dx, offset fadea
	call writestring
	
	mov dl, 22
	mov dh, 7
	call gotoxy
	mov dx, offset ronde3
	call writestring
	pop dx
	jmp ahay
	
koorempat:
	push cx
	mov cl,skorx4
	mov xp,cl
	mov ch,skory4
	mov yp,ch
	pop cx

	push dx
	mov dl, 10
	mov dh, 7
	call gotoxy
	mov dx, offset fadea
	call writestring
	
	mov dl, 28
	mov dh, 7
	call gotoxy
	mov dx, offset ronde4
	call writestring
	pop dx
	jmp ahay

koorlima:
	push cx
	mov cl,skorx5
	mov xp,cl
	mov ch,skory5
	mov yp,ch
	pop cx

	push dx
	mov dl, 10
	mov dh, 7
	call gotoxy
	mov dx, offset fadea
	call writestring
	
	mov dl, 34
	mov dh, 7
	call gotoxy
	mov dx, offset ronde5
	call writestring
	pop dx
	jmp ahay
	
ahay:	invoke waktulempar
	mov dx, portdata
	mov ax, 0
	in al, dx
	
;666666666666666666666666666666666666666

	cmp al, 11111111b	;skor=6
	je lmptenam


;55555555555555555555555555555555555555555
			
	cmp al, 11011111b	;1
	je lmptlima
	cmp al, 11101111b	;2
	je lmptlima
	cmp al, 11110111b	;3
	je lmptlima
	cmp al, 11111011b	;4
	je lmptlima
	cmp al, 11111101b	;5
	je lmptlima
	cmp al, 11111110b	;6
	je lmptlima
	

;44444444444444444444444444444444444444

	cmp al, 11001111b	;1
	je lmptempat
	cmp al, 11010111b	;2
	je lmptempat
	cmp al, 11011011b	;3
	je lmptempat
	cmp al, 11011101b	;4
	je lmptempat
	cmp al, 11011110b	;5
	je lmptempat
	cmp al, 11100111b	;6
	je lmptempat
	cmp al, 11101011b	;7
	je lmptempat
	cmp al, 11101101b	;8
	je lmptempat
	cmp al, 11101110b	;9
	je lmptempat
	cmp al, 11110011b	;10
	je lmptempat
	cmp al, 11110101b	;11
	je lmptempat
	cmp al, 11110110b	;12
	je lmptempat
	cmp al, 11111001b	;13
	je lmptempat
	cmp al, 11111010b	;14
	je lmptempat
	cmp al, 11111100b	;15
	je lmptempat
	

;3333333333333333333333333333333333333

	cmp al, 11000111b	;1
	je lmpttiga
	cmp al, 11001011b	;2
	je lmpttiga
	cmp al, 11001101b	;3
	je lmpttiga
	cmp al, 11001110b	;4
	je lmpttiga
	cmp al, 11010011b	;5
	je lmpttiga
	cmp al, 11010101b	;6
	je lmpttiga
	cmp al, 11010110b	;7
	je lmpttiga
	cmp al, 11011001b	;8
	je lmpttiga
	cmp al, 11011010b	;9
	je lmpttiga
	cmp al, 11011100b	;10
	je lmpttiga
	cmp al, 11100011b	;11
	je lmpttiga
	cmp al, 11100101b	;12
	je lmpttiga
	cmp al, 11100110b	;13
	je lmpttiga
	cmp al, 11101001b	;14
	je lmpttiga
	cmp al, 11101010b	;15
	je lmpttiga
	cmp al, 11101100b	;16
	je lmpttiga
	cmp al, 11110001b	;17
	je lmpttiga
	cmp al, 11110010b	;18
	je lmpttiga
	cmp al, 11110100b	;19
	je lmpttiga
	cmp al, 11111000b	;20
	je lmpttiga


;2222222222222222222222222222222222222

	cmp al, 11000011b	;1
	je lmptdua
	cmp al, 11000101b	;2
	je lmptdua
	cmp al, 11000110b	;3
	je lmptdua
	cmp al, 11001001b	;4
	je lmptdua
	cmp al, 11001010b	;5
	je lmptdua
	cmp al, 11001100b	;6
	je lmptdua
	cmp al, 11010001b	;7
	je lmptdua
	cmp al, 11010010b	;8
	je lmptdua
	cmp al, 11010100b	;9
	je lmptdua
	cmp al, 11011000b	;10
	je lmptdua
	cmp al, 11100001b	;11
	je lmptdua
	cmp al, 11100010b	;12
	je lmptdua
	cmp al, 11100100b	;13
	je lmptdua
	cmp al, 11101000b	;14
	je lmptdua
	cmp al, 11110000b	;15
	je lmptdua


;11111111111111111111111111111111111111

	cmp al, 11000001b	;1
	je lmptsatu
	cmp al, 11000010b	;2
	je lmptsatu
	cmp al, 11000100b	;3
	je lmptsatu
	cmp al, 11001000b	;4
	je lmptsatu
	cmp al, 11010000b	;5
	je lmptsatu
	cmp al, 11100000b	;6
	je lmptsatu


;00000000000000000000000000000000000000

	cmp al, 11000000b	;1
	je lmptnol

;////// PEMBERIAN NILAI ///////
	
lmptenam:
	invoke enam,xp,yp
	add totalnilai,6
	jmp selesai

lmptlima:
	invoke lima,xp,yp
	add totalnilai,5
	jmp selesai
	
lmptempat:
	invoke empat,xp,yp
	add totalnilai,4
	jmp selesai
	
lmpttiga:
	invoke tiga,xp,yp
	add totalnilai,3
	jmp selesai

lmptdua:
	invoke dua,xp,yp
	add totalnilai,2
	jmp selesai

lmptsatu:
	invoke satu,xp,yp
	add totalnilai,1
	jmp selesai
	
lmptnol:
	invoke nol,xp,yp
	jmp selesai


selesai:inc bx
	invoke waktumotor
	jmp ulang

totalsk:mov dl, 10
	mov dh, 7
	call gotoxy
	mov dx, offset fadea
	call writestring

	mov dh, 7
	mov dl, 41
	call gotoxy
	mov dx, offset ttl
	call writestring
	
	cmp totalnilai, 30
	je tigaluh
	cmp totalnilai, 29
	je dualan
	cmp totalnilai, 28
	je duapan
	cmp totalnilai, 27
	je duajuh
	cmp totalnilai, 26
	je duanam
 	cmp totalnilai, 25
	je duama
	cmp totalnilai, 24
	je duapat
	cmp totalnilai, 23
	je duaga
	cmp totalnilai, 22
	je duawa
	cmp totalnilai, 21
	je duatu
	cmp totalnilai, 20
	je dualuh

 	cmp totalnilai, 19
	je satulan
 	cmp totalnilai, 18
	je satupan
 	cmp totalnilai, 17
	je satujuh
 	cmp totalnilai, 16
	je satunam
 	cmp totalnilai, 15
	je satuma
 	cmp totalnilai, 14
	je satupat
 	cmp totalnilai, 13
	je satuga
 	cmp totalnilai, 12
	je satuwa
 	cmp totalnilai, 11
	je satutu
 	cmp totalnilai, 10
	je sepuluh

  	cmp totalnilai, 9
	je lan
  	cmp totalnilai, 8
	je pan
   	cmp totalnilai, 7
	je juh
  	cmp totalnilai, 6
	je nam 
   	cmp totalnilai, 5
	je ma
   	cmp totalnilai, 4
	je pat
   	cmp totalnilai, 3
	je ga
   	cmp totalnilai, 2
	je wa
    	cmp totalnilai, 1
	je tu
   	cmp totalnilai, 0
	je nul
 
tigaluh:invoke tiga,skortotalx1,skortotaly1		;30
	invoke nol,skortotalx2,skortotaly2
	jmp mainlagi

dualan:	invoke dua,skortotalx1,skortotaly1		;29
	invoke sembilan,skortotalx2,skortotaly2
	jmp mainlagi

duapan:	invoke dua,skortotalx1,skortotaly1		;28
	invoke delapan,skortotalx2,skortotaly2
	jmp mainlagi

duajuh:	invoke dua,skortotalx1,skortotaly1		;27
	invoke tujuh,skortotalx2,skortotaly2
	jmp mainlagi

duanam:	invoke dua,skortotalx1,skortotaly1		;26
	invoke enam,skortotalx2,skortotaly2
	jmp mainlagi

duama:	invoke dua,skortotalx1,skortotaly1		;25
	invoke lima,skortotalx2,skortotaly2
	jmp mainlagi

duapat:	invoke dua,skortotalx1,skortotaly1		;24
	invoke empat,skortotalx2,skortotaly2
	jmp mainlagi

duaga:	invoke dua,skortotalx1,skortotaly1		;23
	invoke tiga,skortotalx2,skortotaly2
	jmp mainlagi

duawa:	invoke dua,skortotalx1,skortotaly1		;22
	invoke dua,skortotalx2,skortotaly2
	jmp mainlagi

duatu:	invoke dua,skortotalx1,skortotaly1		;21
	invoke satu,skortotalx2,skortotaly2
	jmp mainlagi

dualuh:	invoke dua,skortotalx1,skortotaly1		;20
	invoke nol,skortotalx2,skortotaly2
	jmp mainlagi

satulan:		;19
	invoke satu,skortotalx1,skortotaly1
	invoke sembilan,skortotalx2,skortotaly2
	jmp mainlagi

satupan:		;18
	invoke satu,skortotalx1,skortotaly1
	invoke delapan,skortotalx2,skortotaly2
	jmp mainlagi

satujuh:		;17
	invoke satu,skortotalx1,skortotaly1
	invoke tujuh,skortotalx2,skortotaly2
	jmp mainlagi

satunam:		;16
	invoke satu,skortotalx1,skortotaly1
	invoke enam,skortotalx2,skortotaly2
	jmp mainlagi

satuma:			;15
	invoke satu,skortotalx1,skortotaly1
	invoke lima,skortotalx2,skortotaly2
	jmp mainlagi

satupat:		;14
	invoke satu,skortotalx1,skortotaly1
	invoke empat,skortotalx2,skortotaly2
	jmp mainlagi

satuga:			;13
	invoke satu,skortotalx1,skortotaly1
	invoke tiga,skortotalx2,skortotaly2
	jmp mainlagi

satuwa:			;12
	invoke satu,skortotalx1,skortotaly1
	invoke dua,skortotalx2,skortotaly2
	jmp mainlagi

satutu:			;11
	invoke satu,skortotalx1,skortotaly1
	invoke satu,skortotalx2,skortotaly2
	jmp mainlagi

sepuluh:		;10
	invoke satu,skortotalx1,skortotaly1
	invoke nol,skortotalx2,skortotaly2
	jmp mainlagi

lan:	invoke nol,skortotalx1,skortotaly1		;9
	invoke sembilan,skortotalx2,skortotaly2
	jmp mainlagi

pan:	invoke nol,skortotalx1,skortotaly1		;8
	invoke delapan,skortotalx2,skortotaly2
	jmp mainlagi

juh:	invoke nol,skortotalx1,skortotaly1		;7
	invoke tujuh,skortotalx2,skortotaly2
	jmp mainlagi

nam:	invoke nol,skortotalx1,skortotaly1		;6
	invoke enam,skortotalx2,skortotaly2
	jmp mainlagi

ma:	invoke nol,skortotalx1,skortotaly1		;5
	invoke lima,skortotalx2,skortotaly2
	jmp mainlagi

pat:	invoke nol,skortotalx1,skortotaly1		;4
	invoke empat,skortotalx2,skortotaly2
	jmp mainlagi

ga:	invoke nol,skortotalx1,skortotaly1		;3
	invoke tiga,skortotalx2,skortotaly2
	jmp mainlagi

wa:	invoke nol,skortotalx1,skortotaly1		;2
	invoke dua,skortotalx2,skortotaly2
	jmp mainlagi

tu:	invoke nol,skortotalx1,skortotaly1		;1
	invoke satu,skortotalx2,skortotaly2
	jmp mainlagi

nul:	invoke nol,skortotalx1,skortotaly1		;0
	invoke nol,skortotalx2,skortotaly2
	jmp mainlagi
	
;////////////////////
;Mau Main Lagi
;////////////////////

mainlagi:
	mov ax,0
	mov dh,20 
	mov dl,10
	call gotoxy
	mov dx, offset mainlg
	call writestring
	
	call readint
	cmp ax,1
	je mau
	jne teend

teend:	invoke tamat	
	exit 

main ENDP	
;////////////////////////////
;Procedure
;////////////////////////////

;////////////////////////////
;Papan Skor
;////////////////////////////
papanskor PROC	
	pushad

	mov bh,1
	mov dh,8
	mov dl,10
	
awal:	cmp bh,9
	ja keluar
	mov bl,1
	
syarat:	cmp bl,43
	ja lnjt
	cmp bh,1
	je cetak
	cmp bh,9
	je cetak
	jmp btgh

btgh 	:cmp bl,1
	je cetak
	cmp bl,7
	je cetak
	cmp bl,13
	je cetak
	cmp bl,19
	je cetak
	cmp bl,25
	je cetak
	cmp bl,31
	je cetak
	cmp bl,43
	je cetak
	jmp ksg
		
cetak:	call gotoxy
	push dx
	mov dx, offset bntg
	call writestring
	pop dx
	jmp tmbh
	
ksg :	call gotoxy
	push dx
	mov dx, offset sps
	call writestring
	pop dx
	
tmbh:	inc bl
	inc dl
	jmp syarat

lnjt:	inc bh
	inc dh
	mov dl,10
	call gotoxy
	jmp awal

keluar: 
	mov dh, 15
	mov dl, 21
	call gotoxy
	popad
	ret
papanskor ENDP

;////////////////////////////
;Border Timer
;////////////////////////////

bordertimer PROC
	pushad
	mov dl,60
	mov dh,8
	call gotoxy
	mov dx, offset timer1
	call writestring
	
	mov dl,60
	mov dh,9
	call gotoxy
	mov dx, offset timer2
	call writestring
	
	mov dl,60
	mov dh,10
	call gotoxy
	mov dx, offset timer3
	call writestring
	
	mov dl,60
	mov dh,11
	call gotoxy
	mov dx, offset timer4
	call writestring
	
	mov dl,60
	mov dh,12
	call gotoxy
	mov dx,offset timer5
	call writestring
	
	mov dl,60
	mov dh,13
	call gotoxy
	mov dx,offset timer6
	call writestring
	
	mov dl,60
	mov dh,14
	call gotoxy
	mov dx,offset timer7
	call writestring
	
	popad
	ret
bordertimer ENDP

;////////////////////////////
;Waktu Lempar Bola Bowling
;////////////////////////////
waktulempar PROC

	pushad
	mov ax,15

waktu:	mov dl,66 ; koordinat angka timer : x=66, y=12
	mov dh,12
	call gotoxy
	call writedec
	
	cmp ax,0
	je sls
	
	cmp ax,9
	jne lanjut


hapus:	mov dl,67 ; koordinat angka timer yang perlu dihapus: x=67, y=12
	mov dh,12
	call gotoxy
	mov dx, offset sps
	call writestring
	
lanjut:	dec ax
	push ax
	mov ax, 1000 ; waktu delay 1 detik
	call delay
	pop ax
	jmp waktu
	
sls:	popad
	ret
waktulempar ENDP

;////////////////////////////
;Waktu Motor Merapikan Pin
;////////////////////////////
waktumotor PROC
	pushad
	
	mov dx, portcontrol
	mov al, naik
	out dx, al
		
	mov ax, 15000
	call delay
	
	mov dx, portcontrol
	mov al, berenti
	out dx, al
		
	mov ax, 3000
	call delay
	
	popad
	ret
waktumotor ENDP

;////////////////////////////
;Intro
;////////////////////////////
intro PROC
	pushad

	mov dl, 30
	mov dh, 20
	call gotoxy
	mov dx, offset dibuat
	call writestring

	mov dl, 30
	mov dh, 21
	call gotoxy
	mov dx, offset daniel
	call writestring
	
	mov dl, 30
	mov dh, 22
	call gotoxy
	mov dx, offset joshia
	call writestring
		
	mov cx, 1

tulis:	cmp cx, 3
	ja keluar
	
	mov dl, 25
	mov dh, 4
	call gotoxy
	mov dx, offset bowl1
	call writestring
	mov ax, 500
	call delay

	mov dl, 25
	mov dh, 5
	call gotoxy
	mov dx, offset bowl2
	call writestring
	mov ax, 500
	call delay

	mov dl, 25
	mov dh, 6
	call gotoxy
	mov dx, offset bowl3
	call writestring
	mov ax, 500
	call delay

	mov dl, 25
	mov dh, 7
	call gotoxy
	mov dx, offset bowl4
	call writestring
	mov ax, 500
	call delay

	mov dl, 25
	mov dh, 8
	call gotoxy
	mov dx, offset bowl5
	call writestring
	mov ax, 500
	call delay

	mov dl, 19
	mov dh, 10
	call gotoxy
	mov dx, offset bowl6
	call writestring
	mov ax, 500
	call delay

	mov dl, 19
	mov dh, 11
	call gotoxy
	mov dx, offset bowl7
	call writestring
	mov ax, 500
	call delay

	mov dl, 19
	mov dh, 12
	call gotoxy
	mov dx, offset bowl8
	call writestring
	mov ax, 500
	call delay

	mov dl, 19
	mov dh, 13
	call gotoxy
	mov dx, offset bowl9
	call writestring
	mov ax, 500
	call delay

	mov dl, 19
	mov dh, 14
	call gotoxy
	mov dx, offset bowl10
	call writestring
	mov ax, 2000 		; SENGAJA DIGEDEIN UNTUK TRANSISI
	call delay

	mov dh,4
	mov dl,19
	inc cx
	
ilang:  cmp dh, 14
	ja tulis
	call gotoxy
	
	push dx
	mov dx, offset fadea
	call writestring
	pop dx
	
	mov ax, 500
	call delay
	inc dh
	jmp ilang
	
keluar:	popad
	ret
intro ENDP


;////////////////////////////
;Game Over
;////////////////////////////
tamat PROC
	pushad
	
	call clrscr
	
	mov dl,33 ; koordinat tulisan "GAME OVER"
	mov dh,11
	call gotoxy
	mov dx, offset gameover
	call writestring

	mov dl,10
	mov dh,25 
	call gotoxy
		
	popad
	ret
tamat ENDP


;////////////////////////////
;Nol
;////////////////////////////

nol PROC,x:BYTE,y:BYTE
	pushad
	mov dl,x
	mov dh,y
	call gotoxy
	push dx
	mov dx, offset nol1
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset nol2
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset nol3
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset nol4
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset nol5
	call writestring
	pop dx
	popad
	ret
nol ENDP

;////////////////////////////
;Satu
;////////////////////////////

satu PROC,x:BYTE,y:BYTE
	pushad
	mov dl,x
	mov dh,y
	call gotoxy
	push dx
	mov dx, offset satu1
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset satu2
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset satu3
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset satu4
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset satu5
	call writestring
	pop dx
	popad
	ret
satu ENDP
	
;////////////////////////////
;Dua
;////////////////////////////	
	
dua PROC,x:BYTE,y:BYTE
	pushad
	mov dl,x
	mov dh,y
	call gotoxy
	push dx
	mov dx, offset dua1
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset dua2
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset dua3
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset dua4
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset dua5
	call writestring
	pop dx
	popad
	ret
dua ENDP

;////////////////////////////
;Tiga
;////////////////////////////	

tiga PROC,x:BYTE,y:BYTE
	pushad
	mov dl,x
	mov dh,y
	call gotoxy
	push dx
	mov dx, offset tiga1
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset tiga2
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset tiga3
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset tiga4
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset tiga5
	call writestring
	pop dx
	popad
	ret
tiga ENDP

;////////////////////////////
;Empat
;////////////////////////////	

empat PROC,x:BYTE,y:BYTE
	pushad
	mov dl,x
	mov dh,y
	call gotoxy
	push dx
	mov dx, offset empat1
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset empat2
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset empat3
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset empat4
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset empat5
	call writestring
	pop dx
	popad
	ret
empat ENDP

;////////////////////////////
;Lima
;////////////////////////////	

lima PROC,x:BYTE,y:BYTE
	pushad
	mov dl,x
	mov dh,y
	call gotoxy
	push dx
	mov dx, offset lima1
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset lima2
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset lima3
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset lima4
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset lima5
	call writestring
	pop dx
	popad
	ret
lima ENDP

;////////////////////////////
;Enam
;////////////////////////////	

enam PROC,x:BYTE,y:BYTE
	pushad
	mov dl,x
	mov dh,y
	call gotoxy
	push dx
	mov dx, offset enam1
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset enam2
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset enam3
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset enam4
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset enam5
	call writestring
	pop dx
	popad
	ret
enam ENDP

;////////////////////////////
;Tujuh
;////////////////////////////	

tujuh PROC,x:BYTE,y:BYTE
	pushad
	mov dl,x
	mov dh,y
	call gotoxy
	push dx
	mov dx, offset tujuh1
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset tujuh2
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset tujuh3
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset tujuh4
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx,offset tujuh5
	call writestring
	pop dx
	popad
	ret
tujuh ENDP

;////////////////////////////
;Delapan
;////////////////////////////	

delapan PROC,x:BYTE,y:BYTE
	pushad
	mov dl,x
	mov dh,y
	call gotoxy
	push dx
	mov dx, offset delapan1
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset delapan2
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset delapan3
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset delapan4
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset delapan5
	call writestring
	pop dx
	popad
	ret
delapan ENDP

;////////////////////////////
;Sembilan
;////////////////////////////	

sembilan PROC,x:BYTE,y:BYTE
	pushad
	mov dl,x
	mov dh,y
	call gotoxy
	push dx
	mov dx, offset sembilan1
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset sembilan2
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset sembilan3
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	push dx
	call gotoxy
	mov dx, offset sembilan4
	call writestring
	pop dx
	
	mov dl,x
	inc dh
	call gotoxy
	push dx
	mov dx, offset sembilan5
	call writestring
	pop dx
	popad
	ret
sembilan ENDP

;////////////////////////
;Keluar Main
;////////////////////////
END main