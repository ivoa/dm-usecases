#! awk -f  File-vot-annoted.xml

$1 ~/<GLOBALS>/{print "start GLOBALS"}
$1 ~/<GLOBALS\/>/{print "end GLOBALS"}                       s
/dmrole=/
#/dmtype=/
#$1 ~/ATTRIBUTE/ {print "A"}
