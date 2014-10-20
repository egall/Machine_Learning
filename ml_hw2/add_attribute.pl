#!/usr/bin/perl


use strict;
use warnings;


my $first;
my $zeroone_var;
my $zeroone_array;
my $itor;
my $new_var_array;

open(my $fh, "<", "diabetes.arff")
     or die "cannot open < diabetes.arff: $!";

open(my $new_arff, ">", "diabetes_twenty_bin.arff") 
     or die "cannot open > : diabetes_twenty_bin.arff$!";

while(<$fh>){
    chomp;
    $zeroone_array = ',';
    for($itor = 0; $itor < 20; $itor++){
        # Generate random number between 0 and 2, take int and round down
        $zeroone_var = int(rand(2));
        $zeroone_array .= $zeroone_var;
        if($itor < 19){
            $zeroone_array .= ',';
        }
    }
    $first = substr($_, 0, 1);
    if ($first =~ /^\d/){
        $new_var_array = $_ . $zeroone_array;
        print $new_arff "$new_var_array\n";
    }else{
        print $new_arff "$_\n"
    }
}

close($fh);
close($new_arff);
