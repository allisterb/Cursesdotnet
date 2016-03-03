%module _form
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
#include <form.h>
%}



/* typedefs */
typedef unsigned long chtype
typedef int Form_Options;
typedef int Field_Options;

/* constants */
#define NO_JUSTIFICATION	0
#define JUSTIFY_LEFT		1
#define JUSTIFY_CENTER		2
#define JUSTIFY_RIGHT		3
#define O_VISIBLE		0x0001
#define O_ACTIVE		0x0002
#define O_PUBLIC		0x0004
#define O_EDIT			0x0008
#define O_WRAP			0x0010
#define O_BLANK			0x0020
#define O_AUTOSKIP		0x0040
#define O_NULLOK		0x0080
#define O_PASSOK		0x0100
#define O_STATIC                0x0200
#define O_NL_OVERLOAD		0x0001
#define O_BS_OVERLOAD		0x0002
#define REQ_NEXT_PAGE	 511 + 1	/* move to next page		*/
#define REQ_PREV_PAGE	 511 + 2	/* move to previous page	*/
#define REQ_FIRST_PAGE	 511 + 3	/* move to first page		*/
#define REQ_LAST_PAGE	 511 + 4	/* move to last page		*/
#define REQ_NEXT_FIELD	 511 + 5	/* move to next field		*/
#define REQ_PREV_FIELD	 511 + 6	/* move to previous field	*/
#define REQ_FIRST_FIELD	 511 + 7	/* move to first field		*/
#define REQ_LAST_FIELD	 511 + 8	/* move to last field		*/
#define REQ_SNEXT_FIELD	 511 + 9	/* move to sorted next field	*/
#define REQ_SPREV_FIELD	 511 + 10	/* move to sorted prev field	*/
#define REQ_SFIRST_FIELD 511 + 11	/* move to sorted first field	*/
#define REQ_SLAST_FIELD	 511 + 12	/* move to sorted last field	*/
#define REQ_LEFT_FIELD	 511 + 13	/* move to left to field	*/
#define REQ_RIGHT_FIELD	 511 + 14	/* move to right to field	*/
#define REQ_UP_FIELD	 511 + 15	/* move to up to field		*/
#define REQ_DOWN_FIELD	 511 + 16	/* move to down to field	*/
#define REQ_NEXT_CHAR	 511 + 17	/* move to next char in field	*/
#define REQ_PREV_CHAR	 511 + 18	/* move to prev char in field	*/
#define REQ_NEXT_LINE	 511 + 19	/* move to next line in field	*/
#define REQ_PREV_LINE	 511 + 20	/* move to prev line in field	*/
#define REQ_NEXT_WORD	 511 + 21	/* move to next word in field	*/
#define REQ_PREV_WORD	 511 + 22	/* move to prev word in field	*/
#define REQ_BEG_FIELD	 511 + 23	/* move to first char in field	*/
#define REQ_END_FIELD	 511 + 24	/* move after last char in fld	*/
#define REQ_BEG_LINE	 511 + 25	/* move to beginning of line	*/
#define REQ_END_LINE	 511 + 26	/* move after last char in line	*/
#define REQ_LEFT_CHAR	 511 + 27	/* move left in field		*/
#define REQ_RIGHT_CHAR	 511 + 28	/* move right in field		*/
#define REQ_UP_CHAR	 511 + 29	/* move up in field		*/
#define REQ_DOWN_CHAR	 511 + 30	/* move down in field		*/
#define REQ_NEW_LINE	 511 + 31	/* insert/overlay new line	*/
#define REQ_INS_CHAR	 511 + 32	/* insert blank char at cursor	*/
#define REQ_INS_LINE	 511 + 33	/* insert blank line at cursor	*/
#define REQ_DEL_CHAR	 511 + 34	/* delete char at cursor	*/
#define REQ_DEL_PREV	 511 + 35	/* delete char before cursor	*/
#define REQ_DEL_LINE	 511 + 36	/* delete line at cursor	*/
#define REQ_DEL_WORD	 511 + 37	/* delete line at cursor	*/
#define REQ_CLR_EOL	 511 + 38	/* clear to end of line		*/
#define REQ_CLR_EOF	 511 + 39	/* clear to end of field	*/
#define REQ_CLR_FIELD	 511 + 40	/* clear entire field		*/
#define REQ_OVL_MODE	 511 + 41	/* begin overlay mode		*/
#define REQ_INS_MODE	 511 + 42	/* begin insert mode		*/
#define REQ_SCR_FLINE	 511 + 43	/* scroll field forward a line	*/
#define REQ_SCR_BLINE	 511 + 44	/* scroll field backward a line	*/
#define REQ_SCR_FPAGE	 511 + 45	/* scroll field forward a page	*/
#define REQ_SCR_BPAGE	 511 + 46	/* scroll field backward a page	*/
#define REQ_SCR_FHPAGE   511 + 47 /* scroll field forward  half page */
#define REQ_SCR_BHPAGE   511 + 48 /* scroll field backward half page */
#define REQ_SCR_FCHAR    511 + 49 /* horizontal scroll char          */
#define REQ_SCR_BCHAR    511 + 50 /* horizontal scroll char          */
#define REQ_SCR_HFLINE   511 + 51 /* horizontal scroll line          */
#define REQ_SCR_HBLINE   511 + 52 /* horizontal scroll line          */
#define REQ_SCR_HFHALF   511 + 53 /* horizontal scroll half line     */
#define REQ_SCR_HBHALF   511 + 54 /* horizontal scroll half line     */
#define REQ_VALIDATION	 511 + 55	/* validate field		*/
#define REQ_NEXT_CHOICE	 511 + 56	/* display next field choice	*/
#define REQ_PREV_CHOICE	 511 + 57	/* display prev field choice	*/
#define MIN_FORM_COMMAND 511 + 1	/* used by form_driver		*/
#define MAX_FORM_COMMAND 511 + 57	/* used by form_driver		*/

