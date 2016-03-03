using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cursesdotnet
{
    public class Curses
    {
        public static WINDOW StdScr { get; private set; }

        public static WINDOW InitScr()
        {
            return StdScr = _curses.initscr();
        }

        public static int EndWin()
        {
            return _curses.endwin();
        }

        public static int Refresh()
        {
            return _curses.refresh();
        }

        public static int Raw()
        {
            return _curses.raw();
        }

        /// <summary>
        /// Prints a string to the screen.
        /// </summary>
        /// <param name="s">The string to print.</param>
        /// <returns>The number of characters printed.</returns>
        public static int PrintW(string s)
        {
            return _curses.printw(s);
        }

        public static int Keypad(WINDOW w, bool t)
        {
            return _curses.keypad(w, t);
        }
    }
}
