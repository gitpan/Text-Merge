

use Text::Merge::Lists;


$|=1;

require "t/test.pl";	# $data is in here
$data = $data;
$actions = { 'Mothers' => \&apple_pie };

my $publisher = new Text::Merge::Lists('t/');

($ct,$passed) = (0,0);

print "1..81\n";

while (!eof(DATA) && ($_=<DATA>)) {
	$ct++;
	$line = $publisher->text_process($_, {'Data'=>$data, 'Actions'=>$actions});
	$nextline = <DATA>;
	if ($line eq $nextline) { $passed++; print "ok\n";  }
	else { print "not ok\n"; };
};

exit ($passed ne $ct);


sub apple_pie {
	my $val = shift;
	my $ret = $$val{TestFruit}.' pie';
	return $ret;
};


__DATA__
REF:Test1
works
[[REF:Test1]]
works
{This }REF:Test1{.}
This works.
[[{This }REF:Test1{.}]]
This works.
Some text before REF:Test1
Some text before works
I love fire[[REF:Test1]]
I love fireworks
Some text before {this }REF:Test1{.}
Some text before this works.
Some text before [[{this }REF:Test1{.}]]
Some text before this works.
REF:Test1 Some text after is here.
works Some text after is here.
[[REF:Test1]]ites galore
worksites galore
{This }REF:Test1{.}  Some text after.
This works.  Some text after.
[[{This }REF:Test1{.}]]..some text after.
This works...some text after.
Some text before REF:Test1.  Some text after.
Some text before works.  Some text after.
I love fire[[REF:Test1]]!!!
I love fireworks!!!
Some text before {this }REF:Test1{.}  Some text after.
Some text before this works.  Some text after.
Some text before [[{this }REF:Test1{.}]]..some text after.
Some text before this works...some text after.
ACT:Mothers
apple pie
[[ACT:Mothers]]
apple pie
{This }ACT:Mothers{.}
This apple pie.
[[{This }ACT:Mothers{.}]]
This apple pie.
Some text before ACT:Mothers
Some text before apple pie
I love fire[[ACT:Mothers]]
I love fireapple pie
Some text before {this }ACT:Mothers{.}
Some text before this apple pie.
Some text before [[{this }ACT:Mothers{.}]]
Some text before this apple pie.
ACT:Mothers Some text after is here.
apple pie Some text after is here.
[[ACT:Mothers]]ites galore
apple pieites galore
{This }ACT:Mothers{.}  Some text after.
This apple pie.  Some text after.
[[{This }ACT:Mothers{.}]]..some text after.
This apple pie...some text after.
Some text before ACT:Mothers.  Some text after.
Some text before apple pie.  Some text after.
I love fire[[ACT:Mothers]]!!!
I love fireapple pie!!!
Some text before {this }ACT:Mothers{.}  Some text after.
Some text before this apple pie.  Some text after.
Some text before [[{this }ACT:Mothers{.}]]..some text after.
Some text before this apple pie...some text after.
IF:Test1{this works}
this works
IF:Null{this doesn't work}

[[IF:Test1{this works}]]
this works
[[IF:Null{this doesn't work}]]

text before IF:Test1{this works}
text before this works
text before IF:Null{this doesn't work}
text before 
text before...[[IF:Test1{this works}]]
text before...this works
text before...[[IF:Null{this doesn't work}]]
text before...
IF:Test1{this works} text after
this works text after
IF:Null{this doesn't work}text after
text after
[[IF:Test1{this works}]] text after
this works text after
[[IF:Null{this doesn't work}]]...text after
...text after
text before IF:Test1{this works} text after
text before this works text after
text before IF:Null{this doesn't work}text after
text before text after
text before...[[IF:Test1{this works}]]...text after
text before...this works...text after
text before...[[IF:Null{this doesn't work}]]text after
text before...text after
NEG:Null{this works}
this works
NEG:Test1{this doesn't work}

[[NEG:Null{this works}]]
this works
[[NEG:Test1{this doesn't work}]]

text before NEG:Null{this works}
text before this works
text before NEG:Test1{this doesn't work}
text before 
text before...[[NEG:Null{this works}]]
text before...this works
text before...[[NEG:Test1{this doesn't work}]]
text before...
NEG:Null{this works} text after
this works text after
NEG:Test1{this doesn't work}text after
text after
[[NEG:Null{this works}]] text after
this works text after
[[NEG:Test1{this doesn't work}]]...text after
...text after
text before NEG:Null{this works} text after
text before this works text after
text before NEG:Test1{this doesn't work}text after
text before text after
text before...[[NEG:Null{this works}]]...text after
text before...this works...text after
text before...[[NEG:Test1{this doesn't work}]]text after
text before...text after
REF:TestCase:upper
BOOK
REF:TestCase:lower
book
REF:TestName:lower:proper
John Q. Smith
REF:TestFloat:int
1
REF:TestFloat:percent
133%
REF:TestFloat:int:percent
100%
$REF:TestFloat:dollars
$1.33
REF:TestDate:abbr
7/9/98
REF:TestDate:short
7/9/98 9:00pm
REF:TestDate:time
9:00pm
REF:TestDate:24h
21:00:00
REF:TestDate:dateonly
July 9, 1998
REF:TestDate:date
July 9, 1998 9:00pm
REF:TestDate:ext
Thursday, July 9th, 1998 at 9:00pm
REF:TestDate:unix
Thu Jul  9 21:00:00 1998
REF:TestEscape:escape
&#38;;&#34;&#35;&#60;&#62;
REF:TestEscape:escape:unescape
&;"#<>
