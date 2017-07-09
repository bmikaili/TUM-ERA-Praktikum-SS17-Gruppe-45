; Es folgt 32−Bit−Assembler. 
BITS 32

; Das Label (= Funktionsname) soll als Symbol exportiert werden.
GLOBAL _floatSin

_floatSin:

section __DATA,__data

two: dd 2.0             ; 2 in den Speicher legen
sign: dw 1              ; Vorzeichen des Endergebnisses im Hauptspeicher ablegen
%include "lut.asm"

section __BSS,__bss

modResult: resd 1       ; Zwischenergebnis von Modulo
newValue: resd 1        ; Abgebildete Value
result: resd 1          ; Endergebnis
value: resd 1           ; Eingabewert


section __TEXT,__text

;-----------------------------------------
;-----------------setup-------------------
;-----------------------------------------

finit
mov eax, 0
mov ebx, 0
mov ecx, 0
mov edx, 0
mov esi, 0

push ebp                
mov ebp, esp
fld dword [ebp+8]       
fstp dword [value]      
pop ebp                 ; Value x an Speicherstelle 0

fld dword [value]       ; Value x in FPU-Register pushen
fldpi                   ; Pi in FPU-Register pushen
fmul dword [two]        ; Pi*2 definiert den betrachteten Abschnitt

;----------------setup end----------------


;-----------------------------------------
;-----------------modulo------------------
;-----------------------------------------

modulo:
fdiv st1, st0           ; Value durch 2pi, Ergebnis in ST1  
fld st1                 ; Ergebnis der Rechnung ist Top-Of-Stack
fisttp dword [modResult]; Rundet Ergebnis ab
fild dword [modResult]  ; Integer Ergebnis in FPU-Register pushen
fmul st1                ; Integer Ergebnis * 2pi
fld dword [value]       ; Ursprüngliche Value x in FPU-Register pushen
fsub st0, st1           ; Ergebnis von Value x subtrahieren
fst dword [newValue]    ; Neue Value in Hauptspeicher ablegen

;------------modulo end-------------------


;-----------------------------------------
;------------Abbildung auf Pi/2-----------
;-----------------------------------------

fninit                  ; FPU-Register leeren
fldpi                   ; Pi in FPU-Register pushen
fld dword [newValue]    ; newValue in FPU-Register pushen
fcomi                   ; newValue und Pi vergleichen
jbe lowerEqual          ; Wenn <= dann zu lowerEqual

; if newValue > pi then
mov word [sign], -1     ; Endergebnis später negieren
fsub st0, st1           ; newValue - Pi

lowerEqual:
; else if newValue <= pi then
fld dword [two]         ; 2 in FPU-Register pushen
fdiv st2, st0           ; Pi / 2, Ergebnis in ST2
fstp dword [two]        ; 2 aus FPU-Register poppen
fcomi                   ; newValue und Pi/2 vergleichen

jbe updateValue         ; Falls newValue schon <= pi/2, dann nichts zu tun
; if newValue > pi/2 then
fldpi                   ; Pi in FPU-Register pushen
fsub st0, st1           ; Pi/2 - newValue | newValue auf Bereich 0 bis Pi/2 abgebildet
updateValue:
fst dword [newValue]    ; Neue Value in Hauptspeicher ablegen

;---------Abbildung auf Pi/2 end----------


;-----------------------------------------
;-----------Binäre Intervalsuche ---------
;-----------------------------------------
 
find_interval:
mov eax, lutX           ; Startadresse in eax
mov ebx, lutX           ; Startadresse in ebx
add ebx, 1600           ; Endadresse in ebx

start:
; Pivotadresse = (Obere Schranke - Untere Schranke)/2 + Untere Schranke
mov esi, ebx            ; Obere Schranke in esi
sub esi, eax            ; Obere Schranke - Untere Schranke, Ergebnis in esi
shr esi, 1              ; / 2
add esi, eax            ; + Startadresse, Ergebnis = Pivotadresse in esi

; Pivotadresse an 8-Byte (64 Bit) Raster ausrichten
sub esi, lutX           ; Abstand von aktueller Adresse zur Startadresse
shr esi, 2              ; Pivot durch 8 teilen
shl esi, 2              ; Pivot mit 8 multiplizieren
add esi, lutX           ; Abstand + Startadresse

fninit                  ; FPU-Register leeren
fld dword [newValue]    ; newValue in FPU-Register pushen  
fld dword [esi]         ; Pivotwert in FPU-Register pushen

fcomi                   ; newValue und Pivotwert vergleichen

jb setLowerBound        ; Falls newValue > Pivotwert, setze Untere Schranke auf Pivotadresse

; else if newValue < Pivotwert then
mov ebx, esi            ; Obere Schranke auf Pivotadresse
jmp checkend            ; setLowerBound überspringen

setLowerBound:
; else if newValue > Pivotwert then
mov eax, esi            ; Untere Schranke auf Pivotadresse

; Abbruchbedingung prüfen
checkend:       
mov edx, ebx            ; Obere Schranke in edx speichern
sub edx, eax            ; Obere Schranke - Untere Schranke, Ergebnis in edx
cmp edx, 4              ; Mit 8 vergleichen
jg start                ; Falls Abstand größer als 8 nochmal durchlaufen

endIntervalSearch:

;------Binäre Intervalsuche end-----------     


;-----------------------------------------
;------------Interpolation----------------
;-----------------------------------------

fninit                   ; FPU-Register leeren
fld dword [ebx-4]        ; x-Wert der unteren Schranke in FPU-Register pushen
fld dword [ebx]          ; x-Wert der oberen Schranke in FPU-Register pushen
fld dword [newValue]     ; newValue in FPU-Register pushen

; Prozentuale Nähe ausrechnen
fsub st0, st2            ; newValue - Wert der unteren Schranke
fincstp                  ; FPU-Stackpointer inkrementieren (st0 jetzt auf oberer Schranke)
fsub st0, st1            ; Obere Schranke - Untere Schranke
fdecstp                  ; FPU-Stackpointer dekrementieren (st0 auf newValue - untere Schranke)
fdiv st0, st1            ; Prozentuale Nähe von newValue zu unterer Schranke jetzt in st0


; Ergebnis berechnen
sub eax, lutX            ; Abstand von unterer Schranke zum Start der Lookup-Table X
add eax, lutY            ; Position in der Lookup-Table Y = Adresse von sin(untere Schranke)

sub ebx, lutX            ; Abstand von oberer Schranke zum Start der Lookup-Table Y
add ebx, lutY            ; Position in der Lookup-Table Y = Adresse von sin(obere Schranke)

fld dword [ebx]          ; Y-Wert der oberen Schranke in FPU-Register pushen
fld dword [eax]          ; Y-Wert der unteren Schranke in FPU-Register pushen

fmul st0, st2            ; Y-Wert der unteren Schranke * prozentuale Nähe von newValue zu Y-Wert der unteren Schranke

fld1                     ; 1 in FPU-Register pushen
fsub st0, st3            ; 1 -  prozentuale Nähe = Prozentuale Nähe zu oberer Schranke
fmul st0, st2            ; Y-Wert der oberen Schranke * prozentuale Nähe von newValue zu Y-Wert der oberen Schranke

fadd st0, st1            ; Prozentuale Werte der beiden Schranken ergeben addiert den interpolierten Wert

fild word [sign]         ; Vorzeichen in FPU-Register pushen
fmul st0, st1            ; Falls Value x im Bereich Pi bis 2Pi lag, wird das Ergebnis negiert

;----------Interpolation end--------------

ret