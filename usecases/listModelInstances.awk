#! Usage :
# awk -f listModelInstances.awk File-vot-annoted.xml > model-tree<num>.txt
/<MODEL/
$1 ~/<GLOBALS>/{print "---------GLOBALS---------"}
$1 ~/<\/GLOBALS>/{print "-------end GLOBALS------"}
/TABLE_MAPPING/
/<TABLE_ROW_TEMPLATE>/
/COLLECTION/ && /dmrole=/
/INSTANCE/ && /dmrole=/ {sub(/<INSTANCE dmrole=/,"-I-- ", $0);
sub("/>","", $0); sub(">","", $0);print $0;
}
#/dmtype=/
/ATTRIBUTE/ && /dmrole=/ {sub(/<ATTRIBUTE dmrole=/,"--A- ", $0);
sub("/>","", $0); print $0;
}

