// Curses.SWIG.cpp : Defines the exported functions for the DLL application.
//

#include "stdafx.h"
#include "Curses.SWIG.h"


// This is an example of an exported variable
CURSESSWIG_API int nCursesSWIG=0;

// This is an example of an exported function.
CURSESSWIG_API int fnCursesSWIG(void)
{
    return 42;
}

// This is the constructor of a class that has been exported.
// see Curses.SWIG.h for the class definition
CCursesSWIG::CCursesSWIG()
{
    return;
}
