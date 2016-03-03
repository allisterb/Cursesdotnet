using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Cursesdotnet;

namespace Cursesdotnet.Tests
{
    class Program
    {
        static void Main(string[] args)
        {
            Curses.InitScr();
            int c =Curses.PrintW("test");
            Curses.Refresh();
            Curses.EndWin();
        }

        public static void Example2()
        {
            int ch;
            Curses.InitScr();          /* Start curses mode 		*/
            Curses.Raw();           /* Line buffering disabled	*/
            _curses.keypad(_curses.stdscr, true);       /* We get F1, F2 etc..		*/
            _curses.noecho();           /* Don't echo() while we do getch */
            _curses.printw("Type any character to see it in bold\n");
            ch = _curses.wgetch(_curses.stdscr);           /* If raw() hadn't been called
					 * we have to press enter before it
					 * gets to the program 		*/
            if (ch == _curses.KEY_HOME)     /* Without keypad enabled this will */
                _curses.printw("Home Key pressed");/*  not get to us either	*/
                                                   /* Without noecho() some ugly escape
                                                    * charachters might have been printed
                                                    * on screen			*/
            else
            {
                //_curses.("The pressed key is ");
                _curses.attron((uint)_curses.A_BOLD | (uint)_curses.A_REVERSE);
                _curses.printw(string.Format("{0}", ch));
                _curses.attroff((uint)_curses.A_BOLD);
            }
            //_curses.a_
            _curses.refresh();          /* Print it on to the real screen */
            _curses.wgetch(_curses.stdscr);            /* Wait for user input */
            _curses.endwin();           /* End curses mode		  */
        }
    }
}
