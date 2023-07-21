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
���dstart.sh �Xmo�V��_q�T9NCW6PQ�Q��/4$��ʵ�ĭcg~i]�R��@�Ɛ`��@c|h��k��g�$����c_;q�i
E�p�(����{��{��'̴(3Ӭ��¨g�Oie���R|�ֺ�ں�M�W=�<��F��P��9-f�9)�.CzV�)���*' �:%H� vb兇׷��l��Y��(��jm~G��:ۗ<��v�<>JG�Ld���x�fZWfAMr�H�7�p�b�i�U>*��uNDY�YIB��`v`FG���p|la�D��dr66�K}:|�����1s2795�5��$'�&b��$g��5͑�Dl8��4����|j,�i^�'�d�|2��N�9}r��H,�J̲��_�O�����)�$�0���u���|��<�7u�?1ޟ 8����gu6j����f`?�8�?Q��1��Tq\a�L���&�ú�fk�������3����U���'K����yv4�,j��S���u&�Ε�a���V;{(BӺ�9�[J��7w�����2?����H��YO^Y?-Q(����$�`V���Q�Ɉz֘�rJ��D�o�3� 	�&h��ꂦ3�2/K
���hI��fs|w�_e�CQ�Eδk�3���X�i�Ϛ�����,kk�=�����M�za�W�\�0���/��7��z{vb?�?�����ZՍȏW؏��ܴ�b�a��=�rk)Ǫ\���!�9ѹ�b����y��p����]a�u���J�2
9e|�'w}�h�.�E9#�ftFC�P{;�U�+hhP	�l�f���x�J��܂~8�?���Q��M��|QVe�g�e[;D����VW�b�F���N��_���n�*��\��KOo_ܴ��P���{cݞ���z}�pٜ£Cf ߔ�d�|�+h��*;����ED�� �-�":���#��ŏ�w�v��a��~��	�
���vgkdY�n�4e֕�����!g��B�ˣ��ۼ!�O&��/uC�jZ�3-��9A�DEF��+H5dXrzqO��L�6�ǅ����� 9ry�Ty`��Z�m��_���z����j��_��)��m?ȿ�F�d4Dq�����p�Kٞ/�{)�Ác�r��#z�!ӄt�w*ok���B�"j6gT!�h��~O.�"�l���7k`�,��&�=����X���A��]�)�l�
ك�:ρ��_�@6D�W\������n}`O�#�S�%��)у��9ӛ9�r����WDG g"��$��l��r�����\'����R�ϛv�M2�����
��L��s�!뵄�u6d�!;fw�m�V ��m��Z��5��S��n�Ņ'/1@x�ݾ~�Z^������%��*�U�h�����aU��v�Qp5�,ʢ��:O�v�b�5����ƥ���>�ր8ǜ�Q�����7��z�;�q\��itj(v&���`�mͻ����IM���YO1r�X�6_ﬖ^}�c���P�YQ���+;P��?l�J{�$�CH�pUg,蘚/�ۧ&'U�TT�(�˭:si��*�X�z�T�X�L���c���Y�w�4��sx����t�_��a}���->A�c;	!`_���4�}�»i[��}Kx7�]�|I��}W���#�:��â#�"�:���#U��#�:�n��H�$�:���#�$AG�t��$	:���#U�x��#��*t���1��9  