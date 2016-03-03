%module _panel
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
#include <panel.h>
%}

/* functions */
extern  WINDOW* panel_window(const PANEL *);
extern  void    update_panels(void);
extern  int     hide_panel(PANEL *);
extern  int     show_panel(PANEL *);
extern  int     del_panel(PANEL *);
extern  int     top_panel(PANEL *);
extern  int     bottom_panel(PANEL *);
extern  PANEL*  new_panel(WINDOW *);
extern  PANEL*  panel_above(const PANEL *);
extern  PANEL*  panel_below(const PANEL *);
extern  int     set_panel_userptr(PANEL *, const void *);
extern  const void* panel_userptr(const PANEL *);
extern  int     move_panel(PANEL *, int, int);
extern  int     replace_panel(PANEL *,WINDOW *);
extern	int     panel_hidden(const PANEL *);
