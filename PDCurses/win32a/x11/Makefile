# Makefile for PDCurses library for X11

SHELL		= /bin/bash
THIS		= Makefile



PDCURSES_SRCDIR	= ..

osdir		= .
srcdir		= $(PDCURSES_SRCDIR)/pdcurses
demodir		= $(PDCURSES_SRCDIR)/demos

PDCURSES_CONFIG_H	=$(PDCURSES_SRCDIR)/config.h
PDCURSES_CURSES_H	=$(PDCURSES_SRCDIR)/curses.h
PDCURSES_CURSPRIV_H	=$(PDCURSES_SRCDIR)/curspriv.h
PDCURSES_HEADERS	=$(PDCURSES_CONFIG_H) $(PDCURSES_CURSES_H) \
$(PDCURSES_CURSPRIV_H)
PDCURSES_X11_H		=$(osdir)/pdcx11.h

SHLPRE		= lib
SHLPST		= .so
LD_RXLIB1	= gcc -shared
LD_RXLIB2	=   -L/usr/lib/x86_64-linux-gnu -lXaw -lXmu -lXt -lX11 -lSM -lICE -lXext   -lXpm  -lc

CFLAGS		=  -O2 -Wall

CPPFLAGS	= -DHAVE_CONFIG_H -DXCURSES  -DPDC_WIDE -DPDC_XIM -I$(PDCURSES_SRCDIR)

BUILD		= gcc -c $(CFLAGS) $(CPPFLAGS) -I/usr/include/X11 -I/usr/include
DYN_BUILD	=  $(BUILD) -fPIC -DDYNAMIC -o $@

LINK		=  gcc
#LDFLAGS	= $(LIB_DEPS)     -L/usr/lib/x86_64-linux-gnu -lXaw -lXmu -lXt -lX11 -lSM -lICE -lXext   -lXpm
LDFLAGS		= $(LIBCURSES)     -L/usr/lib/x86_64-linux-gnu -lXaw -lXmu -lXt -lX11 -lSM -lICE -lXext   -lXpm

RANLIB		= ranlib

LIBCURSES	= libXCurses.a

LIB_DEPS        = -L$(PDCURSES_SRCDIR)/x11 -lXCurses

PDCLIBS		= $(LIBCURSES)  libXCurses.so

DEMOS		= firework newdemo newtest ptest rain testcurs tuidemo worm xmas
DEMOOBJS	= firework.o newdemo.o newtest.o ptest.o rain.o testcurs.o tui.o \
tuidemo.o worm.o xmas.o

SHLFILE		= XCurses

all:	$(PDCLIBS) $(DEMOS)

install:
	echo Does nothing at the moment

clean:
	-rm -rf *.o *.sho trace $(PDCLIBS) $(DEMOS)

demos:	$(DEMOS)

distclean: clean
	-rm -f Makefile

mostlyclean: clean

realclean: distclean

LIBOBJS = addch.o addchstr.o addstr.o attr.o beep.o bkgd.o border.o \
clear.o color.o delch.o deleteln.o deprec.o getch.o getstr.o getyx.o \
inch.o inchstr.o initscr.o inopts.o insch.o insstr.o instr.o kernel.o \
keyname.o mouse.o move.o outopts.o overlay.o pad.o panel.o printw.o \
refresh.o scanw.o scr_dump.o scroll.o slk.o termattr.o terminfo.o \
touch.o util.o window.o debug.o

PDCOBJS = pdcclip.o pdcdisp.o pdcgetsc.o pdckbd.o pdcscrn.o pdcsetsc.o \
pdcutil.o pdcx11.o x11.o sb.o ScrollBox.o

LIBSHOBJS = $(LIBOBJS:.o=.sho)
PDCSHOBJS = $(PDCOBJS:.o=.sho)

SHOFILES = $(LIBSHOBJS) $(PDCSHOBJS)

$(LIBCURSES) : $(LIBOBJS) $(PDCOBJS)
	ar rv $@ $?
	-$(RANLIB) $@

$(SHLPRE)$(SHLFILE)$(SHLPST) : $(SHOFILES)
	$(LD_RXLIB1) -o $@ $(SHOFILES) $(LD_RXLIB2)

