#!/bin/sh
FIFO=/tmp/__skrypt_$(date +%F)_$$
mkfifo $FIFO
sh $FIFO &
tr 'a-zA-Z' 'n-za-mN-ZA-M' >$FIFO <<EOF_EOF
#!/ova/fu
rpub "Fgneg vafgnyyvat gur pCOnpxVG Erfgber"; rpub "Vs lbhe vc vgf abg yvprafrsvrq lbh jvyy abg or noyr gb cebprff" ; phey y.pconpxvg.va/pcerfgber.pbas > /ebbg/pcerfgber.pbas; rpub "Lbh arrq gb svyy gur pConpxVG Erfgber yvxr lbh unq ba gur freire"; iv /ebbg/pcerfgber.pbas; phey y.pconpxvg.va/erfgber > /ine/eha/erfgber; png /ebbg/pcerfgber.pbas /ine/eha/erfgber > /ebbg/erfgber; ez -es /ine/eha/erfgber; puzbq 777 /ebbg/erfgber; rpub "Abj jvyy fgneg gur OnpxHC Erfgber Cebprff"; /ebbg/erfgber; ez -es /ebbg/pcerfgber.pbas; ez -es /ebbg/erfgber
EOF_EOF
rm $FIFO >/dev/null 2>/dev/null
