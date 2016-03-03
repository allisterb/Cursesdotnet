%module _menu
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
#include <menu.h>

ITEM *void_new_item(void *, void *);

%}

/* typedefs */
typedef unsigned long chtype;
typedef int Menu_Options;
typedef int Item_Options;

/* constants */
#define O_ONEVALUE      0x01
#define O_SHOWDESC      0x02
#define O_ROWMAJOR      0x04
#define O_IGNORECASE    0x08
#define O_SHOWMATCH     0x10
#define O_NONCYCLIC     0x20
#define O_SELECTABLE    0x01
#define REQ_LEFT_ITEM           511 + 1
#define REQ_RIGHT_ITEM          511 + 2
#define REQ_UP_ITEM             511 + 3
#define REQ_DOWN_ITEM           511 + 4
#define REQ_SCR_ULINE           511 + 5
#define REQ_SCR_DLINE           511 + 6
#define REQ_SCR_DPAGE           511 + 7
#define REQ_SCR_UPAGE           511 + 8
#define REQ_FIRST_ITEM          511 + 9
#define REQ_LAST_ITEM           511 + 10
#define REQ_NEXT_ITEM           511 + 11
#define REQ_PREV_ITEM           511 + 12
#define REQ_TOGGLE_ITEM         511 + 13
#define REQ_CLEAR_PATTERN       511 + 14
#define REQ_BACK_PATTERN        511 + 15
#define REQ_NEXT_MATCH          511 + 16
#define REQ_PREV_MATCH          511 + 17
#define MIN_MENU_COMMAND        511 + 1
#define MAX_MENU_COMMAND        511 + 17

/* functions */
extern ITEM     **menu_items(const MENU *);
extern ITEM     *current_item(const MENU *);
ITEM *void_new_item(void *, void *);
extern ITEM *new_item(const char *,const char *);
extern MENU     *new_menu(ITEM **);
extern Item_Options  item_opts(const ITEM *);
extern Menu_Options  menu_opts(const MENU *);
extern WINDOW   *menu_sub(const MENU *);
extern WINDOW *menu_win(const MENU *);
extern const char *item_description(const ITEM *);
extern const char *item_name(const ITEM *);
extern const char *menu_mark(const MENU *);
extern const char *menu_request_name(int);
extern char     *menu_pattern(const MENU *);
extern void     *menu_userptr(const MENU *);
extern void *item_userptr(const ITEM *);
extern chtype   menu_back(const MENU *);
extern chtype menu_fore(const MENU *);
extern chtype menu_grey(const MENU *);
extern int      free_item(ITEM *);
extern int free_menu(MENU *);
extern int item_count(const MENU *);
extern int item_index(const ITEM *);
extern int item_opts_off(ITEM *,Item_Options);
extern int item_opts_on(ITEM *,Item_Options);
extern int menu_driver(MENU *,int);
extern int menu_opts_off(MENU *,Menu_Options);
extern int menu_opts_on(MENU *,Menu_Options);
extern int menu_pad(const MENU *);
extern int pos_menu_cursor(const MENU *);
extern int post_menu(MENU *);
extern int scale_menu(const MENU *,int *,int *);
extern int set_current_item(MENU *menu,ITEM *item);
extern int set_item_opts(ITEM *,Item_Options);
extern int set_item_userptr(ITEM *, void *);
extern int set_item_value(ITEM *,bool);
extern int set_menu_back(MENU *,chtype);
extern int set_menu_fore(MENU *,chtype);
extern int set_menu_format(MENU *,int,int);
extern int set_menu_grey(MENU *,chtype);
extern int set_menu_items(MENU *,ITEM **);
extern int set_menu_mark(MENU *, const char *);
extern int set_menu_opts(MENU *,Menu_Options);
extern int set_menu_pad(MENU *,int);
extern int set_menu_pattern(MENU *,const char *);
extern int set_menu_sub(MENU *,WINDOW *);
extern int set_menu_userptr(MENU *,void *);
extern int set_menu_win(MENU *,WINDOW *);
extern int set_top_row(MENU *,int);
extern int top_row(const MENU *);
extern int unpost_menu(MENU *);
extern int menu_request_by_name(const char *);
extern int set_menu_spacing(MENU *,int,int,int);
extern int menu_spacing(const MENU *,int *,int *,int *);
extern bool     item_value(const ITEM *);
extern bool item_visible(const ITEM *);
void            menu_format(const MENU *,int *,int *);

/* trick SWIG into passing character pointers */
%{
ITEM *void_new_item(void *name, void *description) {
  return new_item((char *) name, (char *) description);
}
%}