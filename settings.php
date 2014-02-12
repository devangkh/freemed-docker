<?php
 // $Id$
 //
 // Authors:
 //      Jeff Buchbinder <jeff@freemedsoftware.org>
 //
 // FreeMED Electronic Medical Record and Practice Management System
 // Copyright (C) 1999-2012 FreeMED Software Foundation
 //
 // This program is free software; you can redistribute it and/or modify
 // it under the terms of the GNU General Public License as published by
 // the Free Software Foundation; either version 2 of the License, or
 // (at your option) any later version.
 //
 // This program is distributed in the hope that it will be useful,
 // but WITHOUT ANY WARRANTY; without even the implied warranty of
 // MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 // GNU General Public License for more details.
 //
 // You should have received a copy of the GNU General Public License
 // along with this program; if not, write to the Free Software
 // Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

define ('INSTALLATION', "FreeMED"); // installation name
define ('DB_HOST', "localhost"); // database (SQL) host location
define ('DB_NAME', "freemed"); // database name
define ('DB_USER', "freemed"); // SQL server username
define ('DB_PASSWORD', "freemed"); // SQL server password
define ('PATID_PREFIX', ""); // used to generate internal practice ID
define ('UI', "gwt");	// set default template
define ('HOST', "localhost"); // host name for this system
define ('BASE_URL', '/freemed'); // offset (i.e. http://here/package)
define ('SESSION_PROTECTION', true); // strong session protection?
define ('RECORD_LOCK_TIMEOUT', 180); // record lock timeout in seconds
define ('DEFAULT_LANGUAGE', "en_US"); // default language 
define ('INIT_ADDR',"127.0.0.1"); // this is the only IP address that can run the init wizard...

// Archive settings
//define ('FSF_USERNAME', "<{$fsfusername|escape}>");
//define ('FSF_PASSWORD', "<{$fsfpassword|escape}>");

?>
