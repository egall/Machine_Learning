#!/usr/bin/perl

use strict;
use warnings; 



sub do_xor{
    my $x = $_[0];
    my $y = $_[1];
    my $result;
    if($x == 0 && $y == 0){
        $result = 0;
    }elsif($x == 1 && $y == 0){
        $result = 1;
    }elsif($x == 0 && $y == 1){
        $result = 1;
    }elsif($x == 1 && $y == 1){
        $result = 0;
    }
    return $result;
}

my $x;
my $y;
my @x_array;
my $xor_label;
my $first_xor;


my $filename = "data.arff";
open(my $file_handle, '>', $filename) or die "Could not open file '$filename' $!";
for (my $i = 0; $i < 20; $i++){
    my $x = int(rand(2));
    print $file_handle "$x - label \n";
    $x_array[$i] = $x;
}

$first_xor = do_xor($x_array[0], $x_array[1]);
$xor_label = do_xor($first_xor, $x_array[2]);

print "xor_label = $xor_label\n";
print "x array = @x_array\n";
close $file_handle;
print "done\n"

