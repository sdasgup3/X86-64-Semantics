#include "mini_string.h"
#include "mini_stdlib.h"

//int n = 2;

main ()
{
  int i, x = 45;

  for (i = 0; i < 2; i++)
    {
      if (i != 0)
	x = ( i > 0 ) ? i : 0;
    }

  if (x != 1)
    abort ();
  exit (0);
}
