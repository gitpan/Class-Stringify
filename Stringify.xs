#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"


MODULE = Class::Stringify		PACKAGE = Class::Stringify

PROTOTYPES: disabled


char *
as_string(self, ...)
	SV * self
	PREINIT:
	char * name;
	CODE:
	name = HvNAME( SvSTASH( SvRV( self ) ) ); // get our class name

	RETVAL = malloc( (strlen( name ) + 33) * sizeof(char) );
	sprintf( RETVAL, "%s(%x)", name, (int) SvRV(self) ); // make our stringification
	OUTPUT:
	RETVAL