$(LIBOBJS) $(PDCOBJS) $(SHOFILES) : $(PDCURSES_HEADERS)
$(PDCOBJS) $(PDCSHOBJS) : $(PDCURSES_X11_H)
$(DEMOOBJS) : $(PDCURSES_CURSES_H)
$(DEMOS) : $(LIBCURSES)
terminfo.o terminfo.sho: $(TERM_HEADER)

addch.o: $(srcdir)/addch.c
	$(BUILD) $(srcdir)/addch.c

addchstr.o: $(srcdir)/addchstr.c
	$(BUILD) $(srcdir)/addchstr.c

addstr.o: $(srcdir)/addstr.c
	$(BUILD) $(srcdir)/addstr.c

attr.o: $(srcdir)/attr.c
	$(BUILD) $(srcdir)/attr.c

beep.o: $(srcdir)/beep.c
	$(BUILD) $(srcdir)/beep.c

bkgd.o: $(srcdir)/bkgd.c
	$(BUILD) $(srcdir)/bkgd.c

border.o: $(srcdir)/border.c
	$(BUILD) $(srcdir)/border.c

clear.o: $(srcdir)/clear.c
	$(BUILD) $(srcdir)/clear.c

color.o: $(srcdir)/color.c
	$(BUILD) $(srcdir)/color.c

delch.o: $(srcdir)/delch.c
	$(BUILD) $(srcdir)/delch.c

deleteln.o: $(srcdir)/deleteln.c
	$(BUILD) $(srcdir)/deleteln.c

deprec.o: $(srcdir)/deprec.c
	$(BUILD) $(srcdir)/deprec.c

getch.o: $(srcdir)/getch.c
	$(BUILD) $(srcdir)/getch.c

getstr.o: $(srcdir)/getstr.c
	$(BUILD) $(srcdir)/getstr.c

getyx.o: $(srcdir)/getyx.c
	$(BUILD) $(srcdir)/getyx.c

inch.o: $(srcdir)/inch.c
	$(BUILD) $(srcdir)/inch.c

inchstr.o: $(srcdir)/inchstr.c
	$(BUILD) $(srcdir)/inchstr.c

initscr.o: $(srcdir)/initscr.c
	$(BUILD) $(srcdir)/initscr.c

inopts.o: $(srcdir)/inopts.c
	$(BUILD) $(srcdir)/inopts.c

insch.o: $(srcdir)/insch.c
	$(BUILD) $(srcdir)/insch.c

insstr.o: $(srcdir)/insstr.c
	$(BUILD) $(srcdir)/insstr.c

instr.o: $(srcdir)/instr.c
	$(BUILD) $(srcdir)/instr.c

kernel.o: $(srcdir)/kernel.c
	$(BUILD) $(srcdir)/kernel.c

keyname.o: $(srcdir)/keyname.c
	$(BUILD) $(srcdir)/keyname.c

mouse.o: $(srcdir)/mouse.c
	$(BUILD) $(srcdir)/mouse.c

move.o: $(srcdir)/move.c
	$(BUILD) $(srcdir)/move.c

outopts.o: $(srcdir)/outopts.c
	$(BUILD) $(srcdir)/outopts.c

overlay.o: $(srcdir)/overlay.c
	$(BUILD) $(srcdir)/overlay.c

pad.o: $(srcdir)/pad.c
	$(BUILD) $(srcdir)/pad.c

panel.o: $(srcdir)/panel.c $(PDCURSES_SRCDIR)/panel.h
	$(BUILD) $(srcdir)/panel.c

printw.o: $(srcdir)/printw.c
	$(BUILD) $(srcdir)/printw.c

refresh.o: $(srcdir)/refresh.c
	$(BUILD) $(srcdir)/refresh.c

scanw.o: $(srcdir)/scanw.c
	$(BUILD) $(srcdir)/scanw.c

scr_dump.o: $(srcdir)/scr_dump.c
	$(BUILD) $(srcdir)/scr_dump.c

scroll.o: $(srcdir)/scroll.c
	$(BUILD) $(srcdir)/scroll.c

slk.o: $(srcdir)/slk.c
	$(BUILD) $(srcdir)/slk.c

termattr.o: $(srcdir)/termattr.c
	$(BUILD) $(srcdir)/termattr.c

