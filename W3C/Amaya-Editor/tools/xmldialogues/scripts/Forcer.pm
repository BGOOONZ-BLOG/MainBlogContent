#!/usr/bin/perl -w

package Forcer;
use strict;
BEGIN {
		use vars qw( @ISA @EXPORT );
		use Exporter;
# AutoLoader
		@ISA = ('Exporter');
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
		@EXPORT = 	qw ( &forcer );
}


use XML::Parser;
use Unicode::String qw(utf8 latin1);
	#to indicate that all string will be in utf8 (as they are read) by default
	#	Unicode::String->stringify_as( utf8 );
use Read_label qw (&init_label);

#############to store the old base
my $head_line = "";
my $base_tag = "";
my $control_field = "";

##########to control the parse
my $string_into_what_label = undef;
my $string_into_control = 0; #used in sub init_the_base as a boolean

 

my %oldlabel = () ; #used to store the old labels and the translates.

my @list_of_new_labels = ();	#to store the new ordering 


#############other global variables
my $OK_for_copy ; #used in sub search_and_recopy_a_label as a boolean 
my $found ; #used in sub search_and_recopy_a_label as a boolean 

#---------------end of global variables

################################################################################
## 						sub main
# this is a small tool to permit that the base will stay conform with the ".h "
# generated by the "EDITOR.A" . It is just a need of reorganization (in general)
# it read the ".h" and as it is specified in it recopy all the text 
# between <label specific> and </label> from the
# old base on the new and indicate if any lakes occurs
################################################################################
sub forcer {
	my $base_repertory = shift ; #"/home/ehuck/xmldoc/";
	my $name_of_base = shift ;#"base_am_msg.xml";
	my $base = $base_repertory . $name_of_base ;

	my $h_file_repertory = shift ;#"/home/ehuck/xmldoc/";#"/home/ehuck/opera/Amaya/LINUX-ELF/amaya/";
	my $name_of_h_file = shift ; #"amayamsg.h";#"EDITOR.h";
	my $h_file = $h_file_repertory . $name_of_h_file ;
	my $comment_at_the_begining = shift;
	
	#my $end_label = shift; #unused because the old base must be well formed and have this particular label
	my $label = undef;
#---------------end of main variables


#to store the old labels and there texts
	load_the_old_values ($base);

#to store the new ordering of the base from the ".h"
{	my @list = Read_label::init_label ($h_file, $comment_at_the_begining);
	 	@list_of_new_labels = ();	
	my $total = $list[0];
	my $i = 1;
	do {
		push (@list_of_new_labels, $list[$i]  );
		$i++;
	} while ( $i <= $total );
}	

# now redo the base	
	open ( NEW, ">$base.new" ) || die "can't create " . $base . ".new because: $! \n";
	#the begin
	print NEW $head_line;
	print NEW $base_tag;
	print NEW $control_field ;
	print NEW "<messages>\n";
	
	#the labels
	foreach $label (@list_of_new_labels )	{
		if (defined ($oldlabel {$label} ) ) {
			print NEW $oldlabel {$label};
			delete $oldlabel {$label};#to know after what's deleted by this operartion forcer
		}
		else {
			print "\tThe label $label never exists before, it don't have a translate yet\n";
			print NEW "<label define=\"$label\">". ask_for_an_english_text()."</label>\n";
		}
	}
	#the end
	print NEW "</messages>\n";
	print NEW "</base>";
	
	close (NEW) || die "can't close " . $base . ".new because: $! \n";
	
	
	
	#finaly rename the old base
	rename ( $base, "$base.old" )  || 	
		 	die "\tCan't rename the old base $base to $base.old because of: $! \n".
			"\tThe old base still exist, the new base name is $base.new\n";							
	rename ( "$base.new", $base )  || 	
		 	die "\tCan't rename the new base $base.new to $base because of: $! \n".
			"\tThe old base still exist, the new base name is $base.new\n";		
	
	print "\tThat is the listing of the labels deleted during this process:\n";
	foreach $label(keys ( %oldlabel ) ) {
		if (defined ($label) ) {
			print "\t\t$label\n";
		}
	}
	
	print "\n\t\tEnd of forcing the base with $h_file\n";

}################################################################
## 						end forcer
################################################################