/* functions */
extern FIELD    *new_field(int,int,int,int,int,int),
                *dup_field(FIELD *,int,int),
                *link_field(FIELD *,int,int);

extern int      free_field(FIELD *),
                free_fieldtype(FIELDTYPE *),
                field_info(const FIELD *,int *,int *,int *,int *,int *,int *),
                dynamic_field_info(const FIELD *,int *,int *,int *),
                set_max_field( FIELD *,int),
                move_field(FIELD *,int,int),
                set_new_page(FIELD *,bool),
                set_field_just(FIELD *,int),
                field_just(const FIELD *),
                set_field_fore(FIELD *,chtype),
                set_field_back(FIELD *,chtype),
                set_field_pad(FIELD *,int),
                field_pad(const FIELD *),
                set_field_buffer(FIELD *,int,const char *),
                set_field_status(FIELD *,bool),
                set_field_userptr(FIELD *, void *),
                set_field_opts(FIELD *,Field_Options),
                field_opts_on(FIELD *,Field_Options),
                field_opts_off(FIELD *,Field_Options);

extern chtype   field_fore(const FIELD *),
                field_back(const FIELD *);

extern bool     new_page(const FIELD *),
                field_status(const FIELD *);

extern void     *field_arg(const FIELD *);

extern void     *field_userptr(const FIELD *);

extern FIELDTYPE
                *field_type(const FIELD *);

extern char*    field_buffer(const FIELD *,int);

extern Field_Options  
                field_opts(const FIELD *);

	/******************
	*  FORM routines  *
	******************/
extern FORM     *new_form(FIELD **);

extern FIELD    **form_fields(const FORM *),
                *current_field(const FORM *);

extern WINDOW   *form_win(const FORM *),
                *form_sub(const FORM *);

extern Form_Hook
                form_init(const FORM *),
                form_term(const FORM *),
                field_init(const FORM *),
                field_term(const FORM *);

extern int      free_form(FORM *),
                set_form_fields(FORM *,FIELD **),
                field_count(const FORM *),
                set_form_win(FORM *,WINDOW *),
                set_form_sub(FORM *,WINDOW *),
                set_current_field(FORM *,FIELD *),
                field_index(const FIELD *),
                set_form_page(FORM *,int),
                form_page(const FORM *),
                scale_form(const FORM *,int *,int *),
                set_form_init(FORM *,Form_Hook),
                set_form_term(FORM *,Form_Hook),
                set_field_init(FORM *,Form_Hook),
                set_field_term(FORM *,Form_Hook),
                post_form(FORM *),
                unpost_form(FORM *),
                pos_form_cursor(FORM *),
                form_driver(FORM *,int),
                set_form_userptr(FORM *,void *),
                set_form_opts(FORM *,Form_Options),
                form_opts_on(FORM *,Form_Options),
                form_opts_off(FORM *,Form_Options),
                form_request_by_name(const char *);

extern const char
                *form_request_name(int);

extern void     *form_userptr(const FORM *);

extern Form_Options
                form_opts(const FORM *);

extern bool     data_ahead(const FORM *),
                data_behind(const FORM *);

/* functions to access field types */
extern int field_TYPE_ALPHA(FIELD *field, int min),
           field_TYPE_ALNUM(FIELD *field, int min),
           field_TYPE_ENUM(FIELD *field, char **list, int casef, int match),
           field_TYPE_INTEGER(FIELD *field, int precision, long min, long max),
           field_TYPE_NUMERIC(FIELD *field, int precision, double min, double max),
           field_TYPE_REGEXP(FIELD *field, char *regexp),
           field_TYPE_IPV4(FIELD *field);