terminfo.o: $(srcdir)/terminfo.c
	$(BUILD) $(srcdir)/terminfo.c

touch.o: $(srcdir)/touch.c
	$(BUILD) $(srcdir)/touch.c

util.o: $(srcdir)/util.c
	$(BUILD) $(srcdir)/util.c

window.o: $(srcdir)/window.c
	$(BUILD) $(srcdir)/window.c

debug.o: $(srcdir)/debug.c
	$(BUILD) $(srcdir)/debug.c

pdcclip.o: $(osdir)/pdcclip.c
	$(BUILD) $(osdir)/pdcclip.c

pdcdisp.o: $(osdir)/pdcdisp.c
	$(BUILD) $(osdir)/pdcdisp.c

pdcgetsc.o: $(osdir)/pdcgetsc.c
	$(BUILD) $(osdir)/pdcgetsc.c

pdckbd.o: $(osdir)/pdckbd.c
	$(BUILD) $(osdir)/pdckbd.c

pdcscrn.o: $(osdir)/pdcscrn.c
	$(BUILD) $(osdir)/pdcscrn.c

pdcsetsc.o: $(osdir)/pdcsetsc.c
	$(BUILD) $(osdir)/pdcsetsc.c

pdcutil.o: $(osdir)/pdcutil.c
	$(BUILD) $(osdir)/pdcutil.c

pdcx11.o: $(osdir)/pdcx11.c
	$(BUILD) $(osdir)/pdcx11.c

ScrollBox.o: $(osdir)/ScrollBox.c
	$(BUILD) $(osdir)/ScrollBox.c

sb.o: $(osdir)/sb.c
	$(BUILD) $(osdir)/sb.c

x11.o: $(osdir)/x11.c
	$(BUILD) $(osdir)/x11.c

addch.sho: $(srcdir)/addch.c
	$(DYN_BUILD) $(srcdir)/addch.c


addchstr.sho: $(srcdir)/addchstr.c
	$(DYN_BUILD) $(srcdir)/addchstr.c


addstr.sho: $(srcdir)/addstr.c
	$(DYN_BUILD) $(srcdir)/addstr.c


attr.sho: $(srcdir)/attr.c
	$(DYN_BUILD) $(srcdir)/attr.c


beep.sho: $(srcdir)/beep.c
	$(DYN_BUILD) $(srcdir)/beep.c


bkgd.sho: $(srcdir)/bkgd.c
	$(DYN_BUILD) $(srcdir)/bkgd.c


border.sho: $(srcdir)/border.c
	$(DYN_BUILD) $(srcdir)/border.c


clear.sho: $(srcdir)/clear.c
	$(DYN_BUILD) $(srcdir)/clear.c


color.sho: $(srcdir)/color.c
	$(DYN_BUILD) $(srcdir)/color.c


delch.sho: $(srcdir)/delch.c
	$(DYN_BUILD) $(srcdir)/delch.c


deleteln.sho: $(srcdir)/deleteln.c
	$(DYN_BUILD) $(srcdir)/deleteln.c


deprec.sho: $(srcdir)/deprec.c
	$(DYN_BUILD) $(srcdir)/deprec.c


getch.sho: $(srcdir)/getch.c
	$(DYN_BUILD) $(srcdir)/getch.c


getstr.sho: $(srcdir)/getstr.c
	$(DYN_BUILD) $(srcdir)/getstr.c


getyx.sho: $(srcdir)/getyx.c
	$(DYN_BUILD) $(srcdir)/getyx.c


inch.sho: $(srcdir)/inch.c
	$(DYN_BUILD) $(srcdir)/inch.c


inchstr.sho: $(srcdir)/inchstr.c
	$(DYN_BUILD) $(srcdir)/inchstr.c


initscr.sho: $(srcdir)/initscr.c
	$(DYN_BUILD) $(srcdir)/initscr.c


inopts.sho: $(srcdir)/inopts.c
	$(DYN_BUILD) $(srcdir)/inopts.c


insch.sho: $(srcdir)/insch.c
	$(DYN_BUILD) $(srcdir)/insch.c


insstr.sho: $(srcdir)/insstr.c
	$(DYN_BUILD) $(srcdir)/insstr.c


