#!/usr/bin/perl
# radio_frequency@126.com  
# radiofrequency

use Net::SMTP;

# mail_user should be your_mail@163.com
print "Send Start...\n";
my $i;
for($i=1;$i<=1;$i++){
    print "The  mail $i:   ====>>>   ";
    send_mail('smiedtt@qq.com');
    #send_mail('435891302@qq.com');
    #send_mail('2567211351@qq.com');
    print "Send Succeed!\n";
}	
print "All Mails Send Succeed!\n";
sub send_mail{
    my $to_address  = shift;
	# my $mail_user   = 'radio_frequency@126.com';
    # my $mail_pwd    = 'radiofrequency';
    # my $mail_server = 'smtp.126.com';
	
	my $mail_user   = 'sysudt2014@163.com';
    my $mail_pwd    = 'at3.11';
    my $mail_server = 'smtp.163.com';
	
    my $from    = "From: $mail_user\n";
	my $to      = "To: $to_address\n"; #可以有多个收件人
    my $subject = "Subject: RFID\n\n";

    my $message =
<<CONTENT;
    ********************************************
    验收已完成，请注意实验报告，重要的邮件发三封!!!
    ********************************************
											D.T.T
CONTENT

    my $smtp = Net::SMTP->new($mail_server);

    $smtp->auth($mail_user, $mail_pwd) || die "Auth Error! $!";
    $smtp->mail($mail_user);
    $smtp->to($to_address);

    $smtp->data();             # begin the data
    $smtp->datasend($from);    # set user
	$smtp->datasend($to);      # set receiver
    $smtp->datasend($subject); # set subject
    $smtp->datasend($message); # set content
    $smtp->dataend();

    $smtp->quit();
}