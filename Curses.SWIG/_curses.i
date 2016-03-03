%module _curses
%{
/*        Copyright (c) 2000 by Harry Henry Gebel

        Permission is hereby granted, free of charge, to any person
        obtaining a copy of this software and associated documentation files
        (the "Software"), to deal in the Software without restriction,
        including without limitation the rights to use, copy, modify, merge,
        publish, distribute, sublicense, and/or sell copies of the Software,
        and to permit persons to whom the Software is furnished to do so,
        subject to the following conditions:

        The above copyright notice and this permission notice shall be
        included in all copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
        EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
        MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
        NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
        BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
        ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
        CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        SOFTWARE. */

#include "curses.h"
%}
%include cpointer.i

/* typedefs */
typedef unsigned long chtype;
typedef chtype attr_t;



/* CONSTANTS */
#define A_NORMAL	0L
#define A_ATTRIBUTES	-256
#define A_CHARTEXT	255
#define A_COLOR		65280
#define A_STANDOUT	65536
#define A_UNDERLINE	131072
#define A_REVERSE	262144
#define A_BLINK		524288
#define A_DIM		1048576
#define A_BOLD		2097152
#define A_ALTCHARSET	4194304	
#define A_INVIS		8388608
#define A_PROTECT	16777216
#define A_HORIZONTAL	33554432
#define A_LEFT		67108864
#define A_LOW		134217728
#define A_RIGHT		268435456
#define A_TOP		536870912	
#define A_VERTICAL	1073741824	
#define TRUE    1
#define FALSE   0
#define COLOR_BLACK	0
#define COLOR_RED	1
#define COLOR_GREEN	2
#define COLOR_YELLOW	3
#define COLOR_BLUE	4
#define COLOR_MAGENTA	5
#define COLOR_CYAN	6
#define COLOR_WHITE	7
#define _SUBWIN         0x01
#define _ENDLINE        0x02
#define _FULLWIN        0x04
#define _SCROLLWIN      0x08
#define _ISPAD	        0x10
#define _HASMOVED       0x20
#define _WRAPPED        0x40
#define CCHARW_MAX	5
#define KEY_CODE_YES	0400
#define KEY_MIN		0401
#define KEY_BREAK       0401
#define KEY_DOWN        0402
#define KEY_UP          0403
#define KEY_LEFT        0404
#define KEY_RIGHT       0405
#define KEY_HOME        0406
#define KEY_BACKSPACE   0407
#define KEY_F0          0410
#define KEY_DL          0510
#define KEY_IL          0511
#define KEY_DC          0512
#define KEY_IC          0513
#define KEY_EIC         0514
#define KEY_CLEAR       0515
#define KEY_EOS         0516
#define KEY_EOL         0517
#define KEY_SF          0520
#define KEY_SR          0521
#define KEY_NPAGE       0522
#define KEY_PPAGE       0523
#define KEY_STAB        0524
#define KEY_CTAB        0525
#define KEY_CATAB       0526
#define KEY_ENTER       0527
#define KEY_SRESET      0530
#define KEY_RESET       0531
#define KEY_PRINT       0532
#define KEY_LL          0533
#define KEY_A1		0534
#define KEY_A3		0535
#define KEY_B2		0536
#define KEY_C1		0537
#define KEY_C3		0540
#define KEY_BTAB	0541
#define KEY_BEG		0542
#define KEY_CANCEL	0543
#define KEY_CLOSE	0544
#define KEY_COMMAND	0545
#define KEY_COPY	0546
#define KEY_CREATE	0547
#define KEY_END		0550
#define KEY_EXIT	0551
#define KEY_FIND	0552
#define KEY_HELP	0553
#define KEY_MARK	0554
#define KEY_MESSAGE	0555
#define KEY_MOVE	0556
#define KEY_NEXT	0557
#define KEY_OPEN	0560
#define KEY_OPTIONS	0561
#define KEY_PREVIOUS	0562
#define KEY_REDO	0563
#define KEY_REFERENCE	0564
#define KEY_REFRESH	0565
#define KEY_REPLACE	0566
#define KEY_RESTART	0567
#define KEY_RESUME	0570
#define KEY_SAVE	0571
#define KEY_SBEG	0572
#define KEY_SCANCEL	0573
#define KEY_SCOMMAND	0574
#define KEY_SCOPY	0575
#define KEY_SCREATE	0576
#define KEY_SDC		0577
#define KEY_SDL		0600
#define KEY_SELECT	0601
#define KEY_SEND	0602
#define KEY_SEOL	0603
#define KEY_SEXIT	0604
#define KEY_SFIND	0605
#define KEY_SHELP	0606
#define KEY_SHOME	0607
#define KEY_SIC		0610
#define KEY_SLEFT	0611
#define KEY_SMESSAGE	0612
#define KEY_SMOVE	0613
#define KEY_SNEXT	0614
#define KEY_SOPTIONS	0615
#define KEY_SPREVIOUS	0616
#define KEY_SPRINT	0617
#define KEY_SREDO	0620
#define KEY_SREPLACE	0621
#define KEY_SRIGHT	0622
#define KEY_SRSUME	0623
#define KEY_SSAVE	0624
#define KEY_SSUSPEND	0625
#define KEY_SUNDO	0626
#define KEY_SUSPEND	0627
#define KEY_UNDO	0630
#define KEY_MOUSE	0631
#define KEY_RESIZE	0632
#define KEY_MAX		0777
#define NCURSES_MOUSE_VERSION	1
#define	BUTTON1_RELEASED	000000000001L
#define	BUTTON1_PRESSED		000000000002L
#define	BUTTON1_CLICKED		000000000004L
#define	BUTTON1_DOUBLE_CLICKED	000000000010L
#define	BUTTON1_TRIPLE_CLICKED	000000000020L
#define BUTTON1_RESERVED_EVENT	000000000040L
#define	BUTTON2_RELEASED	000000000100L
#define	BUTTON2_PRESSED		000000000200L
#define	BUTTON2_CLICKED		000000000400L
#define	BUTTON2_DOUBLE_CLICKED	000000001000L
#define	BUTTON2_TRIPLE_CLICKED	000000002000L
#define BUTTON2_RESERVED_EVENT	000000004000L
#define	BUTTON3_RELEASED	000000010000L
#define	BUTTON3_PRESSED		000000020000L
#define	BUTTON3_CLICKED		000000040000L
#define	BUTTON3_DOUBLE_CLICKED	000000100000L
#define	BUTTON3_TRIPLE_CLICKED	000000200000L
#define BUTTON3_RESERVED_EVENT	000000400000L
#define	BUTTON4_RELEASED	000001000000L
#define	BUTTON4_PRESSED		000002000000L
#define	BUTTON4_CLICKED		000004000000L
#define	BUTTON4_DOUBLE_CLICKED	000010000000L
#define	BUTTON4_TRIPLE_CLICKED	000020000000L
#define BUTTON4_RESERVED_EVENT	000040000000L
#define BUTTON_CTRL		000100000000L
#define BUTTON_SHIFT		000200000000L
#define BUTTON_ALT		000400000000L
#define	ALL_MOUSE_EVENTS	000777777777L
#define	REPORT_MOUSE_POSITION	001000000000L
#define TRACE_DISABLE	0x0000
#define TRACE_TIMES	0x0001
#define TRACE_TPUTS	0x0002
#define TRACE_UPDATE	0x0004
#define TRACE_MOVE	0x0008
#define TRACE_CHARPUT	0x0010
#define TRACE_ORDINARY	0x001F
#define TRACE_CALLS	0x0020
#define TRACE_VIRTPUT	0x0040
#define TRACE_IEVENT	0x0080
#define TRACE_BITS	0x0100
#define TRACE_ICALLS	0x0200
#define TRACE_CCALLS	0x0400
#define TRACE_MAXIMUM	0xffff
#define OPTIMIZE_MVCUR		0x01
#define OPTIMIZE_HASHMAP	0x02
#define OPTIMIZE_SCROLL		0x04
#define OPTIMIZE_ALL		0xff
#define	E_OK			0
#define	E_SYSTEM_ERROR	 	-1
#define	E_BAD_ARGUMENT	 	-2
#define	E_POSTED	 	-3
#define	E_CONNECTED	 	-4
#define	E_BAD_STATE	 	-5
#define	E_NO_ROOM	 	-6
#define	E_NOT_POSTED		-7
#define	E_UNKNOWN_COMMAND	-8
#define	E_NO_MATCH		-9
#define	E_NOT_SELECTABLE	-10
#define	E_NOT_CONNECTED	        -11
#define	E_REQUEST_DENIED	-12
#define	E_INVALID_FIELD	        -13
#define	E_CURRENT		-14