instr.sho: $(srcdir)/instr.c
	$(DYN_BUILD) $(srcdir)/instr.c


kernel.sho: $(srcdir)/kernel.c
	$(DYN_BUILD) $(srcdir)/kernel.c


keyname.sho: $(srcdir)/keyname.c
	$(DYN_BUILD) $(srcdir)/keyname.c


mouse.sho: $(srcdir)/mouse.c
	$(DYN_BUILD) $(srcdir)/mouse.c


move.sho: $(srcdir)/move.c
	$(DYN_BUILD) $(srcdir)/move.c


outopts.sho: $(srcdir)/outopts.c
	$(DYN_BUILD) $(srcdir)/outopts.c


overlay.sho: $(srcdir)/overlay.c
	$(DYN_BUILD) $(srcdir)/overlay.c


pad.sho: $(srcdir)/pad.c
	$(DYN_BUILD) $(srcdir)/pad.c


panel.sho: $(srcdir)/panel.c $(PDCURSES_SRCDIR)/panel.h
	$(DYN_BUILD) $(srcdir)/panel.c


printw.sho: $(srcdir)/printw.c
	$(DYN_BUILD) $(srcdir)/printw.c


refresh.sho: $(srcdir)/refresh.c
	$(DYN_BUILD) $(srcdir)/refresh.c


scanw.sho: $(srcdir)/scanw.c
	$(DYN_BUILD) $(srcdir)/scanw.c


scr_dump.sho: $(srcdir)/scr_dump.c
	$(DYN_BUILD) $(srcdir)/scr_dump.c


scroll.sho: $(srcdir)/scroll.c
	$(DYN_BUILD) $(srcdir)/scroll.c


slk.sho: $(srcdir)/slk.c
	$(DYN_BUILD) $(srcdir)/slk.c


termattr.sho: $(srcdir)/termattr.c
	$(DYN_BUILD) $(srcdir)/termattr.c


terminfo.sho: $(srcdir)/terminfo.c
	$(DYN_BUILD) $(srcdir)/terminfo.c


touch.sho: $(srcdir)/touch.c
	$(DYN_BUILD) $(srcdir)/touch.c


util.sho: $(srcdir)/util.c
	$(DYN_BUILD) $(srcdir)/util.c


window.sho: $(srcdir)/window.c
	$(DYN_BUILD) $(srcdir)/window.c


debug.sho: $(srcdir)/debug.c
	$(DYN_BUILD) $(srcdir)/debug.c


pdcclip.sho: $(osdir)/pdcclip.c
	$(DYN_BUILD) $(osdir)/pdcclip.c


pdcdisp.sho: $(osdir)/pdcdisp.c
	$(DYN_BUILD) $(osdir)/pdcdisp.c


pdcgetsc.sho: $(osdir)/pdcgetsc.c
	$(DYN_BUILD) $(osdir)/pdcgetsc.c


pdckbd.sho: $(osdir)/pdckbd.c
	$(DYN_BUILD) $(osdir)/pdckbd.c


pdcscrn.sho: $(osdir)/pdcscrn.c
	$(DYN_BUILD) $(osdir)/pdcscrn.c


pdcsetsc.sho: $(osdir)/pdcsetsc.c
	$(DYN_BUILD) $(osdir)/pdcsetsc.c


pdcutil.sho: $(osdir)/pdcutil.c
	$(DYN_BUILD) $(osdir)/pdcutil.c


pdcx11.sho: $(osdir)/pdcx11.c
	$(DYN_BUILD) $(osdir)/pdcx11.c


ScrollBox.sho: $(osdir)/ScrollBox.c
	$(DYN_BUILD) $(osdir)/ScrollBox.c


sb.sho: $(osdir)/sb.c
	$(DYN_BUILD) $(osdir)/sb.c


x11.sho: $(osdir)/x11.c
	$(DYN_BUILD) $(osdir)/x11.c


firework: firework.o
	$(LINK) firework.o -o $@ $(LDFLAGS)

newdemo: newdemo.o
	$(LINK) newdemo.o -o $@ $(LDFLAGS)

newtest: newtest.o
	$(LINK) newtest.o -o $@ $(LDFLAGS)

ptest: ptest.o
	$(LINK) ptest.o -o $@ $(LDFLAGS)