#-------------------------------------------------------------------------------
sub load_the_old_values {
	my $file_xml = shift;
 	$string_into_control = 0 ;

my $parser = new XML::Parser (
										ErrorContext  => 0 ,
										NoExpand	=> 1  
             						);
#	declaration of the subs used when events are noted	
$parser->setHandlers(
							Start => \&start ,
			   			End   => \&end ,
			   			Char => \&char ,
			   			Default => \&default
						);
open ( BASE ,"<". $file_xml ) || die "problem with the opening of the ". $file_xml ." because of $! \n";
$parser->parse (*BASE); 
close ( BASE );

}
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
sub start {
	my ($p, $element, %attributes ) = @_;
	
	if ( $element eq "base" ) {
		if ( 	defined ( $attributes{"version"}) ) {
			#to increment the information	
			$attributes{"version"} += 1;
			#and store them
			$base_tag = "<base version=\"". $attributes{"version"} 
							."\">\n";
		}
		else {
			print "The old base isn't well-formed (line :". $p->current_line()."): the tag must be like :\n"
					. "\t<$element version =\"\">\n";
		}
	}
	elsif ( $element eq "control" ) {
		$string_into_control = 1;
		$control_field = "<$element>"
	}
	elsif ( $element eq "language" ) {
		unless (defined ( $attributes{"encoding"}) ) {
			print "The old base isn't well-formed (line :". $p->current_line()."): the tag must be like :\n"
					. "\t<$element encoding=\"\">\n";
		}
		$control_field .= "<$element";
		foreach (keys ( %attributes) ) {
			$control_field .= " $_=\"" . $attributes{$_} . "\"";
		}
		$control_field .= ">";  
	}
	elsif ($element eq "messages") {
		#do nothing	 
	}
	elsif ($element eq "label") {
		$string_into_what_label = $element;
		unless (defined ( $attributes{"define"}) ) {
			print "The old base isn't well-formed (line :". $p->current_line()."): the tag must be like :\n"
					. "\t<$element define=\"\">\n";
		}
		$oldlabel {$string_into_what_label} .= "<$element";
		foreach (keys ( %attributes) ) {
			$oldlabel {$string_into_what_label} .= " $_=\"" . $attributes{$_} . "\"";
		}
		$oldlabel {$string_into_what_label} .= ">";

	}
	elsif ($element eq "message") { 
		unless (defined ( $attributes{"xml:lang"}) ) {
			print "The old base isn't well-formed (line :". $p->current_line()."): the tag must be like :\n"
					. "\t<$element xml:lang=\"\">\n";
		}
		$oldlabel {$string_into_what_label} .= "<$element";
		foreach (keys ( %attributes) ) {
			$oldlabel {$string_into_what_label} .= " $_=\"" . $attributes{$_} . "\"";
		}
		$oldlabel {$string_into_what_label} .= ">";
	
	}
	else {
		print "Tag unknown :$element";
		foreach (keys ( %attributes) ) {
			print " $_=\"" . $attributes{$_} . "\"";
		}
		print " at line " . $p->current_line() . "\n";
	}

}

#-------------------------------------------------------------------------------
sub end {
	my ($p ,$end_tag ) = @_ ;

	if ($end_tag eq "control") {
		$string_into_control = 0 ;
		$control_field .= "</$end_tag>\n"	;	
	}
	elsif ($end_tag eq "language")	{
		if ($string_into_control == 1 ) {
			$control_field .= "</$end_tag>\n"	;
		}
		else {
			print "Tag $end_tag at line". $p->current_line() . "not well-placed\n";
		}
	}
	elsif ($end_tag eq "messages")	{
		#do nothing		
	}
	elsif ($end_tag eq "label")	{
		if (defined ($string_into_what_label)) {
			$oldlabel {$string_into_what_label} .= "</$end_tag>\n";
			$string_into_what_label = undef;
		}
		else {
			print "Tag $end_tag at line". $p->current_line() . "not well-placed\n";
		}
	}
	elsif ($end_tag eq "message")	{
		if (defined ($string_into_what_label)) {
			$oldlabel {$string_into_what_label} .= "</$end_tag>\n";			
		}
		else {
			print "Tag $end_tag at line". $p->current_line() . "not well-placed\n";
		}
	}
	else {
		print "Tag unknown : $end_tag";
		print " at line " . $p->current_line() . "\n";
	}
}
#-------------------------------------------------------------------------------
sub char {
	my  ($p, $data) = @_;
	if (defined ($string_into_what_label)) {
		$oldlabel {$string_into_what_label} .= $data;
	}
	elsif ($string_into_control == 1) {
		$control_field .= $data ;
	}
}
#-------------------------------------------------------------------------------
sub default {	#for all the cases of an invalid xml document
	my ( $p, $data ) = @_;

	if ( $data =~ /^<\?xml/ ) { 	# it' the head
		$head_line = $data . "\n";
	}

} #End default
#-------------------------------------------------------------------------------

#####################################################################################
1;
__END__
						sub main
# this is a small tool to permit that the base will stay conform with the ".h "
# generated by the "EDITOR.A" . It is just a need of reorganization (in general)
# it read the ".h" and as it is specified in it recopy all the text 
# between <label specific> and </label> from the
# old base on the new and indicate if any lakes occurs

Warning : some label can be lose during processing. those are stored into %oldlabel and at
the end of process, it keep all the deleted label that don't occur into the ".h" and
normaly not into the new base 
