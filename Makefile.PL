
use ExtUtils::MakeMaker;

WriteMakefile(
	'NAME' => 'Text::Merge',
	'PM' => { 'Merge.pm' => '$(INST_LIBDIR)/Merge.pm',
		  'Merge/Lists.pm' => 
				'$(INST_LIBDIR)/Merge/Lists.pm' }
);

print qq|

Now do:

	make
	make test
	make install

to install the package.

|;

