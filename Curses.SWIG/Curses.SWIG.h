// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the CURSESSWIG_EXPORTS
// symbol defined on the command line. This symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// CURSESSWIG_API functions as being imported from a DLL, whereas this DLL sees symbols
// defined with this macro as being exported.
#ifdef CURSESSWIG_EXPORTS
#define CURSESSWIG_API __declspec(dllexport)
#else
#define CURSESSWIG_API __declspec(dllimport)
#endif

// This class is exported from the Curses.SWIG.dll
class CURSESSWIG_API CCursesSWIG {
public:
	CCursesSWIG(void);
	// TODO: add your methods here.
};

extern CURSESSWIG_API int nCursesSWIG;

CURSESSWIG_API int fnCursesSWIG(void);
