// CursesTest.cpp : Tests for the C pdcurses library.
//

#include "stdafx.h"

int Example1()
{
	initscr();			/* Start curses mode 		  */
	printw("Hello World !!!");	/* Print Hello World		  */
	refresh();			/* Print it on to the real screen */
	getch();			/* Wait for user input */
	endwin();			/* End curses mode		  */

	return 0;
}

int Example2()
{
	int ch;

	initscr();			/* Start curses mode 		*/
	raw();				/* Line buffering disabled	*/
	keypad(stdscr, TRUE);		/* We get F1, F2 etc..		*/
	noecho();			/* Don't echo() while we do getch */
	printw(WACS_VLINE);
	printw("Type any character to see it in bold\n");
	ch = getch();			/* If raw() hadn't been called
							* we have to press enter before it
							* gets to the program 		*/
	if (ch == KEY_F(1))		/* Without keypad enabled this will */
		printw("F1 Key pressed");/*  not get to us either	*/
								 /* Without noecho() some ugly escape
								 * charachters might have been printed
								 * on screen			*/
	else
	{
		printw("The pressed key is ");
		attron(A_BLINK);
		printw("%c", ch);
		attroff(A_BLINK);
	}
	refresh();			/* Print it on to the real screen */
	getch();			/* Wait for user input */
	endwin();			/* End curses mode		  */

	return 0;
}

int Example3()
{
	char mesg[] = "Just a string";		/* message to be appeared on the screen */
	int row, col;				/* to store the number of rows and *
								* the number of colums of the screen */
	initscr();				/* start the curses mode */
	getmaxyx(stdscr, row, col);		/* get the number of rows and columns */
	mvprintw(row / 2, (col - strlen(mesg)) / 2, "%s", mesg);
	/* print the message at the center of the screen */
	mvprintw(row - 2, 0, "This screen has %d rows and %d columns\n", row, col);
	printw("Try resizing your window(if possible) and then run this program again");
	refresh();
	getch();
	endwin();

	return 0;
}

int main()
{
	return Example3();
}



