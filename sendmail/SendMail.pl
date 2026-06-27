#!/usr/bin/perl
# radio_frequency@126.com  
# radiofrequency
# 1726880384@qq.com

use strict;
use Net::SMTP;
my $to = 'smiedtt@qq.com';
my $from = 'radio_frequency@126.com';
my $site = 'mail.126.com';
my $smtp_host = 'smtp.126.com';
my $pop_host = 'pop3.126.com';
my $username = "radio_frequency";
my $password = "radiofrequency";
    &writeAMesg;

sub writeAMesg{
    my $smtp = Net::SMTP->new( $smtp_host, Timeout=>60, Debug=>1 );
    $smtp->auth($username, $password);
    $smtp->mail($from);
    $smtp->to($to);
    $smtp->data();
    $smtp->datasend("From: from\n");
	$smtp->datasend("To: $to\n");
    $smtp->datasend("Subject: A message from server\n");
    $smtp->datasend("\n");
    $smtp->datasend("Hello!\n");
    $smtp->datasend("\n");
    $smtp->dataend();
    $smtp->quit();
}
