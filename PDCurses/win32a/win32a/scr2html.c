#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "pdcwin.h"

int PDC_write_screen_to_file( const char *filename, WINDOW *win);
void PDC_get_rgb_values( const chtype srcp,     /* pdcdisp.c */
            COLORREF *foreground_rgb, COLORREF *background_rgb);

static unsigned locate_chtype_in_list( chtype *list, const chtype type,
            const unsigned list_size)
{
   unsigned i = 0;

   while( i < list_size && type != list[i])
      i++;
   return( i);
}

int PDC_write_screen_to_file( const char *filename, WINDOW *win)
{
   FILE *ofile = fopen( filename, "wb");
   int rval = -1;

   if( ofile)
      {
      const int maxx = getmaxx( win);
      const int maxy = getmaxy( win);
      chtype *buff = (chtype *)calloc( maxx, sizeof( chtype));
      chtype *types = (chtype *)calloc( maxx * maxy, sizeof( chtype));
      chtype curr_attr;
      unsigned n_types = 0, i;
      int x, y;

      fprintf( ofile, "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\">\n");
      fprintf( ofile, "<HTML>\n<HEAD>\n");
      fprintf( ofile, "<META http-equiv=Content-Type content=\"text/html; charset=utf-8\">\n");
      fprintf( ofile, "<title> Title </title>\n");
      fprintf( ofile, "<style type=\"text/css\">\n");
      for( y = 0; y < maxy; y++)
         {
         mvwinchnstr( win, y, 0, buff, maxx);
         for( x = 0; x < maxx; x++)
            {
            const chtype attr = (buff[x] & A_ATTRIBUTES);
            i = locate_chtype_in_list( types, attr, n_types);
            if( i == n_types)
               {
               COLORREF foregnd_rgb, backgnd_rgb;

               PDC_get_rgb_values( attr, &foregnd_rgb, &backgnd_rgb);
               types[n_types++] = attr;
               fprintf( ofile, "   .z%x { color:#%06x; background-color:#%06x; }\n",
                            i, (unsigned)foregnd_rgb, (unsigned)backgnd_rgb);
               }
            }
         }
      fprintf( ofile, "</style> </head><body><p><pre>\n");
      curr_attr = 0;
      for( y = 0; y < maxy; y++)
         {
         mvwinchnstr( win, y, 0, buff, maxx);
         for( x = 0; x < maxx; x++)
            {
            const chtype attr = (buff[x] & A_ATTRIBUTES);
            const unsigned ival = (unsigned)( buff[x] & A_CHARTEXT);
            const char *forbidden_in_html = "~ <>\"&";

            if( curr_attr != attr || (!x && !y))
               {
               curr_attr = attr;
               i = locate_chtype_in_list( types, attr, n_types);
               if( x || y)
                  fprintf( ofile, "</code>");
               fprintf( ofile, "<code class=\"z%x\">", i);
               }
            if( !ival || ival == 32) /* cvt nulls to spaces */
               fprintf( ofile, "&nbsp;");
            else if( ival >= ' ' && ival < 125 &&
                     !strchr( forbidden_in_html, ival))
               fputc( ival, ofile);
            else
               fprintf( ofile, "&#x%x;", ival);
            }
         fprintf( ofile, "\n");
         }
      free( buff);
      free( types);
      fprintf( ofile, "</code> </pre></p></body></html>\n");
      fclose( ofile);
      rval = 0;
      }
   return( rval);
}
