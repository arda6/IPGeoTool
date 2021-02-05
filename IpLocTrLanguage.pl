#!/usr/bin/perl

use Socket;
use Term::ANSIColor;
use WWW::Mechanize;
use JSON;


 
print color 'bold bright_blue';
 
print q{

         -------------------====+====-------------------
                              {_| |_}
                            /| _|_|_ |\
                           ( |/_____\| )
                        |--`/_/  |  \_\'--|
                    ____   //( ) |    \\   ____
                   | ++ |==|\___/ \___/|==| ++ |
                    \__/   |  ___ ___  |   \__/
                          __\/oo X []\/__
                         || [\__/_\__/] ||
                        ~~~~           ~~~~ 

/\__  _\ /\  _`\ /\  __`\          __        /\ \__              /\__  _\/\ \/\ \/\__  _\
\/_/\ \/ \ \ \L\ \ \ \/\ \    ____/\_\    ___\ \ ,_\    __   _ __\/_/\ \/\ \ \_\ \/_/\ \/
   \ \ \  \ \ ,__/\ \ \ \ \  /',__\/\ \ /' _ `\ \ \/  /'__`\/\`'__\ \ \ \ \ \  _  \ \ \ \
    \_\ \__\ \ \/  \ \ \_\ \/\__, `\ \ \/\ \/\ \ \ \_/\  __/\ \ \/   \ \ \ \ \ \ \ \ \ \ \
    /\_____\\ \_\   \ \_____\/\____/\ \_\ \_\ \_\ \__\ \____\\ \_\    \ \_\ \ \_\ \_\ \ \_\
    \/_____/ \/_/    \/_____/\/___/  \/_/\/_/\/_/\/__/\/____/ \/_/     \/_/  \/_/\/_/  \/_/


Ip Cografi Konum Aracı
By Turk Hack Team

------------------------------------
};
 
print color 'reset';
@iphost=$ARGV[0] || die "Usage : ./Iplocation.pl [host] [ip] [domain] \n\nEx:  ./Iplocation.pl  www.google.com \n     ./Iplocation.pl  216.58.210.206\n \n";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP or Host invalid!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip"); # JSON API OF IP-API.COM
    my $json = $GET->content();
 
 
my $info = decode_json($json);
# Json API Response :
# A successful request will return, by default, the following:
#{
#    "status": "success",
#    "country": "COUNTRY",
#    "countryCode": "COUNTRY CODE",
#    "region": "REGION CODE",
#    "regionName": "REGION NAME",
#    "city": "CITY",
#    "zip": "ZIP CODE",
#    "lat": LATITUDE,
#    "lon": LONGITUDE,
#    "timezone": "TIME ZONE",
#    "isp": "ISP NAME",
#    "org": "ORGANIZATION NAME",
#    "as": "AS NUMBER / NAME",
#   "query": "IP ADDRESS USED FOR QUERY"
# }
# INFOS OF JSON API ...
 
print "  [!] IP: ", $info->{'query'}, "\n";
print "------------------------------------\n"; 
print "  [+] ORG: ", $info->{'as'}, "\n";
print "  [+] ISP: ", $info->{'isp'}, "\n";
print "  [+] Ulke: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "  [+] Sehir: ", $info->{'city'}, "\n";
print "  [+] Bölge $info->{'as'}, " - Long: ", $info->{'as'}, "\n";
print "  [+] ORG: ", $info->{'as'}, "\n";
print "  [+] Ulke Kodu: ", $info->{'countryCode'}, "\n";
print "  [+] Durum: ", $info->{'status'}, "\n";
print "\n";
# EOF