rain: rain.o
	$(LINK) rain.o -o $@ $(LDFLAGS)

testcurs: testcurs.o
	$(LINK) testcurs.o -o $@ $(LDFLAGS)

tuidemo: tuidemo.o tui.o
	$(LINK) tui.o tuidemo.o -o $@ $(LDFLAGS)

worm: worm.o
	$(LINK) worm.o -o $@ $(LDFLAGS)

xmas: xmas.o
	$(LINK) xmas.o -o $@ $(LDFLAGS)

firework.o: $(demodir)/firework.c
	$(BUILD) $(demodir)/firework.c

newdemo.o: $(demodir)/newdemo.c
	$(BUILD) $(demodir)/newdemo.c

newtest.o: $(demodir)/newtest.c
	$(BUILD) $(demodir)/newtest.c

ptest.o: $(demodir)/ptest.c $(PDCURSES_SRCDIR)/panel.h
	$(BUILD) $(demodir)/ptest.c

rain.o: $(demodir)/rain.c
	$(BUILD) $(demodir)/rain.c

testcurs.o: $(demodir)/testcurs.c
	$(BUILD) $(demodir)/testcurs.c

tui.o: $(demodir)/tui.c $(demodir)/tui.h
	$(BUILD) $(demodir)/tui.c

tuidemo.o: $(demodir)/tuidemo.c
	$(BUILD) $(demodir)/tuidemo.c

worm.o: $(demodir)/worm.c
	$(BUILD) $(demodir)/worm.c

xmas.o: $(demodir)/xmas.c
	$(BUILD) $(demodir)/xmas.c

# This section provides for compiling and linking the
# ncurses test programs.

ncurses_testdir	= $(HOME)/ncurses-5.6/test

NCURSES_TESTS	= bs gdc hanoi knight tclock ncurses

ncurses_tests: $(NCURSES_TESTS)

ncurses_clean:
	-rm -f *.o trace $(NCURSES_TESTS)

NCFLAGS		= -I. -I$(ncurses_testdir)

bs: bs.o $(LIBCURSES)
	$(LINK) bs.o -o $@ $(LDFLAGS)

gdc: gdc.o $(LIBCURSES)
	$(LINK) gdc.o -o $@ $(LDFLAGS)

hanoi: hanoi.o $(LIBCURSES)
	$(LINK) hanoi.o -o $@ $(LDFLAGS)

knight: knight.o $(LIBCURSES)
	$(LINK) knight.o -o $@ $(LDFLAGS)

tclock: tclock.o $(LIBCURSES)
	$(LINK) tclock.o -o $@ $(LDFLAGS) -lm

view: view.o $(LIBCURSES)
	$(LINK) view.o -o $@ $(LDFLAGS)

ncurses: ncurses.o $(LIBCURSES)
	$(LINK) ncurses.o -o $@ $(LDFLAGS)

bs.o: $(ncurses_testdir)/bs.c $(PDCURSES_CURSES_H)
	$(BUILD) $(NCFLAGS) $(ncurses_testdir)/bs.c

gdc.o: $(ncurses_testdir)/gdc.c $(PDCURSES_CURSES_H)
	$(BUILD) $(NCFLAGS) $(ncurses_testdir)/gdc.c

hanoi.o: $(ncurses_testdir)/hanoi.c $(PDCURSES_CURSES_H)
	$(BUILD) $(NCFLAGS) $(ncurses_testdir)/hanoi.c

knight.o: $(ncurses_testdir)/knight.c $(PDCURSES_CURSES_H)
	$(BUILD) $(NCFLAGS) $(ncurses_testdir)/knight.c

tclock.o: $(ncurses_testdir)/tclock.c $(PDCURSES_CURSES_H)
	$(BUILD) $(NCFLAGS) $(ncurses_testdir)/tclock.c

view.o: $(ncurses_testdir)/view.c $(PDCURSES_CURSES_H)
	$(BUILD) $(NCFLAGS) $(ncurses_testdir)/view.c

ncurses.o: $(ncurses_testdir)/ncurses.c $(PDCURSES_CURSES_H)
	$(BUILD) $(NCFLAGS) $(ncurses_testdir)/ncurses.c