%typemap(python,in) PyObject *FLD_CHK {
  if (!PyCallable_Check($source)) {
      PyErr_SetString(PyExc_TypeError, "Need a callable object!");
      return NULL;
  }
  $target = $source;
}

%typemap(python,in) PyObject *PY_FLD,PyObject *CHR_CHK {
  $target = $source;
}

extern int set_callback(FIELD *field,PyObject *PY_FLD,PyObject *FLD_CHK,PyObject *CHR_CHK);
extern void free_validation_callback(void *);

%{
extern int field_TYPE_ALPHA(FIELD *field, int min) {
  return set_field_type(field, TYPE_ALPHA, min); }

extern int field_TYPE_ALNUM(FIELD *field, int min) {
  return set_field_type(field, TYPE_ALNUM, min); }

extern int field_TYPE_ENUM(FIELD *field, char **list, int casef, int match) {
  return set_field_type(field, TYPE_ENUM, list, casef, match); }

extern int field_TYPE_INTEGER(FIELD *field, int precision, long min, long max) {
  return set_field_type(field, TYPE_INTEGER, precision, min, max); }

extern int field_TYPE_NUMERIC(FIELD *field, int precision, double min, double max) {
  return set_field_type(field, TYPE_NUMERIC, precision, min, max); }

extern int field_TYPE_REGEXP(FIELD *field, char *regexp) {
  return set_field_type(field, TYPE_REGEXP, regexp) ; }

extern int field_TYPE_IPV4(FIELD *field) {
  return set_field_type(field, TYPE_IPV4); }

typedef bool (*FIELD_CHK_FUNC)(FIELD *,const void *);
typedef bool (*CHAR_CHK_FUNC)(int,const void *);
typedef struct validation_callback{
  PyObject *field;
  PyObject *fld_chk;
  PyObject *chr_chk;
} *VALIDATION_CALLBACK;

/* Actually form library call this function when validating field,
   and then we call python callback function in this routine. */
static int field_checker(FIELD *fld,const void *arg)
{
  PyObject *func, *arglist;
  PyObject *result;
  int dres = 0;
  char _ptemp[128];
  VALIDATION_CALLBACK vc;
   
  vc=(VALIDATION_CALLBACK)arg;
  func = vc->fld_chk;                            // Get Python field validation function
  //SWIG_MakePtr(_ptemp, (char *) fld,"_FIELD_p");
  arglist = Py_BuildValue("(N)",vc->field);         // Build argument list
  result = PyEval_CallObject(func,arglist);      // Call Python callback function
  //Py_DECREF(arglist);                            // Trash arglist
  if (result) {                                  // If no errors, return double
    dres = (int)PyInt_AsLong(result);
  }
  Py_XDECREF(result);

  return dres;
}

/* this is character checking routine,but I now don't use it and just pass through. */
int char_checker(int ch,const void *arg)
{
  PyObject *func, *arglist;
  PyObject *result;
  int dres = 1;
  VALIDATION_CALLBACK vc;
   
  vc=(VALIDATION_CALLBACK)arg;
  func = vc->chr_chk;                            // Get Python field validation function

  if(func!=Py_None)
  {
    arglist = Py_BuildValue("(i)",ch);             // Build argument list
    result = PyEval_CallObject(func,arglist);      // Call Python callback function
    Py_DECREF(arglist);                            // Trash arglist
    if (result) {                                  // If no errors, return double
      dres = (int)PyInt_AsLong(result);
    }
    Py_XDECREF(result);
  }

  return dres;
}

extern int set_callback(FIELD *field,PyObject *py_field,PyObject *py_fld_chk,PyObject *py_chr_chk)
{
  FIELDTYPE *fld_type;
  VALIDATION_CALLBACK vc=NULL;

  fld_type=new_fieldtype((FIELD_CHK_FUNC)field_checker,(CHAR_CHK_FUNC)char_checker); // register validation functions here
  if(fld_type)
  {
    set_field_type(field,fld_type);  // associate new field type with our field
    if(field->usrptr)
      free(field->usrptr);
    vc=(VALIDATION_CALLBACK)malloc(sizeof(struct validation_callback));
    if(vc)
    {
      vc->field=py_field;
      vc->fld_chk=py_fld_chk;
      vc->chr_chk=py_chr_chk;
      field->usrptr=(void *)vc;
      field->arg=(void *)vc;  /* store python callback function pointer at here */
      return 0;
    }
    else
      return -1;
  }
  else
    return -1;
}

extern void free_validation_callback(void *userptr)
{
  VALIDATION_CALLBACK vc=(VALIDATION_CALLBACK)userptr;
  free(vc);
}

%}