/* global variables */
%readonly
extern WINDOW   *stdscr;
extern int	LINES;
extern int	COLS;
extern int	TABSIZE;
extern int COLORS;
extern int COLOR_PAIRS;
extern chtype acs_map[];
%readwrite

/* functions */
/* extern char *keybound (int, int); */
extern const char *curses_version (void);
/* extern int define_key (char *, int);
extern int keyok (int, bool);
extern int resizeterm (int, int);
*/
extern int use_default_colors (void);
extern int wresize (WINDOW *, int, int);
extern int baudrate(void);
extern int beep(void);
extern bool can_change_color(void);
extern int cbreak(void);
extern int clearok(WINDOW *,bool);
extern int color_content(short,short*,short*,short*);
extern int copywin(const WINDOW*,WINDOW*,int,int,int,int,int,int,int);
extern int curs_set(int);
extern int def_prog_mode(void);
extern int def_shell_mode(void);
extern int delay_output(int);
extern void delscreen(SCREEN *);
extern int delwin(WINDOW *);
extern WINDOW *derwin(WINDOW *,int,int,int,int);
extern int doupdate(void);
extern WINDOW *dupwin(WINDOW *);
extern int echo(void);
extern int endwin(void);
extern char erasechar(void);
extern void filter(void);
extern int flash(void);
extern int flushinp(void);
extern WINDOW *getwin(FILE *);
extern int halfdelay(int);
extern bool has_colors(void);
extern bool has_ic(void);
extern bool has_il(void);
extern void idcok(WINDOW *, bool);
extern int idlok(WINDOW *, bool);
extern void immedok(WINDOW *, bool);
extern WINDOW *initscr(void);
extern int init_color(short,short,short,short);
extern int init_pair(short,short,short);
extern int intrflush(WINDOW *,bool);
extern bool isendwin(void);
extern bool is_linetouched(WINDOW *,int);
extern bool is_wintouched(WINDOW *);
extern const char *keyname(int);
extern int keypad(WINDOW *,bool);
extern char killchar(void);
extern int leaveok(WINDOW *,bool);
extern char *longname(void);
extern int meta(WINDOW *,bool);
extern int mvcur(int,int,int,int);
extern int mvderwin(WINDOW *, int, int);
extern int mvwin(WINDOW *,int,int);
extern int napms(int);
extern WINDOW *newpad(int,int);
extern SCREEN *newterm(const char *,FILE *,FILE *);
extern WINDOW *newwin(int,int,int,int);
extern int nl(void);
extern int nocbreak(void);
extern int nodelay(WINDOW *,bool);
extern int noecho(void);
extern int nonl(void);
extern void noqiflush(void);
extern int noraw(void);
extern int notimeout(WINDOW *,bool);
extern int overlay(const WINDOW*,WINDOW *);
extern int overwrite(const WINDOW*,WINDOW *);
extern int pair_content(short,short*,short*);
extern int pechochar(WINDOW *, const chtype);
extern int pnoutrefresh(WINDOW*,int,int,int,int,int,int);
extern int prefresh(WINDOW *,int,int,int,int,int,int);
/* extern int putp(const char *); */
extern int putwin(WINDOW *, FILE *);
extern void qiflush(void);
extern int raw(void);
extern int resetty(void);
extern int reset_prog_mode(void);
extern int reset_shell_mode(void);
extern int savetty(void);
extern int scr_dump(const char *);
extern int scr_init(const char *);
extern int scrollok(WINDOW *,bool);
extern int scr_restore(const char *);
extern int scr_set(const char *);9
extern SCREEN *set_term(SCREEN *);
extern int slk_attroff(const chtype);
extern int slk_attron(const chtype);
extern int slk_attrset(const chtype);
/* extern attr_t slk_attr(void); */
extern int slk_attr_set(const attr_t,short,void*);
extern int slk_clear(void);
extern int slk_color(short);
extern int slk_init(int);
extern char *slk_label(int);
extern int slk_noutrefresh(void);
extern int slk_refresh(void);
extern int slk_restore(void);
extern int slk_set(int,const char *,int);
extern int slk_touch(void);
extern int start_color(void);
extern WINDOW *subpad(WINDOW *, int, int, int, int);
extern WINDOW *subwin(WINDOW *,int,int,int,int);
extern int syncok(WINDOW *, bool);
extern chtype termattrs(void);
extern char *termname(void);
/*
extern int tigetflag(const char *);
extern int tigetnum(const char *);
extern char *tigetstr(const char *);
*/
extern int typeahead(int);
extern int ungetch(int);
extern void use_env(bool);
extern int vidattr(chtype);
extern int vwprintw(WINDOW *, const char *,va_list);
extern int vwscanw(WINDOW *, const char *,va_list);
extern int waddch(WINDOW *, const chtype);
extern int waddchnstr(WINDOW *,const chtype *,int);
extern int waddnstr(WINDOW *,const char *,int);
extern int wattr_on(WINDOW *, const attr_t, void *);
extern int wattr_off(WINDOW *, const attr_t, void *);
extern int wbkgd(WINDOW *,const chtype);
extern void wbkgdset(WINDOW *,chtype);
extern int wborder(WINDOW *,chtype,chtype,chtype,chtype,chtype,chtype,chtype,chtype);
extern int wchgat(WINDOW *, int, attr_t, short, const void *);
extern int wclear(WINDOW *);
extern int wclrtobot(WINDOW *);
extern int wclrtoeol(WINDOW *);
extern int wcolor_set(WINDOW*,short,void*);
extern void wcursyncup(WINDOW *);
extern int wdelch(WINDOW *);
extern int wechochar(WINDOW *, const chtype);
extern int werase(WINDOW *);
extern int wgetch(WINDOW *);
extern int wgetnstr(WINDOW *,char *,int);
extern int whline(WINDOW *, chtype, int);
extern chtype winch(WINDOW *);
extern int winchnstr(WINDOW *, chtype *, int);
extern int winnstr(WINDOW *, char *, int);
extern int winsch(WINDOW *, chtype);
extern int winsdelln(WINDOW *,int);
extern int winsnstr(WINDOW *, const char *,int);
extern int wmove(WINDOW *,int,int);
extern int wnoutrefresh(WINDOW *);
extern int wredrawln(WINDOW *,int,int);
extern int wrefresh(WINDOW *);
extern int wscrl(WINDOW *,int);
extern int wsetscrreg(WINDOW *,int,int);
extern void wsyncdown(WINDOW *);
extern void wsyncup(WINDOW *);
extern void wtimeout(WINDOW *,int);
extern int wtouchln(WINDOW *,int,int,int);
extern int wvline(WINDOW *,chtype,int);
/* extern int getmouse(MEVENT *); */
extern int ungetmouse(MEVENT *);
extern mmask_t mousemask(mmask_t, mmask_t *);
extern bool wenclose(const WINDOW *, int, int);
extern int mouseinterval(int);
extern bool wmouse_trafo(const WINDOW* win,int* y, int* x, bool to_screen);
/* extern int mcprint(char *, int); */
extern int has_key(int);
/* extern char *_nc_tracebits(void);
extern char *_tracechar(const unsigned char);
extern void trace(const unsigned int);
extern const char *_nc_visbuf(const char *);
*/
extern void GetYX(WINDOW *,int *,int *);
extern void GetMaxYX(WINDOW *,int *,int *);
extern void GetBegYX(WINDOW *,int *,int *);

%{

extern void GetYX(WINDOW *win,int *y,int *x)
{
  *y=win->_cury;
  *x=win->_curx;
}

extern void GetMaxYX(WINDOW *win,int *y,int *x)
{
  *y=win->_maxy;
  *x=win->_maxx;
}

extern void GetBegYX(WINDOW *win,int *y,int *x)
{
  *y=win->_begy;
  *x=win->_begx;
}

%}
