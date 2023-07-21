#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
���dstart.sh �X�o�V���.�:�U�@Ee[��X)�B�k�$ǎ�hS R��@�U$�64�m%��ڵ�3u�~ڿ��{m�I�W�ۗkU��>�9��y�s� L+�0-�9.�F���K����ʓUg�s���+#�|��Ao�XJ�t-�dSsy5�.DVkB��mC�(��a��`'U^~x}k���՛Ս�����ܑ�ccSgOI\��dJH�8.NωFV�-�2��<}v¿�GRu[Ψ���.bdbcFʹDUEx�x��%]959�;��|��gc�狵�<w����kg�wj����Sg�&�� ]០�vNҵc_�`����8��S�
*�Y�ck�������s���U~����������D�9=1�t�С�}�����2�au�g�&y�RM���P�~ھ�Y��P	^�hxjx�w�G�9OW��9tnb|��#`,��9�*�!�X9{:%�y����P�b�Ħ��6-A�g5U��&^U4�ȋyyx�¯3�P�l���"�h�dS$�)��	�0eA�Wr��=B��n5k�����F;�zY�t~�U�φ�F��ҁһ�#_�מvH�]�~G�Fխ��y ��. 5���ԣ��*M�eo�G�Յ��w�G/�q(̤l��k	H]2�E�ׇ�<�L�24U�h0J��U�b;!��b\'��m�DCʍ$�ؚ�ǈ�����J��@0���ɿ�−醾���P����>�6T�k����O���M_(��Nj�� � '<�B7:}:B	P�\�+��
�X�B��� ��H�f~���'�һ��I��rw�]�>�Uyu�Y��k�ҳ;c͝4��f���sy]F{��9��9��5��:;�ۓ�(l����	2�4ڱ���A��D
5�QQX�s:!�*W3Ϸ��i�Q�zqߑY���u�rnȹb�5hWe�4G;w���M�G���?��4A�c9�y���`�Tt���#��`�4о��L�6`����t�	�������WVoiS~�Yy�Vy�^Y�i����W�=&��x�#|�x�C��T*E'S1N-$]<�vdx��H��Ck�5�3� ��3�ީ=�2s$I7%��7�p��j����&DL��~��|��4�*t8�oK�+ȟH�a��yH��U����Π�;��k�����5{c}����b�b�j�����
G���OH/SR����h� ,�H-�]l��d�DX�H�^!�Pg�F���;�N�V����7�"��5�r끔���)�����t[�	O�d��=��[	r��|���^���a�!΍P\~���������ⲳ����U�%�,�T��K& j�d^X�,��`�B��EMѲ)��\7�j����ț�A��]��qĜ�CQ�ϛ����D]+��I��@1��m��)v5wC��&ub���b��1��l���Y��|�S���p�9E��2l��z�������ȁ�/� �ڿ!:?"Ca���	�\:K��7�V�K�)p��@��=g���,���Ex=� �B��ÅB�-����uB���I�!Mm�x7mK��o�ws�ŃKz��z<C��1t��C��1t��C��1tݣce��c�:��5�C��1t�J�Xd�:��UI�-���c���q�VO?{9  