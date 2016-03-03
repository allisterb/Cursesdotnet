using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cursesdotnet
{
   
    public static class Video
    {
        public static readonly uint A_BLINK = (uint) _curses.A_BLINK;
    }

    public class Curses
    {

        public static WINDOW StdScr { get; private set; }

        /// <summary>
        /// The initscr() function determines the terminal type and initialises all implementation data structures. 
        /// Portable applications must not call initscr() twice. 
        /// </summary>
        /// <remarks>
        /// The initscr() function also causes the first refresh operation to clear the screen. If errors occur, initscr() writes an appropriate error message to standard error and exits. The only functions that can be called before initscr() or newterm() are filter(), ripoffline(), slk_init(), use_env() and the functions whose prototypes are defined in <term.h>.
        /// </remarks>
        /// <returns>Upon successful completion, initscr() returns a pointer to stdscr. Otherwise, it does not return. </returns>
        public static WINDOW InitScr()
        {
            return _curses.initscr();
        }

        /// <summary>
        /// The endwin() function restores the terminal after Curses activity by at least restoring the saved shell terminal mode, flushing any output to the terminal and moving the cursor to the first column of the last line of the screen. Refreshing a window resumes program mode. The application must call endwin() for each terminal being used before exiting.
        /// </summary>
        /// <returns></returns>
        public static bool EndWin()
        {
            return _curses.endwin() == _curses.OK ? true : false;
        }

        /// <summary>
        /// The refresh() and wrefresh() functions refresh the current or specified window. The functions position the terminal's cursor at the cursor position of the window, except that if the leaveok() mode has been enabled, they may leave the cursor at an arbitrary position. 
        /// </summary>
        /// <returns>Upon successful completion, these functions return true. Otherwise they return false. </returns>
        public static bool Refresh()
        {
            return _curses.refresh() == _curses.OK ? true : false;
        }

        /// <summary>
        /// raw - set Raw Mode. 
        /// </summary>
        /// <returns>Upon successful completion, these functions return true. Otherwise they return Efalse. </returns>
        public static bool Raw()
        {
            return _curses.raw() == _curses.OK ? true : false;
        }

        /// <summary>
        /// printw - print formatted output in the current window.
        /// </summary>
        /// <param name="s">The string to print.</param>
        /// <returns>The number of characters printed.</returns>
        public static int PrintW(string s)
        {
            return _curses.printw(s);
        }

        /// <summary>
        /// The keypad() function controls keypad translation. If bf is TRUE, keypad translation is turned on. If bf is FALSE, keypad translation is turned off. The initial state is FALSE. 
        /// </summary>
        /// <param name="win"></param>
        /// <param name="bf"></param>
        /// <returns></returns>
        public static bool Keypad(WINDOW win, bool bf)
        {
            return _curses.keypad(win, bf) == _curses.OK ? true : false; 
        }
    }
}
