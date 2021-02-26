@echo off
title Exercicio jo ken po
mode 80,30
color 0a

:inicio
set vitorias=0
set derrotas=0
set empates=0
cls
echo ------------------------------------------------
set /p nome= DIGITE o SEU NOME: 
echo ================================================
goto:sorteio



:sorteio
set /a num = (%Random%%%5) + 1

if %num% == 1 (
set num=PEDRA) 
if %num% == 2 (
set num=PAPEL)
if %num% == 3 (
set num=TESOURA)
if %num% == 4 (
set num=LARGATO)
if %num% == 5 (
set num=SPOCK)

:menu
cls
echo                    --ooOoo--
echo ===================ooO(_)Ooo====================
echo ------------------------------------------------
echo             BEM VINDO AO JO-KEN-PO %nome%
echo ================================================
echo.
echo [1] PEDRA 
echo [2] PAPEL
echo [3] TESOURA
echo [4] LARGATO
echo [5] SPOCK
echo [E] ENCERRAR O JOGO
echo [R] REGRAS
echo =================================================
echo.

set /p op=Digite opcao desejada:
if %op% == 1 (goto:pedra) 
if %op% == 2 (goto:papel) 
if %op% == 3 (goto:tesoura) 
if %op% == 4 (goto:largato) 
if %op% == 5 (goto:spock) 
if /i %op% == E (goto:encerrar)
if /i %op% == R (goto:regras) else (goto:invalida) 
goto:menu)

:pedra
echo ------------------------------------------------
echo %nome% escolheu: PEDRA
echo Computador escolheu: %num%
echo -------------------------------------------------
if %num% == PEDRA (goto:empates)
if %num% == PAPEL (goto:derrotas) 
if %num% == TESOURA (goto:vitorias)
if %num% == LARGATO (goto:vitorias)
if %num% == SPOCK (goto:derrotas)
goto:placar)

:papel
echo ------------------------------------------------
echo %nome% escolheu:PAPEL
echo Computador escolheu: %num%
echo -------------------------------------------------
if %num% == PEDRA (goto:vitorias)
if %num% == PAPEL (goto:empates)  
if %num% == TESOURA (goto:derrotas) 
if %num% == LARGATO (goto:derrotas) 
if %num% == SPOCK (goto:vitorias)
goto:placar)

:tesoura
echo ------------------------------------------------
echo %nome% escolheu: TESOURA
echo Computador escolheu: %num%
echo -------------------------------------------------
if %num% == PEDRA (goto:derrotas) 
if %num% == PAPEL (goto:vitorias)
if %num% == TESOURA (goto:empates)
if %num% == LARGATO (goto:vitorias)
if %num% == SPOCK (goto:derrotas)
goto:placar)


:largato
echo ------------------------------------------------
echo %nome% escolheu: LARGATO
echo Computador escolheu: %num%
echo -------------------------------------------------
if %num% == PEDRA (goto:derrotas) 
if %num% == PAPEL (goto:vitorias)
if %num% == TESOURA (goto:derrotas) 
if %num% == LARGATO (goto:empates) 
if %num% == SPOCK (goto:vitorias)
goto:placar)

:spock
echo ------------------------------------------------
echo %nome% escolheu: SPOCK
echo Computador escolheu: %num%
echo -------------------------------------------------
if %num% == PEDRA (goto:vitorias)
if %num% == PAPEL (goto:derrotas) 
if %num% == TESOURA (goto:vitorias)
if %num% == LARGATO (goto:derrotas) 
if %num% == SPOCK (goto:empates)
goto:placar)


:vitorias
echo ================================================
echo            PARABENS... VOCE VENCEU!
echo ================================================
set /a vitorias=%vitorias% + 1
pause 
goto:placar

:derrotas
echo ================================================
echo            QUE PENA... VOCE PERDEU 
echo ================================================v
set /a derrotas=%derrotas% + 1
pause 
goto:placar

:empates
echo ================================================
echo             OPS... DEU EMPATE 
echo ================================================
set /a empates=%empates% + 1
pause 
goto:placar
	
:placar
cls
echo.
echo ================================================
echo               PLACAR DO JOGO
echo ================================================
echo VITORIAS: %vitorias%
echo DERROTAS: %derrotas%
echo EMPATES: %empates%
echo.
echo=================================================
pause > nul
set /p resp=DESEJA JOGAR NOVAMENTE ? [S/N]:
if /i %resp% == s (goto:sorteio) else (
	goto:inicio)


:invalida
echo.
echo -------------------------------------------------
echo                OPCAO INVALIDA
echo -------------------------------------------------
pause 
goto:sorteio

:regras 
echo ---------------------------------------------------------------------------
echo                               REGRAS DO JOGO 
echo ===========================================================================
echo PEDRA:
echo    Empata com Pedra; Ganha de Tesoura e Largato; Perde de Papel e Spock;
echo.
echo PAPEL:
echo    Empata com Papel; Ganha de Pedra e Spock; Perde de Tesoura e Largato;
echo.
echo TESOURA:
echo    Empata com Tesoura; Ganha de Largato e Papel; Perde de Pedra e Spock;
echo.
echo LARGATO:
echo    Empata com Largato: Ganha de Papel e Spock; Perde de Pedra e Tesoura;
echo.
echo SPOCK:
echo    Empata com Spock: Ganha de Pedra e Tesoura; Perde de largato e Papel;
echo.
echo ---------------------------------------------------------------------------
pause > nul
goto:menu

:encerrar
set /p resp=DESEJA SAIR DO JOGO ? [S/N]:
if /i %resp% == s (goto:inicio) else (
	goto:inicio)

