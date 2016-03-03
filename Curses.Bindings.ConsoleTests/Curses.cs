using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Curses.Bindings.ConsoleTests
{
    /// <summary>
    /// High-level .NET interface to the curses/pcurses library bindings.
    /// </summary>
    public class Curses
    {
        public static WINDOW StdScr { get; private set; }
        
        public static void InitScr()
        {
            StdScr = _curses.initscr();
        } 

        public static void PrintW(string s)
        {
            _curses.printw(s);
        }
    }
}
