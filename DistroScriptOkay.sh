#!/bin/bash
#https://github.com/GabySimpleRepo/DistroScriptOkay
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××┃
# ┃××××××××××××××××××××××××××××××××-README-××××××××××××××××××××××××××××××××┃
# ┃××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
#Nombre del Archivo:
#	DistroScriptOkay.sh
#
#Distro:
#	Autor:   GabyUserRepo
#	Nombre:  DistroScriptOkay
#	Codigo:  AllOne 
#	Version: 25
#
#Descripcion:
#	Script que convierte Debian, en DistroScriptOkay (distro de bajos recursos, con JWM como entorno grafico predeterminado)
#	---Para mas informacion, vease el archivo README---
#
#Aclaracion:
#	NO ME HAGO RESPONSABLE DEL MAL USO DEL SCRIPT
#
#Version Script: v1.00
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××┃
# ┃××××××××××××××××××××××××××××××××-FRONTEND-××××××××××××××××××××××××××××××××┃
# ┃××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
function readme_funcion() {
echo ""
#read -p "Pulsa \"Enter\" para continuar"
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function license_funcion() {
echo ""
#read -p "Pulsa \"Enter\" para continuar"
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function user_name_funcion() {
#ls /home > /tmp/username.txt; sed -i 's|lost+found||' /tmp/username.txt
ls /home | grep --invert-match "lost+found" | head -n1 > /tmp/username.txt
user_name="$(cat /tmp/username.txt)"; rm /tmp/username.txt
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function distro_data_funcion() {
distro_name="DistroScriptOkay"
distro_code_name="AllOne"
nro_version="$(date +%y)"
url_page_distro=""
url_support_distro=""
url_report_bugs_distro=""
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function screen_loading_funcion() {
for iterador in {1..100}; do
	clear
	printf "CARGANDO %d%%\n" "${iterador}"
	for ((point=1; point<=${iterador}; point++)); do
		if [[ ${point} -eq 1 ]]; then
			printf "["
		elif [[ ${point} -eq ${iterador} ]]; then
			printf "#]"
		else
			printf "#"
		fi
	done
	sleep 0.025
done
echo ""
echo ""
printf "CARGA COMPLETADA"; sleep 1; clear
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function check_requirement_funcion() {
if [ $(whoami) = "root" ]; then
	state_priv="Verifica"
else
	state_priv="No Verifica"
fi


if [ "$(cat /etc/hostname)" = "debian" ] || [ "$(cat /etc/hostname)" = "Debian" ]; then
	state_os="Verifica"
else
	state_os="No Verifica"
fi



if [ "$(uname -m | grep '64')" ]; then
        arch="64"; state_arch="Verifica"
elif [[ "$(uname -m | grep '86')" ]] || [[ "$(uname -m | grep '32')" ]]; then
        arch="32"; state_arch="Verifica"
else
        state_arch="No Verifica"
fi



if [ "${state_priv}" == "Verifica" ] && [ "${state_os}" == "Verifica" ] && [ "${state_arch}" == "Verifica" ]; then
	state_reqs="Verifica"
else
	state_reqs="No Verifica"
fi
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function check_requirement_msg_funcion() {
number_point="10"; time_point="0.1"; time_wait_msg="0.9"; symbol_check=">"
for spin in {1..3}; do
	if [ "${spin}" -eq "1" ]; then
		printf "Verificando los privilegios del usuario "
	elif [ "${spin}" -eq "2" ]; then
		for ((point=1; point<${number_point}; point++)); do
			printf "${symbol_check}"
			sleep ${time_point}
		done
	elif [ "${spin}" -eq "3" ]; then
		printf " ${state_priv}\n"
		sleep ${time_wait_msg}
	fi
done

for spin in {1..3}; do
	if [ "${spin}" -eq "1" ]; then
		printf "Comprobando sistema operativo           "
	elif [ "${spin}" -eq "2" ]; then
		for ((point=1; point<${number_point}; point++)); do
			printf "${symbol_check}"
			sleep ${time_point}
		done
	elif [ "${spin}" -eq "3" ]; then
		printf " ${state_os}\n"
		sleep ${time_wait_msg}
	fi
done

for spin in {1..3}; do
	if [ "${spin}" -eq "1" ]; then
		printf "Analizando arquitectura del computador  "
	elif [ "${spin}" -eq "2" ]; then
		for ((point=1; point<${number_point}; point++)); do
			printf "${symbol_check}"
			sleep ${time_point}
		done
	elif [ "${spin}" -eq "3" ]; then
		printf " ${state_arch}\n"
		sleep ${time_wait_msg}
	fi
done
}
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××┃
# ┃××××××××××××××××××××××××××××××××-DISTRO_BASE-××××××××××××××××××××××××××××××××┃
# ┃×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
function install_packages_for_compiling_funcion() {
echo "instala paquetes para compilar"
apt -y install wget curl git
packages_for_compiling="make cmake build-essential pkg-config"; job_d="$(pwd)"
apt -y install ${packages_for_compiling}; clone_d="/tmp/directory_of_the_repository_clones"; mkdir -p -v "${clone_d}"
#comp_d="/Compilations_APPs"; mkdir -p -v "${comp_d}"
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function uninstall_packages_for_compiling_funcion() {
echo "desinstala paquetes para compilar"
apt -y remove --purge --auto-remove ${packages_for_compiling}; rm --recursive --force --dir "${clone_d}"
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function user_add_sudoers_funcion() {
apt -y install sudo; sed -i "51s|.*|${user_name} ALL=(ALL:ALL) ALL|" /etc/sudoers
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function generator_directory_personal_funcion() {
apt -y install xdg-user-dirs
su - ${user_name} -c "/usr/bin/xdg-user-dirs-update; source \$HOME/.config/user-dirs.dirs && mkdir -v \$XDG_DOCUMENTS_DIR/Notas \$XDG_PICTURES_DIR/Capturas"
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function install_app_base_funcion() {
apt -y install figlet
apt -y install imagemagick
apt -y install nsnake bastet ninvaders 2048 pacman4console
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function bg_distro_funcion() {
img_distro_d="/usr/share/backgrounds/BACKGROUNDS_${distro_name}"; mkdir -p -v "${img_distro_d}"

apt -y install gnome-backgrounds; distro_bg="${img_distro_d}/grid-d_[GNOME-Backgrounds].png"
convert "/usr/share/backgrounds/gnome/grid-d.webp" "${distro_bg}"; apt -y remove --purge --auto-remove gnome-backgrounds

distro_logo="${img_distro_d}/LOGO_[${distro_name}].png"
convert -size 128x128 gradient:red-blue -gravity center -pointsize 16 -fill yellow -annotate +0+0 "${distro_name}" "${distro_logo}"

defaultapp_logo="${img_distro_d}/LOGO_DefaultApp_[${distro_name}].png"
msg_defaultapp_logo="DefaultApp"
convert -size 128x128 gradient:green-black -gravity center -pointsize 24 -fill gold -annotate +0+0 "${msg_defaultapp_logo}" "${defaultapp_logo}"
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function file_script_distro_base_funcion() {
scp_base_d="/SCRIPTS_${distro_name}"; mkdir -p -v "${scp_base_d}"
scp_br_d="${scp_base_d}/Brightness_Scripts"; mkdir -p -v "${scp_br_d}"
scp_lt_d="${scp_base_d}/Lights_Scripts"; mkdir -p -v "${scp_lt_d}"
p_user_d="${scp_base_d}/Directories_Personal_User_Scripts"; mkdir -p -v "${p_user_d}"
pu_cli_d="${p_user_d}/CLI"; mkdir -p -v "${pu_cli_d}"
pu_gui_d="${p_user_d}/GUI"; mkdir -p -v "${pu_gui_d}"
scp_game_d="${scp_base_d}/Games"; mkdir -p -v "${scp_game_d}"
scp_tool_d="${scp_base_d}/Tools_Scripts"; mkdir -p -v "${scp_tool_d}"
scp_ext_d="${scp_base_d}/Extras_Scripts"; mkdir -p -v "${scp_ext_d}"

cat << EOF > ${scp_tool_d}/BATTERY_WARNING_[ACPI]_[XSMG].sh
#!/bin/bash
percentage="\$(acpi | awk '{print \$4}' | sed 's|,||')"
percentage_not_symbol="\$(echo \${percentage} | sed 's|%||' )"
battery_max="80"
battery_low="30"
battery_very_low="15"
battery_too_low="5"
if [ \${percentage_not_symbol} -eq 100 ]; then
	xmessage -center -buttons "Okay" -name "Bateria" "Carga de la Bateria Completa [\${percentage}]"
elif [ \${percentage_not_symbol} -eq \${battery_max} ]; then
	xmessage -center -buttons "Okay" -name "Bateria" "Carga de la Bateria Buena [\${percentage}]"
elif [ \${percentage_not_symbol} -le \${battery_low} ] && [ \${percentage_not_symbol} -gt \${battery_very_low} ]; then
	xmessage -center -buttons "Okay" -name "Bateria" "Carga de la Bateria Baja [\${percentage}]"
elif [ \${percentage_not_symbol} -le \${battery_very_low} ] && [ \${percentage_not_symbol} -gt \${battery_too_low} ]; then
	xmessage -center -buttons "Okay" -name "Bateria" "Carga de la BATERIA MUY BAJA [\${percentage}]"
elif [ \${percentage_not_symbol} -le \${battery_too_low} ]; then
	xmessage -center -buttons "Okay" -name "Bateria" "CARGA DE LA BATERIA DEMASIADA BAJA [\${percentage}]"
else
	xmessage -center -buttons "Okay" -name "Bateria" "Carga de la Bateria [\${percentage}]"
fi
EOF

cat << EOF > ${scp_tool_d}/BATTERY_STATUS_[ACPI]_[CLI].sh
#!/bin/bash
time="\$(acpi | awk '{print \$5}')"
status_battery="\$(acpi | awk '{print \$3}')"
status_time="\$(acpi | awk '{print \$6}')"
percentage="\$(acpi | awk '{print \$4}' | sed 's|,||')"
percentage_not_symbol="\$(echo \${percentage} | sed 's|%||' )"
adapter="\$(acpi -a | awk '{print \$3}')"
capacity_design="\$(acpi -ib | grep 'design' | awk '{print \$5}')"
capacity_full="\$(acpi -ib | grep 'design' | awk '{print \$10}')"
thermal_c_now="\$(acpi -it | awk '{print \$4}' | sed 's|point||' | tr -d '\n')"
thermal_f_now="\$(acpi -itf | awk '{print \$4}' | sed 's|point||' | tr -d '\n')"
thermal_k_now="\$(acpi -itk | awk '{print \$4}' | sed 's|point||' | tr -d '\n')"
thermal_c_support="\$(acpi -it | awk '{print \$12}' | tr -d '\n')"
thermal_f_support="\$(acpi -itf | awk '{print \$12}' | tr -d '\n')"
thermal_k_support="\$(acpi -itk | awk '{print \$12}' | tr -d '\n')"
if [ "\${status_battery}" = "Full," ]; then
	estado="Completa"
	tiempo_estado="Carga Completada"
	time="00:00:00"
elif [ "\${status_battery}" = "Charging," ] && [ "\${status_time}" = "until" ]; then
	estado="Cargandose"
	tiempo_estado="Hasta Cargarse"
elif [ "\${status_battery}" = "Discharging," ] && [ "\${status_time}" = "remaining" ]; then
	estado="Descargandose"
	tiempo_estado="Restante"
fi

if [ "\${adapter}" = "on-line" ]; then
	adaptador="Conectado"
elif [ "\${adapter}" = "off-line" ]; then
	adaptador="Desconectado"
fi
clear
echo "Porcentaje:              \${percentage}"
echo "Estado:                  \${estado}"
echo "Tiempo:                  \${time} (\${tiempo_estado})"
echo "Cargador:                \${adaptador}"
echo "Capacidad Diseñada:      \${capacity_design} mAh"
echo "Capacidad Maxima Actual: \${capacity_full} mAh"
echo "Temperatura --> Actual:  \${thermal_c_now} C°  | Soporta Hasta: \${thermal_c_support} C°"
echo "Temperatura --> Actual:  \${thermal_f_now} F° | Soporta Hasta: \${thermal_f_support} F°"
echo "Temperatura --> Actual:  \${thermal_k_now} K° | Soporta Hasta: \${thermal_k_support} K°"
read
EOF

cat << EOF > ${scp_base_d}/SESION_[XMSG].sh
#!/bin/bash
#xmessage -bg black -fg green -center -buttons "Cerrar Sesion:10,Apagar Sistema:11,Reiniciar Sistema:12,Suspender Sistema:13,Hibernar Sistema:14,Cancelar:15" -name "Opciones de la sesion" "Que deseas realizar?"
xmessage -center -buttons "Cerrar Sesion:10,Apagar Sistema:11,Reiniciar Sistema:12,Suspender Sistema:13,Hibernar Sistema:14,Cancelar:15" -name "Opciones de la sesion" "Que deseas realizar?"
case \$? in
	10) echo "Cerrando Sesion"; 		jwm -exit; clear ;;	# Cierra Sesion de JWM
	11) echo "Apagando el Sistema";		systemctl poweroff ;;	# Apagar el sistema
	12) echo "Reiniciando el Sistema";	systemctl reboot ;;	# Reiniciar el sistema
	13) echo "Suspendiendo el Sistema";	systemctl suspend ;;	# Suspender el sistema
	14) echo "Hibernando el Sistema";	systemctl hibernate ;;	# Hibernar el sistema
	15) echo "Cerrando Cuadro";		exit ;;			# Cancelar
esac
EOF

cat << EOF > ${scp_base_d}/SESION_[CLI].sh
#!/bin/bash
clear
echo "¿Que desea realizar?"
echo "0) Cerrar Sesion"
echo "1) Apagar el Sistema"
echo "2) Reiniciar el Sistema"
echo "3) Suspender el Sistema"
echo "4) Hibernar el Sistema"
echo "5) Cancelar"
echo ""
read -p "Opcion: " op_sesion	
case \$op_sesion in
	0) echo "Cerrando Sesion"; 		jwm -exit; clear ;;	# Cierra Sesion de JWM
	1) echo "Apagando el Sistema";		systemctl poweroff ;;	# Apagar el sistema
	2) echo "Reiniciando el Sistema";	systemctl reboot ;;	# Reiniciar el sistema
	3) echo "Suspendiendo el Sistema";	systemctl suspend ;;	# Suspender el sistema
	4) echo "Hibernando el Sistema";	systemctl hibernate ;;	# Hibernar el sistema
	5) echo "Cancelando";			exit ;;			# Cancelar
esac
EOF

cat << EOF > ${scp_tool_d}/COLOUR_TERM_[CLI].sh
#!/bin/bash
term_custom_d="\$HOME/.Terminals_Customs"; mkdir -p "\${term_custom_d}"
function colour_select_funcion() {
echo "0) NEGRO"
echo "1) ROJO"
echo "2) VERDE"
echo "3) AMARILLO"
echo "4) AZUL"
echo "5) MAGENTA"
echo "6) CIAN"
echo "7) BLANCO"
echo "8) GRIS"
echo ""
read -p "Color: " op_colour
case \${op_colour} in
	0) colour_number="0"; colour_name="NEGRO";;
	1) colour_number="1"; colour_name="ROJO";;
	2) colour_number="2"; colour_name="VERDE";;
	3) colour_number="3"; colour_name="AMARILLO";;
	4) colour_number="4"; colour_name="AZUL";;
	5) colour_number="5"; colour_name="MAGENTA";;
	6) colour_number="6"; colour_name="CIAN";;
	7) colour_number="7"; colour_name="BLANCO";;
	8) colour_number="8"; colour_name="GRIS";;
esac
}
function source_type_funcion() {
clear
echo "Escoge el tipo de letra"
echo "0) Comun"
tput smul; echo "1) Subrayada"; tput sgr0
tput bold; echo "2) Negrita"; tput sgr0
tput smul bold; echo "3) Subrayada y Negrita"; tput sgr0
echo ""
read -p "Opcion: " op_source_type
case \${op_source_type} in
	0) source_type=""; type="Comun";;
	1) source_type="tput smul"; type="Tipo_de_Fuente-Subrayado";;
	2) source_type="tput bold"; type="Tipo_de_Fuente-Negrita";;
	3) source_type="tput smul bold"; type="Tipo_de_Fuente-Subrayado_&_Negrita";;
	*) clear; echo "Opcion no valida, vuelva introducir una opcion valida"; source_type_funcion;;
esac
}
function colour_select_source_funcion() {
clear; echo "Elige el color de la letra"; colour_select_funcion
if [ -z "\${colour_number}" ]; then
	colour_select_source_funcion
else
	colour_source="tput setaf \${colour_number}"; font_colour="Color_Fuente-\${colour_name}"
fi
}
function colour_select_source_bg_funcion() {
clear; echo "Elige el color del fondo"; colour_select_funcion
if [ -z "\${colour_number}" ]; then
	colour_select_source_bg_funcion
else
	colour_source_bg="tput setab \${colour_number}"; bg_colour="Color_Fondo-\${colour_name}"
fi
}
function create_term_custom_funcion() {
if [[ "\${op_menu}" == "b" ]] || [[ "\${op_menu}" == "B" ]]; then
	echo ""
else
name_term_custom="\$(echo \${term_custom_d}/TerminalCUSTOM_[\${type}]_[\${font_colour}]_[\${bg_colour}].sh | sed 's|_\[\]||g')"
echo "#!/bin/bash
/usr/bin/x-terminal-emulator -e /usr/bin/bash -c \"
\${source_type}
\${colour_source}
\${colour_source_bg}
clear
exec /usr/bin/bash\"" > "\${name_term_custom}"; chmod 777 "\${name_term_custom}"
fi
}
function main_menu_funcion() {
clear
echo "Escoge una opcion"
echo "0) Tipo de letra"
echo "1) Color de la letra"
echo "2) Color del fondo de la letra"
echo "a) Todas las anteriores"
echo "b) Abrir personalizaciones hechas"
echo ""
read -p "Opcion: " op_menu
case \${op_menu} in
	0) source_type_funcion;;
	1) colour_select_source_funcion;;
	2) colour_select_source_bg_funcion;;
	a|A) source_type_funcion; colour_select_source_funcion; colour_select_source_bg_funcion;;
	b|B) /usr/bin/x-file-manager "\${term_custom_d}";;
	*) clear; echo "Opcion no valida, vuelva introducir una opcion valida"; main_menu_funcion;;
esac
create_term_custom_funcion; clear
}
main_menu_funcion;
#/usr/bin/x-terminal-emulator -t '\${name_term_custom}' -e "\${name_term_custom}"
\${name_term_custom}
EOF

cat << EOF > ${scp_tool_d}/RESOLUTION_MONITOR_[CLI].sh
#!/bin/bash
clear
name_monitor="\$(xrandr | grep ' connected' | awk '{print \$1}' | head -n 1)"
resolution="\$(xrandr | grep '   ' | awk '{print \$1}')"
cant_res="\$(echo "\${resolution}" | wc -l)"
echo "Selección de resolución:"
for number in \$(seq 1 \${cant_res}); do
    res=\$(echo "\${resolution}" | sed -n "\${number}p")
    echo "\${number}) \${res}"
done
read -p "Selecciona un número para cambiar la resolución: " selected_number
if [[ \${selected_number} -ge 1 && \${selected_number} -le \${cant_res} ]]; then
    selected_resolution=\$(echo "\${resolution}" | sed -n "\${selected_number}p")
    xrandr --output \${name_monitor} --mode \${selected_resolution}
else
    echo "Número no válido. Elige un número entre 1 y \${cant_res}."
fi
EOF

cat << EOF > ${scp_ext_d}/YOUTUBE_URL_EXTRACTOR_[CLI].sh
#!/bin/bash
#read -p "Ingrese archivo: " file_input_read; file_input="\${file_input_read}"
read -p "Ingrese archivo: " file_input
format="txt"; file_name="\$(basename \${file_input})"; mkdir -p -v "\${file_name}"
file_output="List_All_URLs_Youtube_FILE-[\${file_name}].txt"
file_watch="List_URLs_YouTube_[WATCH]_FILE-[\${file_name}].txt"
file_short="List_URLs_YouTube_[SHORT]_FILE-[\${file_name}].txt"
file_playlist="List_URLs_YouTube_[PLAYLIST]_FILE-[\${file_name}].txt"
file_channel="List_URLs_YouTube_[CHANNEL]_FILE-[\${file_name}].txt"
file_video="List_URLs_YouTube_[CHANNEL-VIDEOS]_FILE-[\${file_name}].txt"

#if [ -e "\${file_input}" ]; then
#if [ grep "youtube" "\${file_input}" ]; then
	grep "https://www.youtube.com" "\${file_input}" > "\${file_output}"
	sed -i "s|https://youtu.be/|https://www.youtube.com/watch?v=|g" "\${file_input}" >> "\${file_output}"
	sed -i "s|https://music.youtube.com/watch?v=|https://www.youtube.com/watch?v=|g" "\${file_input}" >> "\${file_output}"
	sed -i "s|https://www.youtube.com/short/|https://www.youtube.com/watch?v=|g" "\${file_input}" >> "\${file_output}"

	grep "https://www.youtube.com/watch?v=" "\${file_output}" > "\${file_watch}"
	grep "https://www.youtube.com/shorts/" "\${file_output}" > "\${file_short}"
	grep "https://www.youtube.com/playlist?list=" "\${file_output}" > "\${file_playlist}"
	grep "https://www.youtube.com/@" "\${file_output}" > "\${file_channel}"

#	for channel in "\$(grep \"https://www.youtube.com/@\" \"\${file_output}\")"; do
#		if [ "\$(grep \"/videos\" \"\${channel}\")" ]; then
#			echo "\${channel}" > "\${file_video}"
#			echo "\${channel}" | sed -i "s|/videos||g" > "\${file_channel}"
#		else 
#			echo "\${channel}" > "\${file_channel}"
#			echo "\${channel}/videos" > "\${file_video}"
#		fi
#	done
#else
#	echo "El archivo no contiene URLs de youtube"; sleep 5s
#fi
EOF

cat << EOF > ${scp_ext_d}/BOOKMARK_CONVERTER_URL_[CLI].sh
#/bin/bash
#Convierte los Bookmarks/Favoritos/Marcadores de Favoritos en un nuevo archivo de texto que solo contiene solo las URLs
read -p "Ingresa el archivo de exportación de favoritos: " file_bookmark
file_out="List_URLs_Bookmarks_FILE-[\$(basename \${file_bookmark})]_[\$(date +%N)].txt" #basename para que no moleste los / de los directorios
#if [ grep "<A HREF=" "\${file_bookmark}" ]; then
	grep --ignore-case "<A HREF=" "\${file_bookmark}" > "\${file_out}"
	sed -i 's|<div||g' "\${file_out}" #konqueror
	sed -i 's|<a href=||g' "\${file_out}" #konqueror
	sed -i 's|<DT><A HREF=||g' "\${file_out}"
	sed -i 's|ADD_DATE="[^"]*"||g' "\${file_out}"
	sed -i 's|ICON=\"[^"]*\"||g' "\${file_out}"
	sed -i 's|ICON_URI=\"[^"]*\"||g' "\${file_out}" #firefox
	sed -i 's|LAST_MODIFIED=\"[^"]*\"||g' "\${file_out}" #firefox
	sed -i 's|</A>||g' "\${file_out}"
	sed -i 's|>[^"]*||g' "\${file_out}"
	sed -i 's|        |    |g' "'\${file_out}"
	sed -i 's|"  |"|g' "\${file_out}"
	sed -i 's|    "|"|g' "\${file_out}" #para no entrar en conflicto por los espacios y comillas, para despues tener como una lista
	sed -i 's|"http|    "http|g' "\${file_out}" #konqueror
#else
#	echo "El archivo no es un archivo de favoritos/marcadores de navegador."; sleep 5s
#fi
EOF

cat << EOF > ${scp_ext_d}/SEARCH_WORD_IN_FILE_[CLI].sh
#!/bin/bash
clear; read -p "Introduce la ruta del archivo: " file_path
clear; read -p "Introduce palabra a buscar: " word_search
file_name="\$(basename "\${file_path}")"; format="txt"
if [ -e "\${file_path}" ]; then
	if [ grep --ignore-case -q "\${word_search}" "\${file_path}" ]; then
		grep --ignore-case -q --no-messages "\${word_search}" "\${file_path}" > "\${file_name}---[Con-(\${word_search})].\${format}"
		grep --ignore-case -q --invert-match --no-messages "\${word_search}" "\${file_path}" > "\${file_name}---[Sin-(\${word_search})].\${format}"
	else
		echo "No se ha encontrado \"\${word_search}\" en el archivo: \"\${file_name}\""
	fi
else
	echo "El archivo ingresado no existe"
fi
EOF

cat << EOF > ${pu_cli_d}/DIRECTORY_HOMEUSER_[CLI].sh
#!/bin/bash
cd \$HOME
/usr/bin/x-terminal-emulator -fullscreen -t 'DIRECTORIO: HOMEUSER' -e /usr/bin/sh -c "pwd; echo; ls -alFN; echo; pwd; /usr/bin/sh"
EOF

cat << EOF > ${pu_cli_d}/DIRECTORY_DOWNLOAD_[CLI].sh
#!/bin/bash
source \$HOME/.config/user-dirs.dirs
cd \$XDG_DOWNLOAD_DIR
/usr/bin/x-terminal-emulator -fullscreen -t 'DIRECTORIO: DESCARGAS' -e /usr/bin/sh -c "pwd; echo; ls -alFN; echo; pwd; /usr/bin/sh"
EOF

cat << EOF > ${pu_cli_d}/DIRECTORY_DESKTOP_[CLI].sh
#!/bin/bash
source \$HOME/.config/user-dirs.dirs
cd \$XDG_DESKTOP_DIR
/usr/bin/x-terminal-emulator -fullscreen -t 'DIRECTORIO: ESCRITORIO' -e /usr/bin/sh -c "pwd; echo; ls -alFN; echo; pwd; /usr/bin/sh"
EOF

cat << EOF > ${pu_cli_d}/DIRECTORY_MUSIC_[CLI].sh
#!/bin/bash
source \$HOME/.config/user-dirs.dirs
cd \$XDG_MUSIC_DIR
/usr/bin/x-terminal-emulator -fullscreen -t 'DIRECTORIO: MUSICA' -e /usr/bin/sh -c "pwd; echo; ls -alFN; echo; pwd; /usr/bin/sh"
EOF

cat << EOF > ${pu_cli_d}/DIRECTORY_PICTURES_[CLI].sh
#!/bin/bash
source \$HOME/.config/user-dirs.dirs
cd \$XDG_PICTURES_DIR
/usr/bin/x-terminal-emulator -fullscreen -t 'DIRECTORIO: IMAGENES' -e /usr/bin/sh -c "pwd; echo; ls -alFN; echo; pwd; /usr/bin/sh"
EOF

cat << EOF > ${pu_cli_d}/DIRECTORY_VIDEOS_[CLI].sh
#!/bin/bash
source \$HOME/.config/user-dirs.dirs
cd \$XDG_VIDEOS_DIR
/usr/bin/x-terminal-emulator -fullscreen -t 'DIRECTORIO: VIDEOS' -e /usr/bin/sh -c "pwd; echo; ls -alFN; echo; pwd; /usr/bin/sh"
EOF

cat << EOF > ${pu_cli_d}/DIRECTORY_TEMPLATES_[CLI].sh
#!/bin/bash
source \$HOME/.config/user-dirs.dirs
cd \$XDG_TEMPLATES_DIR
/usr/bin/x-terminal-emulator -fullscreen -t 'DIRECTORIO: PLANTILLAS' -e /usr/bin/sh -c "pwd; echo; ls -alFN; echo; pwd; /usr/bin/sh"
EOF

cat << EOF > ${pu_cli_d}/DIRECTORY_PUBLIC_[CLI].sh
#!/bin/bash
source \$HOME/.config/user-dirs.dirs
cd \$XDG_PUBLICSHARE_DIR
/usr/bin/x-terminal-emulator -fullscreen -t 'DIRECTORIO: PUBLICO' -e /usr/bin/sh -c "pwd; echo; ls -alFN; echo; pwd; /usr/bin/sh"
EOF

cat << EOF > ${pu_cli_d}/DIRECTORY_DOCUMENTS_[CLI].sh
#!/bin/bash
source \$HOME/.config/user-dirs.dirs
cd \$XDG_DOCUMENTS_DIR
/usr/bin/x-terminal-emulator -fullscreen -t 'DIRECTORIO: DOCUMENTOS' -e /usr/bin/sh -c "pwd; echo; ls -alFN; echo; pwd; /usr/bin/sh"
EOF

cat << EOF > ${pu_cli_d}/DIRECTORY_NOTES_[CLI].sh
#!/bin/bash
source \$HOME/.config/user-dirs.dirs
cd \$XDG_DOCUMENTS_DIR/Notas
/usr/bin/x-terminal-emulator -fullscreen -t 'DIRECTORIO: NOTAS' -e /usr/bin/sh -c "pwd; echo; ls -alFN; echo; pwd; /usr/bin/sh"
EOF

cat << EOF > ${pu_cli_d}/DIRECTORY_SCREENSHOTS_[CLI].sh
#!/bin/bash
source \$HOME/.config/user-dirs.dirs
cd \$XDG_PICTURES_DIR/Capturas
/usr/bin/x-terminal-emulator -fullscreen -t 'DIRECTORIO: CAPTURAS' -e /usr/bin/sh -c "pwd; echo; ls -alFN; echo; pwd; /usr/bin/sh"
EOF

cat << EOF > ${pu_gui_d}/DIRECTORY_HOMEUSER_[GUI].sh
#!/bin/bash
/usr/bin/pcmanfm \$HOME
EOF

cat << EOF > ${pu_gui_d}/DIRECTORY_DOWNLOAD_[GUI].sh
#!/bin/bash
# -c 'source \$HOME/.config/user-dirs.dirs; exec /usr/bin/x-file-manager "\$XDG_DOWNLOAD_DIR"'
source \$HOME/.config/user-dirs.dirs
/usr/bin/pcmanfm "\$XDG_DOWNLOAD_DIR"
EOF

cat << EOF > ${pu_gui_d}/DIRECTORY_DOCUMENTS_[GUI].sh
#!/bin/bash
# -c 'source \$HOME/.config/user-dirs.dirs; exec /usr/bin/x-file-manager "\$XDG_DOCUMENTS_DIR"'
source \$HOME/.config/user-dirs.dirs
/usr/bin/pcmanfm "\$XDG_DOCUMENTS_DIR"
EOF

cat << EOF > ${pu_gui_d}/DIRECTORY_DESKTOP_[GUI].sh
#!/bin/bash
# -c 'source \$HOME/.config/user-dirs.dirs; exec /usr/bin/x-file-manager "\$XDG_DESKTOP_DIR"'
source \$HOME/.config/user-dirs.dirs
/usr/bin/pcmanfm "\$XDG_DESKTOP_DIR"
EOF

cat << EOF > ${pu_gui_d}/DIRECTORY_MUSIC_[GUI].sh
#!/bin/bash
# -c 'source \$HOME/.config/user-dirs.dirs; exec /usr/bin/x-file-manager "\$XDG_MUSIC_DIR"'
source \$HOME/.config/user-dirs.dirs
/usr/bin/pcmanfm "\$XDG_MUSIC_DIR"
EOF

cat << EOF > ${pu_gui_d}/DIRECTORY_PICTURES_[GUI].sh
#!/bin/bash
# -c 'source \$HOME/.config/user-dirs.dirs; exec /usr/bin/x-file-manager "\$XDG_PICTURES_DIR"'
source \$HOME/.config/user-dirs.dirs
/usr/bin/pcmanfm "\$XDG_PICTURES_DIR"
EOF

cat << EOF > ${pu_gui_d}/DIRECTORY_VIDEOS_[GUI].sh
#!/bin/bash
#-c 'source \$HOME/.config/user-dirs.dirs; exec /usr/bin/x-file-manager "\$XDG_VIDEOS_DIR"'
source \$HOME/.config/user-dirs.dirs
/usr/bin/pcmanfm "\$XDG_VIDEOS_DIR"
EOF

cat << EOF > ${pu_gui_d}/DIRECTORY_TEMPLATES_[GUI].sh
#!/bin/bash
# -c 'source \$HOME/.config/user-dirs.dirs; exec /usr/bin/x-file-manager "\$XDG_TEMPLATES_DIR"'
source \$HOME/.config/user-dirs.dirs
/usr/bin/pcmanfm "\$XDG_TEMPLATES_DIR"
EOF

cat << EOF > ${pu_gui_d}/DIRECTORY_PUBLIC_[GUI].sh
#!/bin/bash
# -c 'source \$HOME/.config/user-dirs.dirs; exec /usr/bin/x-file-manager "\$XDG_PUBLICSHARE_DIR"'
source \$HOME/.config/user-dirs.dirs
/usr/bin/pcmanfm "\$XDG_PUBLICSHARE_DIR"
EOF

cat << EOF > ${pu_gui_d}/DIRECTORY_NOTES_[GUI].sh
#!/bin/bash
# -c 'source \$HOME/.config/user-dirs.dirs; exec /usr/bin/x-file-manager "\$XDG_DOCUMENTS_DIR/Notas"'
source \$HOME/.config/user-dirs.dirs
/usr/bin/x-file-manager "\$XDG_DOCUMENTS_DIR/Notas"
EOF

cat << EOF > ${pu_gui_d}/DIRECTORY_SCREENSHOTS_[GUI].sh
#!/bin/bash
# -c 'source \$HOME/.config/user-dirs.dirs; exec /usr/bin/x-file-manager "\$XDG_PICTURES_DIR/Capturas"'
source \$HOME/.config/user-dirs.dirs
/usr/bin/x-file-manager "\$XDG_PICTURES_DIR/Capturas"
EOF

cat << EOF > ${p_user_d}/DIRECTORIES_USER_MENU_[CLI].sh
#!/bin/bash
xmessage -center -button "HOME:10,DESCARGAS:11,DOCUMENTOS:12,ESCRITORIO:13,IMAGENES:14,MUSICA:15,PLANTILLAS:16,PUBLICO:17,VIDEOS:18,NOTAS:19,CAPTURAS:20" -name "Directorios del Usuario [CLI]" "Escoge un directorio:"
case \$? in
	10)${pu_cli_d}/DIRECTORY_HOMEUSER_[CLI].sh;;
	11)${pu_cli_d}/DIRECTORY_DOWNLOAD_[CLI].sh;;
	12)${pu_cli_d}/DIRECTORY_DOCUMENTS_[CLI].sh;;
	13)${pu_cli_d}/DIRECTORY_DESKTOP_[CLI].sh;;
	14)${pu_cli_d}/DIRECTORY_PICTURES_[CLI].sh;;
	15)${pu_cli_d}/DIRECTORY_MUSIC_[CLI].sh;;
	16)${pu_cli_d}/DIRECTORY_TEMPLATES_[CLI].sh;;
	17)${pu_cli_d}/DIRECTORY_PUBLIC_[CLI].sh;;
	18)${pu_cli_d}/DIRECTORY_VIDEOS_[CLI].sh;;
	19)${pu_cli_d}/DIRECTORY_NOTES_[CLI].sh;;
	20)${pu_cli_d}/DIRECTORY_SCREENSHOTS_[CLI].sh;;
esac
EOF

cat << EOF > ${p_user_d}/DIRECTORIES_USER_MENU_[GUI].sh
#!/bin/bash
xmessage -center -button "HOME:10,DESCARGAS:11,DOCUMENTOS:12,ESCRITORIO:13,IMAGENES:14,MUSICA:15,PLANTILLAS:16,PUBLICO:17,VIDEOS:18,NOTAS:19,CAPTURAS:20" -name "Directorios del Usuario [GUI]" "Escoge un directorio:"
case \$? in
	10)${pu_gui_d}/DIRECTORY_HOMEUSER_[GUI].sh;;
	11)${pu_gui_d}/DIRECTORY_DOWNLOAD_[GUI].sh;;
	12)${pu_gui_d}/DIRECTORY_DOCUMENTS_[GUI].sh;;
	13)${pu_gui_d}/DIRECTORY_DESKTOP_[GUI].sh;;
	14)${pu_gui_d}/DIRECTORY_PICTURES_[GUI].sh;;
	15)${pu_gui_d}/DIRECTORY_MUSIC_[GUI].sh;;
	16)${pu_gui_d}/DIRECTORY_TEMPLATES_[GUI].sh;;
	17)${pu_gui_d}/DIRECTORY_PUBLIC_[GUI].sh;;
	18)${pu_gui_d}/DIRECTORY_VIDEOS_[GUI].sh;;
	19)${pu_gui_d}/DIRECTORY_NOTES_[GUI].sh;;
	20)${pu_gui_d}/DIRECTORY_SCREENSHOTS_[GUI].sh;;
esac
EOF

echo "xgamma -q -rgamma 1.0 -ggamma 1.0 -bgamma 1.0" > ${scp_lt_d}/LIGHT_WHITE.sh
echo "xgamma -q -rgamma 1.0 -ggamma 1.0 -bgamma 0.3" > ${scp_lt_d}/LIGHT_WARM.sh

echo "/usr/bin/bash -c 'source \$HOME/.config/user-dirs.dirs && import -window root \$XDG_PICTURES_DIR/Capturas/Screenshot_\$(date +%Y-%m-%d_%H:%M:%S).png'"> ${scp_tool_d}/SCREENSHOT_[IMAGEMAGICK].sh
echo "/usr/bin/x-terminal-emulator -t 'Editor de texto minimalista' -e /usr/bin/bash -c 'source \$HOME/.config/user-dirs.dirs && /usr/bin/nano \$XDG_DOCUMENTS_DIR/Notas/Note_\$(date +%Y-%m-%d_%H:%M:%S:%N).txt'"> ${scp_tool_d}/NANO_[CLI].sh
echo "/usr/bin/x-terminal-emulator -e top" > ${scp_tool_d}/TOP_[CLI].sh

echo "/usr/bin/x-terminal-emulator -g 28x17 -t '2048' -e '/usr/games/2048'" > ${scp_game_d}/2048_[CLI].sh
echo "/usr/bin/x-terminal-emulator -g 60x30 -t 'Bastet' -e '/usr/games/bastet'" > ${scp_game_d}/BASTET_[CLI].sh
echo "/usr/bin/x-terminal-emulator -g 80x25 -t 'nInvaders' -e '/usr/games/ninvaders'" > ${scp_game_d}/NINVADERS_[CLI].sh
echo "/usr/bin/x-terminal-emulator -g 80x24 -t 'nSnake' -e '/usr/games/nsnake'" > ${scp_game_d}/NSNAKE_[CLI].sh
echo "/usr/bin/x-terminal-emulator -g 32x32 -t 'Pacman4Console' -e '/usr/games/pacman4console'" > ${scp_game_d}/PACMAN$CONSOLE_[CLI].sh

echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 1.00" > ${scp_br_d}/BRIGHTNESS_100_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.95" > ${scp_br_d}/BRIGHTNESS_095_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.90" > ${scp_br_d}/BRIGHTNESS_090_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.85" > ${scp_br_d}/BRIGHTNESS_085_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.80" > ${scp_br_d}/BRIGHTNESS_080_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.75" > ${scp_br_d}/BRIGHTNESS_075_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.70" > ${scp_br_d}/BRIGHTNESS_070_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.65" > ${scp_br_d}/BRIGHTNESS_065_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.60" > ${scp_br_d}/BRIGHTNESS_060_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.55" > ${scp_br_d}/BRIGHTNESS_055_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.50" > ${scp_br_d}/BRIGHTNESS_050_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.45" > ${scp_br_d}/BRIGHTNESS_045_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.40" > ${scp_br_d}/BRIGHTNESS_040_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.35" > ${scp_br_d}/BRIGHTNESS_035_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.30" > ${scp_br_d}/BRIGHTNESS_030_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.25" > ${scp_br_d}/BRIGHTNESS_025_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.20" > ${scp_br_d}/BRIGHTNESS_020_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.15" > ${scp_br_d}/BRIGHTNESS_015_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.10" > ${scp_br_d}/BRIGHTNESS_010_[PERCENTAGE].sh
echo "xrandr --output \"\$(xrandr | grep 'connected primary' | awk '{print \$1}')\" --brightness 0.05" > ${scp_br_d}/BRIGHTNESS_005_[PERCENTAGE].sh

chmod --recursive 755 "${scp_base_d}"
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function file_desktop_distro_base_funcion() {
cat << EOF > /usr/share/applications/RESOLUTION_MONITOR_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=RESOLUTION_MONITOR_[CLI]_[${distro_name}]
Exec=${scp_tool_d}/RESOLUTION_MONITOR_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=true
Categories=DistroDesktop
EOF

cat << EOF > /usr/share/applications/COLOUR_TERM_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=COLOUR_TERM_[CLI]_[${distro_name}]
Exec=${scp_tool_d}/COLOUR_TERM_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=true
Categories=DistroDesktop;JWM_Customization
EOF

cat << EOF > /usr/share/applications/YOUTUBE_URL_EXTRACTOR_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=YOUTUBE_URL_EXTRACTOR_[CLI]_[${distro_name}]
Exec=${scp_ext_d}/YOUTUBE_URL_EXTRACTOR_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=true
Categories=DistroDesktop;Utility
EOF

cat << EOF > /usr/share/applications/BOOKMARK_CONVERTER_URL_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=BOOKMARK_CONVERTER_URL_[CLI]_[${distro_name}]
Exec=${scp_ext_d}/BOOKMARK_CONVERTER_URL_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=true
Categories=DistroDesktop;Utility
EOF

cat << EOF > /usr/share/applications/SEARCH_WORD_IN_FILE_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=SEARCH_WORD_IN_FILE_[CLI]_[${distro_name}]
Exec=${scp_ext_d}/SEARCH_WORD_IN_FILE_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=true
Categories=DistroDesktop;Utility
EOF

cat << EOF > /usr/share/applications/SESION_[XMSG]_[${distro_name}].desktop
[Desktop Entry]
Name=SESION_[XMSG]_[${distro_name}]
Exec=${scp_base_d}/SESION_[XMSG].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;JWM
EOF

cat << EOF > /usr/share/applications/SESION_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=SESION_[CLI]_[${distro_name}]
Exec=${scp_base_d}/SESION_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=true
Categories=DistroDesktop;Utility;JWM
EOF

cat << EOF > /usr/share/applications/DIRECTORIES_USER_MENU_[GUI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORIES_USER_MENU_[GUI]_[${distro_name}]
Exec=${p_user_d}/DIRECTORIES_USER_MENU_[GUI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;GUI
EOF

cat << EOF > /usr/share/applications/DIRECTORIES_USER_MENU_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORIES_USER_MENU_[CLI]_[${distro_name}]
Exec=${p_user_d}/DIRECTORIES_USER_MENU_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;CLI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_HOMEUSER_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_HOMEUSER_[CLI]_[${distro_name}]
Exec=${pu_cli_d}/DIRECTORY_HOMEUSER_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;CLI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_DOWNLOAD_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_DOWNLOAD_[CLI]_[${distro_name}]
Exec=${pu_cli_d}/DIRECTORY_DOWNLOAD_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;CLI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_DESKTOP_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_DESKTOP_[CLI]_[${distro_name}]
Exec=${pu_cli_d}/DIRECTORY_DESKTOP_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;CLI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_MUSIC_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_MUSIC_[CLI]_[${distro_name}]
Exec=${pu_cli_d}/DIRECTORY_MUSIC_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;CLI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_PICTURES_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_PICTURES_[CLI]_[${distro_name}]
Exec=${pu_cli_d}/DIRECTORY_PICTURES_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;CLI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_VIDEOS_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_VIDEOS_[CLI]_[${distro_name}]
Exec=${pu_cli_d}/DIRECTORY_VIDEOS_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;CLI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_TEMPLATES_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_TEMPLATES_[CLI]_[${distro_name}]
Exec=${pu_cli_d}/DIRECTORY_TEMPLATES_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;CLI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_PUBLIC_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_PUBLIC_[CLI]_[${distro_name}]
Exec=${pu_cli_d}/DIRECTORY_PUBLIC_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;CLI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_DOCUMENTS_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_DOCUMENTS_[CLI]_[${distro_name}]
Exec=${pu_cli_d}/DIRECTORY_DOCUMENTS_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;CLI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_NOTES_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_NOTES_[CLI]_[${distro_name}]
Exec=${pu_cli_d}/DIRECTORY_NOTES_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;CLI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_SCREENSHOTS_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_SCREENSHOTS_[CLI]_[${distro_name}]
Exec=${pu_cli_d}/DIRECTORY_SCREENSHOTS_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;CLI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_HOMEUSER_[GUI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_HOMEUSER_[GUI]_[${distro_name}]
Exec=${pu_gui_d}/DIRECTORY_HOMEUSER_[GUI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;GUI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_DOWNLOAD_[GUI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_DOWNLOAD_[GUI]_[${distro_name}]
Exec=${pu_gui_d}/DIRECTORY_DOWNLOAD_[GUI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;GUI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_DESKTOP_[GUI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_DESKTOP_[GUI]_[${distro_name}]
Exec=${pu_gui_d}/DIRECTORY_DESKTOP_[GUI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;GUI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_MUSIC_[GUI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_MUSIC_[GUI]_[${distro_name}]
Exec=${pu_gui_d}/DIRECTORY_MUSIC_[GUI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;GUI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_PICTURES_[GUI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_PICTURES_[GUI]_[${distro_name}]
Exec=${pu_gui_d}/DIRECTORY_PICTURES_[GUI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;GUI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_VIDEOS_[GUI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_VIDEOS_[GUI]_[${distro_name}]
Exec=${pu_gui_d}/DIRECTORY_VIDEOS_[GUI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;GUI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_TEMPLATES_[GUI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_TEMPLATES_[GUI]_[${distro_name}]
Exec=${pu_gui_d}/DIRECTORY_TEMPLATES_[GUI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;GUI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_PUBLIC_[GUI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_PUBLIC_[GUI]_[${distro_name}]
Exec=${pu_gui_d}/DIRECTORY_PUBLIC_[GUI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;GUI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_DOCUMENTS_[GUI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_DOCUMENTS_[GUI]_[${distro_name}]
Exec=${pu_gui_d}/DIRECTORY_DOCUMENTS_[GUI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;GUI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_NOTES_[GUI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_NOTES_[GUI]_[${distro_name}]
Exec=${pu_gui_d}/DIRECTORY_NOTES_[GUI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;GUI
EOF

cat << EOF > /usr/share/applications/DIRECTORY_SCREENSHOTS_[GUI]_[${distro_name}].desktop
[Desktop Entry]
Name=DIRECTORY_SCREENSHOTS_[GUI]_[${distro_name}]
Exec=${pu_gui_d}/DIRECTORY_SCREENSHOTS_[GUI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;Directory;GUI
EOF

cat << EOF > /usr/share/applications/2048_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=2048_[CLI]_[${distro_name}]
Exec=${scp_game_d}/2048_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Games
EOF

cat << EOF > /usr/share/applications/BASTET_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=BASTET_[CLI]_[${distro_name}]
Exec=${scp_game_d}/BASTET_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Games
EOF

cat << EOF > /usr/share/applications/NINVADERS_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=NINVADERS_[CLI]_[${distro_name}]
Exec= ${scp_game_d}/NINVADERS_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Games
EOF

cat << EOF > /usr/share/applications/NSNAKE_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=NSNAKE_[CLI]_[${distro_name}]
Exec=${scp_game_d}/NSNAKE_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Games
EOF

cat << EOF > /usr/share/applications/SCREENSHOT_[IMAGEMAGICK]_[${distro_name}].desktop
[Desktop Entry]
Name=SCREENSHOT_[IMAGEMAGICK]_[${distro_name}]
Exec=${scp_tool_d}/SCREENSHOT_[IMAGEMAGICK].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility
EOF

cat << EOF > /usr/share/applications/NANO_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=NANO_[CLI]_[${distro_name}]
Exec=${scp_tool_d}/NANO_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility
EOF

cat << EOF > /usr/share/applications/TOP_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=TOP_[CLI]_[${distro_name}]
Exec=${scp_tool_d}/TOP_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility
EOF

cat << EOF > /usr/share/applications/BATTERY_WARNING_[ACPI]_[XSMG]_[${distro_name}].desktop
[Desktop Entry]
Name=BATTERY_WARNING_[ACPI]_[XSMG]_[${distro_name}]
Exec=${scp_tool_d}/BATTERY_WARNING_[ACPI]_[XSMG].sh
Icon=${distro_logo}
Type=Application
Terminal=true
Categories=DistroDesktop
EOF

cat << EOF > /usr/share/applications/BATTERY_STATUS_[ACPI]_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=BATTERY_STATUS_[ACPI]_[CLI]_[${distro_name}]
Exec=${scp_tool_d}/BATTERY_STATUS_[ACPI]_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=true
Categories=DistroDesktop
EOF
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function grub_distro_funcion() {
cat << EOF > /etc/grub.d/99_${distro_name}_theme
#!/bin/sh
set -e

# Include the GRUB helper library for grub-mkconfig.
. /usr/share/grub/grub-mkconfig_lib 

# We want to work in /boot/grub/ only.
test -d /boot/grub && cd /boot/grub

# Set the default theme colors.
set_default_theme() {
    echo "set menu_color_normal=blue/black"
    echo "set menu_color_highlight=green/black"
}

set_default_theme
EOF
chmod 777 /etc/grub.d/99_${distro_name}_theme

cat << EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

#Config. generic {
GRUB_DEFAULT=0
GRUB_TIMEOUT=7
GRUB_TIMEOUT_STYLE=menu
GRUB_DISABLE_OS_PROBER=false
#GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo ${distro_name}`
#GRUB_DISTRIBUTOR=`echo ${distro_name}`
GRUB_DISTRIBUTOR=${distro_name}
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX=""
# }

#Config. minimal {
GRUB_TERMINAL=console
GRUB_TERMINAL_OUTPUT=console
# }

#Config. graphic {
#GRUB_TERMINAL=gfxterm
#GRUB_TERMINAL_OUTPUT=gfxterm
#GRUB_FONT=""
#GRUB_COLOR_NORMAL="blue/black"
#GRUB_COLOR_HIGHLIGHT="green/black"
#GRUB_BACKGROUND="/path/background"
#GRUB_THEME="/path/theme"
#GRUB_GFXMODE=480x360
#GRUB_GFXPAYLOAD_LINUX=keep
# }

# If your computer has multiple operating systems installed, then you
# probably want to run os-prober. However, if your computer is a host
# for guest OSes installed via LVM or raw disk devices, running
# os-prober can cause damage to those guest OSes as it mounts
# filesystems to look for things.
#GRUB_DISABLE_OS_PROBER=false

# Uncomment to enable BadRAM filtering, modify to suit your needs
# This works with Linux (no patch required) and with any kernel that obtains
# the memory map information from GRUB (GNU Mach, kernel of FreeBSD ...)
#GRUB_BADRAM="0x01234567,0xfefefefe,0x89abcdef,0xefefefef"

# Uncomment to disable graphical terminal
#GRUB_TERMINAL=console

# The resolution used on graphical terminal
# note that you can use only modes which your graphic card supports via VBE
# you can see them in real GRUB with the command "vbeinfo"
#GRUB_GFXMODE=640x480

# Uncomment if you don't want GRUB to pass "root=UUID=xxx" parameter to Linux
#GRUB_DISABLE_LINUX_UUID=true

# Uncomment to disable generation of recovery mode menu entries
#GRUB_DISABLE_RECOVERY="true"

# Uncomment to get a beep at grub start
#GRUB_INIT_TUNE="480 440 1"
EOF

grub-mkconfig -o /boot/grub/grub.cfg; update-grub
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function distro_rename_funcion() {
cat << EOF > /etc/os-release
PRETTY_NAME="'${distro_name}' GNU/Linux ${nro_version} (${distro_code_name})"
NAME="'${distro_name}' GNU/Linux"
VERSION_ID="${nro_version}"
VERSION="'${nro_version}' (${distro_code_name})"
VERSION_CODENAME="${distro_code_name}"
ID="${distro_name}"
HOME_URL="${url_page_distro}"
SUPPORT_URL="${url_support_distro}"
BUG_REPORT_URL="${url_report_bugs_distro}"
EOF

cat << EOF > /usr/bin/lsb_release
Distributor ID:	"${distro_name}"
Description:	"${distro_name} GNU/Linux ${nro_version} (${distro_code_name})"
Release:	"${nro_version}"
Codename:	"${distro_code_name}"
EOF

echo "${distro_name} GNU/Linux ${nro_version} \n \l" > /etc/issue
echo "${nro_version}" > /etc/debian_version
sed -i "s|debian|${distro_name}|" /etc/hostname
sed -i "s|debian|${distro_name}|" /etc/hosts
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function autostart_gui_funcion() {
b="/etc/bash.bashrc"; bt="/tmp/etc_bash_bashrc"; cp -v $b $bt
> $b; echo "clear" >> $b; echo "date '+%^A %d/%^B/%Y %T'" >> $b; echo "figlet '${distro_name}' ${nro_version}" >> $b; echo "" >> $b; cat "$bt" >> $b

p="/etc/profile"; pt="/tmp/etc_profile"; cp -v $p $pt
> $p; echo "startx" >> $p; echo "" >> $p; cat "$pt" >> $p

#x="/etc/X11/xinit/xinitrc"; xt="/tmp/etc_X11_xinit_xinitrc"; #cp -v $x $xt
#> $x; #echo "#!/bin/bash" >> $x; #echo "exec jwm" >> $x; #cat "$xt" >> $x; #sed -i "s|#!/bin/sh|echo ''|" '$xt'
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function appweb_scripts_funcion() {
scp_appweb_d="${scp_base_d}/APP_WEBS_Scripts"; mkdir -p -v "${scp_appweb_d}"
appweb_search_web_d="${scp_appweb_d}/Search-Webs"; mkdir -p -v "${appweb_search_web_d}"
appweb_social_media_d="${scp_appweb_d}/Social_Media"; mkdir -p -v "${appweb_social_media_d}"
appweb_msg_service_d="${scp_appweb_d}/Message_Service"; mkdir -p -v "${appweb_msg_service_d}"
appweb_music_stream_d="${scp_appweb_d}/Music_Streaming-Service"; mkdir -p -v "${appweb_music_stream_d}"
appweb_video_stream_d="${scp_appweb_d}/Video_Streaming-Service"; mkdir -p -v "${appweb_video_stream_d}"
appweb_yt_d="${scp_appweb_d}/YouTube_Service"; mkdir -p -v "${appweb_yt_d}"
appweb_ms_office_d="${scp_appweb_d}/Microsoft_Office"; mkdir -p -v "${appweb_ms_office_d}"
appweb_google_office_d="${scp_appweb_d}/Google_Office"; mkdir -p -v "${appweb_google_office_d}"
appweb_tool_online_d="${scp_appweb_d}/Tool_Online"; mkdir -p -v "${appweb_tool_online_d}"
appweb_ai_tool_d="${appweb_tool_online_d}/AI"; mkdir -p -v "${appweb_ai_tool_d}"
appweb_linux_distro_d="${scp_appweb_d}/Others_Distros_Linux"; mkdir -p -v "${appweb_linux_distro_d}"
appweb_buy_sale_d="${scp_appweb_d}/Buy_and_Sale"; mkdir -p -v "${appweb_buy_sale_d}"

echo "/usr/bin/x-www-browser --app=https://astiango.co/" > ${appweb_search_web_d}/appweb_astian.sh
echo "/usr/bin/x-www-browser --new-window https://astiango.co/" > ${appweb_search_web_d}/newwindow_astian.sh
echo "/usr/bin/x-www-browser --incognito https://astiango.co/" > ${appweb_search_web_d}/incognito_astian.sh
echo "/usr/bin/x-www-browser --app=https://www.bing.com/" > ${appweb_search_web_d}/appweb_bing.sh
echo "/usr/bin/x-www-browser --new-window https://www.bing.com/" > ${appweb_search_web_d}/newwindow_bing.sh
echo "/usr/bin/x-www-browser --incognito https://www.bing.com/" > ${appweb_search_web_d}/incognito_bing.sh
echo "/usr/bin/x-www-browser --app=https://search.brave.com/" > ${appweb_search_web_d}/appweb_brave.sh
echo "/usr/bin/x-www-browser --new-window https://search.brave.com/" > ${appweb_search_web_d}/newwindow_brave.sh
echo "/usr/bin/x-www-browser --incognito https://search.brave.com/" > ${appweb_search_web_d}/incognito_brave.sh
echo "/usr/bin/x-www-browser --app=https://duckduckgo.com/" > ${appweb_search_web_d}/appweb_duckduckgo.sh
echo "/usr/bin/x-www-browser --new-window https://duckduckgo.com/" > ${appweb_search_web_d}/newwindow_duckduckgo.sh
echo "/usr/bin/x-www-browser --incognito https://duckduckgo.com/" > ${appweb_search_web_d}/incognito_duckduckgo.sh
echo "/usr/bin/x-www-browser --app=https://www.ecosia.org" > ${appweb_search_web_d}/appweb_ecosia.sh
echo "/usr/bin/x-www-browser --new-window https://www.ecosia.org" > ${appweb_search_web_d}/newwindow_ecosia.sh
echo "/usr/bin/x-www-browser --incognito https://www.ecosia.org" > ${appweb_search_web_d}/incognito_ecosia.sh
echo "/usr/bin/x-www-browser --app=https://www.gibiru.com" > ${appweb_search_web_d}/appweb_gibiru.sh
echo "/usr/bin/x-www-browser --new-window https://www.gibiru.com" > ${appweb_search_web_d}/newwindow_gibiru.sh
echo "/usr/bin/x-www-browser --incognito https://www.gibiru.com" > ${appweb_search_web_d}/incognito_gibiru.sh
echo "/usr/bin/x-www-browser --app=https://www.google.com/" > ${appweb_search_web_d}/appweb_google.sh
echo "/usr/bin/x-www-browser --new-window https://www.google.com/" > ${appweb_search_web_d}/newwindow_google.sh
echo "/usr/bin/x-www-browser --incognito https://www.google.com/" > ${appweb_search_web_d}/incognito_google.sh
echo "/usr/bin/x-www-browser --app=https://www.startpage.com" > ${appweb_search_web_d}/appweb_startpage.sh
echo "/usr/bin/x-www-browser --new-window https://www.startpage.com" > ${appweb_search_web_d}/newwindow_startpage.sh
echo "/usr/bin/x-www-browser --incognito https://www.startpage.com" > ${appweb_search_web_d}/incognito_startpage.sh
echo "/usr/bin/x-www-browser --app=https://www.qwant.com" > ${appweb_search_web_d}/appweb_qwant.sh
echo "/usr/bin/x-www-browser --new-window https://www.qwant.com" > ${appweb_search_web_d}/newwindow_qwant.sh
echo "/usr/bin/x-www-browser --incognito https://www.qwant.com" > ${appweb_search_web_d}/incognito_qwant.sh

echo "/usr/bin/x-www-browser --app=https://www.alibaba.com/" > ${appweb_buy_sale_d}/appweb_alibaba.sh
echo "/usr/bin/x-www-browser --app=https://aliexpress.com/" > ${appweb_buy_sale_d}/appweb_aliexpress.sh
echo "/usr/bin/x-www-browser --app=https://www.amazon.com/" > ${appweb_buy_sale_d}/appweb_amazon.sh
echo "/usr/bin/x-www-browser --app=https://www.banggood.com/" > ${appweb_buy_sale_d}/appweb_banggood.sh
echo "/usr/bin/x-www-browser --app=https://www.ebay.com/" > ${appweb_buy_sale_d}/appweb_ebay.sh
echo "/usr/bin/x-www-browser --app=https://www.mercadolibre.com" > ${appweb_buy_sale_d}/appweb_mercadolibre.sh
echo "/usr/bin/x-www-browser --app=https://wallapop.com/" > ${appweb_buy_sale_d}/appweb_wallapop.sh
echo "/usr/bin/x-www-browser --app=https://www.wish.com/" > ${appweb_buy_sale_d}/appweb_wish.sh

echo "/usr/bin/x-www-browser --app=https://www.debian.org/" > ${appweb_linux_distro_d}/appweb_debian.sh
echo "/usr/bin/x-www-browser --app=https://loc-os.com/" > ${appweb_linux_distro_d}/appweb_locos.sh
echo "/usr/bin/x-www-browser --app=https://antixlinux.com/" > ${appweb_linux_distro_d}/appweb_antixlinux.sh
echo "/usr/bin/x-www-browser --app=https://www.slax.org/" > ${appweb_linux_distro_d}/appweb_slax.sh
echo "/usr/bin/x-www-browser --app=https://www.bodhilinux.com/" > ${appweb_linux_distro_d}/appweb_bodhilinux.sh
echo "/usr/bin/x-www-browser --app=https://q4os.org/" > ${appweb_linux_distro_d}/appweb_q4os.sh
echo "/usr/bin/x-www-browser --app=https://mxlinux.org/" > ${appweb_linux_distro_d}/appweb_mxlinux.sh
echo "/usr/bin/x-www-browser --app=https://zorin.com/" > ${appweb_linux_distro_d}/appweb_zorin.sh
echo "/usr/bin/x-www-browser --app=https://www.devuan.org/" > ${appweb_linux_distro_d}/appweb_devuan.sh
echo "/usr/bin/x-www-browser --app=https://www.bunsenlabs.org/" > ${appweb_linux_distro_d}/appweb_bunsenlabs.sh
echo "/usr/bin/x-www-browser --app=https://www.kali.org/" > ${appweb_linux_distro_d}/appweb_kali.sh
echo "/usr/bin/x-www-browser --app=https://tails.net/" > ${appweb_linux_distro_d}/appweb_tails.sh
echo "/usr/bin/x-www-browser --app=https://www.parrotsec.org/" > ${appweb_linux_distro_d}/appweb_parrotsec.sh
echo "/usr/bin/x-www-browser --app=https://ubuntu.com/" > ${appweb_linux_distro_d}/appweb_ubuntu.sh
echo "/usr/bin/x-www-browser --app=https://www.linuxmint.com/" > ${appweb_linux_distro_d}/appweb_linuxmint.sh
echo "/usr/bin/x-www-browser --app=https://lubuntu.me/" > ${appweb_linux_distro_d}/appweb_lubuntu.sh
echo "/usr/bin/x-www-browser --app=https://kubuntu.org/" > ${appweb_linux_distro_d}/appweb_kubuntu.sh
echo "/usr/bin/x-www-browser --app=https://xubuntu.org/" > ${appweb_linux_distro_d}/appweb_xubuntu.sh
echo "/usr/bin/x-www-browser --app=https://archlinux.org/" > ${appweb_linux_distro_d}/appweb_archlinux.sh
echo "/usr/bin/x-www-browser --app=https://artixlinux.org/" > ${appweb_linux_distro_d}/appweb_artixlinux.sh
echo "/usr/bin/x-www-browser --app=https://manjaro.org/" > ${appweb_linux_distro_d}/appweb_manjaro.sh
echo "/usr/bin/x-www-browser --app=http://www.slackware.com/" > ${appweb_linux_distro_d}/appweb_slackware.sh
echo "/usr/bin/x-www-browser --app=http://www.porteus.org/" > ${appweb_linux_distro_d}/appweb_porteus.sh
echo "/usr/bin/x-www-browser --app=https://www.absolutelinux.org/" > ${appweb_linux_distro_d}/appweb_absolutelinux.sh
echo "/usr/bin/x-www-browser --app=https://www.slax.org/" > ${appweb_linux_distro_d}/appweb_slax.sh
echo "/usr/bin/x-www-browser --app=https://www.opensuse.org/" > ${appweb_linux_distro_d}/appweb_opensuse.sh
echo "/usr/bin/x-www-browser --app=https://www.gentoo.org/" > ${appweb_linux_distro_d}/appweb_gentoo.sh
echo "/usr/bin/x-www-browser --app=https://www.deepin.org/" > ${appweb_linux_distro_d}/appweb_deepin.sh

echo "/usr/bin/x-www-browser --app=https://docs.google.com/" > ${appweb_google_office_d}/appweb_google_office_center.sh
echo "/usr/bin/x-www-browser --app=https://docs.google.com/document/" > ${appweb_google_office_d}/appweb_google_office_document.sh
echo "/usr/bin/x-www-browser --app=https://docs.google.com/spreadsheets/" > ${appweb_google_office_d}/appweb_google_office_spreadsheets.sh
echo "/usr/bin/x-www-browser --app=https://docs.google.com/presentation/" > ${appweb_google_office_d}/appweb_google_office_presentation.sh
echo "/usr/bin/x-www-browser --app=https://docs.google.com/forms/" > ${appweb_google_office_d}/appweb_google_office_forms.sh

echo "/usr/bin/x-www-browser --app=https://chatgpt.com/" > ${appweb_ai_tool_d}/appweb_chatgpt.sh
echo "/usr/bin/x-www-browser --app=https://www.deepseek.com/" > ${appweb_ai_tool_d}/appweb_deepseek.sh
echo "/usr/bin/x-www-browser --app=https://gemini.google.com/" > ${appweb_ai_tool_d}/appweb_gemini.sh
echo "/usr/bin/x-www-browser --app=https://copilot.microsoft.com/" > ${appweb_ai_tool_d}/appweb_copilot.sh
echo "/usr/bin/x-www-browser --app=https://leonardo.ai/" > ${appweb_ai_tool_d}/appweb_leonardo_ai.sh
echo "/usr/bin/x-www-browser --app=https://openart.ai/" > ${appweb_ai_tool_d}/appweb_openart.sh
echo "/usr/bin/x-www-browser --app=https://suno.com/" > ${appweb_ai_tool_d}/appweb_suno.sh
echo "/usr/bin/x-www-browser --app=https://deepai.org/" > ${appweb_ai_tool_d}/appweb_deepai.sh
echo "/usr/bin/x-www-browser --app=https://pixlr.com/" > ${appweb_ai_tool_d}/appweb_pixlr.sh
echo "/usr/bin/x-www-browser --app=https://civitai.com/" > ${appweb_ai_tool_d}/appweb_civitai.sh
echo "/usr/bin/x-www-browser --app=https://www.perplexity.ai/" > ${appweb_ai_tool_d}/appweb_perplexity.sh
echo "/usr/bin/x-www-browser --app=https://chat.mistral.ai/chat" > ${appweb_ai_tool_d}/appweb_chat_mistral.sh
echo "/usr/bin/x-www-browser --app=https://mylens.ai/" > ${appweb_ai_tool_d}/appweb_mylens.sh
echo "/usr/bin/x-www-browser --app=https://www.piclumen.com/es/" > ${appweb_ai_tool_d}/appweb_piclumen.sh
echo "/usr/bin/x-www-browser --app=https://www.giz.ai/" > ${appweb_ai_tool_d}/appweb_giz.sh
echo "/usr/bin/x-www-browser --app=https://notebooklm.google/" > ${appweb_ai_tool_d}/appweb_google_notebooklm.sh
echo "/usr/bin/x-www-browser --app=https://lemonslice.com/" > ${appweb_ai_tool_d}/appweb_lemonslice.sh
echo "/usr/bin/x-www-browser --app=https://www.aiease.ai/" > ${appweb_ai_tool_d}/appweb_aiease.sh

echo "/usr/bin/x-www-browser --app=https://discord.com/" > ${appweb_msg_service_d}/appweb_discord.sh
echo "/usr/bin/x-www-browser --app=https://chat.google.com/" > ${appweb_msg_service_d}/appweb_google_chat.sh
echo "/usr/bin/x-www-browser --app=https://web.skype.com/" > ${appweb_msg_service_d}/appweb_skype.sh
echo "/usr/bin/x-www-browser --app=https://web.telegram.org/" > ${appweb_msg_service_d}/appweb_telegram.sh
echo "/usr/bin/x-www-browser --app=https://web.whatsapp.com/" > ${appweb_msg_service_d}/appweb_whatsapp.sh

echo "/usr/bin/x-www-browser --app=https://www.office.com/" > ${appweb_ms_office_d}/appweb_ms_office_center.sh
echo "/usr/bin/x-www-browser --app=https://www.office.com/launch/word" > ${appweb_ms_office_d}/appweb_ms_office_word.sh
echo "/usr/bin/x-www-browser --app=https://www.office.com/launch/excel" > ${appweb_ms_office_d}/appweb_ms_office_excel.sh
echo "/usr/bin/x-www-browser --app=https://www.office.com/launch/powerpoint" > ${appweb_ms_office_d}/appweb_ms_office_powerpoint.sh
echo "/usr/bin/x-www-browser --app=https://forms.office.com/" > ${appweb_ms_office_d}/appweb_ms_office_forms.sh
echo "/usr/bin/x-www-browser --app=https://outlook.office.com/mail" > ${appweb_ms_office_d}/appweb_ms_office_outlook.sh
echo "/usr/bin/x-www-browser --app=https://onedrive.live.com/" > ${appweb_ms_office_d}/appweb_ms_office_onedrive.sh
echo "/usr/bin/x-www-browser --app=https://www.onenote.com/" > ${appweb_ms_office_d}/appweb_ms_office_onenote.sh
echo "/usr/bin/x-www-browser --app=https://teams.live.com/" > ${appweb_ms_office_d}/appweb_ms_office_teams.sh

echo "/usr/bin/x-www-browser --app=https://www.virustotal.com/gui/home/upload" > ${appweb_tool_online_d}/appweb_virustotal.sh
echo "/usr/bin/x-www-browser --app=https://www.geogebra.org/calculator" > ${appweb_tool_online_d}/appweb_geogebra.sh
echo "/usr/bin/x-www-browser --app=https://jspaint.app/" > ${appweb_tool_online_d}/appweb_jspaint.sh
echo "/usr/bin/x-www-browser --app=https://urlscan.io/" > ${appweb_tool_online_d}/appweb_urlscan.sh

echo "/usr/bin/x-www-browser --app=https://www.facebook.com/" > ${appweb_social_media_d}/appweb_facebook.sh
echo "/usr/bin/x-www-browser --app=https://www.instagram.com/" > ${appweb_social_media_d}/appweb_instagram.sh
echo "/usr/bin/x-www-browser --app=https://pinterest.com/" > ${appweb_social_media_d}/appweb_pinterest.sh
echo "/usr/bin/x-www-browser --app=https://www.reddit.com/" > ${appweb_social_media_d}/appweb_reddit.sh
echo "/usr/bin/x-www-browser --app=https://www.snapchat.com/" > ${appweb_social_media_d}/appweb_snapchat.sh
echo "/usr/bin/x-www-browser --app=https://www.tiktok.com/" > ${appweb_social_media_d}/appweb_tiktok.sh
echo "/usr/bin/x-www-browser --app=https://x.com/" > ${appweb_social_media_d}/appweb_twitter_x.sh

echo "/usr/bin/x-www-browser --app=https://soundcloud.com/" > ${appweb_music_stream_d}/appweb_soundcloud.sh
echo "/usr/bin/x-www-browser --app=https://open.spotify.com/" > ${appweb_music_stream_d}/appweb_spotify.sh
echo "/usr/bin/x-www-browser --app=https://music.amazon.es/" > ${appweb_music_stream_d}/appweb_amazon_music.sh
echo "/usr/bin/x-www-browser --app=https://music.youtube.com/" > ${appweb_music_stream_d}/appweb_youtube_music.sh
echo "/usr/bin/x-www-browser --app=https://music.apple.com/" > ${appweb_music_stream_d}/appweb_apple_music.sh

echo "/usr/bin/x-www-browser --app=https://kick.com/" > ${appweb_video_stream_d}/appweb_kick.sh
echo "/usr/bin/x-www-browser --app=https://www.twitch.tv/" > ${appweb_video_stream_d}/appweb_twitch.sh
echo "/usr/bin/x-www-browser --app=https://trovo.live/" > ${appweb_video_stream_d}/appweb_trovo.sh
echo "/usr/bin/x-www-browser --app=https://rumble.com/" > ${appweb_video_stream_d}/appweb_rumble.sh

echo "/usr/bin/x-www-browser --app=https://www.youtube.com/" > ${appweb_yt_d}/appweb_youtube.sh
echo "/usr/bin/x-www-browser --app=https://www.youtube.com/premium" > ${appweb_yt_d}/appweb_youtube_premium.sh
echo "/usr/bin/x-www-browser --app=https://www.youtubekids.com/" > ${appweb_yt_d}/appweb_youtube_kids.sh

chmod -R 777 "${scp_appweb_d}"
}
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××┃
# ┃××××××××××××××××××××××××××××××××-DISTRO_BASE_[JWM]-××××××××××××××××××××××××××××××××┃
# ┃×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
function install_jwm_funcion() {
apt -y install jwm xorg gmrun
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function generator_directory_jwm_funcion() {
jwm_d="/etc/jwm"; cfg_jwm_d="${jwm_d}/Config-JWM"; img_d="${cfg_jwm_d}/IMGs"; txt_d="${cfg_jwm_d}/TXTs"
icon_d="${img_d}/Icons"; tm_d="${img_d}/Themes"; bg_jwm_d="${img_d}/Wallpapers"
bkp_d="${txt_d}/Backups"; scp_d="${txt_d}/Scripts"; sys_jwm_d="${txt_d}/Content_TXTs_SystemJWMRC"; man_jwm_d="${txt_d}/Manuals_JWM"
rm_d="${sys_jwm_d}/Roots_Menus"; rm_mn_d="${rm_d}/Main"; rm_mn_ext_d="${rm_mn_d}/Extras"; rm_br_d="${rm_d}/Brightness"; rm_lt_d="${rm_d}/Lights"; rm_red_d="${rm_d}/Red"
scp_cfg_d="${scp_d}/Personalization_JWM"; 
mkdir -p -v "${icon_d}" "${tm_d}" "${bg_jwm_d}" "${bkp_d}" "${man_jwm_d}" "${rm_mn_ext_d}" "${rm_br_d}" "${rm_lt_d}" "${rm_red_d}"
mkdir -p -v "${scp_cfg_d}"

#scp_nmtui_d="${scp_d}/NMTUI"; mkdir -p -v "${scp_nmtui_d}"
#"${scp_br_d}"; scp_br_d="${scp_d}/Brightness"
#"${scp_lt_d}"; scp_lt_d="${scp_d}/Lights"
#p_user_d="${scp_d}/Directories_Personal_User";  "${p_user_d}" 
#pu_cli_d="${p_user_d}/CLI"; pu_gui_d="${p_user_d}/GUI";"${pu_cli_d}" "${pu_gui_d}"
#scp_game_d="${scp_d}/Games";  "${scp_game_d}"
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function install_icon_jwm_funcion() {
apt -y install moka-icon-theme
moka="/usr/share/icons/Moka/48x48"
moka_d="${icon_d}/moka-icon-theme/moka_d/Moka/48x48"

faba="/usr/share/icons/Faba/48x48"
faba_d="${icon_d}/faba-icon-theme/faba_d/Faba/48x48"

mkdir -p -v "${moka_d}" "${faba_d}"

act_moka_d="${moka_d}/actions"
app_moka_d="${moka_d}/apps"
cat_moka_d="${moka_d}/categories"
dev_moka_d="${moka_d}/devices"
emb_moka_d="${moka_d}/emblems"
mime_moka_d="${moka_d}/mimetypes"
pla_moka_d="${moka_d}/places"
sta_moka_d="${moka_d}/status"
web_moka_d="${moka_d}/web"
mkdir -p -v "${act_moka_d}" "${app_moka_d}" "${cat_moka_d}" "${dev_moka_d}" "${emb_moka_d}" "${mime_moka_d}" "${pla_moka_d}" "${sta_moka_d}" "${web_moka_d}"

act_faba_d="${faba_d}/actions"
app_faba_d="${faba_d}/apps"
cat_faba_d="${faba_d}/categories"
dev_faba_d="${faba_d}/devices"
mime_faba_d="${faba_d}/mimetypes"
not_faba_d="${faba_d}/notifications"
pla_faba_d="${faba_d}/places"
sta_faba_d="${faba_d}/status"
mkdir -p -v "${act_faba_d}" "${app_faba_d}" "${cat_faba_d}" "${dev_faba_d}" "${mime_faba_d}" "${not_faba_d}" "${pla_faba_d}" "${sta_faba_d}"

act_moka="
system-lock-screen.png
system-log-out.png
system-restart.png
system-run.png
system-shutdown.png
system-sleep.png
system-suspend.png
system-users.png"

app_moka="
0ad.png
2048.png
abiword.png
accessories-calculator.png
accessories-camera.png
accessories-character-map.png
accessories-clipboard.png
accessories-dictionary.png
accessories-document-viewer.png
accessories-media-converter.png
accessories-painting.png
accessories-podcast.png
accessories-system-cleaner.png
accessories-text-editor.png
accessories-thesaurus.png
acetoneiso.png
acroread.png
addressbook.png
adobe-air.png
aisleriot.png
amarok.png
android-studio.png
anjuta.png
anki.png
app-launcher.png
applets-screenshooter.png
aptanastudio.png
archive-manager.png
ardour.png
arduino-ide.png
arista.png
aseprite.png
assistant-qt4.png
astahc.png
atom.png
atom-beta.png
audacious.png
audacity.png
audio-equalizer.png
authy.png
autokey.png
avast.png
banshee.png
battlenet.png
beaver.png
birdie.png
bitcoin.png
bitdefender.png
bittorrentsync.png
bitwig-studio.png
bleachbit.png
blender.png
bluefish.png
bluetooth.png
boincmgr.png
bokken.png
bootloader.png
brackets.png
brave.png
budgie.png
byobu.png
caffeine.png
cairo-dock.png
calendar.png
calibre.png
ccc_large.png
ccsm.png
ccstudio.png
checkbox.png
cheese.png
cherrytree.png
chess.png
chrome-app-list.png
chromium-browser.png
chromium-browser-old.png
clamav.png
clementine.png
clinica.png
clipgrab.png
clock.png
cmake.png
cmplayer.png
codeblocks.png
colorhug.png
colorhug-ccmx.png
colorhug-flash.png
comix.png
conky-manager.png
corebird.png
counter-strike.png
crossover.png
cs-tiling.png
curlew.png
cutecom.png
darktable.png
dart.png
dasher.png
dconf-editor.png
deadbeef.png
deepin-media-player.png
deja-dup.png
deluge.png
designer-qt4.png
desktop-environment-gnome.png
desktop-environment-kde.png
desktop-environment-lxde.png
desktop-environment-mate.png
desktop-environment-unity.png
desktop-environment-xfce.png
desktop-magnifier.png
desktop-tweaks.png
desura.png
devhelp.png
d-feet.png
dia.png
direct-connect.png
discord.png
discord-canary.png
disk-burner.png
disk-usage-analyzer.png
display.im6.png
docky.png
dogecoin.png
dolphin-emu.png
dosbox.png
dota2.png
doublecmd.png
dropbox.png
ds-emulator.png
dvdrip.png
dvdstyler.png
earth.png
EasyTAG_icon.png
eclipse.png
eidete.png
ekiga.png
elasticsearch.png
elegance-colors.png
emacs.png
emerald.png
empathy.png
emule.png
espeak.png
ettercap.png
eufloria.png
exaile.png
exfalso.png
extensions.png
fbreader.png
fedora-release-notes.png
fedora-utils.png
fedorautils.png
fez.png
filebot.png
filezilla.png
finalterm.png
fingerprint-gui.png
firefox.png
firefox-nightly.png
firewall.png
fitbit.png
five-or-more.png
flash.png
fluxgui.png
focuswriter.png
fontforge.png
four-in-a-row.png
freemind.png
friends.png
frostwire.png
gajim.png
gameconqueror.png
gba.png
gbrainy.png
geany.png
gelemental.png
gensgs.png
genymotion.png
geogebra.png
gfeedline.png
ghex.png
gimp.png
gitg.png
gitkraken.png
gksu-root-terminal.png
glade.png
glippy.png
gloobus-preview.png
gmpc.png
gmusicbrowser.png
gnac.png
gnome-books.png
gnome-boxes.png
gnome-break-timer.png
gnome-clocks.png
gnome-disks.png
gnome-do.png
gnome-documents.png
gnome-games.png
gnome-klotski.png
gnome-music.png
gnome-nettool.png
gnome-nibbles.png
gnome-photos.png
gnome-power-statistics.png
gnome-quadrapassel.png
gnome-robots.png
gnome-software.png
gnome-sound-recorder.png
gnome-subtitles.png
gnome-tali.png
gnome-tetravex.png
gnome-todo.png
gnome-tweak-tool.png
gnome-weather.png
gnomines.png
gnucash.png
gnumeric.png
gnupg.png
gnu-r.png
godot.png
google-chrome.png
google-chrome-old.png
google-music-manager.png
google-webdesigner.png
gparted.png
gpick.png
gpk-service-pack.png
gpodder.png
gramps.png
grsync.png
gstreamer.png
gtg.png
gtkhash.png
gtkpod.png
gtk-recordmydesktop.png
gtkwave.png
guake.png
guayadeque.png
gummi.png
gwibber.png
haguichi.png
half-life.png
half-life2.png
hamster.png
handbrake.png
help-about.png
hexchat.png
higan.png
hipchat.png
homebank.png
hp-logo.png
hugin.png
hydrogen.png
iagno.png
ibus.png
ibus-bopomofo.png
ibus-pinyin.png
iceweasel.png
inkscape.png
insync.png
intellij-idea.png
intel-linux-graphics-installer.png
internet-mail.png
internet-news-reader.png
internet-telephony.png
internet-web-browser.png
jabber.png
jack.png
jamin.png
java.png
jdownloader.png
jockey.png
jokosher.png
juk.png
kazam.png
keepass.png
kile.png
kingsoft-presentation.png
kingsoft-spreadsheets.png
kingsoft-writer.png
kmymoney.png
kodi.png
komodo.png
konqueror.png
konversation.png
kopete.png
krita.png
ktorrent.png
lantern.png
laptop-mode-tools.png
lazarus.png
leafpad.png
left-for-dead.png
librecad.png
libreoffice-base.png
libreoffice-calc.png
libreoffice-draw.png
libreoffice-impress.png
libreoffice-main.png
libreoffice-math.png
libreoffice-writer.png
lightsoff.png
lightworks.png
lightzone.png
linguist-qt4.png
linthesia.png
lmms.png
logviewer.png
lollypop.png
luminance-hdr.png
lutris.png
lxmusic.png
lyx.png
mahjongg.png
manaplus.png
mathematica.png
matlab.png
mattermost-desktop.png
maxthon.png
mc.png
mega.png
meld.png
mendeley.png
menu-editor.png
midori.png
minecraft.png
minitube.png
miro.png
mixxx.png
mixxx-icon.png
mkvinfo.png
mkvmergeGUI.png
moka.png
moneydance.png
mongodb.png
monodevelop.png
mono-runtime-common.png
mpd.png
mplayer.png
mpv.png
ms-excel.png
ms-powerpoint.png
ms-word.png
multimedia-audio-player.png
multimedia-photo-viewer.png
multimedia-video-player.png
multisystem.png
mumble.png
musescore.png
musique.png
mysql-workbench.png
navicat.png
nemiver.png
netbeans.png
nexuiz.png
nicotine.png
ninja-ide.png
nitrotasks.png
notes.png
ntfs-config.png
nuvolaplayer.png
nvidia-settings.png
obconf.png
obs-studio.png
octave.png
onboard.png
openshot.png
openttd.png
opera.png
owncloud.png
oxygen.png
panel.png
panel-applets.png
passwords.png
patchage.png
pdfmod.png
pdfshuffler.png
pencil.png
phpmyadmin.png
picard.png
pidgin.png
pithos.png
plasma.png
playonlinux.png
plex.png
plt.png
poedit.png
polari.png
polly.png
popcorntime.png
portal.png
postgresql.png
pragha.png
preferences-bluetooth.png
preferences-color.png
preferences-desktop-accessibility.png
preferences-desktop-display.png
preferences-desktop-font.png
preferences-desktop-keyboard.png
preferences-desktop-keyboard-shortcuts.png
preferences-desktop-locale.png
preferences-desktop-online-accounts.png
preferences-desktop-screensaver.png
preferences-desktop-theme.png
preferences-desktop-user.png
preferences-desktop-wallpaper.png
preferences-kcalc-constants.png
preferences-management-service.png
preferences-plugins.png
preferences-system.png
preferences-system-bluetooth-inactive.png
preferences-system-brightness-lock.png
preferences-system-hotcorners.png
preferences-system-network.png
preferences-system-notifications.png
preferences-system-power.png
preferences-system-privacy.png
preferences-system-search.png
preferences-system-sharing.png
preferences-system-sound.png
preferences-system-time.png
preferences-system-windows.png
preferences-web-browser-cookies.png
preferences-web-browser-stylesheets.png
psensor.png
puddletag.png
putty.png
pycad.png
pycharm.png
pyrenamer.png
python.png
qcad.png
qr-creator.png
qsynth.png
qtconfig-qt4.png
qtiplot.png
QtProject-qtcreator.png
quassel.png
quiterss.png
quodlibet.png
qupzilla.png
radiotray.png
rambox.png
rapid-photo-downloader.png
rawtherapee.png
reditr.png
redshift.png
remote-desktop.png
retext.png
retroarch.png
rhythmbox.png
rstudio.png
rubymine.png
rygel.png
sakura.png
samba.png
screenruler.png
scribus.png
selinux.png
sencha-animator.png
serious-sam3-bfe.png
session-properties.png
shutter.png
sigil.png
simple-scan.png
sketchup.png
skype.png
smartgit.png
smuxi.png
solaar.png
sound-juicer.png
sparkleshare.png
springseed.png
sqldeveloper.png
sqlitebrowser.png
sqliteman.png
steam.png
stellarium.png
stormcloud.png
subdownloader.png
sublime-text.png
sudoku.png
sunflower.png
supertuxkart.png
swell-foop.png
synapse.png
syncthing.png
synergy.png
system76.png
system-error.png
system-file-manager.png
system-help.png
system-lock-screen.png
system-remixer.png
system-software-install.png
system-software-package-manager.png
system-software-update.png
team-fortress-2.png
teamspeak.png
teamviewer.png
telepathy-kde.png
terminator.png
terminix.png
texmaker.png
texstudio.png
texworks.png
thunderbird-old.png
tomahawk.png
tor-browser.png
tox.png
transmageddon.png
transmission.png
trillian.png
truecrypt.png
turpial.png
tuxguitar.png
tweetdeck.png
typecatcher.png
uberwriter.png
ubuntuone.png
ubuntuone-music.png
ubuntu-sdk.png
ubuntu-tweak.png
ufraw.png
uget.png
umplayer.png
unison-gtk.png
unity-3d.png
unity-lens-photos.png
unity-scope-gdrive.png
unity-tweak-tool.png
upwork.png
usb-creator-gtk.png
user-info.png
utilities-system-monitor.png
utilities-terminal.png
vala.png
varicad.png
variety.png
VBox.png
venom.png
verbiste.png
vidalia.png
video-editor.png
viewnior.png
vim.png
vineyard.png
virt-manager.png
virtualbox.png
visual-studio-code.png
visual-studio-code-insiders.png
vivaldi.png
vlc.png
vmware-player.png
vmware-workstation.png
vocal.png
warsow.png
wayland.png
webide.png
webstorm.png
wesnoth.png
wesnoth-map-editor.png
wine.png
wine-browser.png
winecfg.png
wine-folder.png
wine-help.png
wine-notepad.png
winetricks.png
wine-uninstaller.png
wine-wordpad.png
winff.png
wingpanel.png
wireframing-app.png
wireshark.png
workspace-overview.png
workspace-switcher-left-bottom.png
workspace-switcher-right-bottom.png
workspace-switcher-right-top.png
workspace-switcher-top-left.png
wuala.png
wxformbuilder.png
wxHexEditor.png
xampp.png
xbmc.png
xchat.png
xdiagnose.png
xhydra.png
xiphos.png
xmind.png
xnoise.png
xonotic.png
xorg.png
xournal.png
xterm.png
yakuake.png
yast.png
y-ppa-manager.png
zim.png
zotero.png
zsnes.png"

cat_moka="
applications-accessories.png
applications-development.png
applications-education.png
applications-electronics.png
applications-font.png
applications-games.png
applications-graphics.png
applications-haskell.png
applications-internet.png
applications-java.png
applications-mathematics.png
applications-monodevelopment.png
applications-multimedia.png
applications-ocaml.png
applications-office.png
applications-other.png
applications-php.png
applications-puzzles.png
applications-python.png
applications-ruby.png
applications-science.png
applications-system.png
applications-utilities.png
preferences-desktop.png
preferences-desktop-default-applications.png
preferences-desktop-tweaks.png"

dev_moka="
audio-card.png
camera.png
computer.png
drive-harddisk.png
drive-harddisk-ieee1394.png
drive-optical.png
drive-removable-media.png
drive-removable-media-usb.png
input-keyboard.png
input-mouse.png
input-tablet.png
media-flash.png
multimedia-player.png
network-wired.png
nm-device-wireless.png
phone.png
printer.png
scanner.png"

emb_moka="
emblem-default.png
emblem-important.png
emblem-package.png
emblem-readonly.png
emblem-shared.png
emblem-symbolic-link.png
emblem-synchronizing.png
emblem-unreadable.png
emblem-web.png"

mime_moka="
application-rss+xml.png
application-x-executable.png
x-office-address-book.png
x-office-calendar.png"

pla_moka="
distributor-logo-android.png
distributor-logo-antergos.png
distributor-logo-archlinux.png
distributor-logo-crunchbang.png
distributor-logo-debian.png
distributor-logo-deepin.png
distributor-logo-edubuntu.png
distributor-logo-elementary.png
distributor-logo-fedora.png
distributor-logo-frugalware.png
distributor-logo-gentoo.png
distributor-logo-kubuntu.png
distributor-logo-linuxmint.png
distributor-logo-mageia.png
distributor-logo-mandriva.png
distributor-logo-manjaro.png
distributor-logo-opensuse.png
distributor-logo-slackware.png
distributor-logo-steamos.png
distributor-logo-ubuntu.png
distributor-logo-ubuntu-budgie.png
distributor-logo-ubuntu-gnome.png
distributor-logo-ubuntu-mate.png
distributor-logo-windows.png
folder-remote.png
network-workgroup.png
user-bookmarks.png
user-desktop.png
user-trash.png
user-trash-full.png"

sta_moka="
dialog-error.png
dialog-info.png
dialog-question.png
dialog-warning.png
security-high.png
security-low.png
security-medium.png"

web_moka="
web-aim.png
web-airdroid.png
web-amazon.png
web-angry-birds.png
web-anydo.png
web-bamboo.png
web-bitbucket.png
web-blogger.png
web-chrome-web-store.png
web-circ.png
web-confluence.png
web-copy.png
web-crucible.png
web-deviantart.png
web-duolingo.png
web-ebay.png
web-evernote.png
web-facebook.png
web-facebook-messenger.png
web-fastmail.png
web-feedly.png
web-flickr.png
web-foursquare.png
web-gadugadu.png
web-github.png
web-gizmo.png
web-google.png
web-google-apps-script.png
web-google-calendar.png
web-google-cast.png
web-google-chat.png
web-google-docs.png
web-google-drawings.png
web-google-drive.png
web-google-drive-old.png
web-google-earth.png
web-google-forms.png
web-google-fusion-tables.png
web-google-gmail.png
web-google-gmail-offline.png
web-google-hangouts.png
web-google-keep.png
web-google-maps.png
web-google-photos.png
web-google-play.png
web-google-play-books.png
web-google-play-movies.png
web-google-play-music.png
web-google-plus.png
web-google-sheets.png
web-google-slides.png
web-google-wallet.png
web-google-youtube.png
web-grooveshark.png
web-html.png
web-hulu.png
web-icq.png
web-identica.png
web-instagram.png
web-internet-archive.png
web-irc.png
web-jira.png
web-jolicloud.png
web-khan-academy.png
web-kindle.png
web-lastfm.png
web-lastpass.png
web-launchpad.png
web-linkedin.png
web-mailru.png
web-meanwhile.png
web-memrise.png
web-microsoft.png
web-microsoft-onedrive.png
web-mint.png
web-mxit.png
web-myspace.png
web-netflix.png
web-newsblur.png
web-novell.png
web-omg-chrome.png
web-omgubuntu.png
web-onenote.png
web-outlook.png
web-pandora.png
web-paypal.png
web-pocket.png
web-rdio.png
web-reddit.png
web-signal.png
web-slack.png
web-soundcloud.png
web-spotify.png
web-stash.png
web-sunrise-calendar.png
web-telegram.png
web-trello.png
web-tumblr.png
web-twitter.png
web-viber.png
web-vimeo.png
web-vk.png
web-whatsapp.png
web-wikipedia.png
web-wolfram-alpha.png
web-wordpress.png
web-wunderlist.png
web-yahoo.png
web-zephyr.png"

act_faba="
call-end.svg
call-start.svg
contact-new.svg
document-add.svg
document-new.svg
document-open.svg
document-open-recent.svg
document-print.svg
document-properties.svg
document-save.svg
document-save-as.svg
edit-copy.svg
edit-delete.svg
folder-add.svg
folder-new.svg
mail-archive.svg
mail-mark-junk.svg
mail-mark-unread.svg
mail-message-new.svg
media-optical-audio-new.svg
media-optical-new.svg
media-seek-backward.svg
media-seek-forward.svg
system-lock-screen.svg
system-restart.svg
system-shutdown.svg
system-sleep.svg
system-suspend.svg"

app_faba="
accessories-calculator.svg
accessories-camera.svg
accessories-character-map.svg
disk-burner.svg
disk-utility.svg
file-roller.svg
help-browser.svg
internet-mail.svg
internet-news-reader.svg
internet-web-browser.svg
midori.svg
multimedia-audio-player.svg
multimedia-photo-manager.svg
multimedia-photo-viewer.svg
multimedia-video-player.svg
multitasking-view.svg
office-calendar.svg
preferences-desktop.svg
preferences-desktop-accessibility.svg
preferences-desktop-font.svg
preferences-desktop-keyboard.svg
preferences-desktop-locale.svg
preferences-desktop-wallpaper.svg
preferences-system-privacy.svg
preferences-system-search.svg
preferences-system-windows.svg
software-properties.svg
software-store.svg
system-error.svg
system-file-manager.svg
system-software-install.svg
system-software-package-manager.svg
system-software-update.svg
system-users.svg
user-info.svg
utilities-system-monitor.svg
utilities-terminal.svg"

cat_faba="
applications-internet.svg
preferences-desktop-display.svg
preferences-desktop-online-accounts.svg
preferences-system-network.svg
preferences-system-power.svg
preferences-system-time.svg"

dev_faba="
bluetooth.svg
camera-photo.svg
computer.svg
drive-harddisk.svg
drive-harddisk-usb.svg
drive-multidisk.svg
drive-optical.svg
drive-removable-media.svg
gnome-dev-printer-new.svg
input-gaming.svg
input-keyboard.svg
input-mouse.svg
input-tablet.svg
input-touchpad.svg
input-trackpoint.svg
network-wireless.svg
phone.svg
printer.svg
printer-remote.svg
scanner.svg
tablet.svg
video-display.svg"

mime_faba="
application-epub+zip.svg
application-mathematica.svg
application-pdf.svg
application-vnd.nintendo.snes.rom.svg
application-x-bittorrent.svg
application-x-desktop.svg
application-x-fictionbook+xml.svg
application-x-gba-rom.svg
application-x-mobipocket-ebook.svg
application-x-php.svg
application-x-python-bytecode.svg
application-x-qtiplot.svg
application-x-wine-extension-skb.svg
application-x-wine-extension-skp.svg
audio-x-generic.svg
document-access.svg
document-excel.svg
document-illustrator.svg
document-photoshop.svg
document-powerpoint.svg
document-word.svg
image-x-generic.svg
inode-directory.svg
media-optical.svg
package-gift.svg
package-x-generic.svg
text-html.svg
text-plain.svg
text-x-authors.svg
text-x-c.svg
text-x-copying.svg
text-x-css.svg
text-x-generic.svg
text-x-generic-template.svg
text-x-install.svg
text-x-markdown.svg
text-x-ms-regedit.svg
text-x-php.svg
text-x-preview.svg
text-x-python.svg
text-x-readme.svg
text-x-script.svg
text-x-tex.svg
unknown.svg
video-x-generic.svg
x-office-calendar.svg
x-office-document.svg
x-office-spreadsheet.svg"

not_faba="
notification-audio-volume-high.svg
notification-audio-volume-low.svg
notification-audio-volume-medium.svg
notification-audio-volume-muted.svg
notification-battery-low.svg
notification-device-eject.svg
notification-display-brightness.svg
notification-keyboard-brightness.svg
notification-network-wireless.svg
notification-network-wireless-disconnected.svg
notification-power.svg"

pla_faba="
folder.svg
folder-documents.svg
folder-download.svg
folder-music.svg
folder-pictures.svg
folder-publicshare.svg
folder-remote.svg
folder-templates.svg
folder-videos.svg
user-desktop.svg
user-home.svg"

sta_faba="
avatar-default.svg
battery-caution-symbolic.svg
battery-low-symbolic.svg
computer-fail.svg
dialog-error.svg
dialog-information.svg
dialog-password.svg
dialog-question.svg
dialog-warning.svg
folder-open.svg
image-loading.svg
image-missing.svg
mail-attachment.svg
network-error.svg
network-idle.svg
printer-error.svg
printer-paused.svg
printer-printing.svg
printer-warning.svg
software-update-available.svg
software-update-download.svg
software-update-urgent.svg
view-private.svg"


for act_m in ${act_moka}; do
    cp -v "${moka}/actions/${act_m}" "${act_moka_d}/${act_m}"
done
for app_m in ${app_moka}; do
    cp -v "${moka}/apps/${app_m}" "${app_moka_d}/${app_m}"
done
for cat_m in ${cat_moka}; do
    cp -v "${moka}/categories/${cat_m}" "${cat_moka_d}/${cat_m}"
done
for dev_m in ${dev_moka}; do
    cp -v "${moka}/devices/${dev_m}" "${dev_moka_d}/${dev_m}"
done
for emb_m in ${emb_moka}; do
    cp -v "${moka}/emblems/${emb_m}" "${emb_moka_d}/${emb_m}"
done
for mime_m in ${mime_moka}; do
    cp -v "${moka}/mimetypes/${mime_m}" "${mime_moka_d}/${mime_m}"
done
for pla_m in ${pla_moka}; do
    cp -v "${moka}/places/${pla_m}" "${pla_moka_d}/${pla_m}"
done
for sta_m in ${sta_moka}; do
    cp -v "${moka}/status/${sta_m}" "${sta_moka_d}/${sta_m}"
done
for web_m in ${web_moka}; do
    cp -v "${moka}/web/${web_m}" "${web_moka_d}/${web_m}"
done

for act_f in ${act_faba}; do
    cp -v "${faba}/actions/${act_f}" "${act_faba_d}/${act_f}"
done
for app_f in ${app_faba}; do
    cp -v "${faba}/apps/${app_f}" "${app_faba_d}/${app_f}"
done
for cat_f in ${cat_faba}; do
    cp -v "${faba}/categories/${cat_f}" "${cat_faba_d}/${cat_f}"
done
for dev_f in ${dev_faba}; do
    cp -v "${faba}/devices/${dev_f}" "${dev_faba_d}/${dev_f}"
done
for mime_f in ${mime_faba}; do
    cp -v "${faba}/mimetypes/${mime_f}" "${mime_faba_d}/${mime_f}"
done
for not_f in ${not_faba}; do
    cp -v "${faba}/notifications/${not_f}" "${not_faba_d}/${not_f}"
done
for pla_f in ${pla_faba}; do
    cp -v "${faba}/places/${pla_f}" "${pla_faba_d}/${pla_f}"
done
for sta_f in ${sta_faba}; do
    cp -v "${faba}/status/${sta_f}" "${sta_faba_d}/${sta_f}"
done
apt -y remove --purge --auto-remove moka-icon-theme faba-icon-theme gnome-icon-theme #adwaita-icon-theme
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function file_debian_menu_funcion() {
mv ${jwm_d}/debian-menu ${bkp_d}/debian-menu_original_before_install_apps_distro.txt
cat << EOF > ${jwm_d}/debian-menu.txt
<?xml version="1.0"?>
<JWM>
<!-- Automatically generated and updated. Do not touch -->
	<Menu icon="${moka_d}/places/distributor-logo-debian.png" label="Debian">
		<Menu label="Aplicaciones">
			<Menu label="Accesibilidad">
				<Program label="Xmag" confirm="false">xmag</Program>
			</Menu>
			<Menu label="Ciencia">
				<Menu label="Matemáticas">
					<Program label="Xcalc" confirm="false">xcalc</Program>
				</Menu>
			</Menu>
			<Menu label="Consolas">
				<Program label="Bash" confirm="false">x-terminal-emulator  -T &quot;Bash&quot; -e sh -c &quot;/bin/bash --login&quot;</Program>
				<Program label="Dash" confirm="false">x-terminal-emulator  -T &quot;Dash&quot; -e sh -c &quot;/bin/dash -i&quot;</Program>
				<Program label="Sh" confirm="false">x-terminal-emulator  -T &quot;Sh&quot; -e sh -c &quot;/bin/sh --login&quot;</Program>
			</Menu>
			<Menu label="Editores">
				<Program label="Xedit" confirm="false">xedit</Program>
			</Menu>
			<Menu label="Gráficos">
				<Program label="X Window Snapshot" confirm="false">xwd | xwud</Program>
			</Menu>
			<Menu label="Red">
				<Menu label="Comunicación">
					<Program label="Xbiff" confirm="false">xbiff</Program>
				</Menu>
				<Menu label="Navegación web">
					<Program label="w3m" confirm="false">x-terminal-emulator  -T &quot;w3m&quot; -e sh -c &quot;/usr/bin/w3m /usr/share/doc/w3m/MANUAL.html&quot;</Program>
				</Menu>
			</Menu>
			<Menu label="Sistema">
				<Menu label="Administración">
					<Program label="Debian Task selector" confirm="false">x-terminal-emulator  -T &quot;Debian Task selector&quot; -e sh -c &quot;su-to-root -c tasksel&quot;</Program>
					<Program label="Editres" confirm="false">editres</Program>
					<Program label="Xclipboard" confirm="false">xclipboard</Program>
					<Program label="Xfontsel" confirm="false">xfontsel</Program>
					<Program label="Xkill" confirm="false">xkill</Program>
					<Program label="Xrefresh" confirm="false">xrefresh</Program>
				</Menu>
				<Menu label="Hardware">
 					<Program label="Xvidtune" confirm="false">xvidtune</Program>
				</Menu>
				<Menu label="Monitorización">
					<Program label="Pstree" icon="/usr/share/pixmaps/pstree16.xpm" confirm="false">x-terminal-emulator  -T &quot;Pstree&quot; -e sh -c &quot;/usr/bin/pstree.x11&quot;</Program>
					<Program label="Xconsole" confirm="false">xconsole -file /dev/xconsole</Program>
					<Program label="Xev" confirm="false">x-terminal-emulator -e xev</Program>
					<Program label="Xload" confirm="false">xload</Program>
				</Menu>
			</Menu>
			<Menu label="Visores">
				<Program label="Xditview" confirm="false">xditview</Program>
			</Menu>
		</Menu>
		<Menu label="Ayuda">
			<Program label="Xman" confirm="false">xman</Program>
		</Menu>
		<Menu label="Juegos">
			<Menu label="Juguetes">
				<Program label="Oclock" confirm="false">oclock</Program>
				<Program label="Xclock (analog)" confirm="false">xclock -analog</Program>
				<Program label="Xclock (digital)" confirm="false">xclock -digital -update 1</Program>
				<Program label="Xeyes" confirm="false">xeyes</Program>
				<Program label="Xlogo" confirm="false">xlogo</Program>
			</Menu>
		</Menu>
	</Menu>
</JWM>
EOF
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function file_system_jwmrc_funcion() {
cp ${jwm_d}/system.jwmrc ${bkp_d}/system.jwmrc_original.txt
cat << EOF > ${jwm_d}/system.jwmrc
<?xml version="1.0"?>
<JWM>
<!-- A command to execute when JWM restarts, shuts down, and starts up, respectively. -->
<!-- Un comando para ejecutar cuando JWM se reinicia, se apaga y cuando se enciende, respectivamente. -->
	<Include>${sys_jwm_d}/00A_ActionsCommandJWM.txt</Include>

<!-- The root menu. -->
<!-- El menú principal / El menú raíz. -->
	<Include>${sys_jwm_d}/00_Root_Menu_1.txt</Include>

<!-- The root menu. -->
<!-- El menú de filtro / El menú raíz. -->
	<Include>${rm_lt_d}/00_Root_Menu_Lights.txt</Include>

<!-- The root menu. -->
<!-- El menú de brillo / El menú raíz. -->
	<Include>${rm_br_d}/00_Root_Menu_Brightness.txt</Include>

<!-- The root menu. -->
<!-- El menú de Red / El menú raíz. -->
	<Include>${rm_red_d}/00_Root_Menu_NMTUI.txt</Include>

<!-- Options for program groups. -->
<!-- Opciones para grupos de programas. -->
	<Include>${sys_jwm_d}/01_Groups.txt</Include>

<!-- Tray at the bottom. -->
<!-- Bandeja en la parte inferior / Bandeja en la parte de abajo. -->
	<Include>${sys_jwm_d}/02_Tray_Bottom.txt</Include>

<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<Include>${sys_jwm_d}/03_Visual_Styles.txt</Include>

<!-- Path where icons can be found. IconPath can be listed multiple times to allow searching for icons in multiple paths. -->
<!-- Ruta donde se pueden encontrar los iconos. IconPath puede estar listado varias veces para permitir la búsqueda de iconos en múltiples rutas. -->
	<Include>${sys_jwm_d}/04_IconPath.txt</Include>

<!-- Virtual Desktops -->
<!-- Escritorios virtuales -->
	<Include>${sys_jwm_d}/05_Virtual_Desktop.txt</Include>

<!-- Mouse -->
<!-- Raton -->
	<Include>${sys_jwm_d}/06_Mouse.txt</Include>

<!-- Key bindings -->
<!-- Asignaciones de teclas -->
	<Include>${sys_jwm_d}/07_Keys_Bindings.txt</Include>

<!-- Mouse bindings -->
<!-- Asignaciones del ratón -->
	<Include>${sys_jwm_d}/08_Mouse_Bindings.txt</Include>

<1-- Buttons: "Minimize" ; "Maximum" ; "Close" -->
<1-- Botones: "Minimizar" ; "Maximizar" ; "Cerrar" -->
	<Include>${sys_jwm_d}/09_Buttons_Style.txt</Include>
</JWM>
EOF
#}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
#function file_system_jwmrc_funcion() {
cat << EOF > ${sys_jwm_d}/00A_ActionsCommandJWM.txt
<?xml version="1.0"?>
<JWM>
<!-- A command to run when JWM restarts. -->
<!-- Un comando para ejecutar cuando JWM se reinicia. -->
	<RestartCommand>exec:</RestartCommand>
	<RestartCommand>exec:</RestartCommand>
	<RestartCommand>exec:</RestartCommand>

<!-- A command to run when JWM shuts down. -->
<!-- Un comando para ejecutar cuando JWM se apaga. -->
	<ShutdownCommand>exec:</ShutdownCommand>
	<ShutdownCommand>exec:</ShutdownCommand>
	<ShutdownCommand>exec:</ShutdownCommand>

<!-- A command to run when JWM starts. -->
<!-- Un comando para ejecutar cuando JWM se inicia. -->
	<StartupCommand>exec:</StartupCommand>
	<StartupCommand>exec:</StartupCommand>
	<StartupCommand>exec:</StartupCommand>
</JWM>
EOF

cat << EOF > ${sys_jwm_d}/00_Root_Menu_1.txt
<?xml version="1.0"?>
<JWM>
<!-- The root menu. -->
<!-- El menú principal / El menú raíz. -->
	<RootMenu onroot="1" height="16" label="Main Menu" labeled="false" dynamic="">
		<Separator/>
		<Include>${jwm_d}/debian-menu.txt</Include>
		<Separator/>
		<Include>${rm_mn_d}/Accesorios.txt</Include>
		<Include>${rm_mn_d}/Graficos.txt</Include>
		<Include>${rm_mn_d}/Herramientas_del_Sistema.txt</Include>
		<Include>${rm_mn_d}/Internet.txt</Include>
		<Include>${rm_mn_d}/Juegos.txt</Include>
		<Include>${rm_mn_d}/Oficina.txt</Include>
		<Include>${rm_mn_d}/Otras.txt</Include>
		<Include>${rm_mn_d}/Preferencias.txt</Include>
		<Include>${rm_mn_d}/Programación.txt</Include>
		<Include>${rm_mn_d}/Sonido_y_Vídeo.txt</Include>
		<Separator/>
		<Program icon="${moka_d}/apps/desktop-magnifier.png" label="Buscador">/usr/bin/gmrun</Program>
		<Separator/>
		<Program icon="${moka_d}/actions/system-log-out.png" label="Sesion">${scp_base_d}/SESION_[XMSG].sh</Program>
		<Separator/>
	</RootMenu>
</JWM>
EOF

cat << EOF > ${sys_jwm_d}/01_Groups.txt
<?xml version="1.0"?>
<JWM>
<!-- Options for program groups. -->
<!-- Opciones para grupos de programas. -->
	<Group>
		<Option>tiled</Option>
	</Group>
	<Group>
		<Name>xterm</Name>
		<Option>vmax</Option>
	</Group>
	<Group>
		<Name>xclock</Name>
		<Option>drag</Option>
		<Option>notitle</Option>
	</Group>
</JWM>
EOF

cat << EOF > ${sys_jwm_d}/02_Tray_Bottom.txt
<JWM>
<!-- Tray at the bottom. -->
<!-- Bandeja en la parte inferior / Bandeja en la parte de abajo. -->
	<Tray autohide="false" x="0" y="-1" width="0" height="16" layer="above" layout="horizontal" halign="fixed" valign="fixed" screen="0">
		<TrayButton icon="${moka_d}/apps/playonlinux.png">root:1</TrayButton>
		<TrayButton icon="${moka_d}/apps/desktop-magnifier.png">exec:/usr/bin/gmrun</TrayButton>
		<TrayButton icon="${moka_d}/apps/xterm.png">exec:/usr/bin/x-terminal-emulator</TrayButton>
		<TrayButton icon="${faba_d}/apps/internet-web-browser.svg">exec:/usr/bin/x-www-browser</TrayButton>
		<TrayButton icon="${faba_d}/apps/system-file-manager.svg">exec:/usr/bin/x-file-manager</TrayButton>
		<Spacer width="1" height="0"/>
		<Pager labeled="true"/>
		<TaskList maxwidth="128" labeled="true" height="0"/>
		<Dock spacing="0" width="0"/>
		<TrayButton icon="/usr/share/icons/Adwaita/48x48/legacy/dialog-information.png">root:3</TrayButton>
		<TrayButton icon="${moka_d}/actions/system-sleep.png">root:2</TrayButton>
		<TrayButton icon="${faba_d}/notifications/notification-network-wireless.svg">exec:${scp_nmtui_d}/NMTUI_CONNECT_[CLI].sh</TrayButton>
		<TrayButton icon="/usr/share/icons/Adwaita/48x48/legacy/audio-speakers.png">exec:/usr/bin/pavucontrol</TrayButton>
		<Clock format="%d/%m/%Y %I:%M %P" width="0" height="0">
			<Button mask="1">exec:xclock -digital</Button> <!-- 1="Boton izq mouse", 2="Boton med mouse", 3="Boton der mouse" -->
		</Clock>
		<TrayButton label="...">showdesktop</TrayButton>
	</Tray>
</JWM>
EOF

cat << EOF > ${sys_jwm_d}/03_Visual_Styles.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->

	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#FFFFFF</Foreground>
		<Background>#9A9AFF</Background>
		<Opacity>0.5</Opacity>
		<Outline>#EEEEEE</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#0000AA</Background>
			<Opacity>1.0</Opacity>
			<Outline>#EEEEEE</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#0000AA</Background>
		<Foreground>#FFFFFF</Foreground>
		<Outline>#000000</Outline>
		<Active>
			<Background>#555555</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
		<Opacity>0.75</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#000000</Foreground>
		<Background>#9A9AFF</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#000055</Background>
			<Outline>#FFFFFF</Outline>
		</Active>
	</TaskListStyle>

<!-- 	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#FFFFFF</Outline>
		<Foreground>#000055</Foreground>
		<Background>#AAAAAA</Background>
		<Text>#000000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#000055</Foreground>
			<Background>#FF0000</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bond</Font>
		<Foreground>#999999</Foreground>
		<Background>#222222</Background>
		<Outline>#FFFFFF</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#000000</Background>
		</Active>
		<Opacity>0.85</Opacity>
	</MenuStyle>

	<PopupStyle>
		<Font>Sans-0:bond</Font>
		<Outline>#00FF00</Outline>
		<Foreground>#000000</Foreground>
		<Background>#FFFFFF</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF > ${sys_jwm_d}/04_IconPath.txt
<JWM>
<!-- Path where icons can be found. IconPath can be listed multiple times to allow searching for icons in multiple paths. -->
<!-- Ruta donde se pueden encontrar los iconos. IconPath puede estar listado varias veces para permitir la búsqueda de iconos en múltiples rutas. -->
	<IconPath>/usr/share/icons/gnome/256x256/actions</IconPath>
	<IconPath>/usr/share/icons/gnome/256x256/apps</IconPath>
	<IconPath>/usr/share/icons/gnome/256x256/categories</IconPath>
	<IconPath>/usr/share/icons/gnome/256x256/devices</IconPath>
	<IconPath>/usr/share/icons/gnome/256x256/emblems</IconPath>
	<IconPath>/usr/share/icons/gnome/256x256/mimetypes</IconPath>
	<IconPath>/usr/share/icons/gnome/256x256/places</IconPath>
	<IconPath>/usr/share/icons/gnome/256x256/status</IconPath>
	<IconPath>/usr/share/icons/gnome/32x32/actions</IconPath>
	<IconPath>/usr/share/icons/gnome/32x32/animations</IconPath>
	<IconPath>/usr/share/icons/gnome/32x32/apps</IconPath>
	<IconPath>/usr/share/icons/gnome/32x32/categories</IconPath>
	<IconPath>/usr/share/icons/gnome/32x32/devices</IconPath>
	<IconPath>/usr/share/icons/gnome/32x32/emblems</IconPath>
	<IconPath>/usr/share/icons/gnome/32x32/mimetypes</IconPath>
	<IconPath>/usr/share/icons/gnome/32x32/places</IconPath>
	<IconPath>/usr/share/icons/gnome/32x32/status</IconPath>
	<IconPath>/usr/share/icons/gnome/scalable/actions</IconPath>
	<IconPath>/usr/share/icons/gnome/scalable/apps</IconPath>
	<IconPath>/usr/share/icons/gnome/scalable/categories</IconPath>
	<IconPath>/usr/share/icons/gnome/scalable/devices</IconPath>
	<IconPath>/usr/share/icons/gnome/scalable/emblems</IconPath>
	<IconPath>/usr/share/icons/gnome/scalable/mimetypes</IconPath>
	<IconPath>/usr/share/icons/gnome/scalable/places</IconPath>
	<IconPath>/usr/share/icons/gnome/scalable/status</IconPath>
	<IconPath>/usr/share/icons/hicolor/256x256/apps</IconPath>
	<IconPath>/usr/share/icons/hicolor/256x256/mimetypes</IconPath>
	<IconPath>/usr/share/icons/hicolor/32x32/actions</IconPath>
	<IconPath>/usr/share/icons/hicolor/32x32/apps</IconPath>
	<IconPath>/usr/share/icons/hicolor/32x32/categories</IconPath>
	<IconPath>/usr/share/icons/hicolor/32x32/devices</IconPath>
	<IconPath>/usr/share/icons/hicolor/32x32/emblems</IconPath>
	<IconPath>/usr/share/icons/hicolor/32x32/mimetypes</IconPath>
	<IconPath>/usr/share/icons/hicolor/32x32/status</IconPath>
	<IconPath>/usr/share/icons/hicolor/512x512/apps</IconPath>
	<IconPath>/usr/share/icons/hicolor/512x512/mimetypes</IconPath>
	<IconPath>/usr/share/icons/hicolor/scalable/actions</IconPath>
	<IconPath>/usr/share/icons/hicolor/scalable/apps</IconPath>
	<IconPath>/usr/share/icons/hicolor/scalable/categories</IconPath>
	<IconPath>/usr/share/icons/hicolor/scalable/devices</IconPath>
	<IconPath>/usr/share/icons/hicolor/scalable/emblems</IconPath>
	<IconPath>/usr/share/icons/hicolor/scalable/mimetypes</IconPath>
	<IconPath>/usr/share/icons/hicolor/scalable/places</IconPath>
	<IconPath>/usr/share/icons/hicolor/scalable/status</IconPath>
	<IconPath>/usr/share/icons</IconPath>
	<IconPath>/usr/share/pixmaps</IconPath>
</JWM>
EOF

cat << EOF > ${sys_jwm_d}/05_Virtual_Desktop.txt
<JWM>
<!-- Virtual Desktops -->
<!-- Desktop tags can be contained within Desktops for desktop names. -->
<!-- Escritorios virtuales -->
<!-- Las etiquetas de escritorio pueden estar contenidas dentro de Desktops para nombres de escritorio. -->
	<Desktops width="2" height="2">
	<!-- Default background. Note that a Background tag can be contained within a Desktop tag to give a specific background for that desktop. -->
	<!-- Fondo predeterminado. Tenga en cuenta que una etiqueta de Background puede estar contenida dentro de una etiqueta Desktop para proporcionar un fondo específico para ese escritorio. -->
		<Background type="image">${distro_bg}</Background>
	</Desktops>
</JWM>
EOF

cat << EOF > ${sys_jwm_d}/06_Mouse.txt
<JWM>
<!-- Double click speed (in milliseconds) -->
<!-- Velocidad de doble clic (en milisegundos) -->
	<DoubleClickSpeed>3000</DoubleClickSpeed>

<!-- Double click delta (in pixels) -->
<!-- Delta de doble clic (en píxeles) -->
	<DoubleClickDelta>2</DoubleClickDelta>

<!-- The focus model (sloppy or click) -->
<!-- El modelo de enfoque (sloppy o click) -->
	<FocusModel>click</FocusModel>

<!-- The snap mode (none, screen, or border) -->
<!-- Modo de ajuste (ninguno, pantalla o borde) -->
	<SnapMode>none</SnapMode>

<!-- The move mode (outline or opaque) -->
<!-- Modo de movimiento (contorno u opaco) -->
	<MoveMode>opaque</MoveMode>

<!-- The resize mode (outline or opaque) -->
<!-- Modo de redimensionamiento (contorno u opaco) -->
	<ResizeMode>opaque</ResizeMode>
</JWM>
EOF

cat << EOF > ${sys_jwm_d}/07_Keys_Bindings.txt
<JWM>
<!-- Key bindings -->
<!-- Asignaciones de teclas -->
<!--	#MASK [A=Alt | C=Control/Ctrl | S=Shift | 4=TeclaWindows/Super/Meta | 1=Alt | 2=Num_Lock | 3=Scroll_Lock | 5=ISO_Level3_Shift ]	-->
	<Key key="Up">up</Key>
	<Key key="Down">down</Key>
	<Key key="Right">right</Key>
	<Key key="Left">left</Key>
	<Key key="h">left</Key>
	<Key key="j">down</Key>
	<Key key="k">up</Key>
	<Key key="l">right</Key>
	<Key key="Return">select</Key>
	<Key key="Escape">escape</Key>
	<Key key="Sys_Req">exec:${scp_tool_d}/SCREENSHOT_[IMAGEMAGICK].sh</Key>

	<Key mask="A" key="Tab">nextstacked</Key>
	<Key mask="A" key="F4">close</Key>
	<Key mask="A" key="#">desktop#</Key>
<!--	<Key mask="A" key="F1">root:1</Key>		-->
<!--	<Key mask="A" key="F2">window</Key>		-->
<!--	<Key mask="A" key="F10">maximize</Key>		-->
<!--	<Key mask="A" key="Right">rdesktop</Key>	-->
<!--	<Key mask="A" key="Left">ldesktop</Key>		-->
<!--	<Key mask="A" key="Up">udesktop</Key>		-->
	<Key mask="A" key="F11">maximize</Key>

	<Key mask="C" key="F10">minimize</Key>
	<Key mask="C" key="F11">restore</Key>
	<Key mask="C" key="Tab">prevstacked</Key>
	<Key mask="C" mask="4" key="Down">ddesktop</Key>
	<Key mask="C" mask="4" key="Right">rdesktop</Key>
	<Key mask="C" mask="4" key="Left">ldesktop</Key>
	<Key mask="C" mask="4" key="Up">udesktop</Key>
	<Key mask="C" mask="4" key="Down">ddesktop</Key>

	<Key mask="4" key="#">desktop#</Key>
	<Key mask="4" key="Sys_Req">exec:${scp_tool_d}/SCREENSHOT_[IMAGEMAGICK].sh</Key>
	<Key mask="4" key="N">exec:${scp_tool_d}/NANO_[CLI].sh</Key>
	<Key mask="4" key="Escape">exec:${scp_base_d}/SESION_[XMSG].sh</Key>
	<Key mask="4" key="S">exec:/usr/bin/gmrun</Key>
	<Key mask="4" key="Tab" key="Escape">exec:${scp_tool_d}/TOP_[CLI].sh</Key>
	<Key mask="4" key="T">exec:/usr/bin/x-terminal-emulator</Key>
	<Key mask="4" key="Enter">exec:/usr/bin/x-terminal-emulator</Key>
	<Key mask="4" key="G">exec:/usr/bin/simplescreenrecorder --activate-schedule</Key>
	<Key mask="4" key="D">showdesktop</Key>

	<Key mask="4" mask="C" key="R">exec:/usr/bin/simplescreenrecorder --start-recording</Key>
	<Key mask="4" mask="A" key="Sys_Req">exec:${scp_tool_d}/SCREENSHOT_[IMAGEMAGICK].sh</Key>
	<Key mask="4" mask="C" key="Q">exec:${p_user_d}/DIRECTORIES_USER_MENU_[GUI].sh</Key>
	<Key mask="4" mask="C" key="W">exec:${p_user_d}/DIRECTORIES_USER_MENU_[CLI].sh</Key>
	<Key mask="4" mask="S" key="R">jwm -restart</Key>
</JWM>
EOF

cat << EOF > ${sys_jwm_d}/08_Mouse_Bindings.txt
<JWM>
<!-- Mouse bindings -->
<!-- Asignaciones del ratón -->
<!--	<Mouse context="root" button="4">ldesktop</Mouse>	-->
<!--	<Mouse context="root" button="5">rdesktop</Mouse>	-->

<!--	<Mouse context="title" button="1">move</Mouse>		-->
<!--	<Mouse context="title" button="2">move</Mouse>		-->
<!--	<Mouse context="title" button="3">window</Mouse>	-->
<!--	<Mouse context="title" button="4">shade</Mouse>		-->
<!--	<Mouse context="title" button="5">shade</Mouse>		-->
<!--	<Mouse context="title" button="11">maximize</Mouse>	-->

<!--	<Mouse context="icon" button="1">window</Mouse>		-->
<!--	<Mouse context="icon" button="2">move</Mouse>		-->
<!--	<Mouse context="icon" button="3">window</Mouse>		-->
<!--	<Mouse context="icon" button="4">shade</Mouse>		-->
<!--	<Mouse context="icon" button="5">shade</Mouse>		-->

	<Mouse context="border" button="1">resize</Mouse>
	<Mouse context="border" button="2">move</Mouse>
<!--	<Mouse context="border" button="3">window</Mouse>	-->

<!--	<Mouse context="close" button="-1">close</Mouse>	-->
<!--	<Mouse context="close" button="2">move</Mouse>		-->
<!--	<Mouse context="close" button="-3">close</Mouse>	-->
	<Mouse context="close" button="1">close</Mouse>

<!--	<Mouse context="maximize" button="-1">maximize</Mouse>	-->
<!--	<Mouse context="maximize" button="-2">maxv</Mouse>	-->
<!--	<Mouse context="maximize" button="-3">maxh</Mouse>	-->
	<Mouse context="maximize" button="1">maximize</Mouse>

<!--	<Mouse context="minimize" button="-1">minimize</Mouse>	-->
<!--	<Mouse context="minimize" button="2">move</Mouse>	-->
<!--	<Mouse context="minimize" button="-3">shade</Mouse>	-->
	<Mouse context="minimize" button="1">minimize</Mouse>
</JWM>
EOF

cat << EOF > ${sys_jwm_d}/09_Buttons_Style.txt
<JWM>
<1-- Buttons: "Minimize" ; "Maximum" ; "Close" -->
<1-- Botones: "Minimizar" ; "Maximizar" ; "Cerrar" -->
<!--
	<ButtonClose>/path/of/icon</ButtonClose>
	<ButtonMax>/path/of/icon</ButtonMax>
	<ButtonMaxActive>/path/of/icon</ButtonMaxActive>
	<ButtonMenu>/path/of/icon</ButtonMenu>
	<ButtonMin>/path/of/icon</ButtonMin>
	<DefaultIcon>/path/of/icon</DefaultIcon>
-->
</JWM>
EOF
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function nmtui_jwm_funcion() {
scp_nmtui_d="${scp_base_d}/NMTUI"; mkdir -p -v "${scp_nmtui_d}"

apt -y install network-manager

systemctl stop networking.service
systemctl disable networking.service

systemctl enable NetworkManager.service
systemctl start NetworkManager.service

#apt -y remove --purge --auto-remove ifupdown

cat << EOF > ${scp_nmtui_d}/NMTUI_[CLI].sh
#!/bin/bash
x-terminal-emulator -e "/usr/bin/nmtui"
EOF

cat << EOF > ${scp_nmtui_d}/NMTUI_EDIT_[CLI].sh
#!/bin/bash
x-terminal-emulator -e "/usr/bin/nmtui-edit"
EOF

cat << EOF > ${scp_nmtui_d}/NMTUI_CONNECT_[CLI].sh
#!/bin/bash
x-terminal-emulator -e "/usr/bin/nmtui-connect"
EOF

cat << EOF > ${scp_nmtui_d}/NMTUI_HOSTNAME_[CLI].sh
#!/bin/bash
x-terminal-emulator -e "/usr/bin/nmtui-hostname"
EOF

chmod --recursive 755 "${scp_nmtui_d}"

cat << EOF > ${rm_red_d}/00_Root_Menu_NMTUI.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${faba_d}/categories/preferences-system-network.svg" label="Gestor de Red">
		<Program icon="${faba_d}/notifications/notification-network-wireless.svg" label="NMTUI (Menu)">${scp_nmtui_d}/NMTUI_[CLI].sh</Program>
		<Program icon="${faba_d}/notifications/notification-network-wireless.svg" label="NMTUI EDIT (Editar Conexion)">${scp_nmtui_d}/NMTUI_EDIT_[CLI].sh</Program>
		<Program icon="${faba_d}/notifications/notification-network-wireless.svg" label="NMTUI CONNECT (Conexionar Red)">${scp_nmtui_d}/NMTUI_CONNECT_[CLI].sh</Program>
		<Program icon="${faba_d}/notifications/notification-network-wireless.svg" label="NMTUI HOSTNAME (Nombre de Anfitrion del Sistema)">${scp_nmtui_d}/NMTUI_HOSTNAME_[CLI].sh</Program>
	</Menu>
</JWM>
EOF

cat << EOF > /usr/share/applications/NMTUI_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=NMTUI_[CLI]_[${distro_name}]
Exec=${scp_nmtui_d}/NMTUI_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
EOF

cat << EOF > /usr/share/applications/NMTUI_EDIT_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=NMTUI_EDIT_[CLI]_[${distro_name}]
Exec=${scp_nmtui_d}/NMTUI_EDIT_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
EOF

cat << EOF > /usr/share/applications/NMTUI_CONNECT_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=NMTUI_CONNECT_[CLI]_[${distro_name}]
Exec=${scp_nmtui_d}/NMTUI_CONNECT_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
EOF

cat << EOF > /usr/share/applications/NMTUI_HOSTNAME_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=NMTUI_HOSTNAME_[CLI]_[${distro_name}]
Exec=${scp_nmtui_d}/NMTUI_HOSTNAME_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=false
EOF
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function file_directory_home_jwm_funcion() {
cat << EOF > ${rm_mn_ext_d}/directories_home_user_gui.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${icon_d}/faba-icon-theme/faba_d/Faba/48x48/apps/system-file-manager.svg" label="GUI">
		<Program icon="/usr/share/icons/Adwaita/48x48/places/user-home.png" label="HomeUser">${pu_gui_d}/DIRECTORY_HOMEUSER_[GUI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder-download.png" label="Descargas">${pu_gui_d}/DIRECTORY_DOWNLOAD_[GUI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder-documents.png" label="Documentos">${pu_gui_d}/DIRECTORY_DOCUMENTS_[GUI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/user-desktop.png" label="Escritorio">${pu_gui_d}/DIRECTORY_DESKTOP_[GUI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder-pictures.png" label="Imágenes">${pu_gui_d}/DIRECTORY_PICTURES_[GUI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder-music.png" label="Música">${pu_gui_d}/DIRECTORY_MUSIC_[GUI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder-templates.png" label="Plantillas">${pu_gui_d}/DIRECTORY_TEMPLATES_[GUI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder-publicshare.png" label="Público">${pu_gui_d}/DIRECTORY_PUBLIC_[GUI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder-videos.png" label="Videos">${pu_gui_d}/DIRECTORY_VIDEOS_[GUI].sh</Program>
		<Separator/>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder.png" label="Notas">${pu_gui_d}/DIRECTORY_NOTES_[GUI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder.png" label="Capturas">${pu_gui_d}/DIRECTORY_SCREENSHOTS_[GUI].sh</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_ext_d}/directories_home_user_cli.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${icon_d}/moka-icon-theme/moka_d/Moka/48x48/apps/xterm.png" label="CLI">
		<Program icon="/usr/share/icons/Adwaita/48x48/places/user-home.png" label="HomeUser">${pu_cli_d}/DIRECTORY_HOMEUSER_[CLI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder-download.png" label="Descargas">${pu_cli_d}/DIRECTORY_DOWNLOAD_[CLI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder-documents.png" label="Documentos">${pu_cli_d}/DIRECTORY_DOCUMENTS_[CLI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/user-desktop.png" label="Escritorio">${pu_cli_d}/DIRECTORY_DESKTOP_[CLI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder-pictures.png" label="Imagenes">${pu_cli_d}/DIRECTORY_PICTURES_[CLI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder-music.png" label="Musica">${pu_cli_d}/DIRECTORY_MUSIC_[CLI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder-templates.png" label="Plantillas">${pu_cli_d}/DIRECTORY_TEMPLATES_[CLI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder-publicshare.png" label="Publico">${pu_cli_d}/DIRECTORY_PUBLIC_[CLI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder-videos.png" label="Videos">${pu_cli_d}/DIRECTORY_VIDEOS_[CLI].sh</Program>
		<Separator/>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder.png" label="Notas">${pu_cli_d}/DIRECTORY_NOTES_[CLI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder.png" label="Capturas">${pu_cli_d}/DIRECTORY_SCREENSHOTS_[CLI].sh</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_ext_d}/directories_home_user.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${faba_d}/status/avatar-default.svg" label="Directorio Personal">
		<Include>${rm_mn_ext_d}/directories_home_user_gui.txt</Include>
		<Include>${rm_mn_ext_d}/directories_home_user_cli.txt</Include>
	</Menu>
</JWM>
EOF
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function file_script_jwm_funcion() {
cat << EOF > ${scp_d}/MAN_JWM_[CLI].sh
#!/bin/bash
function manual_cli_jwm_funcion() {
clear
echo "Que manual quiere ver?"
echo "0) ActionsCommandJWM"
echo "1) Root Menu"
echo "2) Visual Style"
echo "3) Groups"
echo "4) Tray Buttom"
echo "5) Virtual Desktop"
echo "6) Mouse"
echo "7) Keys"
echo "8) Mouse Bindings"
echo "9) Buttons Style"
echo ""
read -p "Opcion: " op_man
case \${op_man} in
	0) manual="MAN_ActionsCommandJWM.txt";;
	1) manual="MAN_Root_Menu.txt";;
	2) manual="MAN_Visual_Style.txt";;
	3) manual="MAN_Groups.txt";;
	4) manual="MAN_Tray_Buttom.txt";;
	5) manual="MAN_Virtual_Desktop.txt";;
	6) manual="MAN_Mouse.txt";;
	7) manual="MAN_Keys.txt";;
	8) manual="MAN_Mouse_Bindings.txt";;
	9) manual="MAN_Buttons_Style.txt";;
	*) clear; echo "Opcion no valida, vuelve a intentarlo"; manual_funcion;;
esac
less "${man_jwm_d}/\${manual}"; manual_cli_jwm_funcion
}
manual_cli_jwm_funcion
EOF

cat << EOF > ${scp_d}/MAN_JWM_[XMSG].sh
#!/bin/bash
function manual_xmsg_jwm_funcion() {
xmessage -center -buttons "ActionsCommandJWM:0,Root Menu:1,Visual Style:2,Groups:3,Tray Buttom:4,Virtual Desktop:5,Mouse:6,Keys:7,Mouse Bindings:8,Buttons Style:9" -name "Manuales de JWM" "Cual quieres leer?"
case \${?} in
	0) manual="MAN_ActionsCommandJWM.txt";;
	1) manual="MAN_Root_Menu.txt";;
	2) manual="MAN_Visual_Style.txt";;
	3) manual="MAN_Groups.txt";;
	4) manual="MAN_Tray_Buttom.txt";;
	5) manual="MAN_Virtual_Desktop.txt";;
	6) manual="MAN_Mouse.txt";;
	7) manual="MAN_Keys.txt";;
	8) manual="MAN_Mouse_Bindings.txt";;
	9) manual="MAN_Buttons_Style.txt";;
	*) clear; echo "Opcion no valida, vuelve a intentarlo"; manual_funcion;;
esac
/usr/bin/l3afpad "${man_jwm_d}/\${manual}"
}
manual_xmsg_jwm_funcion
EOF

cat << EOF > ${scp_cfg_d}/CFG_BG_[CLI].sh
#!/bin/bash
desktop_path="${sys_jwm_d}/05_Virtual_Desktop.txt"; format="jpg"
data="\$(date +%Y-%m-%d_%H:%M:%S:%N)"
bg_d="${bg_jwm_d}/BGs_[${distro_name}]_d"
bg_name_base="bg_\${data}.\${format}"

function select_colour_funcion() {
echo "0) Azul          | 1) Amarillo        | 2) Rojo            | 3) Verde        | 4) Naranja          |"
echo "5) Rosa          | 6) Gris            | 7) Magenta         | 8) Purpura      | 9) Celeste          |"
echo "10) Dorado       | 11) Fuchsia        | 12) Blanco         | 13) Negro       | 14) Oliva           |"
echo "15) Turquesa     | 16) Bisquel        | 17) Cyan           | 18) Azul Oscuro | 19) Rojo Oscuro     |"
echo "20) Verde Oscuro | 21) Naranja Oscuro | 22) Magenta Oscuro | 23) Cyan Oscuro | 24) Turquesa Oscuro |"
echo ""
read -p "Opcion: " op_colour
case \${op_colour} in
	0) colour="blue";;
	1) colour="yellow";;
	2) colour="red";;
	3) colour="green";;
	4) colour="orange";;
	5) colour="pink";;
	6) colour="grey";;
	7) colour="magenta";;
	8) colour="purple";;
	9) colour="skyblue";;
	10) colour="gold";;
	11) colour="fuchsia";;
	12) colour="white";;
	13) colour="negro";;
	14) colour="olive";;
	15) colour="turquoise";;
	16) colour="bisque";;
	17) colour="cyan";;
	18) colour="darkblue";;
	19) colour="darkred";;
	20) colour="darkgreen";;
	21) colour="darkorange";;
	22) colour="darkmagenta";;
	23) colour="darkcyan";;
	24) colour="darkturquoise";;
	*) echo "Valor no valido; vuelva a intentarlo"; select_colour_funcion;;
esac
}

function path_bg_user_funcion() {
read -p "Ingresa la ruta: " path_bg
if [ -e "\${path_bg}" ]; then
	mkdir -p -v "\${bg_d}"
	bg_name="\${bg_d}/\${bg_name_base}"
	convert "\${path_bg}" "\${bg_name}"
else
	echo "Imagen no encontrada, vuelva a ingresar la ruta"
	path_bg_user_funcion
fi
}

function frontend_funcion() {
clear
echo "Escoja el estilo de fondo de pantalla"
echo "0) Color Solido"
echo "1) Color Gradiente"
echo "2) Imagen Estirada"
echo "3) Imagen Escalada"
echo "4) Imagen Mosaico"
echo "5) Fondo predeterminado"
echo ""
read -p "Opcion: " op_bg
clear
case \${op_bg} in
	0) echo "Elija el color"; select_colour_funcion
	sed -i "s|<Background.*</Background>|<Background type=\"solid\">\${colour}</Background>|g" "\${desktop_path}"
	;;

	1) echo "Elija el color superior"; select_colour_funcion; colour_upper="\${colour}"
	echo "Elija el color inferior"; select_colour_funcion; colour_lower="\${colour}"
	sed -i "s|<Background.*</Background>|<Background type=\"gradient\">\${colour_upper}:\${colour_lower}</Background>|g" "\${desktop_path}"
	;;

	2) path_bg_user_funcion
	sed -i "s|<Background.*</Background>|<Background type=\"image\">\${bg_name}</Background>|g" "\${desktop_path}"
	;;

	3) path_bg_user_funcion
	sed -i "s|<Background.*</Background>|<Background type=\"scale\">\${bg_name}</Background>|g" "\${desktop_path}"
	;;

	4) path_bg_user_funcion
	sed -i "s|<Background.*</Background>|<Background type=\"tile\">\${bg_name}</Background>|g" "\${desktop_path}"
	;;

	5) sed -i "s|<Background.*</Background>|<Background type=\"image\">${distro_bg}</Background>|g" \${desktop_path}
	;;

	x|X) echo "Salir"
	exit
	;;

	*) clear; echo "Opcion no valida, vuelva a intentarlo"
	frontend_funcion
	;;
esac
jwm -restart; frontend_funcion
}
frontend_funcion
EOF

cat << EOF > ${scp_cfg_d}/CFG_THEME_[CLI].sh
#!/bin/bash
function theme_cli_jwm_funcion() {
clear
echo "Configuracion de tema"
echo "¿Que tema quieres?"
echo "0) Tema 0   | 1) Tema 1   | 2) Tema 2   | 3) Tema 3         |"
echo "4) Tema 4   | 5) Tema 5   | 6) Tema 6   | 7) Tema 7         |"
echo "8) Tema 8   | 9) Tema 9   | 10) Tema 10 | 11) Tema 11       |"
echo "12) Tema 12 | 13) Tema 13 | 14) Tema 14 | 15) Tema 15       |"
echo "16) Tema 16 | 17) Tema 17 | 18) Tema 18 | 19) Tema 19       |"
echo "20) Tema 20 | 21) Tema 21 | 22) Tema 22 | 24) Tema 24       |"
echo "25) Tema 25 | 26) Tema 26 | 27) Tema 27 | 28) Tema 28       |"
echo "29) Tema 29 | 30) Tema 30 | 31) Tema 31 | 32) Tema original |"
echo ""
read -p "Opcion: " op_theme
if [ "\${op_theme}" -eq "32" ]; then
	op_theme="0"
fi
cp "${tm_d}/THEME_\${op_theme}.txt" "${sys_jwm_d}/03_Visual_Styles.txt"
jwm -restart
theme_cli_jwm_funcion
}
theme_cli_jwm_funcion
EOF

cat << EOF > ${scp_cfg_d}/CFG_THEME_[XMSG].sh
#!/bin/bash
function theme_xmsg_jwm_funcion() {
destiny="/etc/jwm/Config-JWM/TXTs/Content_TXTs_SystemJWMRC/03_Visual_Styles.txt"
xmessage -center -button "0:0,1:1,2:2,3:3,4:4,5:5,6:6,7:7,8:8,9:9,0:10,11:11,12:12,13:13,14:14,15:15,16:16,17:17,18:18,19:19,20:20,21:21,22:22,23:23,24:24,25:25,26:26,27:27,28:28,29:29,30:30,31:31,Original:0" -name "Configuracion de Tema" "Escoge un Tema:"
cp "${tm_d}/THEME_\${?}.txt" "${sys_jwm_d}/03_Visual_Styles.txt"; jwm -restart
}
theme_xmsg_jwm_funcion
EOF
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function file_desktop_jwm_funcion() {
cat << EOF > /usr/share/applications/MAN_JWM_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=MAN_JWM_[CLI]_[${distro_name}]
Exec=${scp_d}/MAN_JWM_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=true
Categories=DistroDesktop;Utility;JWM
EOF

cat << EOF > /usr/share/applications/MAN_JWM_[XMSG]_[${distro_name}].desktop
[Desktop Entry]
Name=MAN_JWM_[XMSG]_[${distro_name}]
Exec=${scp_d}/MAN_JWM_[XMSG].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;Utility;JWM
EOF

cat << EOF > /usr/share/applications/CFG_BG_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=CFG_BG_[CLI]_[${distro_name}]
Exec=${scp_cfg_d}/CFG_BG_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=true
Categories=DistroDesktop;JWM_Customization
EOF

cat << EOF > /usr/share/applications/CFG_THEME_[CLI]_[${distro_name}].desktop
[Desktop Entry]
Name=CFG_THEME_[CLI]_[${distro_name}]
Exec=${scp_cfg_d}/CFG_THEME_[CLI].sh
Icon=${distro_logo}
Type=Application
Terminal=true
Categories=DistroDesktop;JWM_Customization
EOF

cat << EOF > /usr/share/applications/CFG_THEME_[XMSG]_[${distro_name}].desktop
[Desktop Entry]
Name=CFG_THEME_[XMSG]_[${distro_name}]
Exec=${scp_cfg_d}/CFG_THEME_[XMSG].sh
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop;JWM_Customization
EOF
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function file_manual_jwm_funcion() {
cat << EOF > ${man_jwm_d}/MAN_ActionsCommandJWM.txt
Manual --> ActionsCommandJWM.txt
Etiqueta		Descripción
RestartCommand		Un comando para ejecutar cuando JWM se reinicie.
ShutdownCommand		Un comando para ejecutar cuando JWM se apague.
StartupCommand		Un comando para ejecutar cuando JWM se inicie.
EOF

cat << EOF > ${man_jwm_d}/MAN_Root_Menu.txt
Manual --> Root_Menu.txt
El menú raíz (Root Menu) en JWM es la forma principal de iniciar programas. También proporciona una manera de reiniciar o salir del administrador de ventanas. Cabe destacar que es posible tener múltiples menús raíz. Consulte el atributo onroot para más información. La etiqueta más externa es RootMenu. Esta etiqueta admite los siguientes atributos:
	onroot	= Determina qué botones en la ventana raíz activan el menú. Es una lista de enteros que especifican los botones. El valor predeterminado es 123. Se pueden utilizar múltiples menús raíz especificando diferentes botones para activarlos. Los valores válidos en esta lista son del 0 al 9 y de la a a la z. Los botones de mouse habituales son: 1 para el botón izquierdo, 2 para el botón central, 3 para el botón derecho, y 4 y 5 para la rueda de desplazamiento. Por lo tanto, acceder a menús raíz asignados a los botones 0, 6, 7, 8, 9 o una letra generalmente requerirá el uso de un botón en la bandeja o una asignación de tecla.
	height	= La altura de cada elemento del menú en píxeles. 0 indica que la altura de la fuente determinará la altura. El valor predeterminado es 0.
	label	= La etiqueta que se mostrará en la parte superior del menú. El valor predeterminado es JWM.
	labeled = Determina si aparece una etiqueta en la parte superior del menú. Los valores posibles son true y false. El valor predeterminado es false.
	dynamic = Un archivo para cargar en el menú raíz. Si el nombre comienza con "exec:", se puede proporcionar el nombre de un ejecutable que generará el menú raíz. Tenga en cuenta que la estructura del menú raíz debe tener una etiqueta JWM en el nivel superior.
Dentro de la etiqueta RootMenu se admiten las siguientes etiquetas:
	Menu	-> Esta etiqueta crea un elemento de submenú. Cualquier etiqueta permitida dentro de la etiqueta RootMenu, incluida Menu, es válida dentro de esta etiqueta. La etiqueta Menu admite los siguientes atributos:
		height	= La altura de cada elemento del menú en píxeles. 0 indica que la altura de la fuente determinará la altura. El valor predeterminado es heredado del menú principal.
		label	= La etiqueta a utilizar para este menú. No hay valor predeterminado.
		tooltip	= Un texto emergente para utilizar en este menú. No hay valor predeterminado.
		icon	= El ícono a utilizar para este menú. No hay valor predeterminado.
		labeled	= Determina si aparece una etiqueta en la parte superior del menú. Los valores posibles son true y false. El valor predeterminado es false.
	Dynamic	-> Incluye el contenido de un archivo o la salida de un programa como un submenú. El archivo (o la salida del programa) debe comenzar con una etiqueta JWM que contenga uno o más elementos para ser incluidos en el submenú. Se especifica un archivo mediante el texto de la etiqueta. Si el texto comienza con exec:, se usa la salida del ejecutable especificado. Tenga en cuenta que el programa o archivo se leerá cada vez que se muestre el menú. Para incluir elementos de menú al mismo nivel o para incluir estáticamente los elementos del menú cuando se analice el archivo de configuración, utilice la etiqueta Include. Esta etiqueta admite los mismos atributos que la etiqueta Menu.
	Program	-> La etiqueta Program proporciona una forma de iniciar programas externos. El texto de esta etiqueta indica el comando utilizado para iniciar el programa. Se admiten los siguientes atributos:
		label	= La etiqueta que se mostrará. El valor predeterminado es el texto de la etiqueta.
		tooltip	= El texto emergente a utilizar. No hay valor predeterminado.
		icon	= El ícono a utilizar. No hay valor predeterminado.
	Separator -> Esta etiqueta simplemente coloca una línea en el menú, permitiendo divisiones en el menú. No se usan texto ni atributos.
	Desktops -> Esta etiqueta agrega un menú de escritorios. Es un menú con una lista de escritorios que se pueden seleccionar para cambiar el escritorio actual. Se admiten los siguientes atributos:
		label	= La etiqueta a utilizar para el menú. El valor predeterminado es Desktops.
		tooltip	= El texto emergente a utilizar. No hay valor predeterminado.
		icon	= El ícono a utilizar para este menú. No hay valor predeterminado.
	SendTo	-> Agrega un menú "enviar a" al menú. Después de seleccionar un elemento de este menú, se puede seleccionar una ventana para enviarla al escritorio seleccionado. Se admiten los siguientes atributos:
		label	= La etiqueta a utilizar para el menú. El valor predeterminado es SendTo.
		tooltip	= El texto emergente a utilizar. No hay valor predeterminado.
		icon	= El ícono a utilizar para este menú. No hay valor predeterminado.
	Stick	-> Agrega la operación de pegar/despegar ventana al menú. Después de seleccionar este elemento, se puede seleccionar una ventana para alternar el estado pegajoso de esa ventana. Se admiten los siguientes atributos:
		label	= La etiqueta a utilizar para el menú. El valor predeterminado es Stick.
		tooltip	= El texto emergente a utilizar. No hay valor predeterminado.
		icon	= El ícono a utilizar para este menú. No hay valor predeterminado.
	Maximize -> Agrega la operación de maximizar ventana al menú. Después de seleccionar este elemento, se puede seleccionar una ventana para alternar el estado maximizado de esa ventana. Se admiten los siguientes atributos:
		label	= La etiqueta a utilizar para el menú. El valor predeterminado es Maximize.
		tooltip	= El texto emergente a utilizar. No hay valor predeterminado.
		icon	= El ícono a utilizar para este menú. No hay valor predeterminado.
	Minimize -> Agrega la operación de minimizar ventana al menú. Después de seleccionar este elemento, se puede seleccionar una ventana para minimizarla. Se admiten los siguientes atributos:
		label	= La etiqueta a utilizar para el menú. El valor predeterminado es Minimize.
		tooltip	= El texto emergente a utilizar. No hay valor predeterminado.
		icon	= El ícono a utilizar para este menú. No hay valor predeterminado.
	Shade	-> Agrega la operación de sombrear/desombrar ventana al menú. Después de seleccionar este elemento, se puede seleccionar una ventana para alternar el estado sombreado de esa ventana. Se admiten los siguientes atributos:
		label	= La etiqueta a utilizar para el menú. El valor predeterminado es Shade.
		tooltip	= El texto emergente a utilizar. No hay valor predeterminado.
		icon	= El ícono a utilizar para este menú. No hay valor predeterminado.
	Move	-> Agrega la operación de mover ventana al menú. Después de seleccionar este elemento, se puede seleccionar una ventana para moverla. Se admiten los siguientes atributos:
		label	= La etiqueta a utilizar para el menú. El valor predeterminado es Move.
		tooltip	= El texto emergente a utilizar. No hay valor predeterminado.
		icon	= El ícono a utilizar para este menú. No hay valor predeterminado.
	Resize	-> Agrega la operación de redimensionar ventana al menú. Después de seleccionar este elemento, se puede seleccionar una ventana para cambiar su tamaño. Se admiten los siguientes atributos:
		label	= La etiqueta a utilizar para el menú. El valor predeterminado es Resize.
		tooltip	= El texto emergente a utilizar. No hay valor predeterminado.
		icon	= El ícono a utilizar para este menú. No hay valor predeterminado.
	Kill	-> Agrega la operación de matar ventana al menú. Después de seleccionar este elemento, se puede seleccionar una ventana para matarla. Se admiten los siguientes atributos:
		label	= La etiqueta a utilizar para el menú. El valor predeterminado es Kill.
		tooltip	= El texto emergente a utilizar. No hay valor predeterminado.
		icon	= El ícono a utilizar para este menú. No hay valor predeterminado.
	Close	-> Agrega la operación de cerrar ventana al menú. Después de seleccionar este elemento, se puede seleccionar una ventana para cerrarla. Se admiten los siguientes atributos:
		label	= La etiqueta a utilizar para el menú. El valor predeterminado es Close.
		tooltip	= El texto emergente a utilizar. No hay valor predeterminado.
		icon	= El ícono a utilizar para este menú. No hay valor predeterminado.
	Restart	-> Esta etiqueta agrega un elemento de menú para reiniciar el administrador de ventanas. Se admiten los siguientes atributos:
		label	= La etiqueta a utilizar. El valor predeterminado es Restart.
		tooltip	= El texto emergente a utilizar. No hay valor predeterminado.
		icon	= El ícono a utilizar. No hay valor predeterminado.
	Exit	-> Esta etiqueta agrega un elemento de menú para salir del administrador de ventanas. Si se incluye texto en esta etiqueta, se interpretará como un comando para ejecutar cuando JWM salga. Esto se puede usar para iniciar otro administrador de ventanas. Se admiten los siguientes atributos:
		label	= La etiqueta a utilizar. El valor predeterminado es Exit.
		tooltip	= El texto emergente a utilizar. No hay valor predeterminado.
		icon	= El ícono a utilizar para este menú. No hay valor predeterminado.
		confirm	= Determina si aparece un cuadro de confirmación antes de salir. El valor predeterminado es true. Tenga en cuenta que los cuadros de confirmación pueden ser deshabilitados completamente en el momento de la compilación.
EOF

cat << EOF > ${man_jwm_d}/MAN_Visual_Style.txt
Manual --> Visual_Style.txt
<!-- Window Style
La etiqueta WindowStyle controla la apariencia de los bordes de las ventanas. Esta etiqueta admite los siguientes atributos:
	decorations	= Determina las decoraciones a utilizar para las ventanas. Los valores posibles incluyen flat (plano) y motif (motivo). El valor predeterminado es flat.
	delimiters	= Dos caracteres para usar como delimitadores para el nombre de la máquina cliente X. El valor predeterminado es (). Nuevo en v2.4.3.
	showclient	= Incluye el nombre de la máquina cliente X (WM_CLIENT_MACHINE) en el título de la ventana. Las opciones válidas son true (verdadero) y false (falso). El valor predeterminado es false. Nuevo en v2.4.3.
Dentro de esta etiqueta se admiten las siguientes etiquetas:
	Font		= La fuente utilizada para las barras de título. Ver Fuentes.
	Width		= El ancho de los bordes de la ventana en píxeles. El valor predeterminado es 4, el mínimo es 1 y el máximo es 128.
	Height		= La altura de las barras de título de la ventana en píxeles. Por defecto se usa el tamaño de la fuente del título. El mínimo es 1 y el máximo es 256.
	Corner		= El ancho de la esquina redondeada en píxeles. El valor predeterminado es 4. El mínimo es 0 (cuadrado) y el máximo es 5 (muy redondeado).
	Foreground	= El color del texto en la barra de título. Ver Colores.
	Background	= El color de la barra de título (se admiten gradientes). Ver Colores.
	Opacity		= La opacidad de la ventana. Este es un valor de punto flotante entre 0.0 y 1.0. Ten en cuenta que se requiere un administrador de composiciones, como compton, para esto.
	Outline		= El color del contorno de la ventana. Ver Colores.
	Active		= Los colores/opacidad utilizados para la ventana activa. Dentro de esta etiqueta, se admiten las siguientes etiquetas:
		Foreground	= El color del texto en la barra de título. Ver Colores.
		Background	= El color de la barra de título (se admiten gradientes). Ver Colores.
		Opacity		= La opacidad de la ventana. Este es un valor de punto flotante entre 0.0 y 1.0. Ten en cuenta que se requiere un administrador de composiciones, como compton, para esto.
		Outline		= El color del contorno de la ventana. Ver Colores. -->

<!-- ################################################################################################################################################################################################ 256 -->

<!-- Clock Style
La etiqueta ClockStyle controla la apariencia de los relojes en la bandeja. Dentro de esta etiqueta se admiten las siguientes etiquetas:
	Font		= La fuente a utilizar. Ver Fuentes. Se hereda de TrayStyle por defecto.
	Background	= El color de fondo. Ver Colores. Se hereda de TrayStyle por defecto.
	Foreground	= El color del texto. Ver Colores. Se hereda de TrayStyle por defecto. -->

<!-- ################################################################################################################################################################################################ 256 -->

<!-- Tray Style
La etiqueta TrayStyle controla la apariencia de la bandeja. Esta etiqueta admite el siguiente atributo:
	decorations	= Determina las decoraciones a utilizar para las bandejas. Los valores posibles incluyen flat (plano) y motif (motivo). El valor predeterminado es flat.
Dentro de esta etiqueta se admiten las siguientes etiquetas:
	Font		= La fuente predeterminada para la bandeja. Ver Fuentes.
	Background	= El color de fondo predeterminado. Ver Colores.
	Foreground	= El color de primer plano predeterminado. Ver Colores.
	Outline		= El color del contorno de la bandeja. Ver Colores.
	Active		= Colores para los elementos activos en la bandeja. Dentro de esta etiqueta, se admiten las siguientes etiquetas:
		Background	= El color de fondo predeterminado para los elementos activos en la bandeja. Ver Colores.
		Foreground	= El color de primer plano predeterminado para los elementos activos en la bandeja. Ver Colores.
		Outline		= El color del contorno de la bandeja activa. Ver Colores.
		Opacity		= La opacidad de la ventana. Este es un valor de punto flotante entre 0.0 y 1.0. Ten en cuenta que se requiere un administrador de composiciones, como compton, para esto. -->

<!-- ################################################################################################################################################################################################ 256 -->

<!-- Task List Style
La etiqueta TaskListStyle controla la apariencia de las listas de tareas. Se admiten los siguientes atributos:
	decorations	= Determina las decoraciones a utilizar para las listas de tareas. Los valores posibles incluyen flat (plano) y motif (motivo). El valor predeterminado se hereda de TrayStyle.
	group		= Determina si las ventanas se agrupan por clase cuando se muestran en las barras de tareas. Los valores posibles son true (verdadero) y false (falso). El valor predeterminado es false.
	list		= Determina qué ventanas se muestran en las listas de tareas. Los valores posibles son all (todas las ventanas) y desktop (para el escritorio actual). El valor predeterminado es desktop.
	showkill	= Determina si se muestra la opción del menú "Kill" en las barras de tareas y las barras de título de las ventanas. Los valores posibles son true (verdadero) y false (falso). El valor predeterminado es true. Nuevo en v2.4.3.
Dentro de esta etiqueta se admiten las siguientes etiquetas:
	Font		= La fuente utilizada para los nombres de los programas. Se hereda de TrayStyle por defecto. Ver Fuentes.
	Foreground	= El color de primer plano de la lista de tareas. Se hereda de TrayStyle por defecto. Ver Colores.
	Background	= El color de fondo de la lista de tareas. Se admiten gradientes. Se hereda de TrayStyle por defecto. Ver Colores.
	Outline		= El color del contorno. Se hereda de TrayStyle por defecto. Ver Colores.
	Active		= Colores para los elementos activos en la lista. Dentro de esta etiqueta, se admiten las siguientes etiquetas:
		Background	= El color de fondo activo predeterminado. Se hereda de TrayStyle por defecto. Ver Colores.
		Foreground	= El color de primer plano activo predeterminado. Se hereda de TrayStyle por defecto. Ver Colores.
		Outline		= El color del contorno para los elementos activos. Se hereda de TrayStyle por defecto. Ver Colores. -->

<!-- ################################################################################################################################################################################################ 256 -->

<!-- Tray Button Style
La etiqueta TrayButtonStyle controla la apariencia de los botones de la bandeja en la bandeja del sistema. Dentro de esta etiqueta, se admiten las siguientes etiquetas:
	Font		= La fuente utilizada para las etiquetas de los botones de la bandeja. Se hereda de TrayStyle por defecto. Ver Fuentes.
	Foreground	= El color de primer plano para las etiquetas de los botones de la bandeja. Se hereda de TrayStyle por defecto. Ver Colores.
	Background	= El color de fondo de los botones de la bandeja. Se admiten gradientes. Se hereda de TrayStyle por defecto. Ver Colores.
	Outline		= El color del contorno. Se hereda de TrayStyle por defecto. Ver Colores.
	Active		= Colores para los botones de la bandeja presionados. Dentro de esta etiqueta, se admiten las siguientes etiquetas:
		Background	= El color de fondo activo predeterminado. Se hereda de TrayStyle por defecto. Ver Colores.
		Foreground	= El color de primer plano activo predeterminado. Se hereda de TrayStyle por defecto. Ver Colores.
		Outline		= El color del contorno activo. Se hereda de TrayStyle por defecto. Ver Colores. -->

<!-- ################################################################################################################################################################################################ 256 -->

<!-- Pager Style
La etiqueta PagerStyle controla la apariencia de los paginadores en la bandeja. Dentro de esta etiqueta, se admiten las siguientes etiquetas:
	Outline		= El color del contorno alrededor de las ventanas mostradas en el paginador. Ver Colores.
	Foreground	= El color de las ventanas inactivas mostradas en el paginador. Ver Colores.
	Background	= El fondo de los escritorios inactivos mostrados en el paginador. Ver Colores.
	Text		= El color a utilizar para las etiquetas del paginador. Ver Colores.
	Font		= La fuente a utilizar para las etiquetas del paginador. Ver Fuentes.
	Active		= Colores para las ventanas activas mostradas en el paginador. Dentro de esta etiqueta, se admiten las siguientes etiquetas:
		Foreground	= El color de las ventanas activas mostradas en el paginador. Ver Colores.
		Background	= El color de los escritorios activos mostrados en el paginador. Ver Colores. -->

<!-- ################################################################################################################################################################################################ 256 -->

<!-- Menu Style
La etiqueta MenuStyle controla la apariencia de los menús en JWM (esto incluye el menú raíz y los menús de las ventanas). Esta etiqueta admite el siguiente atributo:
	decorations	= Determina las decoraciones a utilizar para los menús. Los valores posibles incluyen flat (plano) y motif (motivo). El valor predeterminado es flat.
Dentro de esta etiqueta se admiten las siguientes etiquetas:
	Font		= La fuente utilizada en los menús. Ver Fuentes.
	Foreground	= El color del texto de los elementos inactivos del menú. Ver Colores.
	Background	= El color de fondo de los elementos inactivos del menú. Ver Colores.
	Outline		= El color del contorno. Ver Colores.
	Active		= Colores para los elementos activos del menú. Dentro de esta etiqueta, se admiten las siguientes etiquetas:
		Foreground	= El color del texto de los elementos activos del menú. Ver Colores.
		Background	= El color de fondo del texto de los elementos activos del menú. Se admiten gradientes. Ver Colores.
		Opacity		= La opacidad de la ventana. Este es un valor de punto flotante entre 0.0 y 1.0. Ten en cuenta que se requiere un administrador de composiciones, como compton, para esto. -->

<!-- ################################################################################################################################################################################################ 256 -->

<!-- Popup Style
La etiqueta PopupStyle controla la apariencia de las ventanas emergentes, como las que se muestran cuando el mouse se sitúa sobre un elemento de la lista de tareas. Esta etiqueta admite los siguientes atributos:
	enabled		= Determina si las ventanas emergentes están habilitadas. Esta es una lista separada por comas de uno o más de los siguientes valores:
		true	-> Todo habilitado
		false	-> Todo deshabilitado
		button	-> Botones de la bandeja
		clock	-> Relojes
		menu	-> Menús
		pager	-> Paginadores
		task	-> Elementos de la lista de tareas
		El valor predeterminado es true.
	delay		= El retraso en milisegundos antes de que se activen las ventanas emergentes. El valor predeterminado es 600.
Dentro de esta etiqueta se admiten las siguientes etiquetas:
	Font		= La fuente a utilizar. Ver Fuentes.
	Outline		= El color del contorno de la ventana. Ver Colores.
	Foreground	= El color del texto. Ver Colores.
	Background	= El color de fondo de la ventana. Ver Colores. -->
EOF

cat << EOF > ${man_jwm_d}/MAN_Groups.txt
<!-- Group Settings
Los grupos de programas permiten especificar opciones que se aplican a un grupo de programas por su nombre y/o clase. Un grupo de programas se crea con la etiqueta Group. Se pueden crear tantos grupos de programas como se desee. Dentro de la etiqueta Group, se admiten las siguientes etiquetas:
	Name	= El nombre de la ventana de un programa para hacer coincidir y que esté en este grupo (la primera cadena en WM_CLASS). Este campo se analiza como una expresión regular POSIX extendida (consulta regex(7) para más información). Si se especifica una o más etiquetas Name, al menos una debe coincidir.
	Class	= La clase de ventana de un programa para hacer coincidir y que esté en este grupo (la segunda cadena en WM_CLASS). Este campo se analiza como una expresión regular POSIX extendida (consulta regex(7) para más información). Si se especifica una o más etiquetas Class, al menos una debe coincidir.
	Option	= Una opción para este grupo. La tabla a continuación enumera las opciones posibles.

	Option	Descripción
	aerosnap	Habilita la auto-maximización.
	border		Habilita el borde en las ventanas de este grupo.
	centered	Centra las ventanas de este grupo al colocarlas inicialmente en lugar de usar colocación en cascada.
	constrain	Evita que los clientes en este grupo se muevan fuera de la pantalla.
	desktop:#	El escritorio en el que se iniciarán las ventanas de este grupo.
	drag		No pasa eventos del ratón a la ventana. En su lugar, usa el ratón para mover/redimensionar la ventana.
	fixed		Fija las ventanas de este grupo al escritorio actual. Esto hará que el escritorio cambie cuando se eleve la ventana, en lugar de la acción predeterminada de mover la ventana al escritorio actual.
	height:n	Establece la altura inicial para las ventanas de este grupo a n (píxeles).
	hmax		Hace que las ventanas de este grupo se maximicen horizontalmente por defecto.
	icon:icon	El icono a utilizar para las ventanas de este grupo.
	iignore		Ignora la sugerencia de tamaño de incremento al maximizar las ventanas de este grupo.
	layer:layer	La capa en la que se iniciarán las ventanas de este grupo. Las opciones válidas son below, normal, y above.
	maximized	Hace que las ventanas de este grupo se maximicen.
	minimized	Hace que las ventanas de este grupo se minimicen.
	noborder	Desactiva el borde para las ventanas de este grupo.
	noclose		Oculta el botón de cierre para las ventanas de este grupo.
	nodrag		Desactiva mod1+drag para mover/redimensionar las ventanas de este grupo.
	nofocus		Evita que las ventanas de este grupo tomen el foco cuando se mapean.
	nofullscreen	Evita que las ventanas de este grupo se pongan en pantalla completa.
	nolist		Hace que la bandeja ignore las ventanas de este grupo.
	nomax		Deshabilita la maximización para las ventanas de este grupo.
	nomin		Deshabilita la minimización para las ventanas de este grupo.
	nomove		Evita que las ventanas de este grupo se muevan.
	nopager		Hace que el pager ignore las ventanas de este grupo.
	noresize	Evita que las ventanas de este grupo sean redimensionadas.
	noshade		Deshabilita el sombreado para las ventanas de este grupo.
	notitle		Desactiva la barra de título para las ventanas de este grupo.
	noturgent	Ignora la sugerencia urgente para las ventanas de este grupo. Sin esta opción habilitada, JWM hará parpadear el borde de las ventanas urgentes.
	opacity:#	Establece la opacidad para las ventanas de este grupo. El valor es un número entre 0.0 y 1.0 inclusive.
	pignore		Ignora la posición inicial especificada por el programa.
	shaded		Hace que las ventanas de este grupo se sombren.
	sticky		Hace que las ventanas de este grupo sean fijas (sticky).
	tiled		Intenta colocar las ventanas de este grupo en mosaico al principio. Si la colocación en mosaico falla, las ventanas volverán a la colocación en cascada (predeterminada) o centrada si se especifica.
	title		Activa la barra de título para las ventanas de este grupo.
	vmax		Hace que las ventanas de este grupo se maximicen verticalmente por defecto.
	width:n		Establece el ancho inicial para las ventanas de este grupo a n (píxeles).
	x:n		Establece la coordenada x inicial para las ventanas de este grupo a n.
	y:n		Establece la coordenada y inicial para las ventanas de este grupo a n.
EOF

cat << EOF > ${man_jwm_d}/MAN_Tray_Buttom.txt
<!-- Trays
Uno o más bandejas pueden ser creadas mediante la etiqueta Tray. Esta etiqueta soporta los siguientes atributos:
	autohide	= Especifica la ubicación para ocultar la bandeja cuando no esté activada. Puede ser uno de los siguientes: left (izquierda), right (derecha), top (arriba), bottom (abajo), o off (desactivado). El valor predeterminado es off para desactivar el ocultamiento.
	x		= La coordenada x de la bandeja. Puede ser negativa para indicar un desplazamiento desde la derecha de la pantalla.
	y		= La coordenada y de la bandeja. Puede ser negativa para indicar un desplazamiento desde la parte inferior de la pantalla.
	width		= El ancho de la bandeja. Un valor de 0 indica que la bandeja debe calcular un ancho óptimo dependiendo de lo que contenga y el diseño. Un valor negativo indica que el ancho debe restarse del ancho de la pantalla. El valor predeterminado es 0.
	height		= La altura de la bandeja. Un valor de 0 indica que la bandeja debe calcular una altura óptima dependiendo de lo que contenga y el diseño. Un valor negativo indica que la altura debe restarse de la altura de la pantalla. El valor predeterminado es 0.
	layer		= La capa de la bandeja. El valor predeterminado es "above" (por encima). Los valores válidos son "below" (por debajo), "normal" y "above" (por encima).
	layout		= El diseño de la bandeja. El valor predeterminado es horizontal. Los valores posibles son "horizontal" y "vertical".
	halign		= La alineación horizontal de la bandeja. El valor predeterminado es "fixed" (fija). Los valores posibles son "fixed" (fija), "left" (izquierda), "center" (centro) y "right" (derecha).
	valign		= La alineación vertical de la bandeja. El valor predeterminado es "fixed" (fija). Los valores posibles son "fixed" (fija), "top" (arriba), "center" (centro) y "bottom" (abajo).
	screen		= El índice de la pantalla en la que debe comenzar la bandeja. El valor predeterminado es 0.
Dentro de la etiqueta Tray, se soportan las siguientes etiquetas:
	Clock	-> Añadir un reloj a la bandeja. Esta etiqueta soporta los siguientes atributos:
		format	= El formato del reloj. Consulta strftime(3) para más información. El valor predeterminado es %I:%M %p.
		zone	= La zona horaria del reloj. Consulta tzset(3) para más información. El valor predeterminado es la zona horaria local.
		width	= El ancho a usar. Un valor de 0 indica que el ancho debe ser determinado desde la bandeja y la fuente utilizada. El valor predeterminado es 0.
		height	= La altura a usar. Un valor de 0 indica que la altura debe ser determinada desde la bandeja y la fuente utilizada. El valor predeterminado es 0.
		El texto de esta etiqueta determina lo que el reloj hace cuando se hace clic en él:
			exec:program	= Ejecutar un programa.
			showdesktop	= Minimizar todas las ventanas en el escritorio actual.
			root:n		= Mostrar el menú raíz n.
Opcionalmente, la etiqueta Button puede ser utilizada dentro de esta etiqueta para especificar la acción a tomar para un botón de ratón en particular.
El texto de la etiqueta es el mismo que para TrayButton. La etiqueta Button soporta el atributo mask, que especifica qué botones del ratón activan la acción.
El valor predeterminado es 123, para clic derecho, medio y izquierdo.
	Dock	-> Añadir un dock para notificaciones del sistema. Esto puede ser utilizado por aquellos programas que usan la selección _NET_SYSTEM_TRAY_Sn. El tamaño del Dock es dinámico, dependiendo del tamaño de la bandeja y del número de elementos que contiene. Solo se permite un Dock por instancia de JWM. Esta etiqueta soporta los siguientes atributos:
		spacing	= Número de píxeles a dejar entre los elementos del dock. El valor predeterminado es 0.
		width	= El ancho mínimo de los elementos en el dock. El valor predeterminado es 0.
	Pager	-> Añadir un pager a la bandeja. Esta etiqueta soporta el siguiente atributo:
		labeled	= Determina si el nombre del escritorio se muestra. Los valores posibles son "true" y "false". El valor predeterminado es "false".
	Spacer	-> Añadir espacio vacío a la bandeja. Esta etiqueta soporta los siguientes atributos:
		width	= El ancho del espaciador. Un valor de 0 indica que el ancho debe ser determinado desde la bandeja. El valor predeterminado es 0.
		height	= La altura del espaciador. Un valor de 0 indica que la altura debe ser determinada desde la bandeja. El valor predeterminado es 0.
	Swallow	-> Absorber un programa en la bandeja. El texto de esta etiqueta indica el comando a ejecutar. Esta etiqueta soporta los siguientes atributos:
		name	= El nombre del programa a absorber. Este atributo es requerido, ya que es así como JWM encuentra el programa a absorber.
		width	= El ancho del programa absorbido. Un valor de 0 indica que el ancho debe ser determinado desde la bandeja y el tamaño solicitado por el programa. El valor predeterminado es 0.
		height	= La altura del programa absorbido. Un valor de 0 indica que la altura debe ser determinada desde la bandeja y el tamaño solicitado por el programa. El valor predeterminado es 0.
	TaskList -> Añadir una lista de tareas a la bandeja. Esta etiqueta soporta los siguientes atributos:
		maxwidth = El ancho máximo de un ítem en la lista de tareas. Un valor de 0 indica que no hay máximo. El valor predeterminado es 0.
		labeled	= Determina si se muestra una etiqueta para los ítems de la lista de tareas. Los valores posibles son "true" y "false". El valor predeterminado es "true".
		height	= La altura preferida de los ítems en la lista de tareas. Un valor de 0 indica que no hay preferencia. El valor predeterminado es 0.
	TrayButton -> Añadir un botón a la bandeja. Esta etiqueta soporta los siguientes atributos:
		label	= Una etiqueta para mostrar. No tiene valor predeterminado.
		icon	= Un icono para mostrar. No tiene valor predeterminado.
		popup	= Texto para mostrar en un popup. El valor predeterminado es la etiqueta.
		El texto de esta etiqueta determina lo que el botón hace:
			exec:program	= Ejecutar un programa.
			showdesktop	= Minimizar todas las ventanas en el escritorio actual.
			root:n		= Mostrar el menú raíz n.
Opcionalmente, la etiqueta Button puede ser utilizada dentro de esta etiqueta para especificar la acción a tomar para un botón de ratón en particular.
El texto de la etiqueta es el mismo que para TrayButton. La etiqueta Button soporta el atributo mask, que especifica qué botones del ratón activan la acción. 
El valor predeterminado es 123, para clic derecho, medio y izquierdo.
EOF

cat << EOF > ${man_jwm_d}/MAN_Virtual_Desktop.txt
<!-- Desktops
Los escritorios virtuales se controlan con la etiqueta Desktops. Dentro de esta etiqueta se admiten los siguientes atributos:
	width	= El número de escritorios virtuales en la dirección horizontal. El valor predeterminado es 4.
	height	= El número de escritorios virtuales en la dirección vertical. El valor predeterminado es 1.
	Dentro de la etiqueta Desktops, se admiten las siguientes etiquetas:
		Background = El fondo predeterminado para los escritorios. El atributo type determina el tipo de fondo y el texto contenido dentro de esta etiqueta es el valor. Los tipos válidos son:
			solid		= Un color sólido. Consulta Colors. Este es el valor predeterminado.
			gradient	= Un color en gradiente. Consulta Colors.
			image		= Una imagen estirada.
			scale		= Una imagen escalada.
			tile		= Una imagen en mosaico.
			command		= Un comando para ejecutar para establecer el fondo.
	Desktop	= Datos específicos de un escritorio. 
		Se puede especificar el atributo name para nombrar el escritorio (el valor predeterminado es el número del escritorio). 
		Dentro de esta etiqueta, se puede especificar una etiqueta Background para un fondo específico de escritorio. Consulta Background más arriba para más información.
EOF

cat << EOF > ${man_jwm_d}/MAN_Mouse.txt
<!--	Tag			Descripción									Predeterminado		Rango
	DoubleClickDelta	El número de píxeles que el ratón puede moverse durante un doble clic.		2			0 - 32

	DoubleClickSpeed	El número de milisegundos entre los clics para un doble clic.			400			1 - 2000

	FocusModel		El modelo de enfoque usado por JWM:
		click 		- Clic para enfocar y elevar.
		clicktitle 	- Clic para enfocar. Clic en el título o borde para elevar.
		sloppy 		- Mover el ratón para enfocar. Clic para elevar.
		sloppytitle 	- Mover el ratón para enfocar. Clic en el título o borde para elevar.
		Valores posibles: click, clicktitle, sloppy, sloppytitle

	SnapMode	El modo de ajuste. 									border			none, screen, border
			Un atributo opcional distance especifica la distancia para el ajuste 
			(el valor predeterminado es 5, rango 1 - 32).

	MoveMode	El modo de movimiento. El atributo opcional mask especifica la tecla modificadora 	opaque			opaque, outline
			que, al mantenerse presionada, permite mover la ventana arrastrándola. 
			El predeterminado es A. 
			El atributo opcional coordinates determina la ubicación de la ventana 
			de estado de movimiento. Los valores posibles son 
			off, corner, window, y screen (predeterminado). 
			El atributo opcional delay establece el retraso en milisegundos antes de mover 
			una ventana a otro escritorio. 
			Establecer esto a 0 deshabilita el arrastre entre escritorios. 
			El predeterminado es 1000.

	ResizeMode	El modo de redimensionado. 								opaque			opaque, outline
			El atributo opcional coordinates determina la ubicación de la ventana 
			de estado de redimensionado. Los valores posibles son 
			off, corner, window, y screen (predeterminado).	
EOF

cat << EOF > ${man_jwm_d}/MAN_Keys.txt
Manual -- > Keys.txt
Aquí, la máscara especifica las teclas modificadoras que deben mantenerse presionadas para habilitar esta acción y la tecla especifica la tecla que debe presionarse.
Se puede especificar keycode en lugar de key si se conoce el código de la tecla pero no la tecla en sí (o si no existe un símbolo para el código de la tecla). 
action es la acción que se realiza cuando se presiona esta combinación de teclas. La sección de mask es opcional. Puede contener cualquier número de los siguientes valores:
	A - Alt (mod1)
	C - Control
	S - Shift
	1 - mod1
	2 - mod2
	3 - mod3
	4 - mod4
	5 - mod5
Tenga en cuenta que la tecla física que determina la máscara se puede configurar utilizando el programa "xmodmap". 
La sección de key debe contener una cadena de texto para la clave XStringToKeysym. 
Estos valores son generalmente los que se esperarían (por ejemplo, la tecla de escape se llama "Escape").

Finalmente, action es la acción que se realiza cuando se presiona una tecla. Las acciones válidas son:
	Valor		Descripción
	up		Mover hacia arriba.
	down		Mover hacia abajo.
	right		Mover hacia la derecha.
	left		Mover hacia la izquierda.
	escape		Detener un movimiento/redimensionamiento o salir de un menú.
	select		Hacer una selección.
	next		Cambiar a la siguiente ventana en la lista de tareas.
	nextstacked	Cambiar a la siguiente ventana en el orden de apilamiento.
	prev		Cambiar a la ventana anterior en la lista de tareas.
	prevstacked	Cambiar a la ventana anterior en el orden de apilamiento.
	close		Cerrar la ventana.
	fullscreen	Alternar entre pantalla completa.
	minimize	Minimizar la ventana.
	maximize	Maximizar la ventana.
	maxv		Maximizar la ventana verticalmente.
	maxh		Maximizar la ventana horizontalmente.
	maxtop		Maximizar la ventana en la mitad superior de la pantalla.
	maxbottom	Maximizar la ventana en la mitad inferior de la pantalla.
	maxleft		Maximizar la ventana en la mitad izquierda de la pantalla.
	maxright	Maximizar la ventana en la mitad derecha de la pantalla.
	restore		Restaurar ventana maximizada o minimizada.
	shade		Sombrear ventana.
	move		Mover la ventana.
	resize		Redimensionar ventana.
	root:n		Mostrar el menú raíz n.
	window		Mostrar el menú de la ventana.
	desktop#	Cambiar a un escritorio específico. Para usar esto, se debe especificar # en la sección de tecla.
			Luego se sustituyen los números del 1 al número de escritorios configurados.
	rdesktop	Mover un escritorio a la derecha.
	ldesktop	Mover un escritorio a la izquierda.
	udesktop	Mover un escritorio hacia arriba.
	ddesktop	Mover un escritorio hacia abajo.
	sendl		Mover la ventana activa a la izquierda.
	sendr		Mover la ventana activa a la derecha.
	sendu		Mover la ventana activa hacia arriba.
	sendd		Mover la ventana activa hacia abajo.
	exec:command	Ejecutar el comando.
	restart		Reiniciar JWM.
	exit		Salir de JWM.
	showtray	Mostrar las bandejas.

	Tenga en cuenta que cualquier vínculo que no se especifique en el archivo de configuración no será accesible. 
	Además, es posible vincular múltiples combinaciones de teclas a la misma acción.
EOF

cat << EOF > ${man_jwm_d}/MAN_Mouse_Bindings.txt
Manual --> Mouse_Bindings.txt
<!-- Mouse Bindings
Las vinculaciones del mouse se configuran utilizando la etiqueta Mouse. El atributo context determina el contexto en el que se aplica la vinculación, el atributo button especifica el botón del mouse y el atributo (opcional) mask especifica la máscara de teclas que debe estar activa para que la vinculación coincida. Finalmente, el texto de la etiqueta Mouse determina la acción a realizar (consulta Key Bindings para obtener una lista de acciones). El botón es el número de un botón del mouse, comenzando desde el 1 (típicamente el botón izquierdo). Un valor positivo para el botón indica que la acción se aplica al presionar el mouse, y un valor negativo indica que la acción se aplica al soltar el mouse. El número del botón puede repetirse para vincularlo a los clics dobles. Los siguientes contextos de mouse son compatibles:
	border		= El borde de la ventana.
	close		= El botón de cerrar en una ventana.
	icon		= El botón del ícono en una ventana.
	maximize	= El botón de maximizar en una ventana.
	minimize	= El botón de minimizar en una ventana.
	root		= La ventana raíz (o el escritorio).
	title		= La barra de título de una ventana.
	Otras vinculaciones:
		Button 1 (típicamente el botón izquierdo)	= Sobre una lista de tareas, eleva o minimiza la ventana. Sobre un paginador, cambia el escritorio actual.
		Button 2 (típicamente el botón del medio)	= Sobre un paginador, cambia el escritorio actual.
		Button 3 (típicamente el botón derecho)		= Sobre una lista de tareas, muestra el menú de la ventana. Sobre un paginador, arrastrando con el botón 3 se mueve una ventana.
		Cuando un menú está abierto, la rueda de desplazamiento se moverá a través de los elementos del menú. 
		Cuando está sobre el paginador, la rueda de desplazamiento cambiará de escritorio. 
		Cuando está sobre una lista de tareas, la rueda de desplazamiento cambiará de ventana.
EOF

cat << EOF > ${man_jwm_d}/MAN_Buttons_Style.txt
Manual --> Buttons_Style.txt
Etiquta			Descripción
ButtonClose		Un icono para usar en el botón de cierre en las ventanas del cliente en lugar del predeterminado.

ButtonMax		Un icono para usar en el botón de maximizar en las ventanas del cliente en lugar del predeterminado.

ButtonMaxActive		Un icono para usar en el botón de maximizar en las ventanas del cliente cuando están maximizadas en lugar del predeterminado.

ButtonMenu		Un icono para usar en el botón de menú en las ventanas del cliente en lugar del predeterminado. 
			Esto se usa si la ventana del cliente no especifica un icono.

ButtonMin		Un icono para usar en el botón de minimizar en las ventanas del cliente en lugar del predeterminado.

DefaultIcon		El icono predeterminado a usar para las ventanas que no especifican un icono o tienen uno configurado explícitamente.
EOF
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function file_theme_jwm_funcion() {
cat << EOF >> ${tm_d}/THEME_0.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#FFFFFF</Foreground>
		<Background>#9A9AFF</Background>
		<Opacity>0.5</Opacity>
		<Outline>#EEEEEE</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#0000AA</Background>
			<Opacity>1.0</Opacity>
			<Outline>#EEEEEE</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#0000AA</Background>
		<Foreground>#FFFFFF</Foreground>
		<Outline>#000000</Outline>
		<Active>
			<Background>#555555</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
		<Opacity>0.75</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#000000</Foreground>
		<Background>#9A9AFF</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#000055</Background>
			<Outline>#FFFFFF</Outline>
		</Active>
	</TaskListStyle>

<!-- 	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#FFFFFF</Outline>
		<Foreground>#000055</Foreground>
		<Background>#AAAAAA</Background>
		<Text>#000000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#000055</Foreground>
			<Background>#FF0000</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bond</Font>
		<Foreground>#999999</Foreground>
		<Background>#222222</Background>
		<Outline>#FFFFFF</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#000000</Background>
		</Active>
		<Opacity>0.85</Opacity>
	</MenuStyle>

	<PopupStyle>
		<Font>Sans-0:bond</Font>
		<Outline>#00FF00</Outline>
		<Foreground>#000000</Foreground>
		<Background>#FFFFFF</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_1.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#000000</Foreground>
		<Background>#00FF00</Background>
		<Opacity>0.0</Opacity>
		<Outline>#00FF00</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Opacity>0.0</Opacity>
			<Outline>#00FF00</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
		<Outline>#000000</Outline>
		<Active>
			<Background>#555555</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle>

	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle>

	<PagerStyle>
		<Outline>#000000</Outline>
		<Foreground>#00FF00</Foreground>
		<Background>#00FF00</Background>
		<Text>#00FF00</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#00FF00</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#00FF00</Outline>
		<Active>
			<Foreground>#000000</Foreground>
			<Background>#00FF00</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#00FF00</Outline>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_2.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto en las ventanas) -->
		<Background>#A3B8D2</Background> <!-- Azul claro (Ventanas inactivas) -->
		<Opacity>0.0</Opacity>
		<Outline>#3C4C7A</Outline> <!-- Azul oscuro (borde de ventana) -->
		<Active>
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto en ventana activa) -->
			<Background>#4A6A92</Background> <!-- Azul metálico (Ventana activa) -->
			<Opacity>0.0</Opacity>
			<Outline>#3C4C7A</Outline> <!-- Azul oscuro (borde de ventana activa) -->
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#1D2D4B</Background> <!-- Azul oscuro (fondo reloj) -->
		<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto del reloj) -->
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#2A3A55</Background> <!-- Gris oscuro (fondo bandeja) -->
		<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto en la bandeja) -->
		<Outline>#3C4C7A</Outline> <!-- Azul oscuro (borde bandeja) -->
		<Active>
			<Background>#4A6A92</Background> <!-- Azul metálico (bandeja activa) -->
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto en bandeja activa) -->
			<Outline>#3C4C7A</Outline> <!-- Azul oscuro -->
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TrayListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#D0D0D0</Foreground> <!-- Gris claro (texto tray list) -->
		<Background>#3A4D70</Background> <!-- Azul metálico oscuro -->
		<Outline>#3C4C7A</Outline> <!-- Azul oscuro -->
		<Active>
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto activo en tray list) -->
			<Background>#4A6A92</Background> <!-- Azul metálico (fondo tray list activo) -->
			<Outline>#3C4C7A</Outline> <!-- Azul oscuro -->
		</Active>
	</TrayListStyle>

	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#A9C2E8</Foreground> <!-- Azul claro (texto tray button) -->
		<Background>#1D2D4B</Background> <!-- Azul oscuro (fondo tray button) -->
		<Outline>#3C4C7A</Outline> <!-- Azul oscuro -->
		<Active>
			<Background>#4A6A92</Background> <!-- Azul metálico -->
			<Foreground>#A9C2E8</Foreground> <!-- Azul claro -->
			<Outline>#3C4C7A</Outline> <!-- Azul oscuro -->
		</Active>
	</TrayButtomStyle>

	<PagerStyle>
		<Outline>#3C4C7A</Outline> <!-- Azul oscuro (borde pager) -->
		<Foreground>#B5B5B5</Foreground> <!-- Gris claro (texto del pager) -->
		<Background>#2A3A55</Background> <!-- Gris oscuro -->
		<Text>#4A6A92</Text> <!-- Azul metálico (texto del pager) -->
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto del pager activo) -->
			<Background>#4A6A92</Background> <!-- Azul metálico (fondo del pager activo) -->
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#B5B5B5</Foreground> <!-- Gris claro (texto en menús) -->
		<Background>#1D2D4B</Background> <!-- Azul oscuro (fondo menú) -->
		<Outline>#3C4C7A</Outline> <!-- Azul oscuro (borde menú) -->
		<Active>
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto activo en menú) -->
			<Background>#4A6A92</Background> <!-- Azul metálico (fondo menú activo) -->
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#3C4C7A</Outline> <!-- Azul oscuro -->
		<Foreground>#B5B5B5</Foreground> <!-- Gris claro (texto del popup) -->
		<Background>#2A3A55</Background> <!-- Gris oscuro -->
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_3.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#9699A2</Foreground>
		<Background>#E7E8EB</Background>
		<Outline>#DCDFE3</Outline>
		<Opacity>1.0</Opacity>
		<Active>
			<Foreground>#5C616C</Foreground>
			<Background>#E7E8EB</Background>
			<Opacity>0.0</Opacity>
			<Outline>#DCDFE3</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#E7E8EB</Background>
		<Foreground>#5C616C</Foreground>
                <Outline>#E7E8EB</Outline>
		<Active>
			<Background>#5294E2</Background>
			<Foreground>#FFFFFF</Foreground>
			<Outline>#5294E2</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> ->>

<!-- 	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

        <PagerStyle>
                <Outline>#2F343F</Outline>
                <Foreground>#ECECEC</Foreground>
                <Background>#5B5B5D</Background>
                <Text>#ACABAB</Text>
		<Font>Sans-8:bold</Font>
                <Active>
                        <Foreground>#ECECEC</Foreground>
                        <Background>#5194E2</Background>
                </Active>
        </PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#5C616C</Foreground>
		<Background>#FDFDFD</Background>
		<Outline>#CFD6E6</Outline>
		<Active>
			<Background>#5194E2</Background>
			<Foreground>#FFFFFF</Foreground>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#CFD6E6</Outline>
		<Foreground>#5C616C</Foreground>
		<Background>#FDFDFD</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_4.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#EEEEEE</Foreground>
		<Background>#BBBBBB</Background>
		<Opacity>0.0</Opacity>
		<Outline>#BBBBBB</Outline>
		<Active>
			<Foreground>#EEEEEE</Foreground>
			<Background>#0000BB</Background>
			<Opacity>0.0</Opacity>
			<Outline>#0000BB</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#1D2D4B</Background>
		<Foreground>#FFFFFF</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#BBBBBB</Background>
		<Foreground>#000000</Foreground>
		<Outline>#BBBBBB</Outline>
		<Active>
			<Background>#4A6A92</Background>
			<Foreground>#FFFFFF</Foreground>
			<Outline>#3C4C7A</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#EEEEEE</Foreground>
		<Background>#909090</Background>
		<Outline>#909090</Outline>
		<Active>
			<Foreground>#BBBBBB</Foreground>
			<Background>#909090</Background>
			<Outline>#909090</Outline>
		</Active>
	</TaskListStyle>

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#000000</Outline>
		<Foreground>#000000</Foreground>
		<Background>#000000</Background>
		<Text>#000000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#000000</Foreground>
			<Background>#000000</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bond</Font>
		<Foreground>#000000</Foreground>
		<Background>#BBBBBB</Background>
		<Opacity>0.85</Opacity>
		<Active>
			<Foreground>#EEEEEE</Foreground>
			<Background>#0000BB</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-0:bond</Font>
		<Outline>#00FF00</Outline>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_5.txt
<?xml version="1.0"?>
<JWM> 
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#000000</Foreground>
		<Background>#BFBFBF:#FFFFFF</Background>
		<Opacity>0.0</Opacity>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#5C798D:#9CB9CD</Background>
			<Opacity>0.0</Opacity>
			<Outline>#000000</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#FF0000</Background>
		<Foreground>#111111</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#8D0D13</Background>
		<Foreground>#B0B0B0</Foreground>
		<Outline>#000000</Outline>
		<Active>
			<Background>#FFFFFF</Background>
			<Foreground>#8D0D13</Foreground>
			<Outline>#FFFFFF</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#B0B0B0</Foreground>
		<Background>#C72628:#621314</Background>
		<Outline>#C72628:#621314</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#621314:#DD1D16</Background>
			<Outline>#621314:#DD1D16</Outline>
		</Active>
	</TaskListStyle>

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#000000</Outline>
		<Foreground>#C8E4FF</Foreground>
		<Background>#831D22</Background>
		<Text>#00000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#BEE4ED</Foreground>
			<Background>#AF2323</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#000000</Foreground>
		<Background>#ECE9D8</Background>
		<Outline>#ECE9D8</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#9CB9CD:#5C798D</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#000000</Outline>
		<Foreground>#000000</Foreground>
		<Background>#FF0000</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_6.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#000000</Foreground>
		<Background>##EBE4E4:#C0BEBE</Background>
		<Opacity>0.0</Opacity>
		<Outline>#EBE4E4</Outline>
		<Active>
			<Foreground>#F8F1F1</Foreground>
			<Background>#DDDDDD:#000000</Background>
			<Opacity>0.0</Opacity>
			<Outline>#000000</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#837F7F</Background>
		<Foreground>#000000</Foreground>
		<Outline>#837F7F</Outline>
		<Active>
			<Background>#C8C6C6:#000000</Background>
			<Foreground>#F8F1F1</Foreground>
			<Outline>#C8C6C6:#000000</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> -->

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#FFFFFF</Outline>
		<Foreground>#C8C6C6</Foreground>
		<Background>#9B9696</Background>
		<Text>#9B9696</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#676262</Foreground>
			<Background>#000000</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#FFFFFF</Foreground>
		<Background>#837F7F</Background>
		<Outline>#00FF00</Outline>
		<Active>
			<Foreground>#F8F1F1</Foreground>
			<Background>#C8C6C6:#000000</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#000000</Outline>
		<Foreground>#000000</Foreground>
		<Background>#C0BEBE</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_7.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#DD9988</Foreground>
		<Background>#060000</Background>
		<Opacity>0.0</Opacity>
		<Outline>#FFC184</Outline>
		<Active>
			<Foreground>#FFEAA0</Foreground>
			<Background>#391612:#3C1B16</Background>
			<Opacity>0.0</Opacity>
			<Outline>#FFC184</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#060000</Background>
		<Foreground>#BD7968</Foreground>
		<Outline>#000000</Outline>
		<Active>
			<Background>#391612:#3C1B16</Background>
			<Foreground>#FEDA90</Foreground>
			<Outline>#391612:#3C1B16</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle> 

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> -->

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#DDDDDD</Outline>
		<Foreground>#060000</Foreground>
		<Background>#3C1B16</Background>
		<Text>#000000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#361000</Foreground>
			<Background>#693642</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#CD8978</Foreground>
		<Background>#251210</Background>
		<Outline>#251210</Outline>
		<Active>
			<Foreground>#FFEAA0</Foreground>
			<Background>#391612:#3C1B16</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#FFC184</Outline>
		<Foreground>#070101</Foreground>
		<Background>#F1AD70</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_8.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#E5E5E5</Foreground>
		<Background>#9DBBDB:#000000</Background>
		<Opacity>0.0</Opacity>
		<Outline>#B3B3B3:#4D4D4D</Outline>
		<Active>
			<Foreground>#FFFF00</Foreground>
			<Background>#9DBBDB:#000000</Background>
			<Opacity>0.0</Opacity>
			<Outline>#9DBBDB:#000000</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#4D525B</Background>
		<Foreground>#FFFF00</Foreground>
		<Outline>#4D525B</Outline>
		<Active>
			<Background>#FFFF00</Background>
			<Foreground>#4D525B</Foreground>
			<Outline>#FFFF00</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#E5E5E5</Foreground>
		<Background>#999999:#333333</Background>
		<Outline>#999999:#333333</Outline>
		<Active>
			<Foreground>#FFFF00</Foreground>
			<Background>#7F7F7F:#1A1A1A</Background>
			<Outline>#7F7F7F:#1A1A1A</Outline>
		</Active>
	</TaskListStyle>

	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#FFFF00</Foreground>
		<Background>#7F7F7F:#1A1A1A</Background>
		<Outline>#7F7F7F:#1A1A1A</Outline>
		<Active>
			<Background>#999999:#333333</Background>
			<Foreground>#FFFFFF</Foreground>
			<Outline>#999999:#333333</Outline>
		</Active>
	</TrayButtomStyle>

	<PagerStyle>
		<Outline>#737373</Outline>
		<Foreground>#B3B3B3</Foreground>
		<Background>#737373</Background>
		<Text>#000000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#A6A6A6</Foreground>
			<Background>#8C8C8C</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#FFFFFF</Foreground>
		<Background>#4D525B</Background>
		<Outline>#4D525B</Outline>
		<Active>
			<Foreground>#FFFF00</Foreground>
			<Background>#9DBBDB:#000000</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#000000</Outline>
		<Foreground>#000000</Foreground>
		<Background>#FFD700</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_9.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#FFFFFF</Foreground>
		<Background>#9A9AFF</Background>
		<Opacity>0.5</Opacity>
		<Outline>#9A9AFF</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#0000AA</Background>
			<Opacity>1.0</Opacity>
			<Outline>#0000AA</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#0000AA</Background>
		<Foreground>#FFFFFF</Foreground>
		<Outline>#0000AA</Outline>
		<Active>
			<Background>#FFFFFF</Background>
			<Foreground>#0000AA</Foreground>
			<Outline>#FFFFFF</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#000000</Foreground>
		<Background>#9A9AFF</Background>
		<Outline>#9A9AFF</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#000055</Background>
			<Outline>#000055</Outline>
		</Active>
	</TaskListStyle>

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#000000</Outline>
		<Foreground>#000055</Foreground>
		<Background>#AAAAAA</Background>
		<Text>#000000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#000055</Foreground>
			<Background>#FF0000</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bond</Font>
		<Foreground>#999999</Foreground>
		<Background>#222222</Background>
		<Outline>#00FF00</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#000000</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-0:bond</Font>
		<Outline>#FFFFFF</Outline>
		<Foreground>#000000</Foreground>
		<Background>#FFFFFF</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_10.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#6B997B</Foreground>
		<Background>#57635B</Background>
		<Opacity>0.0</Opacity>
		<Outline>#606B64</Outline>
		<Active>
			<Foreground>#000000</Foreground>
			<Background>#73BF8C</Background>
			<Opacity>0.0</Opacity>
			<Outline>#80FFAA</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#394C40</Background>
		<Foreground>#C7C7C7</Foreground>
		<Outline>#000000</Outline>
		<Active>
			<Background>#73BF8C</Background>
			<Foreground>#000000</Foreground>
			<Outline>#73BF8C</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> -->

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#606B64</Outline>
		<Foreground>#C7C7C7</Foreground>
		<Background>#808F85</Background>
		<Text>#000000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#80FFAA</Foreground>
			<Background>#BDCFC3</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#C7C7C7</Foreground>
		<Background>#394C40</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#000000</Foreground>
			<Background>#73BF8C</Background>
		</Active>
		<Opacity>0.80</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#434C46</Outline>
		<Foreground>#C7C7C7</Foreground>
		<Background>#394C40</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_11.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#C7C7C7</Foreground>
		<Background>#47333C:#8E86BF</Background>
		<Opacity>0.0</Opacity>
		<Outline>#47333C</Outline>
		<Active>
			<Foreground>#C7C7C7</Foreground>
			<Background>#73503F:#E69356</Background>
			<Opacity>0.0</Opacity>
			<Outline>#E69356</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#47333C</Background>
		<Foreground>#C7C7C7</Foreground>
		<Outline>#47333C</Outline>
		<Active>
			<Background>#73503F:#E69356</Background>
			<Foreground>#C7C7C7</Foreground>
			<Outline>#73503F</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> -->

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#8E86BF</Outline>
		<Foreground>#C7C7C7</Foreground>
		<Background>#47333C</Background>
		<Text>#000000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#47333C</Foreground>
			<Background>#BE7C4E</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#C7C7C7</Foreground>
		<Background>#47333C</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#C7C7C7</Foreground>
			<Background>#73503F:#E69356</Background>
		</Active>
		<Opacity>0.75</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#47333C</Outline>
		<Foreground>#C7C7C7</Foreground>
		<Background>#6A5C7D</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_12.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#AAAAAA</Foreground>
		<Background>#FFFA71:#FFDA51</Background>
		<Opacity>0.0</Opacity>
		<Outline>#B3B3B3</Outline>
		<Active>
			<Foreground>#000000</Foreground>
			<Background>#FFFA71:#FFDA51</Background>
			<Opacity>0.0</Opacity>
			<Outline>#000000</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#FFDA51:#FFA100</Background>
		<Foreground>#000000</Foreground>
		<Outline>#FFDA51:#FFA100</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#FFA100</Foreground>
			<Outline>#FFA100</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> -->

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#000000</Outline>
		<Foreground>#FFC100</Foreground>
		<Background>#FF8100</Background>
		<Text>#000000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#FF8100</Foreground>
			<Background>#FFE85E</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#000000</Foreground>
		<Background>#FFDA51</Background>
		<Outline>#FFDA51</Outline>
		<Active>
			<Foreground>#000000</Foreground>
			<Background>#FFDA51:#FFA100</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#000000</Outline>
		<Foreground>#000000</Foreground>
		<Background>#FFFF00</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_13.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto en las ventanas) -->
		<Background>#2D2D30</Background> <!-- Gris oscuro (Ventanas inactivas) -->
		<Opacity>0.0</Opacity>
		<Outline>#000000</Outline> <!-- Negro (borde de ventana) -->
		<Active>
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto en ventana activa) -->
			<Background>#0078D4</Background> <!-- Azul Windows 8 (Ventana activa) -->
			<Opacity>0.0</Opacity>
			<Outline>#000000</Outline> <!-- Negro (borde de ventana activa) -->
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#2D2D30</Background> <!-- Gris oscuro (fondo reloj) -->
		<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto del reloj) -->
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#2D2D30</Background> <!-- Gris oscuro (fondo bandeja) -->
		<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto en la bandeja) -->
		<Outline>#000000</Outline> <!-- Negro (borde bandeja) -->
		<Active>
			<Background>#0078D4</Background> <!-- Azul Windows 8 (bandeja activa) -->
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto en bandeja activa) -->
			<Outline>#000000</Outline> <!-- Negro (borde bandeja activa) -->
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TrayListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#D1D1D1</Foreground> <!-- Gris claro (texto tray list) -->
		<Background>#3C3C3C</Background> <!-- Gris oscuro (fondo tray list) -->
		<Outline>#000000</Outline> <!-- Negro (borde tray list) -->
		<Active>
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto activo en tray list) -->
			<Background>#0078D4</Background> <!-- Azul Windows 8 (fondo tray list activo) -->
			<Outline>#000000</Outline> <!-- Negro (borde tray list activo) -->
		</Active>
	</TrayListStyle>

	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto tray button) -->
		<Background>#3C3C3C</Background> <!-- Gris oscuro (fondo tray button) -->
		<Outline>#000000</Outline> <!-- Negro (borde tray button) -->
		<Active>
			<Background>#0078D4</Background> <!-- Azul Windows 8 (fondo tray button activo) -->
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto tray button activo) -->
			<Outline>#000000</Outline> <!-- Negro (borde tray button activo) -->
		</Active>
	</TrayButtomStyle>

	<PagerStyle>
		<Outline>#000000</Outline> <!-- Negro (borde pager) -->
		<Foreground>#D1D1D1</Foreground> <!-- Gris claro (texto del pager) -->
		<Background>#3C3C3C</Background> <!-- Gris oscuro (fondo del pager) -->
		<Text>#0078D4</Text> <!-- Azul Windows 8 (texto del pager) -->
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto del pager activo) -->
			<Background>#0078D4</Background> <!-- Azul Windows 8 (fondo del pager activo) -->
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#D1D1D1</Foreground> <!-- Gris claro (texto en menús) -->
		<Background>#2D2D30</Background> <!-- Gris oscuro (fondo menú) -->
		<Outline>#000000</Outline> <!-- Negro (borde menú) -->
		<Active>
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto activo en menú) -->
			<Background>#0078D4</Background> <!-- Azul Windows 8 (fondo menú activo) -->
		</Active>
    		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#000000</Outline> <!-- Negro (borde popup) -->
		<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto del popup) -->
		<Background>#2D2D30</Background> <!-- Gris oscuro (fondo popup) -->
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_14.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#5C616C</Foreground>
		<Background>#EBEBEB</Background>
		<Opacity>0.0</Opacity>
		<Outline>#DCDCDC</Outline>
		<Active>
			<Foreground>#5C616C</Foreground>
			<Background>#F0F0F0</Background>
			<Opacity>0.0</Opacity>
			<Outline>#DCDCDC</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#EBEBEB</Background>
		<Foreground>#5C616C</Foreground>
		<Outline>#DCDCDC</Outline>
		<Active>
			<Background>#D1D1D1</Background>
			<Foreground>#5C616C</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> -->

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#444444</Outline>
		<Foreground>#ECECEC</Foreground>
		<Background>#444444</Background>
		<Text>#ACABAB</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#EBEBEB</Foreground>
			<Background>#D1D1D1</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#444444</Foreground>
		<Background>#FFFFFF</Background>
		<Outline>#DCDCDC</Outline>
		<Active>
			<Foreground>#EFEFEF</Foreground>
			<Background>#444444</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#DCDCDC</Outline>
		<Foreground>#444444</Foreground>
		<Background>#FFFFFF</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_15.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#000000</Foreground> <!-- Negro (texto en las ventanas) -->
		<Background>#D0D0D0</Background> <!-- Gris claro (Ventanas inactivas) -->
		<Opacity>0.0</Opacity>
		<Outline>#808080</Outline> <!-- Gris medio (borde de ventana) -->
		<Active>
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto en ventana activa) -->
			<Background>#A0A0A0</Background> <!-- Gris más oscuro (Ventana activa) -->
			<Opacity>0.0</Opacity>
			<Outline>#00008B</Outline> <!-- Azul oscuro (borde de ventana activa) -->
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#D0D0D0</Background> <!-- Gris claro (fondo reloj) -->
		<Foreground>#000000</Foreground> <!-- Negro (texto del reloj) -->
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#D0D0D0</Background> <!-- Gris claro (fondo bandeja) -->
		<Foreground>#000000</Foreground> <!-- Negro (texto en la bandeja) -->
		<Outline>#808080</Outline> <!-- Gris medio (borde bandeja) -->
		<Active>
			<Background>#A0A0A0</Background> <!-- Gris más oscuro (bandeja activa) -->
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto en bandeja activa) -->
			<Outline>#00008B</Outline> <!-- Azul oscuro (borde bandeja activa) -->
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TrayListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#000000</Foreground> <!-- Negro (texto tray list) -->
		<Background>#D0D0D0</Background> <!-- Gris claro -->
		<Outline>#808080</Outline> <!-- Gris medio -->
		<Active>
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto activo en tray list) -->
			<Background>#A0A0A0</Background> <!-- Gris más oscuro (fondo tray list activo) -->
			<Outline>#00008B</Outline> <!-- Azul oscuro (borde tray list activo) -->
		</Active>
	</TrayListStyle>

	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#000000</Foreground> <!-- Negro (texto tray button) -->
		<Background>#D0D0D0</Background> <!-- Gris claro -->
		<Outline>#808080</Outline> <!-- Gris medio -->
		<Active>
			<Background>#A0A0A0</Background> <!-- Gris más oscuro (fondo tray button) -->
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto en tray button activo) -->
			<Outline>#00008B</Outline> <!-- Azul oscuro -->
		</Active>
	</TrayButtomStyle>

	<PagerStyle>
		<Outline>#808080</Outline> <!-- Gris medio -->
		<Foreground>#000000</Foreground> <!-- Negro (texto del pager) -->
		<Background>#D0D0D0</Background> <!-- Gris claro -->
		<Text>#00008B</Text> <!-- Azul oscuro (texto del pager) -->
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto del pager activo) -->
			<Background>#A0A0A0</Background> <!-- Gris más oscuro (fondo del pager activo) -->
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#000000</Foreground> <!-- Negro (texto en menús) -->
		<Background>#D0D0D0</Background> <!-- Gris claro (fondo menú) -->
		<Outline>#808080</Outline> <!-- Gris medio (borde menú) -->
		<Active>
			<Foreground>#FFFFFF</Foreground> <!-- Blanco (texto activo en menú) -->
			<Background>#A0A0A0</Background> <!-- Gris más oscuro (fondo menú activo) -->
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#808080</Outline> <!-- Gris medio -->
		<Foreground>#000000</Foreground> <!-- Negro (texto del popup) -->
		<Background>#D0D0D0</Background> <!-- Gris claro -->
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_16.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#B8ED48</Foreground>
		<Background>#010101:#74A604</Background>
		<Opacity>0.0</Opacity>
		<Outline>#010101:#74A604</Outline>
		<Active>
			<Foreground>#FAFDFA</Foreground>
			<Background>#74A604:#010101</Background>
			<Opacity>0.0</Opacity>
			<Outline>#3C5505</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#6C746F</Background>
		<Foreground>#1B240A</Foreground>
		<Outline>#6C746F</Outline>
		<Active>
			<Background>#74A604:#010101</Background>
			<Foreground>#FAFDFA</Foreground>
			<Outline>#74A604:#010101</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> -->

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#B8ED48</Outline>
		<Foreground>#B8ED48</Foreground>
		<Background>#010101</Background>
		<Text>#000000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#4B6C02</Foreground>
			<Background>#81B01F</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#1B240A</Foreground>
		<Background>#6C746F</Background>
		<Outline>#6C746F</Outline>
		<Active>
			<Foreground>#FAFDFA</Foreground>
			<Background>#74A604:#010101</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#B8ED48</Outline>
		<Foreground>#B8ED48</Foreground>
		<Background>#010101</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_17.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#DDDDDD</Foreground>
		<Background>#004400:#110000</Background>
		<Opacity>0.0</Opacity>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#FFFF00</Foreground>
			<Background>#FF0000:#0000FF</Background>
			<Opacity>0.0</Opacity>
			<Outline>#000000</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#FF0000:#0000FF</Background>
		<Foreground>#FFFF00</Foreground>
		<Outline>#000000</Outline>
		<Active>
			<Background>#FF0000</Background>
			<Foreground>#0000FF</Foreground>
			<Outline>#000000</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#DDDDDD</Foreground>
		<Background>#004400:#110000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#FFFF00</Foreground>
			<Background>#FF0000:#0000FF</Background>
			<Outline>#000000</Outline>
		</Active>
	</TaskListStyle>

	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle>

	<PagerStyle>
		<Outline>#000000</Outline>
		<Foreground>#00FF00</Foreground>
		<Background>#00FF00</Background>
		<Text>#00FF00</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#00FF00</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#999900</Foreground>
		<Background>#000022</Background>
		<Outline>#330033</Outline>
		<Active>
			<Foreground>#DDDDDD</Foreground>
			<Background>#004400:#110000</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#FF0000</Outline>
		<Foreground>#000000</Foreground>
		<Background>#DDDDDD</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_18.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#201D15</Foreground>
		<Background>#BFBFB8:#FFFFF8</Background>
		<Opacity>0.0</Opacity>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#201D15</Foreground>
			<Background>#94A974:#D4E9B4</Background>
			<Opacity>0.0</Opacity>
			<Outline>#94A974:#D4E9B4</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#ECE9D8</Background>
		<Foreground>#201D15</Foreground>
		<Outline>#ECE9D8</Outline>
		<Active>
			<Background>#94A974:#D4E9B4</Background>
			<Foreground>#201D15</Foreground>
			<Outline>#94A974:#D4E9B4</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> -->

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#000000</Outline>
		<Foreground>#ECE9D8</Foreground>
		<Background>#CDC7B0</Background>
		<Text>#000000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#201D15</Foreground>
			<Background>#B4C994</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#201D15</Foreground>
		<Background>#ECE9D8</Background>
		<Outline>#ECE9D8</Outline>
		<Active>
			<Foreground>#201D15</Foreground>
			<Background>#D4E9B4:#94A974</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#00FF00</Outline>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_19.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#FFFFFF</Foreground>
		<Background>#00008B:#212121</Background>
		<Opacity>0.0</Opacity>
		<Outline>#0000FF</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground> 
			<Background>#333333:#000000</Background>
			<Opacity>0.0</Opacity>
			<Outline>#0000BB</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#212121</Background>
		<Foreground>#FFFFFF</Foreground>
		<Outline>#212121</Outline>
		<Active>
			<Background>#FFFFFF</Background>
			<Foreground>#212121</Foreground>
			<Outline>#FFFFFF</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#FFFFFF</Foreground>
		<Background>#00008B:#212121</Background>
		<Outline>#00008B:#212121</Outline>
		<Active>
			<Foreground>#A8A8A8</Foreground>
			<Background>#333333:#000000</Background>
			<Outline>#333333:#000000</Outline>
		</Active>
	</TaskListStyle>

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#A8A8A8</Outline>
		<Foreground>#707070</Foreground>
		<Background>#383838</Background>
		<Text>#000000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#0000BB</Foreground>
			<Background>#707070</Background>
		</Active>
	</PagerStyle>

 	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#C4C4C4</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#00008B:#212121</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle> 

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#383838</Outline>
		<Foreground>#FFFFFF</Foreground>
		<Background>#0000FF</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_20.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#AEAEAE</Foreground>
		<Background>#1E1E1E</Background>
		<Opacity>0.0</Opacity>
		<Outline>#2E2E2E</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#272727</Background>
			<Opacity>0.0</Opacity>
			<Outline>#2E2E2E</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#1E1E1E</Background>
		<Foreground>#E2E2E2</Foreground>
		<Outline>#424242</Outline>
		<Active>
			<Background>#D1D1D1</Background>
			<Foreground>#424242</Foreground>
			<Outline>#D1D1D1</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> -->

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#444444</Outline>
		<Foreground>#ECECEC</Foreground>
		<Background>#303030</Background>
		<Text>#ACABAB</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#EBEBEB</Foreground>
			<Background>#D1D1D1</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#AEAEAE</Foreground>
		<Background>#1E1E1E</Background>
		<Outline>#E2E2E2</Outline>
		<Active>
			<Foreground>#272727</Foreground>
			<Background>#E2E2E2</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#AEAEAE</Outline>
		<Foreground>#303030</Foreground>
		<Background>#2E2E2E</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_21.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#E6E6E6</Foreground>
		<Background>#010101:#746C73</Background>
		<Opacity>0.0</Opacity>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#FDFDFA</Foreground>
			<Background>#9372A4:#010101</Background>
			<Opacity>0.0</Opacity>
			<Outline>#550538</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#230A24</Background>
		<Foreground>#746C73</Foreground>
		<Outline>#230A24</Outline>
		<Active>
			<Background>#746C73</Background>
			<Foreground>#230A24</Foreground>
			<Outline>#746C73</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#230A24</Foreground>
		<Background>#AB9DA7:#746C73</Background>
		<Outline>#AB9DA7:#746C73</Outline>
		<Active>
			<Foreground>#010101</Foreground>
			<Background>#9372A4:#010101</Background>
			<Outline>#9372A4:#010101</Outline>
		</Active>
	</TaskListStyle>

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#E6E6E6</Outline>
		<Foreground>#E6E6E6</Foreground>
		<Background>#010101</Background>
		<Text>#000000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#9372A4</Foreground>
			<Background>#010101</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#230A24</Foreground>
		<Background>#746C73</Background>
		<Outline>#746C73</Outline>
		<Active>
			<Foreground>#FDFAFD</Foreground>
			<Background>#9372A4:#010101</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#E6E6E6</Outline>
		<Foreground>#E6E6E6</Foreground>
		<Background>#010101</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_22.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#C7C7C7</Foreground>
		<Background>#DCD3D3:#1D1B1B</Background>
		<Opacity>0.0</Opacity>
		<Outline>#FEF7F7</Outline>
		<Active>
			<Foreground>#131111</Foreground>
			<Background>#161212:#DBCFCF</Background>
			<Opacity>0.0</Opacity>
			<Outline>#FEF7F7</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#181414</Background>
		<Foreground>#C7C7C7</Foreground>
		<Outline>#181414</Outline>
		<Active>
			<Background>#C7C7C7</Background>
			<Foreground>#181414</Foreground>
			<Outline>#C7C7C7</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#000000</Foreground>
		<Background>#DCD3D3:1D1B1B</Background>
		<Outline>#DCD3D3:1D1B1B</Outline>
		<Active>
			<Foreground>#131111</Foreground>
			<Background>#161212:#DBCFCF</Background>
			<Outline>#161212:#DBCFCF</Outline>
		</Active>
	</TaskListStyle>

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#DCD3D3</Outline>
		<Foreground>#1D1B1B</Foreground>
		<Background>#DCD3D3</Background>
		<Text>#000000</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#161212</Foreground>
			<Background>#DBCFCF</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#C7C7C7</Foreground>
		<Background>#181414</Background>
		<Outline>#181414</Outline>
		<Active>
			<Foreground>#131111</Foreground>
			<Background>#161212:#DBCFCF</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#FEF7F7</Outline>
		<Foreground>#DEDEDE</Foreground>
		<Background>#1E1E1E</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_23.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#00FF00</Foreground> <!-- Neon Green -->
		<Background>#111111</Background> <!-- Dark background -->
		<Opacity>0.0</Opacity>
		<Outline>#FF00FF</Outline> <!-- Neon Pink -->
		<Active>
			<Foreground>#00FF00</Foreground> <!-- Neon Green -->
			<Background>#000000</Background> <!-- Dark background -->
			<Opacity>0.0</Opacity>
			<Outline>#FF00FF</Outline> <!-- Neon Pink -->
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#111111</Background> <!-- Dark background -->
		<Foreground>#00FFFF</Foreground> <!-- Neon Cyan -->
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#111111</Background> <!-- Dark background -->
		<Foreground>#00FFFF</Foreground> <!-- Neon Cyan -->
		<Outline>#FF00FF</Outline> <!-- Neon Pink -->
		<Active>
			<Background>#333333</Background> <!-- Dark gray for active -->
			<Foreground>#00FF00</Foreground> <!-- Neon Green -->
			<Outline>#00FF00</Outline> <!-- Neon Green -->
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground> <!-- Neon Green -->
		<Background>#111111</Background> <!-- Dark background -->
		<Outline>#FF00FF</Outline> <!-- Neon Pink -->
		<Active>
			<Foreground>#00FF00</Foreground> <!-- Neon Green -->
			<Background>#111111</Background> <!-- Dark background -->
			<Outline>#00FFFF</Outline> <!-- Neon Cyan -->
		</Active>
	</TaskListStyle>

	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground> <!-- Neon Green -->
		<Background>#111111</Background> <!-- Dark background -->
		<Outline>#FF00FF</Outline> <!-- Neon Pink -->
		<Active>
			<Background>#222222</Background> <!-- Dark gray for active -->
			<Foreground>#00FF00</Foreground> <!-- Neon Green -->
			<Outline>#00FFFF</Outline> <!-- Neon Cyan -->
		</Active>
	</TrayButtomStyle>

	<PagerStyle>
		<Outline>#FF00FF</Outline> <!-- Neon Pink -->
		<Foreground>#00FF00</Foreground> <!-- Neon Green -->
		<Background>#111111</Background> <!-- Dark background -->
		<Text>#00FFFF</Text> <!-- Neon Cyan -->
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#00FF00</Foreground> <!-- Neon Green -->
			<Background>#333333</Background> <!-- Dark gray for active -->
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground> <!-- Neon Green -->
		<Background>#111111</Background> <!-- Dark background -->
		<Outline>#FF00FF</Outline> <!-- Neon Pink -->
		<Active>
			<Foreground>#000000</Foreground> <!-- Black text for active -->
			<Background>#00FFFF</Background> <!-- Neon Cyan -->
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#FF00FF</Outline> <!-- Neon Pink -->
		<Foreground>#00FFFF</Foreground> <!-- Neon Cyan -->
		<Background>#111111</Background> <!-- Dark background -->
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_24.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#00FF00</Foreground> <!-- Verde Neón -->
		<Background>#32CD32</Background> <!-- Verde Lima -->
		<Opacity>0.0</Opacity>
		<Outline>#228B22</Outline> <!-- Verde Bosque -->
		<Active>
			<Foreground>#00FF00</Foreground> <!-- Verde Neón -->
			<Background>#228B22</Background> <!-- Verde Bosque -->
			<Opacity>0.0</Opacity>
			<Outline>#32CD32</Outline> <!-- Verde Lima -->
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#32CD32</Background> <!-- Verde Lima -->
		<Foreground>#00FF00</Foreground> <!-- Verde Neón -->
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#32CD32</Background> <!-- Verde Lima -->
		<Foreground>#00FF00</Foreground> <!-- Verde Neón -->
		<Outline>#228B22</Outline> <!-- Verde Bosque -->
		<Active>
			<Background>#228B22</Background> <!-- Verde Bosque -->
			<Foreground>#00FF00</Foreground> <!-- Verde Neón -->
			<Outline>#00FF00</Outline> <!-- Verde Neón -->
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground> <!-- Verde Neón -->
		<Background>#32CD32</Background> <!-- Verde Lima -->
		<Outline>#228B22</Outline> <!-- Verde Bosque -->
		<Active>
			<Foreground>#00FF00</Foreground> <!-- Verde Neón -->
			<Background>#228B22</Background> <!-- Verde Bosque -->
			<Outline>#32CD32</Outline> <!-- Verde Lima -->
		</Active>
	</TaskListStyle>

	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground> <!-- Verde Neón -->
		<Background>#32CD32</Background> <!-- Verde Lima -->
		<Outline>#228B22</Outline> <!-- Verde Bosque -->
		<Active>
			<Background>#228B22</Background> <!-- Verde Bosque -->
			<Foreground>#00FF00</Foreground> <!-- Verde Neón -->
			<Outline>#32CD32</Outline> <!-- Verde Lima -->
		</Active>
	</TrayButtomStyle>

	<PagerStyle>
		<Outline>#228B22</Outline> <!-- Verde Bosque -->
		<Foreground>#00FF00</Foreground> <!-- Verde Neón -->
		<Background>#32CD32</Background> <!-- Verde Lima -->
		<Text>#00FF00</Text> <!-- Verde Neón -->
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#00FF00</Foreground> <!-- Verde Neón -->
			<Background>#228B22</Background> <!-- Verde Bosque -->
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground> <!-- Verde Neón -->
		<Background>#32CD32</Background> <!-- Verde Lima -->
		<Outline>#228B22</Outline> <!-- Verde Bosque -->
		<Active>
			<Foreground>#32CD32</Foreground> <!-- Verde Lima -->
			<Background>#228B22</Background> <!-- Verde Bosque -->
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#228B22</Outline> <!-- Verde Bosque -->
		<Foreground>#00FF00</Foreground> <!-- Verde Neón -->
		<Background>#32CD32</Background> <!-- Verde Lima -->
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_25.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#00FFFF</Foreground> <!-- Azul Neón -->
		<Background>#000080</Background> <!-- Azul Oscuro -->
		<Opacity>0.0</Opacity>
		<Outline>#00008B</Outline> <!-- Azul Oscuro -->
		<Active>
			<Foreground>#00FFFF</Foreground> <!-- Azul Neón -->
			<Background>#00008B</Background> <!-- Azul Oscuro -->
			<Opacity>0.0</Opacity>
			<Outline>#1E90FF</Outline> <!-- Azul Dodger -->
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000080</Background> <!-- Azul Oscuro -->
		<Foreground>#00FFFF</Foreground> <!-- Azul Neón -->
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#000080</Background> <!-- Azul Oscuro -->
		<Foreground>#00FFFF</Foreground> <!-- Azul Neón -->
		<Outline>#1E90FF</Outline> <!-- Azul Dodger -->
		<Active>
			<Background>#1E90FF</Background> <!-- Azul Dodger -->
			<Foreground>#00FFFF</Foreground> <!-- Azul Neón -->
			<Outline>#00FFFF</Outline> <!-- Azul Neón -->
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FFFF</Foreground> <!-- Azul Neón -->
		<Background>#000080</Background> <!-- Azul Oscuro -->
		<Outline>#1E90FF</Outline> <!-- Azul Dodger -->
		<Active>
			<Foreground>#00FFFF</Foreground> <!-- Azul Neón -->
			<Background>#1E90FF</Background> <!-- Azul Dodger -->
			<Outline>#000080</Outline> <!-- Azul Oscuro -->
		</Active>
	</TaskListStyle>

	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FFFF</Foreground> <!-- Azul Neón -->
		<Background>#000080</Background> <!-- Azul Oscuro -->
		<Outline>#1E90FF</Outline> <!-- Azul Dodger -->
		<Active>
			<Background>#1E90FF</Background> <!-- Azul Dodger -->
			<Foreground>#00FFFF</Foreground> <!-- Azul Neón -->
			<Outline>#000080</Outline> <!-- Azul Oscuro -->
		</Active>
	</TrayButtomStyle>

	<PagerStyle>
		<Outline>#1E90FF</Outline> <!-- Azul Dodger -->
		<Foreground>#00FFFF</Foreground> <!-- Azul Neón -->
		<Background>#000080</Background> <!-- Azul Oscuro -->
		<Text>#00FFFF</Text> <!-- Azul Neón -->
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#00FFFF</Foreground> <!-- Azul Neón -->
			<Background>#1E90FF</Background> <!-- Azul Dodger -->
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FFFF</Foreground> <!-- Azul Neón -->
		<Background>#000080</Background> <!-- Azul Oscuro -->
		<Outline>#1E90FF</Outline> <!-- Azul Dodger -->
		<Active>
			<Foreground>#000080</Foreground> <!-- Azul Oscuro -->
			<Background>#1E90FF</Background> <!-- Azul Dodger -->
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#1E90FF</Outline> <!-- Azul Dodger -->
		<Foreground>#00FFFF</Foreground> <!-- Azul Neón -->
		<Background>#000080</Background> <!-- Azul Oscuro -->
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_26.txt
<?xml version="1.0"?>
<JWM> 
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#FFFFFF</Foreground>
		<Background>#2E3B47:#3C4F6E</Background>
		<Opacity>0.0</Opacity>
		<Outline>#2E3B47</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#415A6B:#4A647A</Background>
			<Opacity>0.0</Opacity>
			<Outline>#2E3B47</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#3D5A6D</Background>
		<Foreground>#FFDDC1</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#6A1B4D</Background>
		<Foreground>#D1D1D1</Foreground>
		<Outline>#000000</Outline>
		<Active>
			<Background>#D1D1D1</Background>
			<Foreground>#6A1B4D</Foreground>
			<Outline>#D1D1D1</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#D1D1D1</Foreground>
		<Background>#9C2D35:#7F1D28</Background>
		<Outline>#9C2D35:#7F1D28</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#7F1D28:#D25C4D</Background>
			<Outline>#7F1D28:#D25C4D</Outline>
		</Active>
	</TaskListStyle>

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#2D4B5F</Outline>
		<Foreground>#C9D6E5</Foreground>
		<Background>#8D2C2D</Background>
		<Text>#FFFFFF</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#E3F1F5</Foreground>
			<Background>#8F3030</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#3E3E3E</Foreground>
		<Background>#F5F1D1</Background>
		<Outline>#F5F1D1</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#A2B4C6:#4C677B</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#2D4B5F</Outline>
		<Foreground>#2D4B5F</Foreground>
		<Background>#F4A8A3</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_27.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#AEAEAE</Foreground>
		<Background>#303030</Background>
		<Opacity>1.0</Opacity>
		<Outline>#2E2E2E</Outline>
		<Active>
			<Foreground>#E2E2E2</Foreground>
			<Background>#424242</Background>
			<Opacity>0.0</Opacity>
			<Outline>#2E2E2E</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#424242</Background>
		<Foreground>#E2E2E2</Foreground>
		<Outline>#424242</Outline>
		<Active>
			<Background>#D1D1D1</Background>
			<Foreground>#424242</Foreground>
			<Outline>#D1D1D1</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> -->

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#444444</Outline>
		<Foreground>#ECECEC</Foreground>
		<Background>#303030</Background>
		<Text>#ACABAB</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#EBEBEB</Foreground>
			<Background>#D1D1D1</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#444444</Foreground>
		<Background>#FFFFFF</Background>
		<Outline>#2E2E2E</Outline>
		<Active>
			<Foreground>#2E2E2E</Foreground>
			<Background>#EFEFEF</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#DCDCDC</Outline>
		<Foreground>#444444</Foreground>
		<Background>#FFFFFF</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_28.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#FFFFFF</Foreground>
		<Background>#000000:#343434</Background>
		<Opacity>0.0</Opacity>
		<Outline>#5B5B5D</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#000000:#343434</Background>
			<Opacity>0.0</Opacity>
			<Outline>#5B5B5D</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#000000:#343434</Background>
		<Foreground>#FFFFFF</Foreground>
		<Outline>#5B5B5D</Outline>
		<Active>
			<Background>#343434:#000000</Background>
			<Foreground>#FFFFFF</Foreground>
			<Outline>#5B5B5D</Outline>
		</Active>
		<Opacity>0.80</Opacity>
	</TrayStyle>

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> -->

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#000000</Outline>
		<Foreground>#FFFFFF</Foreground>
		<Background>#000000</Background>
		<Text>#ACABAB</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#5B5B5D</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#323232</Foreground>
		<Background>#FCFCFC</Background>
		<Outline>#CDC7C2</Outline>
		<Active>
			<Foreground>#FCFCFC</Foreground>
			<Background>#3584E4</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#000000</Outline>
		<Foreground>#ACAFC6</Foreground>
		<Background>#343434</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_29.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#FFFF00</Foreground>
		<Background>#0000DD</Background>
		<Opacity>0.0</Opacity>
		<Outline>#DCDCDC</Outline>
		<Active>
			<Foreground>#0000DD</Foreground>
			<Background>#FFFF00</Background>
			<Opacity>0.0</Opacity>
			<Outline>#DCDCDC</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#0000FF</Background>
		<Foreground>#FFFF00</Foreground>
		<Outline>#DCDCDC</Outline>
		<Active>
			<Background>#FFFF00</Background>
			<Foreground>#0000FF</Foreground>
			<Outline>#DCDCDC</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> -->

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#444444</Outline>
		<Foreground>#ECECEC</Foreground>
		<Background>#444444</Background>
		<Text>#ACABAB</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#EBEBEB</Foreground>
			<Background>#D1D1D1</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#000000</Foreground>
		<Background>#9999FF</Background>
		<Outline>#0000FF</Outline>
		<Active>
			<Foreground>#0000FF</Foreground>
			<Background>#999900</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle>

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#DCDCDC</Outline>
		<Foreground>#444444</Foreground>
		<Background>#FFFFFF</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_30.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#999999</Foreground>
		<Background>#628080</Background>
		<Opacity>0.0</Opacity>
		<Outline>#777777</Outline>
		<Active>
			<Foreground>#D4D4D4</Foreground>
			<Background>#2B6D6E</Background>
			<Opacity>0.0</Opacity>
			<Outline>#777777</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#000000</Background>
		<Foreground>#00FF00</Foreground>
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#345455</Background>
		<Foreground>#628080</Foreground>
		<Outline>#777777</Outline>
		<Active>
			<Background>#2B6D6E</Background>
			<Foreground>#D4D4D4</Foreground>
			<Outline>#DCDCDC</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> -->

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#777777</Outline>
		<Foreground>#DCDAD5</Foreground>
		<Background>#888888</Background>
		<Text>#ACABAB</Text>
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#8899AA</Foreground>
			<Background>#3A4956</Background>
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#2D4242</Foreground>
		<Background>#CEE3E4</Background>
		<Outline>#FF9999</Outline>
		<Active>
			<Foreground>#D4D4D4</Foreground>
			<Background>#003C3E</Background>
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle> 

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#777777</Outline>
		<Foreground>#777777</Foreground>
		<Background>#C9FBFB</Background>
	</PopupStyle>
</JWM>
EOF

cat << EOF >> ${tm_d}/THEME_31.txt
<?xml version="1.0"?>
<JWM>
<!-- Visual Styles -->
<!-- Estilos visuales. -->
	<WindowStyle decorations="motif" delimiters="()" showclient="false">
		<Font>Sans-8:bold</Font>
		<Width>1</Width>
		<Height>16</Height>
		<Corner>0</Corner>
		<Foreground>#FFFFFF</Foreground>
		<Background>#9C2D91</Background> <!-- Magenta oscuro -->
		<Opacity>0.0</Opacity>
		<Outline>#660066</Outline> <!-- Morado más oscuro -->
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#D94F8B</Background> <!-- Magenta brillante -->
			<Opacity>0.0</Opacity>
			<Outline>#660066</Outline>
		</Active>
	</WindowStyle>

	<ClockStyle>
		<Font>Sans-8:bold</Font>
		<Background>#5C0C8E</Background> <!-- Púrpura oscuro -->
		<Foreground>#FF00FF</Foreground> <!-- Magenta brillante -->
	</ClockStyle>

	<TrayStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Background>#6A0DAD</Background> <!-- Violeta -->
		<Foreground>#D8A7FF</Foreground> <!-- Lavanda claro -->
		<Outline>#660066</Outline>
		<Active>
			<Background>#9B30B5</Background> <!-- Magenta medio -->
			<Foreground>#FFFFFF</Foreground>
			<Outline>#D8A7FF</Outline>
		</Active>
		<Opacity>0.0</Opacity>
	</TrayStyle>

<!--	<TaskListStyle decorations="motif" group="false" list="all" showkill="false">
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Foreground>#00FF00</Foreground>
			<Background>#000000</Background>
			<Outline>#00FF00</Outline>
		</Active>
	</TaskListStyle> -->

<!--	<TrayButtomStyle>
		<Font>Sans-8:bold</Font>
		<Foreground>#00FF00</Foreground>
		<Background>#000000</Background>
		<Outline>#000000</Outline>
		<Active>
			<Background>#000000</Background>
			<Foreground>#00FF00</Foreground>
			<Outline>#00FF00</Outline>
		</Active>
	</TrayButtomStyle> -->

	<PagerStyle>
		<Outline>#660066</Outline>
		<Foreground>#D8A7FF</Foreground>
		<Background>#8B4C8D</Background> <!-- Púrpura intermedio -->
		<Text>#FF00FF</Text> <!-- Magenta brillante -->
		<Font>Sans-8:bold</Font>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#B148C8</Background> <!-- Magenta oscuro -->
		</Active>
	</PagerStyle>

	<MenuStyle decorations="motif">
		<Font>Sans-8:bold</Font>
		<Foreground>#FFFFFF</Foreground>
		<Background>#C671B7</Background> <!-- Magenta suave -->
		<Outline>#660066</Outline>
		<Active>
			<Foreground>#FFFFFF</Foreground>
			<Background>#9B30B5</Background> <!-- Magenta medio -->
		</Active>
		<Opacity>0.0</Opacity>
	</MenuStyle> 

	<PopupStyle enable="false" delay="3000">
		<Font>Sans-8:bold</Font>
		<Outline>#660066</Outline>
		<Foreground>#FFFFFF</Foreground>
		<Background>#FF5EC0</Background> <!-- Magenta claro -->
	</PopupStyle>
</JWM>
EOF

}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function file_root_menu_light_jwm_funcion() {
cat << EOF > ${rm_lt_d}/00_Root_Menu_Lights.txt
<JWM>
	<RootMenu onroot="2" height="16" label="Luz de Escritorio" labeled="false" dynamic="">
		<Program icon="/usr/share/icons/Adwaita/48x48/status/night-light-disabled-symbolic.symbolic.png" label="Luz Blanca">${scp_lt_d}/LIGHT_WHITE.sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/night-light-symbolic.symbolic.png" label="Luz Calida">${scp_lt_d}/LIGHT_WARM.sh</Program>
	</RootMenu>
</JWM>
EOF
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function file_root_menu_brightness_jwm_funcion() {
cat << EOF > ${rm_br_d}/00_Root_Menu_Brightness.txt
<JWM>
	<RootMenu onroot="3" height="16" label="Brillo" labeled="false" dynamic="">
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 100%">${scp_br_d}/BRIGHTNESS_100_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 95%">${scp_br_d}/BRIGHTNESS_095_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 90%">${scp_br_d}/BRIGHTNESS_090_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 85%">${scp_br_d}/BRIGHTNESS_085_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 80%">${scp_br_d}/BRIGHTNESS_080_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 75%">${scp_br_d}/BRIGHTNESS_075_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 70%">${scp_br_d}/BRIGHTNESS_070_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 65%">${scp_br_d}/BRIGHTNESS_065_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 60%">${scp_br_d}/BRIGHTNESS_060_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 55%">${scp_br_d}/BRIGHTNESS_055_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 50%">${scp_br_d}/BRIGHTNESS_050_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 45%">${scp_br_d}/BRIGHTNESS_045_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 40%">${scp_br_d}/BRIGHTNESS_040_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 35%">${scp_br_d}/BRIGHTNESS_035_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 30%">${scp_br_d}/BRIGHTNESS_030_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 25%">${scp_br_d}/BRIGHTNESS_025_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 20%">${scp_br_d}/BRIGHTNESS_020_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 15%">${scp_br_d}/BRIGHTNESS_015_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 10%">${scp_br_d}/BRIGHTNESS_010_[PERCENTAGE].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/status/display-brightness-symbolic.symbolic.png" label="Brillo 5%">${scp_br_d}/BRIGHTNESS_005_[PERCENTAGE].sh</Program>
	</RootMenu>
</JWM>
EOF
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function file_root_menu_main_jwm_funcion() {
cat << EOF > ${rm_mn_d}/Accesorios.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${moka_d}/categories/applications-accessories.png" label="Accesorios">
		<Program icon="${moka_d}/apps/accessories-calculator.png" label="${calc_jwm_label} [Calculadora]">${calc_jwm_path}</Program>
		<Program icon="${faba_d}/apps/multimedia-photo-manager.svg" label="ImageMagick [SCRIPT] [Captura de Pantalla]">${scp_tool_d}/SCREENSHOT_[IMAGEMAGICK].sh</Program>
		<Program icon="${moka_d}/apps/leafpad.png" label="${text_editor_jwm_label} [Editor de Texto]">${text_editor_jwm_path}</Program>
		<Program icon="${moka_d}/apps/accessories-text-editor.png" label="Nano [Editor de Texto]">${scp_tool_d}/NANO_[CLI].sh</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_d}/Graficos.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${moka_d}/categories/applications-graphics.png" label="Gráficos">
		<Program icon="${moka_d}/apps/multimedia-photo-viewer.png" label="${image_viewer_jwm_label} [Visualizador de Imágenes]">${image_viewer_jwm_path}</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/legacy/applications-graphics.png" label="${draw_jwm_label} [Dibujo]">${draw_jwm_path}</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_d}/Herramientas_del_Sistema.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${moka_d}/categories/applications-utilities.png" label="Herramientas del Sistema">
		<Program icon="${faba_d}/apps/system-file-manager.svg" label="${file_manager_jwm_label} [Administrador de Archivos]">${file_manager_jwm_path}</Program>
		<Program icon="${faba_d}/apps/utilities-system-monitor.svg" label="${task_jwm_label} [Administrador de Tareas]">${task_jwm_path}</Program>
		<Program icon="${moka_d}/apps/xterm.png" label="${term_jwm_label} [Terminal]">${term_jwm_path}</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_d}/Internet.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${faba_d}/categories/applications-internet.svg" label="Internet">
		<Include>${rm_red_d}/00_Root_Menu_NMTUI.txt</Include>
		<Program icon="${faba_d}/categories/applications-internet.svg" label="${browser_web_jwm_label} [Navegador Web]">${browser_web_jwm_path}</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_d}/Oficina.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${moka_d}/categories/applications-office.png" label="Oficina">
		<Program icon="${moka_d}/apps/libreoffice-writer.png" label="${office_writer_jwm_label} [Procesador de Texto]">${office_writer_jwm_path}</Program>
		<Program icon="${moka_d}/apps/libreoffice-calc.png" label="${office_calc_jwm_label} [Hoja de Cálculo]">${office_calc_jwm_path}</Program>
<!--		<Program icon="${moka_d}/apps/libreoffice-impress.png" label="${office_impress_jwm_label} [Presentaciones]">${office_impress_jwm_path}</Program> -->
		<Program icon="${moka_d}/apps/pdfshuffler.png" label="${pdf_reader_jwm_label} [Lector de PDF]">${pdf_reader_jwm_path}</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_d}/Juegos.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${faba_d}/devices/input-gaming.svg" label="Juegos">
		<Program icon="/usr/share/pixmaps/2048.png" label="2048 [2048]">${scp_game_d}/2048_[CLI].sh</Program>
		<Program icon="/usr/share/pixmaps/bastet.xpm" label="Bastet [Tetris]">${scp_game_d}/BASTET_[CLI].sh</Program>
		<Program icon="${moka_d}/apps/gnome-robots.png" label="nInvaders [Space Invaders]">${scp_game_d}/NINVADERS_[CLI].sh</Program>
		<Program icon="/usr/share/pixmaps/nsnake.xpm" label="nSnake [Snake]">${scp_game_d}/NSNAKE_[CLI].sh</Program>
		<Program icon="/usr/share/pixmaps/pacman4console.xpm" label="Pacman4Console [Pacman]">${scp_game_d}/PACMAN$CONSOLE_[CLI].sh</Program>
	</Menu>

</JWM>
EOF

cat << EOF > ${rm_mn_d}/Otras.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${moka_d}/mimetypes/application-x-executable.png" label="Otras">
		<Program icon="${faba_d}/apps/system-file-manager.svg" label="${file_manager_jwm_label} [Administrador de Archivos]">${file_manager_jwm_path}</Program>
		<Include>${rm_mn_ext_d}/directories_home_user.txt</Include>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder.png" label="Menu directorios del usuario (CLI)">${p_user_d}/DIRECTORIES_USER_MENU_[CLI].sh</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/places/folder.png" label="Menu directorios del usuario (GUI)">${p_user_d}/DIRECTORIES_USER_MENU_[GUI].sh</Program>
		<Program icon="${moka_d}/apps/xterm.png" label="Buscador de palabra en archivo de texto (CLI)">/usr/bin/x-terminal-emulator -t 'Buscador de palabra en archivo de texto' -e "${scp_ext_d}/SEARCH_WORD_IN_FILE_[CLI].sh"</Program>
		<Program icon="${moka_d}/apps/xterm.png" label="Extrae URLs de YouTube de archivo de texto (CLI)">/usr/bin/x-terminal-emulator -t 'Extrae URLs de YouTube de archivo de texto' -e "${scp_ext_d}/YOUTUBE_URL_EXTRACTOR_[CLI].sh"</Program>
		<Program icon="${moka_d}/apps/xterm.png" label="Extrae URLs de los archivos de favoritos de navegadores webs (CLI)">/usr/bin/x-terminal-emulator -t 'Extrae URLs de los archivos de favoritos de navegadores webs' -e "${scp_ext_d}/BOOKMARK_CONVERTER_URL_[CLI].sh"</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_d}/Preferencias.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${moka_d}/categories/applications-system.png" label="Preferencias">
		<Program icon="${faba_d}/apps/preferences-desktop-wallpaper.svg" label="Configuracion de Fondo de Pantalla (CLI)">/usr/bin/x-terminal-emulator -t 'Configuracion de Fondo de Pantalla' -e "${scp_cfg_d}/CFG_BG_[CLI].sh"</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-theme.png" label="Configuracion de Tema (CLI)">/usr/bin/x-terminal-emulator -t 'Configuracion de Tema' -e "${scp_cfg_d}/CFG_THEME_[CLI].sh"</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/legacy/preferences-desktop-theme.png" label="Configuracion de Tema (GUI)">${scp_cfg_d}/CFG_THEME_[XMSG].sh</Program>
		<Program icon="${moka_d}/status/dialog-info.png" label="Manual de JWM (CLI)">/usr/bin/x-terminal-emulator -t 'Manuales de JWM' -e "${scp_d}/MAN_JWM_[CLI].sh"</Program>
		<Program icon="${moka_d}/status/dialog-info.png" label="Manual de JWM (GUI)">${scp_d}/MAN_JWM_[XMSG].sh</Program>
		<Program icon="${moka_d}/apps/xterm.png" label="Terminal Personalizado (CLI)">/usr/bin/x-terminal-emulator -t 'Terminal Personalizado (CLI)' -e "${scp_tool_d}/COLOUR_TERM_[CLI].sh"</Program>
		<Program icon="${moka_d}/apps/xterm.png" label="Cambiar Resolucion (CLI)">/usr/bin/x-terminal-emulator -t 'Cambiar Resolucion (CLI)' -e "${scp_tool_d}/RESOLUTION_MONITOR_[CLI].sh"</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_d}/Programacion.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${moka_d}/categories/applications-ruby.png" label="Programacion">
<!--		<Program icon="" label=""></Program> -->
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_d}/Sonido_y_Vídeo.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${moka_d}/categories/applications-multimedia.png" label="Sonido y Vídeo">
		<Program icon="/usr/share/icons/Adwaita/48x48/legacy/audio-speakers.png" label="${volume_jwm_label} [Control de Volumen]">${volume_jwm_path}</Program>
<!--		<Program icon="${moka_d}/apps/multimedia-audio-player.png" label="${sound_player_jwm_label} [Reproductor de Sonido]">${sound_player_jwm_path}</Program> -->
		<Program icon="${moka_d}/apps/mpv.png" label="${video_player_jwm_label} [Reproductor de Video]">${video_player_jwm_path}</Program>
		<Program icon="/usr/share/icons/Adwaita/48x48/legacy/media-record.png" label="${recorder_jwm_label} [Grabadora de Pantalla]">${recorder_jwm_path}</Program>
	</Menu>
</JWM>
EOF
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function file_permission_jwm_funcion() {
chmod 755 --recursive "${jwm_d}"
#chmod 744 --recursive "${img_d}"
#chmod 755 "${rm_mn_d}/05_Virtual_Desktop.txt" "${rm_mn_d}/03_Visual_Styles.txt"
chown -R "${user_name}:${user_name}" "${jwm_d}"
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function set_app_for_default_funcion() {
update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator ${term_jwm_path} 9999 #registra como opcion
update-alternatives --set x-terminal-emulator ${term_jwm_path} #establece default

update-alternatives --install /usr/bin/x-www-browser x-www-browser ${browser_web_jwm_path} 9999 #registra como opcion
update-alternatives --set x-www-browser ${browser_web_jwm_path} #establece default

#update-alternatives --install /usr/bin/x-text-editor x-text-editor ${} 9999
#update-alternatives --set x-text-editor ${}

update-alternatives --install /usr/bin/x-file-manager x-file-manager ${file_manager_jwm_path} 9999 #registra como opcion
update-alternatives --set x-file-manager ${file_manager_jwm_path} #establece default

#update-alternatives --install /usr/bin/x-video-player x-video-player ${} 9999
#update-alternatives --set x-video-player ${}

#update-alternatives --install /usr/bin/x-text-editor x-text-editor ${} 9999
#update-alternatives --set x-text-editor ${}

#update-alternatives --install /usr/bin/x-sound-editor x-sound-editor ${} 9999
#update-alternatives --set x-sound-editor ${}

#update-alternatives --install /usr/bin/x-image-viewer x-image-viewer ${} 9999
#update-alternatives --set x-image-viewer ${}

#update-alternatives --install /usr/bin/x-recorder-screen x-recorder-screen ${} 9999
#update-alternatives --set x-recorder-screen ${}

#update-alternatives --install /usr/bin/x-image-editor x-image-editor ${} 9999
#update-alternatives --set x-image-editor ${}

#update-alternatives --install /usr/bin/x-video-editor x-video-editor ${} 9999
#update-alternatives --set x-video-editor ${}

#update-alternatives --install /usr/bin/x-sound-editor x-sound-editor ${} 9999
#update-alternatives --set x-sound-editor ${}

#update-alternatives --install /usr/bin/x-pdf-reader x-pdf-reader ${} 9999
#update-alternatives --set x-pdf-reader ${}

#update-alternatives --install /usr/bin/x-office-writer x-office-writer ${} 9999
#update-alternatives --set x-office-writer ${}

#update-alternatives --install /usr/bin/x-office-calc x-office-calc ${} 9999
#update-alternatives --set x-office-calc ${}

#update-alternatives --install /usr/bin/x-office-math x-office-math ${} 9999
#update-alternatives --set x-office-math ${}

#update-alternatives --install /usr/bin/x-office-draw x-office-draw ${} 9999
#update-alternatives --set x-office-draw ${}

#update-alternatives --install /usr/bin/x-office-base x-office-base ${} 9999
#update-alternatives --set x-office-base ${}

#update-alternatives --install /usr/bin/x-office-impress x-office-impress ${} 9999
#update-alternatives --set x-office-impress ${}

#update-alternatives --install /usr/bin/x-office-center x-office-center ${} 9999
#update-alternatives --set x-office-center ${}

#update-alternatives --install /usr/bin/x-calc x-calc ${} 9999
#update-alternatives --set x-calc ${}





cat << EOF > /usr/share/applications/X-TERMINAL-EMULATOR_[${distro_name}].desktop
[Desktop Entry]
Name=X-TERMINAL-EMULATOR_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-WWW-BROWSER_[${distro_name}].desktop
[Desktop Entry]
Name=X-WWW-BROWSER_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-TEXT-EDITOR_[${distro_name}].desktop
[Desktop Entry]
Name=X-TEXT-EDITOR_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=text/plain
EOF

cat << EOF > /usr/share/applications/X-FILE-MANAGER_[${distro_name}].desktop
[Desktop Entry]
Name=X-FILE-MANAGER_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-VIDEO-PLAYER_[${distro_name}].desktop
[Desktop Entry]
Name=X-VIDEO-PLAYER_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-SOUND-PLAYER_[${distro_name}].desktop
[Desktop Entry]
Name=X-SOUND-PLAYER_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-IMAGE-VIEWER_[${distro_name}].desktop
[Desktop Entry]
Name=X-IMAGE-VIEWER_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-RECORDER-SCREEN_[${distro_name}].desktop
[Desktop Entry]
Name=X-RECORDER-SCREEN_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-IMAGE-EDITOR_[${distro_name}].desktop
[Desktop Entry]
Name=X-IMAGE-EDITOR_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-VIDEO-EDITOR_[${distro_name}].desktop
[Desktop Entry]
Name=X-VIDEO-EDITOR_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-SOUND-PLAYER_[${distro_name}].desktop
[Desktop Entry]
Name=X-SOUND-PLAYER_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-PDF-READER_[${distro_name}].desktop
[Desktop Entry]
Name=X-PDF-READER_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-OFFICE-WRITER_[${distro_name}].desktop
[Desktop Entry]
Name=X-OFFICE-WRITER_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-OFFICE-CALC_[${distro_name}].desktop
[Desktop Entry]
Name=X-OFFICE-CALC_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-OFFICE-MATH_[${distro_name}].desktop
[Desktop Entry]
Name=X-OFFICE-MATH_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-OFFICE-DRAW_[${distro_name}].desktop
[Desktop Entry]
Name=X-OFFICE-DRAW_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-OFFICE-BASE_[${distro_name}].desktop
[Desktop Entry]
Name=X-OFFICE-BASE_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-OFFICE-IMPRESS_[${distro_name}].desktop
[Desktop Entry]
Name=X-OFFICE-IMPRESS_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-OFFICE-CENTER_[${distro_name}].desktop
[Desktop Entry]
Name=X-OFFICE-CENTER_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF

cat << EOF > /usr/share/applications/X-CALC_[${distro_name}].desktop
[Desktop Entry]
Name=X-CALC_[${distro_name}]
Exec=
Icon=${defaultapp_logo}
Type=Application
Terminal=false
Categories=Default
MimeType=
EOF
}
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××┃
# ┃××××××××××××××××××××××××××××××××-DISTRO_DEFAULT_JWM-××××××××××××××××××××××××××××××××┃
# ┃××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
function install_app_default_funcion() {
apt -y install xpdf abiword gnumeric; apt -y install l3afpad; apt -y install feh mpv pavucontrol
apt -y install pcmanfm && apt -y remove --purge --auto-remove gnome-icon-theme lxde-icon-theme #adwaita-icon-theme
apt -y install simplescreenrecorder mtpaint

calc_jwm_label="XCalc"; calc_jwm_path="/usr/bin/xcalc"
text_editor_jwm_label="L3afpad"; text_editor_jwm_path="/usr/bin/l3afpad"
file_manager_jwm_label="PCManFM"; file_manager_jwm_path="/usr/bin/pcmanfm"
draw_jwm_label="MTPaint"; draw_jwm_path="/usr/bin/mtpaint"
office_writer_jwm_label="Abiword"; office_writer_jwm_path="/usr/bin/abiword"
office_calc_jwm_label="Gnumeric"; office_calc_jwm_path="/usr/bin/gnumeric"
pdf_reader_jwm_label="XPDF"; pdf_reader_jwm_path="/usr/bin/xpdf"
volume_jwm_label="Pavucontrol"; volume_jwm_path="/usr/bin/pavucontrol"
recorder_jwm_label="simplescreenrecorder"; recorder_jwm_path="/usr/bin/simplescreenrecorder"
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function install_st_funcion() {
local st_d="${clone_d}/st"; local cfg_st="${st_d}/config.def.h"; local depends="libx11-dev libxft-dev libxext-dev"
git clone https://git.suckless.org/st "${st_d}"; apt -y install ${depends}
cd ${st_d}
#sed -i "s|doubleclicktimeout = 300|doubleclicktimeout = 300|g" "${cfg_st}"
sed -i "s|tripleclicktimeout = 600|tripleclicktimeout = 500|g" "${cfg_st}"
#sed -i "s|scroll = NULL|scroll = scroll|g" "${cfg_st}"
sed -i "s|blinktimeout = 800|blinktimeout = 800|g" "${cfg_st}"
sed -i "s|cursorthickness = 2|cursorthickness = 2|g" "${cfg_st}"
sed -i "s|bellvolume = 0|bellvolume = 0|g" "${cfg_st}"
sed -i "s|cols = 80|cols = 80|g" "${cfg_st}"
sed -i "s|rows = 24|rows = 24|g" "${cfg_st}"
sed -i "s|mousefg = 7|mousefg = 7|g" "${cfg_st}"
sed -i "s|mousebg = 0|mousebg = 0g" "${cfg_st}"
sed -i "s|XC_xterm|XC_arrow|g" "${cfg_st}"
sed -i "s|Liberation Mono:pixelsize=12|Monospace:pixelsize=12|g" "${cfg_st}"
sed -i "s|borderpx = 2|borderpx = 0|g" "${cfg_st}"
sed -i "s|cursorshape = 2|cursorshape = 4|g" "${cfg_st}"
sed -i "s|defaultfg = 258|defaultfg = 2|g" "${cfg_st}"
sed -i "s|defaultbg = 259|defaultbg = 0|g" "${cfg_st}"
sed -i "s|defaultcs = 256|defaultcs = 3|g" "${cfg_st}"
sed -i "s|defaultrcs = 257|defaultrcs = 0|g" "${cfg_st}"
sed -i "s|/bin/sh|/bin/bash|g" "${cfg_st}"
#make --directory ${st_d} install; apt -y remove --purge --auto-remove ${depends}
make install; apt -y remove --purge --auto-remove ${depends}; cd ${job_d}
term_jwm_label="Simple Terminal (ST)"; term_jwm_path="/usr/local/bin/st"
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function install_browser_web_default_funcion() {
if [ ! -z "${var_tmp}" ]; then
	if [ "${arch}" -eq "64" ]; then
		case ${var_tmp} in
			a|A) curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
			echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
			apt update; apt -y install brave-browser
			browser_web_jwm_label="Brave Browser"; browser_web_jwm_path="/usr/bin/brave-browser"
			;;

			b|B) apt -y install chromium
			browser_web_jwm_label="Chromium"; browser_web_jwm_path="/usr/bin/chromium"
			;;

#			*) curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
#			echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
#			apt update; apt -y install brave-browser
#			browser_web_jwm_label="Brave Browser"; browser_web_jwm_path="/usr/bin/brave-browser"
#			;; 
		esac
	elif [ "${arch}" -eq "32" ]; then
		apt -y install chromium
		browser_web_jwm_label="Chromium"; browser_web_jwm_path="/usr/bin/chromium"
	fi
fi
#file_icon_browser_web_default_jwm_funcion
#}

#function icon_browser_web_default_jwm_funcion() {
#if [ -e /usr/bin/brave-browser ] || [ -e /usr/bin/chromium ] ; then
	icon_txt="/tmp/icon_txt/"; icon_app_web_d="${icon_d}/Apps_Webs_Icons"; mkdir "${icon_txt}" "${icon_app_web_d}"
	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAfCAMAAACxiD++AAAALVBMVEVHcEzjYVnjYVnjYVnjYVnjYVnjYVnjYVnjYVnjYVnjYVnjYVnjYVnjYVnjYVkohOIjAAAADnRSTlMADmCwm4vyJsN2UOM71aDzUzwAAADmSURBVCiRjVNbAsMgCKuKb5v7H3dirdqVbuWLR0QkcdvYYnBw2ehNNo3TnFi3tWKL94lgpXoC8ukrCVDPP1w9GjzNdpj502DL2H8DAPMaUIiEZziE060LEwD73IIMoJkdAKUtWd3TBWPBHaBCZ8YckAz4FVCYNEOGIa3gce4yMWCGTLLq+dqOyDhOzIbc61iiD0MQ60jtAR1cx7Y2JvVFjcJdIe5CjbsTdaUm3EUI0BIJWngBCEu0EDVvxQV+E0sE0gj0GsxDefEFvcY5xS4LnmmMxRf+cCTUW49uUaxXCtpnD7Fx/QFSdwtkGKgDlgAAAABJRU5ErkJggg==" > ${icon_txt}/astiango.txt
	cat ${icon_txt}/astiango.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_search_astiango.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAzFBMVEVHcEz////////+/v77+/vx8fL9/f309fX+/v739/f////09PXOz8/5+vr8/P3////////29vf///////84qlf8wAdGiPX8/PzsUUTqQjQsqFLrSj3S3/w6g/TqPCs0gPQgpUf85+bv9P+63sL62Nb+8ef4ycbw+PJkunkeePP81HXwgGv0jhzc5/3o9efX7N5Fr19Uj/WQy562zPr2trL94KDzoJrzoJv80Gjyl5H94qgyh9v7xzihsSp+wYV1sE5ZtXBmmvUynoWKrvzKDGT6AAAAE3RSTlMAW+TTeBLcHLMt1WsKzfUznkBIxSDAuAAAAUZJREFUKJFtktligkAMRUFZxKVuDMOAggpu1apVu+/t//9TkxBU1PsySQ4hlyGadpTd0fWOrV2R3eqyWhe80j1RpYCc7pmcI2tyaZimQw6bOTMplU9hpKIofJSUmgwtTCYq9EFhqKIJ5lbGdGIRAGhUQLNX6wRLOA2Y8vdpuvfVOJtaOjhdhL56yYrjU8cGFsRSLc4/x+DPfxBiSZN6LMlXUYXzVghBT8/7pPkdxFX28yzEO8HYI8U9dlQudMZx3AeInWWe+SrExxrhCLTre3E+M3P7FXznLn887z53a2PwGbjBLLvUP2jcYUC/FYdOA9d1g22SbN1fbizT9bUxXA+QguB4G2GlfbIFqw1i0GCzKmzDDQ1LZgPQLKHk5rAJpmSj0ykH0jxArW4V79yqF1bMkEckjYvFrTWIy0btApFsx7m68Ff1D4OdMHbngtKsAAAAAElFTkSuQmCC" > ${icon_txt}/google.txt
	cat ${icon_txt}/google.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_search_google.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAANlBMVEVHcEwhIychIychIycXGh53eHoAAAPv7++/v8D///+KiowMEBasra1QUVTZ2dmjo6RgYWI6Oz6V/uVGAAAAA3RSTlMAi+pi3o44AAAAt0lEQVR4AXzOwRKEIAwDUF1KIFRA//9nt86wB9hqLhzepGTbtv0TnHz2zTLIYeuFx+xuUX5Vz+JQBwUJ8oQxM5cVBRY1PJjjgqg5pdaDOmeRyXJ2MuJvEA7yLhXyFLO5SWbYA7IhzKjWKHpjI2VFuxplfF3lFV/O6nI2yMuggE5e0PupMuPQHjN5IqxoevXGHIFyrWgRRWLzBg02YoKHFtRSlkFTWYdZvkMkMEzAhDdp4k3UeLMDAIZGDSc9vAqBAAAAAElFTkSuQmCC" > ${icon_txt}/qwant.txt
	cat ${icon_txt}/qwant.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_search_qwant.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAwFBMVEX////GxsWnpqapqai5ubn4+Ph+fX0UExIZGBcaGRgbGhlkY2PV1dUhIB8lJCMeHRwREA8cHBg0OCkjIiG2trVBQD/e3t29u79mbFk0QB0eGyBramqurq5eXl9VVVWXlpiUlo4AAAAKEQCNp19JWip1nS6cqYbS0Nbn5+dLS0sHCAVEVyKApT5RXTvl4uk8PDpRaCd0lDs+TSJriDd7iGP09++LrVFHYBtgezA9URl6njrr8eGIholviUBxf1n2/+eiJ0i4AAAAy0lEQVR4ASxPA5YEQQxNMymlamzbtu5/q91GnvMNAJ4f5OeHEQDESCQkkRREqAC0NMzWSesKxRK7Mni2xFgpV6u1eqPJ5P8/GFvQ7nR70Mf0YUQl6g7cYDgCRSJ5uNAfMA3Gk+mskErMfLHE5Wq13mx3LkhM55XBYH9IHpXkYVDHw+PpNJ6ct4x+8mhdrrf74fF8vVEmHknW+XP4/uZdKdJHieL55TLvVSEe+KClZUZeLNj5AKoN8CYprXCOJLYhSubqcphdOfwbkAcAA0sSY5DiziUAAAAASUVORK5CYII=" > ${icon_txt}/gibiru.txt
	cat ${icon_txt}/gibiru.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_search_gibiru.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAArlBMVEX////32tTqopXmhGvjdlzsq5zxvrPeUijvuq744dz87+zkeV/gWjLgZEPniXP65N/lfWPjkH/eTyT108z66ePcShncQwzeVC7dVzLywbbebVD8/PveWDP59/Pt7/XX3u3oxr65w9mdp8Vvf67mdTP/67L/8LT2t175tyr/1UnyoDP/56n/yhv1qTPcSjP5zpHtji3f8uDLYSufizg8vTul2KA3syJRsDWufjK94rsAXnbpAAABdklEQVR4Aa2SRaLDIBBASUoKIU6gkDb23et6/4v9mbot+zbIuJBH4LgdSjuec0fUZZT7Qvg8CLvkEhHFIvHSKAq8RGSROJclMlep7mljDdOBymVyZidVofsDxQ0ry9LoQsmTbZQXPUNpTqpY2rK0vSKPDjKeKW1Z38d7zlCqVXzIKhSBsVFV473J0LNJBdvXFyS6lF7dDPA10CWgE7qr1+MeK2VL6gYeT0+pKS3ocpcgHT8wKHx+QbeNK8NXa1K/QxAqIlDl4JGot7f3j8+vb0hB0JOQZXD7+f39/Pz8ex2WByG4hTCmD+mMfr+HCKQb7N263JOltQr8fv1+fn///ZmSQZa7UiiUghkBo/Hf9zjEUoL96JgAv8zFqyuH1qBXER5GGSttIWg1Ie10Np9i+7LueeOtrBfL1RxYG2z85ch0u1kul6vVfK2LRIrLYdNsstoQp6dTHPblmmRCEYQnIo4EuYSHlDtJ4nDKuvdW08PVdB3yAP4BFkgiojjtOuwAAAAASUVORK5CYII=" > ${icon_txt}/duckduckgo.txt
	cat ${icon_txt}/duckduckgo.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_search_duckduckgo.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAWlBMVEVHcEwAgAkAgAkAgAkAgAkAfwcAgAkAgAgAgAkAfANlpWcAcwAAgAn///8AdgAAfgAAfADr9Ozc6t0AgAYtjC8ehyFClERcoF73+/fI3ckAbQB9sX6z0LSZwZrZacMVAAAADHRSTlMAF8IWYIYx5z75zsGmyFMWAAABOklEQVQokWWT6bLDIAiFTZql0yuImn15/9e8gDFLe35kot8gB0Rjspq6bK1ty7ox36oY2Bgjf21bPVDByBGSQyTFxcXevCa3ewAIKzrB7wcb4FBwd1pINgunPGrmdLJYwe2CsKe86lP+0MM9VLZsdQRa5L1xUI0Ai5rm0EZYJIYdORb1MG0wrUwbU9sc2alL16ezeVWb0uacvESWS5BDS01JuMwCMYgSHBwnFTYGf8LcCnFshJ1ZlmVJdOrFAB+LIUOc53lSNqZayohwQi9Kq1EM1VrjcezNLWCsuQk4nfBWJ1jHI9HifMDcoWQJpfNVdjv0qi43QYelfdzXoVkD5bJx/2Y7xlceE6J1C96zs8n7sK1E9yGKxEUsXOLId4kUL2bMq82Xuv+MZhpqN6iRn6FOz+Ej5f3dnsM/HMMjeCuIbCYAAAAASUVORK5CYII=" > ${icon_txt}/ecosia.txt
	cat ${icon_txt}/ecosia.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_search_ecosia.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAclBMVEX////f5f68xf75+/1z2uAzoOVCjO9Qd/hXbP6Xn/8R2M1PxN+ez/GewfZrlfjK9vFH4dLt/Pvt8PSe7+a11fjFz//09vff4OO7v8TT1NhDS2BhZ3cAABzDxssACDJRWWqssLgHHDyDiJSFipaBhpIdK0a5X+qrAAAAdUlEQVR4Ad3OxQHAIBAEwI27u3v/JQb4Lw0wuN7BTJZtW+Ac1/ODMHLAuHGSZnkYgSjisgLqPGQ/N3GjhjbvyGFV9WoYxoEcTvPiAPW8bizZeT/O87gOMMO8S9dcg+nH+xmXXf1OqaD7C63p209obdcJvR4GEh71BrK3iCmRAAAAAElFTkSuQmCC" > ${icon_txt}/startpage.txt
	cat ${icon_txt}/startpage.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_search_startpage.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAOVBMVEVHcEwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADLcPMfAAAAE3RSTlMASYi8zKF0C/v/3fFfGTYnA+VP0aqwAAAAAJlJREFUeAHN0EkKwzAQBdHWrHJrsu9/2ISYJAjZe9fqw6MRSJ6bsc6HeEkpZAA2c2EKWVWB9TiAL0mq1fW2ZVz/rJgJaUZLNueqjq3P6NDvjNBm9H8sCzq0/l7QPmPJhHN1j6sz1g2NSWQ0B2X5O9BQit1BFxxx50zZF5VmN8DFsq86RuqttTrkrWrkrqLocatG8XLb4Y08shdRigYARNoizQAAAABJRU5ErkJggg==" > ${icon_txt}/bing.txt
	cat ${icon_txt}/bing.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_search_bing.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAsUlEQVR4AWLABwDt1QEGhVAQRuEtvCW8pQRd7ap2UAkBRCsJCGgJLWUiGJBTpl9wh4HQ+eK6DcnqPpkp1iuSOO/j+EvjAIqrARDXAyD+AQAODb4Qn8cBGZABGRCfDFjGDwHr7O9qkzV6AMcVAIiX1nlRAIAvn7yGAN6rkC/HgwCI+25tYT8JIB4PAG7Ed48LABiv7M9VBujjASDE9IAN4gIAnG7pwKWiH7jL9XP+xQRzAMxy9yqv9OarAAAAAElFTkSuQmCC" > ${icon_txt}/twitch.txt
	cat ${icon_txt}/twitch.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_streamingvideo_twitch.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAALVBMVEUIDQkJDwsJDwsJDgsLFhAGAwQcvHIcx3EJEQwNHxUd0nEOJhkZplwQVjEVfEgFBcMLAAAABHRSTlMGnOlB7JZBcQAAAS5JREFUKJFVk4uywyAIREmqiA/8/8+9u2DT3HWameawIGhERK67lNJ7feu+hPoAlDJLrfZa0AewUGT/RIycTJm+N+DzEtabWW+lvM85OyJu6TRm6Ei59T4RYFV+Sf3AWmLzeA0401jXaFhj5T/UmgJjr9oaAB/Exz87YbGWGoG/kE5k9aZN2xNBtlC5CwrX3fRFA29uK+DSgPqyugVEWk29afQTTl1L10k9dG2M6YExdGyK5ubfAROinZjszsy7uup+YM/RHuiTjewfDKsnnD66j1azJmc87YFeleYwEh562kENbJxGMznHY8eqg79djRLL08PR7OPlYM0Kltz2PdvqK1vlXGm85QrI+wD53tvhCma4unYoTz1VDuSltgenLJF94s5ft52A73vU4+fwB/pmFPGrJuxFAAAAAElFTkSuQmCC" > ${icon_txt}/trovo.txt
	cat ${icon_txt}/trovo.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_streamingvideo_trovo.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAAA8klEQVR4AWMgCYwCy3UCLudFXM6iIKCI+XIBNJWq+dyul7GotN4iyKvBgtMC95siIf8lMBFQJ5pKvW5erCq9HokKGLDitMDtGsiC4D/ICLsFWg08WFV63qXMArVSHphjgVJUtOCsCDzoYQqoagFQXMyZTcSWFRL0lFuAjoJ+SPg8FwMi//fiQC7lFmAieLjjQmSnIgQiYLrDQSFgJjCZx8+tzEwTC9jFmeDmUNECRBbj12OhrgWIFAwMGWD4cCvSxgLlLC649qFmAWYQ0S+S6ZlM6Z/R6F9UYBZ2dCqu6VXh0L/KpEulT/NmCz0bXoTBKAAAlvjKZQX6JB8AAAAASUVORK5CYII=" > ${icon_txt}/kick.txt
	cat ${icon_txt}/kick.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_streamingvideo_kick.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAWlBMVEX////3+/Pa7cuIyUd6wyeYz2TF46yDxj6Fx0J/xTWr14Ty+e2Cxju43Znl8tp9xC/s9uTU6sKm1X3M5raPy1Tb7cy+4KF7wyv7/fmd0W3u9+fI5LCw2oy13JPxjEMuAAAAqklEQVR4Ac2RRxLDMAgAUUwEuPfu/38zI5wmjXxO9rp04LeYa3VLEO/WxB0SMwmmWUQKsZJjASFlxS8kqQNpRdPUEja+bHOX0+aiGjtP9sQsA8A4kVov1yVObo+sVyvfsnLyE8fT91ATM1egaGZVxjLn5cwMe1YrwCans+G0lOwkrO6Ab1KXQDkrOIJHJ/wid/t6ZPhSmM4QckysL2triGAFcdkMXGDgH3gAEe4JPSXZypIAAAAASUVORK5CYII=" > ${icon_txt}/rumble.txt
	cat ${icon_txt}/rumble.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_streamingvideo_rumble.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAA3lBMVEX/0QD/0gD/1QD/1gDzxx3Fo0GnjFGgh1WchFX6zRGqjk+3mUblvST/1wCylEz/0wD8zQDxxACvkk5ya3+Ve0KXg22cnbi2utWlqsqRhn3Fnxv/2QDTrBZRSGSOipz////3+f+Wkp+YhmZ6eZdvdajT1N/c3++dlZWamrDAw9uDhaiPkK/lugzJzeDBwtGoqL+hhTypiTXs7PGMjKaVfljDw9N7f6iMeF7UrzNKRm9qXWZZVXd4aGFzZGcUI3yEclsrMHkvNHXIpjolLHoAAIF/bmNBQHEACH4PIHxlWWwvPUKJAAABXklEQVR4AcWRBWLDMAxFHSnlek4ZnNUpMzMz3f9CU92MD9AfzhOLvVQGuDL+EzQ9Xp/f7/N6TPzNIRD0hcIMkIMRDvmCAfh2wzdvAEEYaEUsBMCAN8pdZ2HF4gH9L5FMpTNZSi7td0toPyunnFS+UCiWlCorVUlWq7W6ylkPX0woLSepyo1yk/BTCaSgrbbS6nSbHf1wYbslGPTqjvqpcvL5rPSAgbfVz6R/8kGD3IajrBcYjh519prJZHKg2dhRk6mNyEfIIDoDZsikcpxuk5ijkoN6iyLOovTfnEsqy14Q6CapoIpaeqhQOTcNuq9GRIEVag7hrmrkbU5/R2uph7DZcoqArV66PknFopJa4NtNQA9QmLv9QaIQvNWyWggC5WF/NIU7XGN72nvDXGrxsHd/OjPxtRYZ3m5Op8titVpcrqfbOSx/blRwKn26vt/XU2qNu24/OCCnoJSTvVIftHItEPgMLlgAAAAASUVORK5CYII=" > ${icon_txt}/mercadolible.txt
	cat ${icon_txt}/mercadolible.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_compraventa_mercadolibre.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAABLUlEQVR4Ae3WJUADYRjG8UMzDpmCJNyl4ZpxSbhrQ9viGu4Oc+8BJ7KCR5y2vXzPrOCypS/8J2e/8zshu63ApXHw3ZpbWkKR08G2trZS1hrrBNl+lzoDBNbMugPU2tYmQjYUw5r/Fewersi0LXha3FUYYh+O3xiGcZjm30D71rx33DDMvtV/Ao1J6XH2xvtrDdWNYyrfuqNYe/cbfo4wHmErx1RBEehH4FVMUjjr6SY6gZA6o8ocWa42CfUnZKnCSCQT6GXLzdL5lmCalPmaR1XBhMZUwU9Afw1qMyopokJDH4GX2140pfCn74Mc5CAHOYinwF9BLOPbIGLQwm9BkSpw5VePp73kYjFgfEeUayQMs1ZxKmGg5HnLXcJAyeW2twQIYls3yN/a/jUOvgKkonKBWnbPogAAAABJRU5ErkJggg==" > ${icon_txt}/ebay.txt
	cat ${icon_txt}/ebay.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_compraventa_ebay.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAgVBMVEVHcEz////8gQn////7hgH8gAn////09PT7dRD7fwn////6cRH6dwz6fQn5WSH5Uib6hAL5axX5ZRn5SSz5VxH5Xx/8uKT9y7/+7eeNjJH5WzbZ2tupqq36qpGZmp7/4tn3TAT7mXrDxMf7iGL4aFX5gXL6fFR4eH5JSVK+qKKyfGlmuaMJAAAACnRSTlMAmFdX6iUl+uqYcHjkIgAAAZJJREFUOI19k4l2gjAQRce2GkUFgZAQkhAIi9r//8BOFlxa7RX0JPfNMOYcAGCzIslLyGoDyOcb7SOfWP+Px8QGVv/5JFkBNpDydReC+wTwVwlFrCXSkprXCTfEykRa3G+x0AXaS6taoc7iyphmjF1xIdoW7yXQthcphLDfjA/aaCHVRZGLsktAndW5PStrr6zvme6vwnXAljHgh5QEqblmRrNa4gzSzxgCdwzHq37aAm5q5OXfxH3DYRynqddueH4HV0zrfhrmEco7TdncyNIsyyjyGCjLDK9AmqWBWyB7ILq0QmCx5bOi3lZFAUGU43STXk8jLTwQCjuWsKFJaaAacNndA2ma0YYZw3U/zPPQa24Ma7BDjkDsSruZcXcy7tw4mzuae/aQVn4cTNAGi/GA+qGhwe8RiMMWVUVp17kJ3Ld3+xhwFu8cPwUt/KODOzggzJoX+dJz/2CXQB755Q6H4+EIUf2xxwhsnX0jj6fTF+yi+2NPnh2stw8PfZbI1xrgY/tGOv/hXu/1bvvCOb3D+h8jUEJPcHXQ1QAAAABJRU5ErkJggg==" > ${icon_txt}/banggood.txt
	cat ${icon_txt}/banggood.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_compraventa_banggood.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAe1BMVEUy5HYy53cx2nIy4XUw1G8ngkgqoFYvy2oniUoux2gz6nkmdUIqnFQtuWIdABQssl8kZjorqVsmb0Anf0geIh0roVclcUEfIiAwz2wpj1AmekQeHR0iTS8jWzYx3XMplVIuwWYhQCofKiIhRiwdExkx3nMfNCQkYTky43ZZAKfhAAAAr0lEQVR4Ae1MhQHDIBAMFoEnSNxd9l+w7u0IPeTlxHnHHwjfGvKDpMxFZ43nB+jp4KeLEKcC+MnNZaiIc6MJMKw0Dgy1Lo7AKhnbJJVXFkGWy7Aoq6T2WdN2iaoA2xJfyX5I1Kil6CffzLPN5awWYektN20ABonpxNqkXDdTqfZBcogZnjueD8z1W6ZNqNpU30jkdcrpFMKgPFBJ7/keMaZ1btjvBRG6oPO431Z/HAH1gwrjMDdptwAAAABJRU5ErkJggg==" > ${icon_txt}/wish.txt
	cat ${icon_txt}/wish.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_compraventa_wish.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAATlBMVEVHcEznLgP/mgHmKAD/mgL+mQP9mwPnLwTkMAf+mgDmHgDvZgzlbVfoo5L+/v7iCQDmkX3uvrLmgWz349vcQSHkVTzGEwn5hQfCYlLtYAcsk+tnAAAACnRSTlMA////54mJ54nn0fbKYQAAAQNJREFUKJF1ktuWgyAMRYG01aYhXNXO///oBBWkrR4eyGLnBGJUSt1v5kTPuxI9z9CKlXpcMWMexbi8TrQUq1k0wq806sUoo68ERr1giz6Ot+1Pbfv87ii88xZsEDzPB5zZYgcxMh7Qse+hBo6tLhBn6CGG5Jox1bg6Mwe3poMLPMEH1EicskN0OXCs91eocUqcQkjM1N7WoNSjkFKI7uj4gIJR6vafau9TA2DXaQ/RYvTWQskoWseyQyCbPYUpElnrJSvG6GGHGNazDIlIcoIlWa0sOSqmmCWJ0EfyZKtT5rdeB0CTvFZ2BPxu5WvkAoefBpoGNV7DUV1bh/LLj6d4EN8/gB8OPT1VFFMAAAAASUVORK5CYII=" > ${icon_txt}/aliexpress.txt
	cat ${icon_txt}/aliexpress.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_compraventa_aliexpress.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAeFBMVEX9aiH9Zxn9Ygn9XQD9YgD9aBz9Yw39WwD9hlP+uqP+287/6+P+yrj9dTT9ZhX+q4v/9O/////+tpv9kmn+39P9YQD/5dz+spb9f0f9TwD+mXP+pYT+wqf9byr+0L/+n3v9eT39mG39k2X9i1r9hVD+n3b+1MP+xq+PO21SAAAA30lEQVR4AdVQBYLEIAxEitRSQt29/f8PL3tuH1gcRkjCnrdxIaUM1H+QNjaM4jhJ+R8IZOYQ0ecFst/a0jqs6kYKaF0HPzGZoQMjyZA3qH7pejI06TASDb34gREbpz7rNGOmqAy9qC+1jBHzEoCwBEumtG6aD1Sl6LRmijOYkRmzeG+/0lEYjwGz60gWSeWmRnyLCbbKxdNMym4acln+DJeyMBLIAkoBfyq3q+MAKBsBggHn8I3Bt/icrnq9p2xN4NzWM1NfwrobvK/9QPMeCTzO77agH008piJbyur52gvx0w4LaIHYDwAAAABJRU5ErkJggg==" > ${icon_txt}/alibaba.txt
	cat ${icon_txt}/alibaba.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_compraventa_alibaba.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAllBMVEVHcEz////////////////////////9/f7///////////////////////////////8AAAADBQX29vb/owD/+vG2trbZ2dmZmZn/26n/8d3v7+//9eb/yHpISUn/1Zr/48GmpqY+Pz8jIyP/rxb/u0oxMjJsbW3j4+PAwcH/6Mj/wGHMzMx7fHxfYGDFxcX/tC0NDg6Li4slqlgLAAAAD3RSTlMAooK1rWYj+jfodsRYfMGCSs7OAAABRElEQVQokW2T2XqDIBCFSZsE0w1EUEFi3Jfsff+XK6ttUubG4fzMcZxvBABEa4j+BVxHQMXbH4UQ8nvaqLqFpFOmgqWLTwReXSayPTaxr3z1Cvh7Z4tijO/MSTvgEmb0vsFxjGtf6qH2rFMi9po+w0vTxJN6XkMQkXEkUIgwRCJl2XBpgvB07m27AZjW5huHc6hSdYnv1SjSABRa+1biKQCZ1q4qyXSSPsJKaxVCY28sHqF5Vc9Og24X+1LfkBX97KdHyKyKh6rBOINPQ5guevRMIFYziCinFvKSmuESuySQINolyZEbSMvW4iXoTA8dd7Z525a8cBdowfP2WEp1tGsyH5Okk/lBRS6Vp+T5rNdkba/nCrtoZY6Q9lmByLXND6W83W6dLOfCKlCt9Wbn26BFsbxZmX7old++vP/7H+DX5xaAHw4uN1n/ebb2AAAAAElFTkSuQmCC" > ${icon_txt}/amazon.txt
	cat ${icon_txt}/amazon.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_compraventa_amazon.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAVFBMVEX////u+fio4tmI2c2d39XY8u6W3dMAu6MAvKVbzr73/Px31ccAvqhLyrm45+Cx5d0sxbEQwq08x7Xi9fJTzLvO7+rn9/WB18vA6uOj4dho0cLF7OaVu0oPAAAAp0lEQVR4Ac3QBRaEMAwE0EGTblPcuf89FyflcQB+3QXfFoRRnOBdSrwwePhZYRuRy5K8EPcYK7k0QharijNoEa/9ITY1NdAK/qlWWUKrCHpQWn/bEJeahTr/Qv1wNhpOuYcyCtN57DCAnXdMBSXgSW9LayupsTM0QJFyzQxW0/obmmUTHCcl5Gb4iuXHhZN1Ic94Go2ZRNLQrSe86XlRBnhXx1GGD/sDM1QGmn2Cq0oAAAAASUVORK5CYII=" > ${icon_txt}/wallapop.txt
	cat ${icon_txt}/wallapop.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_compraventa_wallapop.png

	echo "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6IzdCRD84NzQ5OjcBCgoKDQwNGg8PGjclHyU3NzU3Nzc3Ljc3Kzc3Nzc3Nzc1NzE1KzcyNzU3Nzc1NTc3NzU4NTYtNzcrNzc1NTIvLf/AABEIABwAHAMBEQACEQEDEQH/xAAaAAABBQEAAAAAAAAAAAAAAAAAAQMEBQYC/8QAJhAAAQMDAwIHAAAAAAAAAAAAAQACAwQREgUGIXGBExQyQUORwf/EABkBAQADAQEAAAAAAAAAAAAAAAABBAUGAv/EACIRAAICAgEDBQAAAAAAAAAAAAABAgMEERIFcfEhMTJBof/aAAwDAQACEQMRAD8Am5LpTjAyQCZoBckAlJF5qoZD40MOXyTPxaOpScuK3rfY91w5y47S7mxoNqUEWBqp3VsjhcMjOLPsc279lmWZtj+K0bNXTKo+s3y/EG9RDQaJBSU0UUQlnBLY22FgD+kJhcrLXKT3pEdRUaqFCC1tmIzWroxCPmpBc6VuSp0qmjhpmNOLySH+lzTzbre/Kq24kbZuTZdozpU1qEV4Ot0a7HrUtK+GN8bYozdr/ZxPPUcDlTi47pTT+yM3KWQ4tL2KTNWSmNXUgLoAugC6A//Z" > ${icon_txt}/telegram.txt
	cat ${icon_txt}/telegram.txt | sed 's/^data:image\/jpeg;base64,//' | base64 --decode > ${icon_app_web_d}/icon_chat_telegram.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAUVBMVEVHcEz////////////////////////////////////////////////r+u/Z9uL1/fhe24gAzUkf02Sh6LZ+4Z1t3pHG8dMC0Viw7MKQ5apL2HsasPsVAAAADXRSTlMANIfD7f8zYGIW4N4+qsA5tgAAAQdJREFUeAF9k4UWgzAMRYM8vG6j//+hKyfQ+S6WEq9QpWm7Hui7dqB3xh6VfnpRzQteWGeqbPhg+6Or2hkVIVWVOfIKRmpTsA7MQoUJjDchCiVdSpJ/jEXZs6iTrFYs9UQD/3FG4MIn/jbUsmBukNXX7jhoqcPBLR2BPVBHhe5MGcKhDGAE5+iJh3kHoolg1FnSqdRFiZAEIJ6VHHbPKOR0iyYISKM4LBcUeehNskbCZy7oasV6LsX5CHEmb6k5lQ4XymoWBuKkwkjpFGdImXX9sUG47WSS0bvz1uxgJiosALyPCtHnrNm/sL4u9ivz/23yf4Mx84oXlpmemZ439UjvDNdxaOjiDkjvFKpa/ei0AAAAAElFTkSuQmCC" > ${icon_txt}/whatsapp.txt
	cat ${icon_txt}/whatsapp.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_chat_whatsapp.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAASFBMVEVHcExYZPFXZPJXZPFXZPFXZPFXZPFXZPFYZPJYZfJYZPJXZfFWY/JhbfNsd/OSmvbS1fv////x8/6pr/hQXvLl5/2Bi/XAxfpYg8U1AAAADHRSTlMADzmFwOT8YtP/sloPkm6kAAABAklEQVR4AYWTBbLFIAxFcXs4lf3vFEg1X2+9JzITIZco40IqJQVnlGBRbewtoxFmziI59rCPRGhIfn5hiLKDYSkJkemZz98689IB9YlCjPMlxnBgr4ejgTebcqltqJacLFBDCQPHJZWX0gIOjHB4Lusbrgu4ciKQI3IVRALMGGaAkqgZNdQRK4U8foc0MtQw46oDbmC9pBkQomwHlBPOlOsW9lL2sK1XUknETNnKpNOl5slKm1AQfsFaxw2eF+RQBB9HwLq3PedxG3CPMyc7yufDqF6b5Q2+jfoFf5SPaH/WPXhQuCqvn5bNVqEXR1GzkST7e0wwxeyX0fSO/T/Uf65DBzQNHUMopTvLAAAAAElFTkSuQmCC" > ${icon_txt}/discord.txt
	cat ${icon_txt}/discord.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_chat_discord.png

	echo "https://logincdn.msftauth.net/shared/5/images/44_08ed657e48f1458641b5.png" > ${icon_txt}/skype.txt
	wget "$(cat ${icon_txt}/skype.txt)" -O ${icon_app_web_d}/icon_chat_skype.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAABn0lEQVR4Ae2WA0yGQRiA/1wzM4YwZtt2Q5iyOTbkZjaveXnIriE35HnLtt1/fW/bu93v+7O2PR9Oz/mOF1AQ+qn8IeF5o7qyUc5ckGHmXDLN/aBS8sMgD94yuetWS1+JsjFhEprVpJjqpC10GmQs7NI8DCodysOhv00bSGUKoXUg0MlYIohN7jQ57eORxyElZg5DrAlKP0/oafuE0k8TovTC0cKaWehQNP902cebfxpWmH0YUp6TBqSBtLMJzoRmLMm1GVoqIvSqvgzl2PCuviQUpw61xRowg1mAtDZNMWe2TTEE4f53bJtjguUSsq4xFNo0xxCEk258tJBq4a8W/gthHTpUjt4Ig8sC9lrL+kh3yAxI+mYW6pS7BhuVx+0ZlccTBP5BCAVyBbVwmRc4FhHhf5vGlzdhFmqVOexoldnxEfinZHcchB1GoXaZI6GxaYweQNmnCF8jYdraYFJolzq2gJRGUiFy0AJliwgBnInQWkSoO++gi3FmsiC8rGSuK0p4B7WFQj7q1oZCEdmHCqELUQYbwIcKcVyBH3sRfgZal9v7DbqvsAAAAABJRU5ErkJggg==" > ${icon_txt}/googlechat.txt
	cat ${icon_txt}/googlechat.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_chat_googlechat.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAaVBMVEX////8/Pzc3Nzf39/5+flxcXEAAACYmJgbGxvDw8Py8vLv7++ysrJXV1eAgICEhIRqamqfn59lZWVNTU0mJiaTk5PNzc26urpHR0dBQUHj4+PT09MLCwvr6+sSEhI5OTkuLi5gX2CmpqYaM6ryAAAA9ElEQVR4AbXON4KEMBAF0cJ9vPcwDu5/yBUEGtaF89KSupvPc1yPf/iBjPDvpihO0kx5Ucb8VEUYtdS06lKu0l4DjFIGJJMc3kZJOLNKSBdAPZarcBXu7Q69VDrUD6y5YTAxZ1RILGWDLoeuR/Sec5O3dwill413LWfUCrEKh6SVb6viIy45xrNXBo/SxuYJtcoNozsHZbIxVePgB+dY+amJ63WutIM3V23+OON4PdfdFQ2UGujOOFVYGo+pqmGRifdSd6zgBXjJ8SLnLmngLdHmALseA2Sqfa4WKd/Oq/BV8tNYlNNjTJJRL/5Uyij5j+vyeV+qoA1qsxSRqQAAAABJRU5ErkJggg==" > ${icon_txt}/chatgpt.txt
	cat ${icon_txt}/chatgpt.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_ia_chatgpt.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAMFBMVEVHcExNa/5Na/5Na/5Na/5Na/5Na/5Na/5Na/5Na/5Na/5Na/5Na/5Na/5Na/5Na/5glKuKAAAAD3RSTlMA05QmPhvxp+O+dGJWhBD9rd47AAAA0UlEQVQokcWR2RbDIAhEARXXhP//26IYY9o+9pzOQ9C5LkwE+K9CiaTllIfrCJkRReTUWRMyu/VPlKU+rVodOJ+TTvBmwg7Aa83djAAkD3kAXsMg8k6dDehj46LZ9xvZO3+knVIRqaNfSaN4wxGKLWgGr8jjfMRJw/BYM5m6yzKjmYVywL6XzmgRp7N+493WPE3bXltX5nw5ONeFee1941zeqaDivB96vYLGOkby3moO8KSJejfxtPdLG/W82hRslPMBu8rEXOCbQqu1ha/o13oBhAwQQ4gEzPgAAAAASUVORK5CYII=" > ${icon_txt}/deekseek.txt
	cat ${icon_txt}/deekseek.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_ia_deepseek.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAC01BMVEVHcEwA17gbH0kJrdz/niLVJXxvvxJgOLxcBP8Nuf4Iyev23b7/ZQC3vPS6wvj10K7/MXfYn5cAADP/W1KWALrWELmn3YL/lgf/kwT9mAftkUzJdwCl8soYv///sABtlfvYh2pFouv5zpJWvteFnLPOhe/SWWGs2OGYpfnFaoFJXf7ZXQD8pGArMf8An8AAWNveuO5PKi3238cAAGKfnvXTz+plYGd4cXv/QGWiF9DBU+LDTeP7/P0BAjX///4ZFj4AFj/e3+EgI0QAAixROkPy8e6Ji5bo6+0OJUkEGEmgoKYbKk7V1t1DQUHVxqw/RltZQEZJR0SVlZwPDjbv9fsIb5WqrsA7NjVQVWmTmaft0bZFMD7V1da1qpXZ0bz/8r0DVGVWV20sL0j9wxAABj3Ini5XQTLCl2TwvB7nagjv6tvH7eUuISh9fYhHQFIdFy+YOk/90V9NSl/l8fipqbRKTmbJw7/hrxtpeIA/S2YAHzvVjUI5LkcbLmDRu4mmdQt7D2a+w8q70eeZfnoMrMx6lJ8LcW+0rrHn5eZ2M0fJxOrW3/DO0NOrZACzNji5dnY3OVOQio0jRVr2x8yZSnOtjDGujWioiYpzOBn2sgAuWp3/+t7rmXHwqLVhZ4BAICcacavQQWeyxpthUT+9InqtgCFZYJ3/4KDamgVlQje+iQBSMijGsotuVCtvXtgiGdL8zYV2VJaCeGmakHhSCOA0GvMhAPAAAHfDdBOmnFZza3E3QT38ewAAZoAAn7AAi3maUihysMqgiFEAjqrd2MD/5OldMzRbMFKAhLno2OyOYir/5ZT//+qnYzn5ypwsTZsUWpqhIGZmUFa3mY3/npjmvHZVsaENgLTy39LoO1djF1mySoS5g5ooKIgAhriMhazr38NeAFM4XNYoTOm3xIqIhrpjFGsYFLIzMJ7QpHhTT05zadY+O6fefwDLkgX/+OzRmQoHHXdLAAAAPHRSTlMAKi78YP4QBhdvPv4Z9f7vceb4R1c8aZDQyYHk3BtRjrd3q3hpl9Lb2PtsfIlYr1T3o8Fss9vEppxjW19TNSx8AAAClElEQVQokWNgQAZMTAy4gbEhDgldE94uUyNufiU5DCktPkcvtyQzc2+3EkduMRQpdg3HXGenIJ+eMB+3Cc4VjjJsCDkOvrLg4BrXEJ+ydh93mzwH2/ZsRrg+zX7bvJqYkKjq1eGpy4vdc3xtd+2E6VXr8y+yz7U7N2NG9ZwDaYV2kbaBvmnSEDmVfn8n+0S7abZno+Ls7NKDD9nMc/BIapYCSzZNj3aJLikoOBYV52djY7dyxdSwcN/w1ih2oJyyo0uBh+3RhcenHQFLrjmVfCbFvm23ow5QUt0rurMzYvKUpHSvID8bv7ir0TPjExPawiP5gZLZiS6efUFzp9TOuhQwMat+8VKXmacj99v7RtzgYWB0tw9wsp98YlbCokV197NcH8xeW16YXeUR6OAqzMDVYRvg5Oy+bIHTtbr0p1lZNhs8MzLcbT0Cbd1ZGIRigJL2NucXeCc8WRbmWmdT75lRfsbbIzAlRohB3zU4wD63+8J176KKsM1+ZbGJKcmp8W4OQGNFGDi6i1ycOw6G3vN3dH3ZW5/u6jMvI7Ww2Nm39CQHAwOv2/ygkMOhoUF2m4ptQmw22TUuTU2OD8txMwB6RT5mYvG+0NDgksbet2kr363w8rEtn5oc79WjCoqTpsi9k2rvPveK3THfzi7tw+bGh7dcFq+K7eIAha1ia57tncfrI/w8e9/brfJcU9GwcE6KR7MCJFqYJ5VOf7TeOXb76g3L126PdWi4eblyQiYPRJKrxdtp7rqkV1s9d1R7bi3yuH3F3yFTHJYUOFsSBFkrI15vq3HZti6iklUwJ1MCkYg4mfUEllT5v6n1flFaddFCe48kcvKT5WQQZm3YuGXLxmdLBBhYWDCTtaiItZWlKJIAAGwk6nMKrKIKAAAAAElFTkSuQmCC" > ${icon_txt}/leonardoia.txt
	cat ${icon_txt}/leonardoia.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_ia_leonardoia.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAb1BMVEVHcEz9/f3+/v7+/v79/f39/f39/f39/f3+/v79/f3z8/X9/f39/f3+/v7+/v79/f39/f39/f3///8NBDgCADAAACj29fg5NlLn5uzNzNYAAA3AvsrY19+npbVaV3AmIkVHRF1mY3mPjaFwbYS2tMHbrpA4AAAAEnRSTlMAE7GFvgxcOt3v6NJj52bf0IWW6qNqAAABTklEQVQokY1T27LCIAxEW6UdL1WacC+9+f/fKJS0Wh/OnH1ispMluwTGCCf+LJu6bsqCn9geh/tDbHjcD98cP4odjvzDnSvxg+q8cbdckd69jJbGeSFuxHLqc6PqexWC6tUkRbUoH/J9sgOEFhJatEGKY5rqmvs6Cy0B2s5IIa7R3yU3Kmw3oE6ly4lxGqZNjYAYtVscZKpxVhAZMF6o5jn0UQK6VCtYSc4coOq81trNADimUsmalbTBk8iEMKRbG1avlaDJ0iRnq0w81iu5wQ8WOlB+IaNsDExvpB4B+55k40BGWffVGb0ADRSt+LE3G/lKfpGs8PQaRm6qQ7SJikKg+KhVhxSBNRQfBW9mJ4WeUjxoF9EU/PpkcSq0FmM6Kk+3PNn62LIbB6WGMGVbFd+vidDGeBrtdv7Pgv29mj9Lfdkv9fIdivwdnp/v8AbKNTBM5HeJeQAAAABJRU5ErkJggg==" > ${icon_txt}/deepai.txt
	cat ${icon_txt}/deepai.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_ia_deepai.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAA9lBMVEUmJiYnJycoKCgpKSkqKionJyUoIBwnFQosPEQlGwwnJCEnEwYxaXo8q8xFu+ZLtOVRrORPkcY1SF4kHxQ6o8E/wuhBuuFGsd5Lq9xRpNxXnt1gneQ/VXgjIxo+u99YmtpgkdlnkuEqLDQzZH5Cb5ZNXpQkLTImHRYhEwBTf7lpiNlhcrwgHQwtS1QuW29KaJhsgtZpdsciGwAzdopYebg2iKFCk7w1QFVyf9pWV5c7j65Agak8Tmx5fd8sKzskAABGoc1hY61PToc6X39OfrRAT3Y+Qmd7c9djWaWDa9h5YsQbIg2LZdo6M06RXtlINGN+VbxdOYDIX6LNAAABZklEQVR4AW3Rg7LDQBQG4J7dMqoZp7ZtW+//Mjeezs7943zr9bgBhL0YYwTgIQNePdgOwdgx5EP6DZHVDPMHvEFviEK6koZohuXCkWgs/qOO+RPJVDqTzfGC6KrTH51ISnrFrKyomg8h+B2nn0lKqXQ+WOAVtSjaM8KW4YCkW6lMVapqrd4AMNU2qqk32iojFG+rnW7PQmQZ9veTXLqCEOoNap2uXRNbhstDLj3SMT5WO5OpCKbq/yHgp3B5ls7MQ1RvodY6y5XPQV+T7Tfp9SwTmVNC1bBpA+w+jaGkuPRGn32OV3SbbG2zkEtnMpFsTpZN27mmIwQ3BuVks95Uc0wPYAwhKrYvHBRFPa4acZ9reszdpyh9CrXaSjTFNb1dZMSn6d2dKMdctdLoTJY7kTAP2Nhdni8N28iq4uV8vd1tIxTE3fX6oHykGQrgez4er7dIkh7QUfx8Pl8SXb7f75bBf07+/ANHKSe0X7iXSAAAAABJRU5ErkJggg==" > ${icon_txt}/pixlr.txt
	cat ${icon_txt}/pixlr.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_ia_pixlr.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADgAAAA4CAMAAACfWMssAAAAXVBMVEUAAAD////Gxsbw8PBUVFQHBweBgYEwMDAPDw+VlZUzMzOGhoZ5eXk2Njatra11dXUUFBTe3t74+PiioqK+vr5ra2soKCjU1NTMzMxdXV0hISHq6uqbm5uPj48aGhpk4+TNAAABaUlEQVRIiZ2X2ZaDIAxAE/e9Lh27+/+fOaKdOQIJQe6j5R5KSGIEXImyJC9S8CAt8iSLlAOIceujHGljJcZnNUW8iqf32/ZEiEI8WLUsTMwgCRMTyMUlZTddrKcVFG6tHnHj2uvPe3r5H8WA//xov7jTZR7xQO0vah6ifVKGGxqIgdypTQ8HP9HyEBsfbyJEr4IYCdG4E5KG8vAmi3dSRCFjgAyNopa8ByOK5UvF1CuuESOiJL44USp88hYVQvL0nIelW3yy4mSsTPXKnFmxM8SOXTm7NuDvDfHpPlTJikIbpIthZXR7kHDiSxC5apCzOmbEtyRyWf2QRLsZ7kgel513UbT79oZH279QnnSLG1QJijFVZIEbAgyW6DlZtKbn0bd3jEw/MXN9tAO6K1Gv6MOdDM7XfGrOHcv1+zeFl8RCDEjN1JXivFWFj2TBQ2Dw2Bk86IaP1sHDPG6fD9WyCJ1XkRZL9f18+AV/fArL4AV+kgAAAABJRU5ErkJggg==" > ${icon_txt}/sunoia.txt
	cat ${icon_txt}/sunoia.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_ia_sunoia.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAAAAABXZoBIAAAApElEQVR4AeWSIQzCMBBFn/deoOcwiHm8N3iDQs3NBx/sdAUKtWRmSW3VRFVNHaamsmSXLbQJ4MOe6s9L7tqfkn7wzzLqwZVy7NbcAFQ2kwZ2z/kQKo73vgXzloqL5Aluc3aQS2shKtBJ6OgzaVLwjcwWPNdCxppT8B+llXUwrmOHTJ5lnV0uZKF4ShWkgT21ejQwZSVolRZagIP71q0Z/Ra+Sc4LeaXB9CYWvEkAAAAASUVORK5CYII=" > ${icon_txt}/openart.txt
	cat ${icon_txt}/openart.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_ia_openart.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAdVBMVEX////5+Pzi4vKztuC0u+JpdclffM2prdxhdspVfM2cteLFxeZgbsdif85Yg9E6ftC2zeywq9tma8VThtJKitUphdWPvOfo4fHCtN5+bMNxb8ZsestFjNY8kdkmkdoil96bzO/X6/n2+v1RdMsRjdqw0u+dxOoXwiEkAAAAa0lEQVR4AdXLgxHAUAAD0NS27e6/YXEuMsB/5wACkyRwsgxOUcFpOijDtGwQjuv5QYhfUez5SZrln0IqyqpurrLt+mGc5ndZa/ex64ZPeTMWP227NcevMLi6DYTd3j+m7cHtO7hpAjfPENcJ+wwG2aDUGTgAAAAASUVORK5CYII=" > ${icon_txt}/gemini.txt
	cat ${icon_txt}/gemini.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_ia_gemini.png

	echo "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Microsoft_365_Copilot_Icon.svg/768px-Microsoft_365_Copilot_Icon.svg.png" > ${icon_txt}/ms_copilot.txt
	wget "$(cat ${icon_txt}/ms_copilot.txt)" -O ${icon_app_web_d}/icon_ia_mscopilot.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAAAAABXZoBIAAAA/0lEQVR4AbXPIazCMACE4d+L2qoZFEGSIGcRc/gJJB5XMzGJmK9EN0HMi+qaibkKVF1txdQe4g0YzPK5yyWXHL9TaPNQ89LojH87N1rbJcXkMF4Fk31UMrf34hm14KUeoQxGArALHTMuQD2cAWQfJXOpgTbksGr9ng8qluShJTPhyCdx63POg7rEim95ZyR68I1ggQpnCEGwyPicw6hZtPEGmnhkycqOio1zm6XuFtyw5XDXfGvuau0dXHzJp8pfBPuhIXO9ZK5ILUCdSvLYMpc6ASBtl3EaC97I4KaFaOCaBE9Zn5jUsVqR2vcTJZO1DdbGoZryVp94Ka/mQfE7f2T3df0WBhLDAAAAAElFTkSuQmCC" > ${icon_txt}/twitter.txt
	cat ${icon_txt}/twitter.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_rrss_twitter.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAD30lEQVR4AayShW4cMRCGLQgzHArKDK9xor5KnyDMSZmZmZmZRWWuKMy8e3y7U8/KvXG6PlR+6dM3Wtv/tElYulnzHXI918HnvQZ7PNfgGfdvz1XQEJzFtz14B++y+crCO+D2XoG97ssw475swhwuGWSOK26T3zX24luWbZbehTxe1uS+YOiuCzGwOB+3mA2yAvcFU8cO7Mrsf30R3Lz4nfMcL+eglZyNkm3QGXZhJ0snzrOw3nE61uc4zQs4wmKOxC3PaIszZA4/I2On6zSsY8ni4P9Kx6loX/WJMCCOk5G47dCZ+r79HLtxR8LfueN45F318TDEORYiW4TJHBcvbf8QhT/TJoRiJkQME2bCJvRpJnwaM8TbuX24Q/k3wS82VR0JwRwOB8nSjF5xJgRvhgxIEtEj3kngLibHcQzc1YdDetWhICSj8iD5UW8MUsX+PoBGdNzJ/qXqQHBv5f4AVHCEBX4yp1LMG26EIJ2I+2hpFn18J8OsuQi5lXv9MxV7/ZAul35HIY0k7cCduJtV7tN95bt0sNgdt5g1sjR/GrX/+E9+j8DyI35xV7eh6q/cpftY2Q5tDwfSoVxYj5jwf5Yf4qV0j+bknXtY2bbZZxxIh9KtlkERfjaD52QFcgdSvl17xkq3zP4u3TwDSAlZAZ2pgmeZgrtZ6aZpraRrGpR0kuVZFTpXv1eBu1lpx5RW3DEFFu1kmWzSM21AiehC04wWc/uUxorbpn4XtU6CiuLWKcvZ5HVPxN7ZQkZwNytqnnxW1DwBSGETWSabnPsSkjuV4G5W2DC+hwPJyCZdL/22ngLJYt7DihonfAW1Y2BRR5bJJhtvaeL9OFoJ7mZrGiC3sHb8b6vlcdswFATRL2ZCDagAX12H+3DOOWe7A8d2fFQZlsRMXpzu6z8kVnGdPcDgDbRJ5InP/nFB3lFOTMlck1TVuW8gD8wzcRO3FeQfFvfeQUbeQU5M2K0yOGBJXlVjcmaO1HFTsernecPZTd/c3ZQ0CeTM7M+S3L0MNWbpT/a94abql7ebXDrburidECiZa5LsspZUZO+kzNI2Z31r9JPsmlx7M2namzHZG7J1vaQkp6qBff09csYN3FKS6jt5w1mPA2stos8sCb/b6zFzIPMcduOG+kzORjpurUaBtRKRuRwSsz8LqnpWQuaoV8MAu9V3VF/MG9Zi2DQXAxrwUlhSENeZA7aWwyY/+bc1tkKu/hOXxkLwZswHVLlTUlINNW0mjFnswC71W+FtGLOd+9ps+7k2qw/MtEmSrlNZB+c6z5jBrPo3nZNjzXQm1FTrjgSp6dYDakr3oFd9U+9y1lO9tTZT6gAAAABJRU5ErkJggg==" > ${icon_txt}/facebook.txt
	cat ${icon_txt}/facebook.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_rrss_facebook.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAABWVBMVEVyHVFHcEx0Fvp8Fv1yFP1/FfyLCOyfBOmtAeS7AuDHAd3UANjZAs7rD6xyFvzjANTqAMHoA7l2F/yPFfx8GPmfD/zFF/XVWujoZuLyZt3pRt/yGdHyA8j1AKTViPj/9Pr////8g9f9A7r3DZz5vO794Pf+ruj9B6uzFPv7JLv+AJr+BI/+YMP/1vD+AIThG+n9GZn/vd3/YZz+AXP+GoT/r8r+AmT/b5z+HHH+I3f+G2P/ur7+FFD+Klb+fYv/wcr+LUf+LWX+AFn+Nzr+Ohz+RT7+inP+Si7/ztD+TxL/zbv+Wy//9fH+WgL+c1X+ZyX+PUv+Bzv+VXD+cxr/6eL+aQT+eAX+nDj+gwD+gxH+fSL+rYn+jwD+iwL+XhX/3rn/1bH9ZR/+lwP+nwH+xHH8ZC3+qAH+sAD+wAP+x1P+zGb+pl79mQn+uAD9J3T+ygD9O1n8pRL9twuaEkMNAAAAc3RSTlMBAF3G///////////GW9j//9nY/1r///////////7//////8b/////////////////////////////////////////////////////////////////////////////////xf///1v////////Y/9j/2VzGSus+GgAAAeNJREFUeAFFjEWiU0EQRc/tqu74V9wZ4TBiB6wG3wpzVoQ7zHCXeELypHH+KVchJAESaEs0IUv0Zv+7fwLgSAOk9ZFghcnfDw4AAg18cyhWCKNVob9NCZjQLWVrEGhJbJGDoCBpMwCrJTETAKBWgdeRGb4dmJW56PdI/KU1K4X15N+AFsW0+3/WVm7Pa0Pmu4Fh7HcbRIjMIhr3FItUGAH4SNZKjK32YjKpK3Iv0yUY0b8g0Vs0oK+8wbeyMBAQwVeo44R1z7XWq6rqpn5jiTmAeQO3iceg9zkYzKvc71iEmMFbqCJJ4tDcKFrLjX5D/MEdq8GpIUUgd/tgGboTgiUDPDZ44SXNpr0gWRcAgqEmEPJRNVPOxYaOth0oAHdCxWoOzslH+RCvlafYMgFUHvAIHoCjz16io80BrH/j0AAcJ9KWKkhn5sRyGjsDtr/sqyrsWNO1cW9/cDNLZgHLSzVvn+wMq9qbKKwy7TiIaKTW56pzW6Oa+N1OKEQdvvl2RyOE4DEOZurd1cHNeab27tyjOPfhFlucXP04ovF97B6jTOzdJwFLaNAff7N6c8incH1VpiSR67q2VgjzUU7JgbMTiQtFKmgAsCAuczlflmVZn7iGBFc1awB/p4tqUS3LDb8OPwBrSrZIO/KHZwAAAABJRU5ErkJggg==" > ${icon_txt}/instagram.txt
	cat ${icon_txt}/instagram.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_rrss_instagram.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAllBMVEVHcEz/RQD/RQD/RQD/RQD/RQD/RQD/RQD/RQD/RQD/RQD/RQD/RgD/RQD+////RQD/PAD/NQD+QgDP3+fb6e7n8PLx9vcKEhX0/f/L1tz+jXL718/+XCr4+vv0e1/olIP6pJDi3N3PqqbfNAn7cU//VgP+9vQyODv1bEb+49rdzc3/v66xu77IXlHlXDhqcHKsLABrLBlRGkQ3AAAADnRSTlMAwkSK1tA47GYdh31HPrF7ujQAAAF5SURBVCiRbZOHcoMwDIahyYUkbW3Z2GbvlT3e/+UqQSCkiY4D5A9bvwaWNdpqYTucO/ZiZf23NYLRnPUL2iyfiEvJl5sn+5khLuJacP41sq85gyNje5joZs7kLWCMhUiHk+fxKu9+YswnuOx1zvd5FZRKHYAc0jzlIAFudwCoU9RLGWHuJEIIABHnx7I85jE6eOHyylqg+DCKwnDPHrYPycd0tpbNIWcfLAduU8hPjDEKymXs07spi2GxKA09/FhyCwNrkzB2FruEFpMqPtO3GgEeC5lKmK4aGRGMRFNplqgM8Fgb1eZ+4l8a3hJseXNBN0e1NqUid9oYE7VDzDYyiTE7San0RSi0Nv6p6zyv606+0boYikC5QOoqpZXXm9JaqRT68vWFh8x1XRVcPe8aKHzN4FH4vmUiDdwgwP10D1JUM7RsaDbw7FDgHrc4ZLzv2GOMfof5gLhO0zoG6Bs2DtH3NHYgh1a+s5lNo7l+Q7OhfoWOvX3+Dn+Ini8glo+XBwAAAABJRU5ErkJggg==" > ${icon_txt}/reddit.txt
	cat ${icon_txt}/reddit.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_rrss_reddit.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAM1BMVEVHcEzmACPmACLmACPmACPmACPmACPmACPmACPmACPmACPmACPmACPmACPmACPmACPmACMDEHyKAAAAEXRSTlMADQV52f/IqIf3aFsqSuK8lqlIRVYAAAC5SURBVHgBvZJFEsQwDATHzPD/165U2nB8zYTVwtj4QkotgDbWkazRT2bcLnNn3p3k31iIMSSh95xZ3ssts+bvSvYYG6D4S18CM6pjdY12CaUZEoeHQeYBUF27Q0d2Co9Ap1eFSXchUmQicFXLxRHZ5QSDQHeHYkJzWcaQqc8NUWhq4JAIzmTv/1VDdSqOcRlFy4RQGqQpjtfQSSVzy/2xMNxCQVgvS0V6sD1zbavFBpQe/22y3mAf6Ae59wbdKckEPwAAAABJRU5ErkJggg==" > ${icon_txt}/pinterest.txt
	cat ${icon_txt}/pinterest.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_rrss_pinterest.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAADRElEQVR4AbRWQ3RkURS8Yzv2NjY3cbIbs5N17OyyGtu2bdv2THfGthG7U9M1dt4P6pzbuL/qvvrP8jNQLo6olpGmMKBGKkyBRooKGEXP2mxDfgcgzUwknSneUNCkYZTXbIttCkEwofDGjRlsS/ej29XevPF7gsMBo4zUKq4qF9y5JThyiCG4e4s57SY4J2jAoCqoLBMsXSzw9hJ07NgcDg4ODP5mDsuWkKOpF/Qc/0oVcnGBIF4nsLOzwcSJE3Hv3j0UFxeDwd/M2dpaIz6OXPW5ICpEY5UgPU3g5uYKNvYv3L17F66uLsjOpEbNhJIB/WVBjx7tcfHiRdSF8+fPo3v39sjXN6KBkcMFMTExMBqNqAvkREVFYcyoRjTQu5cgPT0dqkhNTcXgQY1kgGMZHiaYNm0aVDFu3DhEhAtqqxtggMtpxHBBSLDArIdgwoQJUMWwYcOooZbDx1raDaxfxyVni1GjRkGn02HMmDFQxejRoxEXFwdqbWyssGVTPQwsmCfw9PREYWEhamtrUVVVBVWQSw217u7uWLywHgZevxT4+QmCgoJw4cIFsKAqyOVyDAgIQGCA4O2rek7C928EyUmCLl064/Lly1AFuR07tkdaCms0cBXs2SkwM+uOFy9eQBXPnz+HWY9u2Lu7gcvw2WOBq2sz5OXlaR4CatzcmuH5k3oY4Po9f0bg5SkYMGAASkpKoBXU9O/fH15egvNnWVPRQMF7QVKioHv3tuDux9OuvqA2LS3NVKsNa7J23QZ4pltaWuLUqVMqe7/S2cBarLl6pYIBnnzW1i3Rt29frFmzBgUFBagvqF29ejX69OkDG5uWMFxVMMCxum4QZKSxJwQpKSmorq7W1BvkUpOcnMwayEhnTdbWsApI3rRBeLZzM0J0dDRyc3Oh1+v/uiKY4zNyyKWG2s0b/38o/fdKxpPwwjnBqhWCmdN5LNNQB2RnZ+PGjRvfr2T8zRyfkTPDxF25nFrWqOtKVi35qpdIFjtxTBAbI+jSuTmcnJwY6NKlOXM4cZQcTbdiAw2M+pFUN/Lw3o9rOX9ravjTkJrlA9YxAdkJsnugu2b075xC7EB0TrF1z1uhCfMnFS39Ce6B/cXsngMAoMbZs/GdcckAAAAASUVORK5CYII=" > ${icon_txt}/snapchat.txt 
	cat ${icon_txt}/snapchat.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_rrss_snapchat.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAhFBMVEVHcEwbFyAbFR8bFR4gFBsiExkbFiAeFB0kEhgbFiAnERYrAAAuDxIHoJsLAQAC//ed+/e/2NmsACMVERL/////A0gEEhPyrr1XAA8Jv7j/zNfYADgcPT3/6O9T+/S8/vvZ+vmKAibZP2X/S3YA7eT+epYcFR4aFiD5bYsagX2WX23/cpIvOAPpAAAACnRSTlMAb8Hw//9f//+MVnReTQAAAX5JREFUeAFdkwdiwjAQBOWGAgruvTtNKf//X9Yn7gwsnRmvbRVF8fwgDKO7hGHge4pz0iHhF45TQn1y/HzwC4UcMs5yvGBRjg6tiTM2CCm7oTWu74G/misSH4anfCcQRUySplle4JcTfBUQd8JlF8qyrGqpCBQXEL4JTXuRil3gAhZgxMag4l4AFwHJOlypE+QSRXDBldI5RABDDqEf6ifBjNeuM7swDc2doEkA75J5WXMS8nh7e3eCXKT5SFYUVzEJRRHH0cNdmA7gTnATJkJ0GffjP6uKhaeBisx13nlOtykN4BC+YISmS1G/YQpYkPlmYYEALg3EIXwpq3WozRXCd4yCHwg9BpELrLJfMF5GnKL8jcHx5W8rgIl/QdgNbboSST8+wKeqjoRbFZARxlnJqbbi4IHyretgo6/yGpQ4kK88y8Zv0/fNO27WYeLWU8qSAaWO221r6+KGidt941hRbF1bjU/B9qSQs2UFElHG9gzMHRyBfDxvf/sU3v7/p6c6d0XDWZwAAAAASUVORK5CYII=" > ${icon_txt}/tiktok.txt
	cat ${icon_txt}/tiktok.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_rrss_tiktok.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAIAAAD9b0jDAAABlElEQVR4Aa2RAUQDURjHHwAABYAgECAymUzArEErDYZUFJZkSotqgFBAFlKAgaGQIAsiIgIFDBBBbHfublur3/XZdrqnLd7zc9u9e9/v/d/3VLtgHtXeMw7SXeMg3TaP+swZB+mGcZBmzaNaa8ZBujIYi6qVUXZaWatDVkY108wwr4dv/UHh5CJ26fCrMxrV1/p+QtRh2F8PBfJsJJVzmnMebhChCw77bKeZ0tRSpsHNjlNgXxWt63OrfGzfltzn+7CUUVseC5eHjCnfaF0U0OGy78pATO/lSStljTfNaSgMSlM9RGofLGAUl89jRWJqpa2Pd7xAZFGDkh/erXySgNwGp8YoLiAjhKXhYW0mxIvOp360Tjqncik6EQV1zbcq/C1lmbTiRxpXuCSXWIKIcRAprfCmRBqHXlLothL+dXxqvRi2jpTYdKR+kvfvvVwE9pBt5MbkrvqfPR6Qgkw5M8P27MgvrLlReda25vUsRd0J1ZXyb2BiipbpiQVXitQ0bGIewhsHadQ4SCeNgzRiHuVOmOcbe7MFPYep+uEAAAAASUVORK5CYII=" > ${icon_txt}/soundcloud.txt
	cat ${icon_txt}/soundcloud.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_streamingmusic_soundcloud.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAEL0lEQVR4AWIgFsjdSeKRu51kKXcL0Hs5ANmxhFH4xbY1q2fbtm3PnWe/mIXYtm3bto21Ylur71QmqcndmTWqTt3p7t/qXvN/Y585DCzle7Ogb+3x/Z8RZj4h2gwLzoDiygi2UDDX2PvjEWPPjwkg2QMJ0ByGdjY8JgZXyrLigHBfEYR8auw11yD0qhRkElfhXYWMjwMirMKZVV4JL7qg+KyEZQfIOIOsjgHhVoUMKYe4JpgEc6IE5BASkTkuIMxXPW3l5AzCiWLKFWAE0XWPhPKksEOYlBvKHZHoYERahVJ7H2p+lqGcZ78mTqPrI//QV6ZiV7sQXwAxWL0OzLB7vTe57AZPD9YDwQSwBP7d0B7NSMdAuwL+ik7vLScj37vZawxehTCYWVDGiLIK14z7KZ9/5GpF/1zQiLCKQ1MF2gcUSQxqB5Yj56RXi0L3wzXlEb6SEM9xes3he9kfYFYpI9T3FLLb4vG+VF1FRCnIEoQfIqaXw4CLGh62cUU5D2T9LPgCpj/5bUgKmrHfmPX/rH9E0VvyHqWVjYifCjoNCYr5NR/0QdC2QPYJh56D8Dym8P/vP145DIOhL5iN9ZEqTpDoUVRJ4BIg/+YOtRoy/7ENKnKjyw7+np/9Xg6+BNZ/3aLCykDlJthGHAax8ETzGyel4LzL0Eqy74TxKHmHFi8WEGYVYT3EScfZQBmw1EPpSV1AELUAX+GR0nA3CCKkAZyFsHc/4X+ZPVPjFiwiCoedBslwu4Mmsz7nVwcLlILNbrcah38HRGbuEsGgEjJKabW74GI6k3GdlwFXOPw+IPrnQnhbC5oXwI+gIULb4GV70EKKwBcofQK6KgGRPxVwGFMWGV9At1IR8TbAOwXxnM1HQCjfCl1SGvVxCrqd0A/HoG9QXqNWlJVPhgSEmTU5X+thwAIZMDTDc5yQgjNSCE5rnco7BprdDWrXmhhTnb1VbjIxdoBS8J/HKyfR9moENE3Bt+A1Jt5TPLse5fdJCvA19r4HLaGbpag5DEoQP9ikyecSOU3DP8kVgmgZF4K9nN12PafVQ335uMWKUJillV/Gb+larKtEmvnsyVcIw+7QDNArSnWUTmsfxIFHuYapXAaOC8EhhP0kzzVOwTiwDGwC28Bmez0aNEHYq0SlnIzBkAoaMpKRRgdMh7749cvI9AoTSMjgNXseoRsCQs16yj0dUUT970F7BZ3f3fwSol1y6tGBrK0oH4Wi4x7eL8PICv4Pko9V4XnwIDmFrve9nmQd8+BJ1pYCLuT1T0gFFVuuGUBaeAOUT3Oe6+ksI3LhWT4aB6tm9B8TRaJDjtQEE1NhT89z95oINT+0u+NK5hXDoxuRgsNzcp7FPwZMRY1bhM3UYHHOBY+5cVBDRgPMbrWc+UNYCYx5TBMO6Dm+EKwH68ACMECznZnyqCZcRuWmAMFguk4gWsrvAAAAAElFTkSuQmCC" > ${icon_txt}/spotify.txt
	cat ${icon_txt}/spotify.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_streamingmusic_spotify.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAAAfklEQVR4Ae2RAQbAMBAE84S4e0P7/68UoCiAvqJp0CrrWBE5oocBJ8ZO0rLtlyevsDgRwhCGMISV9TgtBggfmaRUFMiVoUKEC/2T0nd8IcBk2S6D0r4/RKECwoQsDb91JMWF7Na+kCRlt+mSfsCKxhtPqjSpnU2mSOrAj4Ru3FVK6FEk/4MiAAAAAElFTkSuQmCC" > ${icon_txt}/amazonmusic.txt
	cat ${icon_txt}/amazonmusic.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_streamingmusic_amazonmusic.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAS1BMVEX/////AAD/AAD/AAD/AAD/AAD/AAD/AAD/AAD/AAD/UFD/gID/EBD/8PD/////0ND/MDD/4OD/oKD/QED/kJD/cHD/sLD/ICD/wMAc5h2AAAAACnRSTlMAMIDA/2DQIFDwpl5OWwAAANJJREFUeAF0zlcChDAIBFCSjDWCXe9/0i0sWfv7hKHQxvkAFbyjqyzHTp7RURFwEgraKStcVOVuPW79z5R4YDuKbX8dP+rtyu+P9F8TWaRtRTg26dP9A10vQ61rBum73Ru59ZlHmJHZEjmRs/291Szd2xVHHirKCIxTOj5KhPLpRR60zLMlBk5vQtVSa0CkH/8FRekCLCCyrPiQeAy0FlCxAd7jJ6wApxUSKFYQdCRBbxIMKIJBTSiyCEY3oQRDMMkRSrQEkz3hjEM46xHOvASzPwCp9RWl7WCrkgAAAABJRU5ErkJggg==" > ${icon_txt}/ytmusic.txt
	cat ${icon_txt}/ytmusic.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_streamingmusic_ytmusic.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAVFBMVEVHcEz7UGn7WnP7WnP7VW76JD76JT/7W3T7O1T6JkD7NlD7J0L7TGX7IT37Lkn7U2z7QVv7PVb7V3H////7Rl/7Gjn+yM79sLj9pa78doX/6Ov8hJI83G/pAAAACnRSTlMA4NSds7X180TYG4Dr3QAAARhJREFUKJFtk42ugyAMRrtNvco/AxzM93/P2xZBozsQrN8BTAgCAMyv59+F52sGZnj/ZGjOtn5gyc72iop7McNwjlV0asvrpvh1gIdqOFXy+g3IJ3LwAJxee+Q8dGmVhb7QhkO6GqGse8SbjApig+V3zcWsH1+jLp0KuTgjvBOHdA0VpHcRC5SiRl16FfboJH0jBlML/Kao1W+5VyCEp+5FDJJroVHWCOWOI4nKl5BNjbo0ImgcLR1ilk0aatqUlWTiA0bJKRgirZQlLPj4NslplXILTX7oDJPZ5YSDzqFlqeSS9oUTLBIRJN+aSp34gZgFRk7kVnrYGWGWdf7dSby6i2akvrLQxV1u8eHw6o5Ton1PbRrpd/gHBgEsj29df9sAAAAASUVORK5CYII=" > ${icon_txt}/applemusic.txt
	cat ${icon_txt}/applemusic.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_streamingmusic_applemusic.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACsElEQVR4AYyTA3AkURRFfzQ2YtvWKDa7hjEHvbZt27Zt27Ztb3kR9b5eK7hV9/u8b9SIzCgUhkQkch/OZouVULdCLRWdziEzN5ms+kznzgeI3NxBLyMiYvu1aoUrDAaDGGwG/hckG0m3b9/OUSKRzigrm127YAFBdOt2hFAoUt8YjcaH0H8KXNC2bVsrHMf/hcFyGHhEp9NejY0tuGQ0rqlJTe1y08nJPRuAROhfAX6pVGLtAROBzb/uF8zCsPx46LwCXgVBfGg0hgeHY1NModDDyYEYhqEOHdpx0tIylsTHF32Uy/UXxGJ3A+LxHNRhYaqdEkn+05yc3O1t27ax0ev1qBFRfHwS5w8adJMYP/49bM30EkkkFY9HjnxK9O59jvDyki8gT9zc3Bw1IisPD+ns3r3PEyNHPiNIFpFRxo17RwwceIPw9k6YT87SGG1n54FYLF54dHTuValU+0AodNIhW1vPNvHxle+jozXnaDRujI2ND2pMFRXlqLKygltaWnKgoEA39ev56XQa64IC7Qm1WtlzxIhhjcK7dm1GBQWFCG4jFQ75GVj39axMJhMVKktJQ5kC+X9fpoUF1R+WbMjJyTkG4B4YJ4Ab+/kGqvX66qdRUTFdGQxhkaUlxc3ePugryWIJycxDJqs6aTKtq09ONtVERETqvb1D0M8AXbp05Ccnp23LyOjcoNevqgkPV+8SCFhuHTt2ZLVr19olNDR6BI6vqSFfZqdOe2vFYo9qX98U9FNhYUrk6Bg0oG/fc8T8+QRRXDwdXmDacVjmPvA9pVL5LDHR9K5Tp/1EWlr3xzQaJw6C/OQBDkUcjm0uhg1/Q34gmaz8al5e7iyAJ8MKe1dXV0nZbF6CUOjag8HgJwFigf4jKpv9ZWIRQJNbgFnZ3MfHlSknJ5cJ5EV8AACsCfUJMvR/UwAAAABJRU5ErkJggg==" > ${icon_txt}/geogebra.txt
	cat ${icon_txt}/geogebra.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_recursosdigitales_geogebra.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAOVBMVEVHcEz7+/v///////////////////////9+qOgAW9eFrOgZbtqzy/GuyPDx9v1tnOU9ft5PieDe6fmixuR+AAAAB3RSTlMAJ4qgniZd2HlVdwAAAH1JREFUeAGc0kUShEAQRFHaXe9/2ME9i4j524eTw1eMC3lLcLWYNq/pyZQBqRE5Qj6iQChGlAjljtadu6HxwcY0F+0Dc6nZLMU7jrVRIebWMkTTa4E4avAUFuKyjX6gf16F+ggWfz784UHy62fjmdADo6c5pp6jltuof8MNAC9rEwgv9u4qAAAAAElFTkSuQmCC" > ${icon_txt}/virustotal.txt
	cat ${icon_txt}/virustotal.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_recursosdigitales_virustotal.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAnFBMVEVHcExsbGxjYncAAACZmZkAAAAXFxdHR0aYmJhqamogLIJ/foBsbGyEhIShoaH///9kZGSlpabR0dG+vr739/fk5OS4uLje3t53d3iOjo8mJidrbGxTVFSvsLDIyMiCgoPY2NhcXFwSEQ3t7eyUAAA7Ozu1NTVJHwDoAAD//23n2wAAFXmsrl307zmnqVAAAGooa5YSSYG0tjLOAACUDAz+AAAAD3RSTlMAMOOjyAbu/f5S8btU9cBDnp3VAAABN0lEQVQokX3RaXODIBAGYMyFSdoihwJyeDdN0snR/v//VkSrMZnx/foMu8suAG1WyVMWazBkhRBjrEJDws36EXEoolENHrXFIhV8RDSqQwmhih/Q6zro0HCs+5cxQziOudyAAC87zIXOvTGRISqyTELwnsFli5913aOGKkKckFyBAJZq+eHwq0OGdVkShLglyjVcxLtmwAozU1LCXGePYHG7Rz2yy09SYuLrV5H/ye52Vh7Z5Xj6N4Q6BLv79fBbF+T7eDpgQtAE9+fztTzAqfUYUkoTg0OZCaHaYR7R+L3YBEtRpMSyF2R8Bt2/Ene2IrVPuLfUhJnSTZqW+hm3hJOOYZrRfDrQG2dVbo0r2iKf4jZGrG0p1SzqGRSzWMyjtK+Iqpw6jBpJBvTHBoHxW1eFWwOMhjR/TyM0sydNkRwAAAAASUVORK5CYII=" > ${icon_txt}/paint_online.txt
	cat ${icon_txt}/paint_online.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_recursosdigitales_paint_online.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAnFBMVEVHcEziWkXiWkXiWkXiWkXiWkXiWkXhWUTiWUTiWkXhWUXiWkXiWkXiWkXiWkXlW0Y7Yn3s8fTn8vbiTzciRlriVkA1XnrRUj4OQlqlRTi3SDeyOybicGDZ3uLm6eu5xMuInawjVHFAR1bXVD/ewsHVsq/I0NVmeYbjp6Hk19gvWHLjg3fHSjbPjodngpV5kaFXd42mucWPUFC+c2prS8AmAAAADnRSTlMA0Xri2WbDHiyJCZuUnmJD08UAAAEjSURBVCiRpZLZeoIwEIWhUiutZiUB2SmbuNu+/7s1I4lG7E2/nhv4+DkzyZxxnP9rsZwhJc9/e0Yu0sJoPsEv8FkI88OrzVaKcJymnGvqP/j4bmCM5Rs+9S4U2zCaFR1lgylt+npI7FjeR1G07VijvfO7caB9VZaEBBlLhW39QCJlXUUuF0lkSU3b8UwzqFpsyflMiDxSU9e9QgROBUHyRFtzYGDv6lnn+ZWRqmAHMYG8pV0lpaxKmu2xBR14iTOalcdTQWn/ibAFIQwRN4wqqdsGmrr6KtA1+W6b9pCsg0BT3wwBgtonSRLX4Ujv8xujxCCEgUZf2IxvtN6yVjSK8W3wY9R3Gq9DO+7VA61DO+yJd7Im9oKhpwUDvPSA/Laaf9cPVxUi4W9UeZYAAAAASUVORK5CYII=" > ${icon_txt}/urlscan.txt
	cat ${icon_txt}/urlscan.txt | sed 's/^data:image\/png;base64,//' | base64 --decode > ${icon_app_web_d}/icon_recursosdigitales_urlscan.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADgAAAAdCAMAAADIOV+pAAAAflBMVEX///8AAACtra0AasAAZr5ra2sAaL8aGho5OTmuxOLf6PTo7ve9zuje3t7q6uqysrLW1taSkpIye8UAYb1GRka6urry8vIxMTHKysoZccJwnNKbm5thYWHDw8P4+vwpKSmNrth/f3+YtdxNh8pTU1OlvuCKiopzc3OCp9bK2e4in2UZAAAA80lEQVQ4je2SYW+CMBCG39riECh0sALtkOmcVv//H9y1DDSwmCzZl2U+ycsRLk+a6wE8+OfUqxFstQ5BrbWk5PnUK4Dsix6Jf6BhI/4VbxRIxlaUop16DXbVOiBKHKsqQc6u4gt7QkwZRX0VYxhjBMFNlW64COJeqsBCLHqlpGNs65ulKdMkSd65mMTXcdyF6D8+M1b7WhpjiYO5J358L3LC3BM7Gkr9XGxO5LVQc5EffDnezDi7VU/bZ4sTZ2J9I8bDLv15fLMQ14MoaB2C9gjZRQMdTm5Pca7F2V7yiCqhXRTEs935klmbXii/8tc++Lt8AmYTFAZ+umuzAAAAAElFTkSuQmCC" > ${icon_txt}/civitai.txt
	cat ${icon_txt}/civitai.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_ia_civitai.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAASFBMVEUAAAAAAAAAAAAAAAAAAAAODg4lJSUxMTF5eXeLi4o5OTnz8/C1tbP///7k5OGwsK5oaGfAwL7OzsydnZxbW1pFRUTY2NZLS0pmsWyyAAAABXRSTlMzx//IxgDMHHYAAAEOSURBVHgBddLhEoMgCADgxhaGmCiqvf+bblrdpnfjD3mfpFDL8oA/8ZxtiNdy5vVMiMPyQrP1RNTTZga0TG23c62M2I64e0EAEQAUv0/IIaptaGMMPOMKSbNI1gTrL66ImQsiVe8rIRbOiOuFNrnITuRz2O4/yXF0yVx4VEctUsPUH109btTcJyBO1UnvMesXQ3t5dFbEur4zjFhUTGvFOB9mDD7BOQRInAbMKxPcCLTjcObBCPdsAfn4VpaqsWP2PneMWsuFuFFqGJRZQ8NEG/7OFmGrFCPVDXAavGEkT+1CnzSj5ejDedvg41y513y3kuv8sfX4tnLoiFh+f7CCA15hzLBcXvA3Hsvy/G9viXYUStfpMwoAAAAASUVORK5CYII=" > ${icon_txt}/perplexity.txt
	cat ${icon_txt}/perplexity.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_ia_perplexity.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAADP0lEQVRYhb2XTYwURRiGn2oQdFEnBBPQCNGLtfwENP7UxJNgXBJiDbge1AMHYyIEEhKIwslEAzFiOOlJIzcTQbMhO03CiXjwhy0xympgpxKCISQuQiIrGJANTnmYbqampnp2d3D2vXR97/f1975TXVPdJQgglX4NeAnoB5YA9wHzgCSs7YA6cBO4DowDp4Fha9IvwkLRFK48AW4kE+sVJoFnrElHcyJpiOvnwP3UY3Gy/qek0mtzQvSXdck5JnosHMNCa9KJxDkOzuCm48Bu4ADw9x0a+BJgLvDytMoFq+xIetpj3paqcgjcK10aeAFASKXdFIX1pE5p7GQa/cVS6Qmg1KWJZ6fx10oeKRLP8FGX4oBYNpWBLdYMX/AJqSpPBk2GujfgFnUy8Ks16aet4noA3I9S6adyzprqaPut08ZdhQYEYiBCH8uuTwf8H10amF9k4OOaqV70Can0bprb8bKg/kyXBuL7uzXpjgi93xsvDHLnCvrfBD4DbJGBuRFuT0hIpbcF1P1BfD7S5xNr0q1ej8vAA2FR2wxYk34YaXYgiPuCeDyI1/niGdrehNA+A++GBVLpjcA9AR2+tC5l10kSsdSeqF6iHdHH1GLAmvS9SM3+CHdvayj+AueSelIaM8P/xIQoeHf4j+BwmOxXeiUgpzIgqP8ixLy7x04WigPcipG3Z0DAB2HSwd6CZkv8oGaOXvFjWdYP49hlTbrLo2/EGuUzcLlm0lN+Yrna2Efj0yyGBwt4ZFk/juMCsFOqyqNe6s9OBr4JE3XqsfXQFFJ6ccg9Vn6xjOPnPBa4lc2xONvJwEOtzSsl4K1OBoDtgaFNwokTPudgdT6umepvsSb5GihLpd90Ys6QcP8OgPt8CnGAd6TSvwOjwA7g1UjNBuB9Lz4IvOHFt6bzQXJnEMkCOzJ8PQ+l0seBdVk4GNuK/1+4+hFgfR5akz7vp2dy2OgWA1LpfUXJ3j+CJr5DiM12pHUxCqn0EDA4SyYArgBfgzhkTfWrhDm8Povi0PiWGAS+BUjs9+lVmqtyViBgrTXV8WzcgFR6DfADvT+clq1Jvd0yQHY83wSsoLHn9wHzmfnxfBK4BlwEasCR2PH8P+tg6M0Z9zE+AAAAAElFTkSuQmCC" > ${icon_txt}/mylens.txt
	cat ${icon_txt}/mylens.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_ia_mylens.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAABJklEQVR4Ae2SgUdDYRTFz5t3aWgDEBCAALW/owYQgh4PSX9BjP0XY4IEsICAJAAboATwFoQQgF49Nwdx3zXb+5DMvsMPrnPOd/AhKmqRdAapoUgQKGZ8T/PHX6A1npEhUMz4HnavwYA4YATRe1Q17vCoE4wNl3DireZhxveMmg64hS5lgimceFuZiwMaD7hJqqVcJ086SHsW3lbmGg3IIToU/RPytRgQBxxAyuPtyvJ12h7aD/d9tnXiPbxZDzPew+5mA/pdtXwedTMYlYednvfwBiNmvCcOWDigAPYKQfbLXJB/7Lcry/tuemU9bzuti7LfGVt4sx5mfA+7rYdv4zXF+VygIRSCKZx4C+3h23HA/w8YAK0ZICE8ACmceAvt4duI2nj9ACFeL7PIuCqAAAAAAElFTkSuQmCC" > ${icon_txt}/chat-mistral.txt
	cat ${icon_txt}/chat-mistral.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_ia_chat-mistral.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAQlBMVEVHcEx8Efd8Efh8Evh8EfiHEvx6EfN8EviAAvt6EfOPOPqaVvrVvf3////y6v52APi1ivvi0f3Fo/xrAPZxEfVvC/VsCcKcAAAAFnRSTlMATZjK6v8U//8j///////////////7Wt+p1gAAAZxJREFUeAFtk4HOqyAMhR2KZdBSsOz9X/Uems2w3f8kRJPvs20QtiWPsB8xHnt4bH/kDHFJOH/5iokoUvj+/LgpWEyEHEuRZ1yTcknQiJ739zfBSjGxZPJ8ahxvXqsmbkl7V1KdXb7nS5dkla6qiZSvaYS1QU5RGIL1psrCEAaa3AWKNO2ilbNcxljAw0sA5pxS6tKytMoszr3AGNjfGMF6xmzAtXa5nGcYcB7eobDEcik8QaDoJYIeSNh2CAlhkauKpzNWU2+xvzchqaIMHEU/PMh0mNkYxxadc5+RaqSEzxGi3hmGC5R6nZkCqUhFiDDwFA7wGFUtYjBpZgwBD/u02CGAF7TmCobV53sBRfYtgKfL52MBhYMdQxkXXmF7QNBam879675RHZ3GuwKOJ1pAUQX/bPU0Jkfmz/LTk4r/I61cQKfhPEA4yQ0tmLSZdKvVbuPcvIRHSU2n0CTDqOYFPAd5rLIZz4MA5jMcjr0JomiuDu6c97F/G/h7tPDnenEISL/wcnE+k46lwCv8f3nX+svl/bn+4/Vz/f8BIWwnEwec298AAAAASUVORK5CYII=" > ${icon_txt}/piclumen.txt
	cat ${icon_txt}/piclumen.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_ia_piclumen.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAASFBMVEVHcEyHh9mRkdyAgNaBgdednOCdnOBwcdKAgNaAgNaCgtednOGbmuByc9NwcdJeX82NjNtqa9BaW8ybmt9gYc2eneFgYc1eX82d8CXJAAAAGHRSTlMAOpCy2NlWXfb///9qH39q/////v+8k8oNeUZ1AAAAsklEQVR4AaXO4RKEEBSG4QOSik1R93+nWzvGOofNj33Hv+8ZQBnjQqrcACQ9GjNNc24BnDB3v4E0z0CYZ8BMB8gOsKYDdA/wHhB/A9cDrAVeUNQAKwKuBh4BGClYNwwsAXsIGABDYA8VACu/YA0YpJi4xD37jQIeU2r3frtnCtLL10nrlS7AMqdKYAtgWwDKVA0OBNhnRABwkd6ggaQwOKAqlsBBoyH/4bTQjvGoztOh+Q0EehzbNBlNlgAAAABJRU5ErkJggg==" > ${icon_txt}/giz.txt
	cat ${icon_txt}/giz.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_ia_giz.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAYAAAByDd+UAAACSElEQVR4AcWWA6wkQRBAZ8+27ejCs23btm3btm3btm0EZ/tu1VO3tT8zXZN0fs18JnmjxmvVpLRkcVLHqNS7uuWuQpYx5QwaVoxKwtXYmBn3jcJ34qicb8dUDP/M8TnShHYOk6YfirEE9sd4BjtiPDBZS1gs0WfFeEgRU2NcEJNi9BfNmya3fWi84zLmhT2uXwERmKx3hbDEij47homYIvFPiPEB+8EOuTAJWsWyGFlgd8wjKHYolNJxMb5LaShCusHnVgyuPmTxCTcyeN1+QNZumLZGn+GqawccOBHxgX+uzvWcRaZ8+xF73i/QVn0BbdP7j+GIST4OcfM3dLjzyBRufiu0a9/ThjUs6H4i5pLSgn811y+40fwMbOt9GbYNOgMn+x59jN8M3PVGL6R4G7ZeJGkxxdOwbi0qoCiFeHdXP/DaXX0HIAGJiafmEnDXmRrEU39IEG+DdlYaNhTeRg0ekAPE/7xxL3/X3HMNhUTGClFGUcWncupGIVReW3xPp6svjOVF9g/Z81W5pAro8ir3UCVOMMJ/wXKI9r5r7fQ3R9+VBfTetbO+xyLc87JSeP6zbDxNKQl1B1QRUG7EL8AYRfo397TC78iA1lAnNHr01PPT/tglHV3ga8KJpeHclOIAyITyAKNrSIY0kfTtIOnZHXQDXKWevUQeKbQpRZlzoQRnqzlJhMaX05uhOCB6aDC0ETxABrQKoXdnSc8ekh694SnONHqSKMUyst+c5EBsHPKEIy+114iX2U2io2EPmaTWgJuB3fL/zl3GTWU6gWgAAAAASUVORK5CYII=" > ${icon_txt}/aiease.txt
	cat ${icon_txt}/aiease.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_ia_aiease.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAaVBMVEVHcEwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD///9jY2P5+fnW1tZZWVny8vJQUFC+vr6np6dxcXGBgYE4ODiMjIy3t7fGxsbo6OgTExMoKCi/T8vOAAAAEHRSTlMApeC+lRtnVDRECyl9+IPuvtK9QwAAAQxJREFUKJF9ku2igiAMhv1Gj1kM0PxM6/4v8owNE816fw0eYO/GgmBTLrJMpMGJRCydwvKA8pv0FP/5LJEHFRuLj0xKsbLwk0mZMyvW9bOfBvWmDN2iNkB6rKYtyzjuALr69epngJp3rOWIoge07sbYOHoNgpSCHq/Ny2Imu9BAexF2hoJGY0ZjNOi7lHfonKULmUEjgw2UBqRGE0y5OehmVAOl0ggmGLnUhO0stgqNWMGEDhRDerbFhGocyKc2eEDxs4LhzL4aTNis0JXSwpPggHbeMHJNaLkyLKLf4GVr36fox6tzluy/bKfq25BYlT9GwRui65Hlu9GMfBQeh7pYR7BKToe+FJkofPIPgecmYav2MX4AAAAASUVORK5CYII=" > ${icon_txt}/notebooklm.txt
	cat ${icon_txt}/notebooklm.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_ia_notebooklm.png

	echo "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAclBMVEVHcExPcak8edozfe1Cd85Idb5AeNE7et08eds4gqw8edraJIPfH4XlGYbKMX/PLYDUKYLYJoPUKYKIWHXmJ4DCXGbrX2PpXWTFgVXwlUjZtz3cuTyZr1yhtVlTon1Vp30/gIgOmaEjjpsAl6gakqAviZUKnGfvAAAAJnRSTlMADl//diaJmbhS1mnB/0hYkqaeNf+H//+L/93ptP+w/z3/k/+iibpQ+FwAAACISURBVHgBvctFEgIBEATBYd3dXf//RNzpwaGuGUXnLQRhQUyCuE7CJovbZIjKDlWI6g41iPoOBYJpGzOISTIMhf6caVkmZ5a9zsLm2NtciN4O/XsYQAyjbSHB4iRNk5iYsjzPiK0oeavquuKsadc12Lp+mw5xGLdNr2O3w45g88YGYgrn+eJbAfJqCva/OGd7AAAAAElFTkSuQmCC" > ${icon_txt}/lemonslice.txt
	cat ${icon_txt}/lemonslice.txt | sed 's/^data:image\/png;base64,//' | base64 --decode >  ${icon_app_web_d}/icon_ia_lemonslice.png

	wget https://res.cdn.office.net/officehub/officestartresources/m365-logo_light_and_dark.svg -O ${icon_app_web_d}/icon_ms_office365_center.png
	wget https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Microsoft_Office_PowerPoint_%282019%E2%80%93present%29.svg/120px-Microsoft_Office_PowerPoint_%282019%E2%80%93present%29.svg.png -O ${icon_app_web_d}/icon_ms_poweroffice.png
	wget https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Microsoft_Office_Excel_%282019%E2%80%93present%29.svg/120px-Microsoft_Office_Excel_%282019%E2%80%93present%29.svg.png -O ${icon_app_web_d}/icon_ms_excel.png
	wget https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Microsoft_Office_Word_%282019%E2%80%93present%29.svg/120px-Microsoft_Office_Word_%282019%E2%80%93present%29.svg.png -O ${icon_app_web_d}/icon_ms_word.png
	wget https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Microsoft_Office_OneDrive_%282019%E2%80%93present%29.svg/100px-Microsoft_Office_OneDrive_%282019%E2%80%93present%29.svg.png -O ${icon_app_web_d}/icon_ms_onedrive.png
	wget https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Microsoft_Office_OneNote_%282019%E2%80%93present%29.svg/120px-Microsoft_Office_OneNote_%282019%E2%80%93present%29.svg.png -O ${icon_app_web_d}/icon_ms_onenote.png
	wget https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Microsoft_Office_Outlook_%282018%E2%80%93present%29.svg/100px-Microsoft_Office_Outlook_%282018%E2%80%93present%29.svg.png -O ${icon_app_web_d}/icon_ms_outlook.png
	wget https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg/120px-Microsoft_Office_Teams_%282018%E2%80%93present%29.svg.png -O ${icon_app_web_d}/icon_ms_team.png
	wget https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Microsoft_Forms_%282019-present%29.svg/250px-Microsoft_Forms_%282019-present%29.svg.png -O ${icon_app_web_d}/icon_ms_forms.png
}

function file_menu_browser_web_default_jwm_funcion() {
cat << EOF > ${rm_mn_ext_d}/AppsWebs_RecursosDigitales.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="/etc/jwm/Config-JWM/IMGs/Icons/moka-icon-theme/moka_d/Moka/48x48/apps/accessories-media-converter.png" label="Recursos Digitales">
		<Program icon="${icon_app_web_d}/icon_recursosdigitales_virustotal.png" label="VirusTotal">/usr/bin/x-www-browser --app=https://www.virustotal.com/gui/home/upload</Program>
		<Program icon="${icon_app_web_d}/icon_recursosdigitales_geogebra.png" label="Geogebra">/usr/bin/x-www-browser --app=https://www.geogebra.org/calculator</Program>
		<Program icon="${icon_app_web_d}/icon_recursosdigitales_paint_online.png" label="Paint Online">/usr/bin/x-www-browser --app=https://jspaint.app/</Program>
		<Program icon="${icon_app_web_d}/icon_recursosdigitales_urlscan.png" label="URLScan.io">/usr/bin/x-www-browser --app=https://urlscan.io/</Program>

	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_ext_d}/AppsWebs_Google_Office_Online.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="/etc/jwm/Config-JWM/IMGs/Icons/moka-icon-theme/moka_d/Moka/48x48/web/web-google.png" label="Google Office Online"
		<Program icon="${moka_d}/web/web-google.png" label="Google Office Online Center">/usr/bin/x-www-browser --app=https://docs.google.com/</Program>
		<Program icon="${moka_d}/web/web-google-docs.png" label="Google Document (Documento)">/usr/bin/x-www-browser --app=https://docs.google.com/document/</Program>
		<Program icon="${moka_d}/web/web-google-sheets.png" label="Google Sheet (Hoja de Calculo)">/usr/bin/x-www-browser --app=https://docs.google.com/spreadsheets/</Program>
		<Program icon="${moka_d}/web/web-google-slides.png" label="Google Slide (Presentacion)">/usr/bin/x-www-browser --app=https://docs.google.com/presentation/</Program>
		<Program icon="${moka_d}/web/web-google-forms.png" label="Google Forms (Formulario)">/usr/bin/x-www-browser --app=https://docs.google.com/forms/</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_ext_d}/AppsWebs_MS_Office_Online.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="/etc/jwm/Config-JWM/IMGs/Icons/moka-icon-theme/moka_d/Moka/48x48/web/web-microsoft.png" label="Microsoft Office Online"
		<Program icon="${icon_app_web_d}/icon_ms_office365_center.png" label="Microsoft 365 (Center Office)">/usr/bin/x-www-browser --app=https://www.office.com/</Program>
		<Program icon="${icon_app_web_d}/icon_ms_word.png" label="Microsoft Word (Documento)">/usr/bin/x-www-browser --app=https://www.office.com/launch/word</Program>
		<Program icon="${icon_app_web_d}/icon_ms_excel.png" label="Microsoft Excel (Hoja de Calculo)">/usr/bin/x-www-browser --app=https://www.office.com/launch/excel</Program>
		<Program icon="${icon_app_web_d}/icon_ms_poweroffice.png" label="Microsoft PowerPoint (Presentacion)">/usr/bin/x-www-browser --app=https://www.office.com/launch/powerpoint</Program>
		<Program icon="${icon_app_web_d}/icon_ms_forms.png" label="Microsoft Forms (Formularios)">/usr/bin/x-www-browser --app=https://forms.office.com/</Program>
		<Separator/>
		<Program icon="${icon_app_web_d}/icon_ms_outlook.png" label="Microsoft Outlook (Correo)">/usr/bin/x-www-browser --app=https://outlook.office.com/mail</Program>
		<Program icon="${icon_app_web_d}/icon_ms_onedrive.png" label="Microsoft OneDrive (Almacenamiento Nube)">/usr/bin/x-www-browser --app=https://onedrive.live.com/</Program>
		<Program icon="${icon_app_web_d}/icon_ms_onenote.png" label="Microsoft OneNote (Bloc de Notas)">/usr/bin/x-www-browser --app=https://www.onenote.com/</Program>
		<Program icon="${icon_app_web_d}/icon_ms_team.png" label="Microsoft Teams (Comunicacion)">/usr/bin/x-www-browser --app=https://teams.live.com/</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_ext_d}/AppsWebs_BROWSER.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${faba_d}/apps/internet-web-browser.svg" label="Motores de Búsquedas">
		<Menu icon="${icon_app_web_d}/icon_search_astiango.png" label="AstianGO">
			<Program icon="${icon_app_web_d}/icon_search_astiango.png" label="AstianGO [App Web]">/usr/bin/x-www-browser --app=https://astiango.co/</Program>
			<Program icon="${icon_app_web_d}/icon_search_astiango.png" label="AstianGO [Nueva Ventana]">/usr/bin/x-www-browser --new-window https://astiango.co/</Program>
			<Program icon="${icon_app_web_d}/icon_search_astiango.png" label="AstianGO [Incognito]">/usr/bin/x-www-browser --incognito https://astiango.co/</Program>
		</Menu>
		<Menu icon="${icon_app_web_d}/icon_search_bing.png" label="Bing">
			<Program icon="${icon_app_web_d}/icon_search_bing.png" label="Bing [App Web]">/usr/bin/x-www-browser --app=https://www.bing.com/</Program>
			<Program icon="${icon_app_web_d}/icon_search_bing.png" label="Bing [Nueva Ventana]">/usr/bin/x-www-browser --new-window https://www.bing.com/</Program>
			<Program icon="${icon_app_web_d}/icon_search_bing.png" label="Bing [Incognito]">/usr/bin/x-www-browser --incognito https://www.bing.com/</Program>
		</Menu>
		<Menu icon="${moka_d}/apps/brave.png" label="Brave">
			<Program icon="/usr/share/icons/hicolor/48x48/apps/brave-browser.png" label="Brave [App Web]">/usr/bin/x-www-browser --app=https://search.brave.com/</Program>
			<Program icon="/usr/share/icons/hicolor/48x48/apps/brave-browser.png" label="Brave [Nueva Ventana]">/usr/bin/x-www-browser --new-window https://search.brave.com/</Program>
			<Program icon="/usr/share/icons/hicolor/48x48/apps/brave-browser.png" label="Brave [Incognito]">/usr/bin/x-www-browser --incognito https://search.brave.com/</Program>
		</Menu>
		<Menu icon="${icon_app_web_d}/icon_search_duckduckgo.png" label="DuckDuckGo">
			<Program icon="${icon_app_web_d}/icon_search_duckduckgo.png" label="DuckDuckGo [App Web]">/usr/bin/x-www-browser --app=https://duckduckgo.com/</Program>
			<Program icon="${icon_app_web_d}/icon_search_duckduckgo.png" label="DuckDuckGo [Nueva Ventana]">/usr/bin/x-www-browser --new-window https://duckduckgo.com/</Program>
			<Program icon="${icon_app_web_d}/icon_search_duckduckgo.png" label="DuckDuckGo [Incognito]">/usr/bin/x-www-browser --incognito https://duckduckgo.com/</Program>
		</Menu>
		<Menu icon="${icon_app_web_d}/icon_search_ecosia.png" label="Ecosia">
			<Program icon="${icon_app_web_d}/icon_search_ecosia.png" label="Ecosia [App Web]">/usr/bin/x-www-browser --app=www.ecosia.org</Program>
			<Program icon="${icon_app_web_d}/icon_search_ecosia.png" label="Ecosia [Nueva Ventana]">/usr/bin/x-www-browser --new-window www.ecosia.org</Program>
			<Program icon="${icon_app_web_d}/icon_search_ecosia.png" label="Ecosia [Incognito]">/usr/bin/x-www-browser --incognito www.ecosia.org</Program>
		</Menu>
		<Menu icon="${icon_app_web_d}/icon_search_gibiru.png" label="Gibiru">
			<Program icon="${icon_app_web_d}/icon_search_gibiru.png" label="Gibiru [App Web]">/usr/bin/x-www-browser --app=www.gibiru.com</Program>
			<Program icon="${icon_app_web_d}/icon_search_gibiru.png" label="Gibiru [Nueva Ventana]">/usr/bin/x-www-browser --new-window www.gibiru.com</Program>
			<Program icon="${icon_app_web_d}/icon_search_gibiru.png" label="Gibiru [Incognito]">/usr/bin/x-www-browser --incognito www.gibiru.com</Program>
		</Menu>
		<Menu icon="${icon_app_web_d}/icon_search_google.png" label="Google">
			<Program icon="${icon_app_web_d}/icon_search_google.png" label="Google [App Web]">/usr/bin/x-www-browser --app=https://www.google.com/</Program>
			<Program icon="${icon_app_web_d}/icon_search_google.png" label="Google [Nueva Ventana]">/usr/bin/x-www-browser --new-window https://www.google.com/</Program>
			<Program icon="${icon_app_web_d}/icon_search_google.png" label="Google [Incognito]">/usr/bin/x-www-browser --incognito https://www.google.com/</Program>
		</Menu>
		<Menu icon="${icon_app_web_d}/icon_search_startpage.png" label="StartPage">
			<Program icon="${icon_app_web_d}/icon_search_startpage.png" label="Startpage [App Web]">/usr/bin/x-www-browser --app=www.startpage.com</Program>
			<Program icon="${icon_app_web_d}/icon_search_startpage.png" label="Startpage [Nueva Ventana]">/usr/bin/x-www-browser --new-window www.startpage.com</Program>
			<Program icon="${icon_app_web_d}/icon_search_startpage.png" label="Startpage [Incognito]">/usr/bin/x-www-browser --incognito www.startpage.com</Program>
		</Menu>
		<Menu icon="${icon_app_web_d}/icon_search_qwant.png" label="Qwant">
			<Program icon="${icon_app_web_d}/icon_search_qwant.png" label="Qwant [App Web]">/usr/bin/x-www-browser --app=www.qwant.com</Program>
			<Program icon="${icon_app_web_d}/icon_search_qwant.png" label="Qwant [Nueva Ventana]">/usr/bin/x-www-browser --new-window www.qwant.com</Program>
			<Program icon="${icon_app_web_d}/icon_search_qwant.png" label="Qwant [Incognito]">/usr/bin/x-www-browser --incognito www.qwant.com</Program>
		</Menu>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_ext_d}/AppsWebs_Streaming.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${moka_d}/apps/multimedia-video-player.png" label="Streaming Vídeo">
		<Program icon="${icon_app_web_d}/icon_streamingvideo_kick.png" label="Kick">/usr/bin/x-www-browser --app=https://kick.com/</Program>
		<Program icon="${icon_app_web_d}/icon_streamingvideo_twitch.png" label="Twitch">/usr/bin/x-www-browser --app=https://www.twitch.tv/</Program>
		<Program icon="${icon_app_web_d}/icon_streamingvideo_trovo.png" label="Trovo">/usr/bin/x-www-browser --app=https://trovo.live/</Program>
		<Program icon="${icon_app_web_d}/icon_streamingvideo_rumble.png" label="Rumble">/usr/bin/x-www-browser --app=https://rumble.com/</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_ext_d}/AppsWebs_MSG.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${faba_d}/status/mail-attachment.svg" label="Mensajeria">
		<Program icon="${icon_app_web_d}/icon_chat_discord.png" label="Discord">/usr/bin/x-www-browser --app=https://discord.com/</Program>
		<Program icon="${icon_app_web_d}/icon_chat_googlechat.png" label="Google Chat">/usr/bin/x-www-browser --app=https://chat.google.com/</Program>
		<Program icon="${icon_app_web_d}/icon_chat_skype.png" label="Skype Web">/usr/bin/x-www-browser --app=https://web.skype.com/</Program>
		<Program icon="${icon_app_web_d}/icon_chat_telegram.png" label="Telegram Web">/usr/bin/x-www-browser --app=https://web.telegram.org/</Program>
		<Program icon="${icon_app_web_d}/icon_chat_whatsapp.png" label="WhatsApp Web">/usr/bin/x-www-browser --app=https://web.whatsapp.com/</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_ext_d}/AppsWebs_IA.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${moka_d}/apps/cheese.png" label="Inteligencia Artificial">
		<Program icon="${icon_app_web_d}/icon_ia_chatgpt.png" label="ChatGPT">/usr/bin/x-www-browser --app=https://chatgpt.com/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_deepseek.png" label="DeepSeek">/usr/bin/x-www-browser --app=https://www.deepseek.com/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_gemini.png" label="Gemini">/usr/bin/x-www-browser --app=https://gemini.google.com/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_mscopilot.png" label="Microsoft Copilot">/usr/bin/x-www-browser --app=https://copilot.microsoft.com/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_leonardoia.png" label="Leonardo.AI">/usr/bin/x-www-browser --app=https://leonardo.ai/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_openart.png" label="OpenArt">/usr/bin/x-www-browser --app=https://openart.ai/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_sunoia.png" label="Suno.AI">/usr/bin/x-www-browser --app=https://suno.com/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_deepai.png" label="DeepAI">/usr/bin/x-www-browser --app=https://deepai.org/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_pixlr.png" label="PIXLR">/usr/bin/x-www-browser --app=https://pixlr.com/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_civitai.png" label="CivitAI">/usr/bin/x-www-browser --app=https://civitai.com/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_perplexity.png" label="Perplexity AI">/usr/bin/x-www-browser --app=https://www.perplexity.ai/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_chat-mistral.png" label="Le Chat MistralAI-Chat">/usr/bin/x-www-browser --app=https://chat.mistral.ai/chat</Program>
		<Program icon="${icon_app_web_d}/icon_ia_mylens.png" label="MyLens AI">/usr/bin/x-www-browser --app=https://mylens.ai/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_piclumen.png" label="PicLumen">/usr/bin/x-www-browser --app=https://www.piclumen.com/es/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_giz.png" label="Giz AI">/usr/bin/x-www-browser --app=https://www.giz.ai/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_notebooklm.png" label="Google NotebookLM">/usr/bin/x-www-browser --app=https://notebooklm.google/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_lemonslice.png" label="LemonSlice">/usr/bin/x-www-browser --app=https://lemonslice.com/</Program>
		<Program icon="${icon_app_web_d}/icon_ia_aiease.png" label="Ai Ease">/usr/bin/x-www-browser --app=https://www.aiease.ai/</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_ext_d}/AppsWebs_RRSS.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${moka_d}/mimetypes/application-rss+xml.png" label="Redes Sociales">
		<Program icon="${icon_app_web_d}/icon_rrss_facebook.png" label="Facebook">/usr/bin/x-www-browser --app=https://www.facebook.com/</Program>
		<Program icon="${icon_app_web_d}/icon_rrss_instagram.png" label="Instagram">/usr/bin/x-www-browser --app=https://www.instagram.com/</Program>
		<Program icon="${icon_app_web_d}/icon_rrss_pinterest.png" label="Pinterest">/usr/bin/x-www-browser --app=https://pinterest.com/</Program>
		<Program icon="${icon_app_web_d}/icon_rrss_reddit.png" label="Reddit">/usr/bin/x-www-browser --app=https://www.reddit.com/</Program>
		<Program icon="${icon_app_web_d}/icon_rrss_snapchat.png" label="Snapchat">/usr/bin/x-www-browser --app=https://www.snapchat.com/</Program>
		<Program icon="${icon_app_web_d}/icon_rrss_tiktok.png" label="TikTok">/usr/bin/x-www-browser --app=https://www.tiktok.com/</Program>
		<Program icon="${icon_app_web_d}/icon_rrss_twitter.png" label="Twitter/X">/usr/bin/x-www-browser --app=https://x.com/</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_ext_d}/AppsWebs_YT.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${moka_d}/web/web-google-youtube.png" label="YouTube">
		<Program icon="${moka_d}/web/web-google-youtube.png" label="YouTube">/usr/bin/x-www-browser --app=https://www.youtube.com/</Program>
		<Program icon="${moka_d}/web/web-google-youtube.png" label="YouTube Premium">/usr/bin/x-www-browser --app=https://www.youtube.com/premium</Program>
		<Program icon="${icon_app_web_d}/icon_streamingmusic_ytmusic.png" label="YouTube Music">/usr/bin/x-www-browser --app=https://music.youtube.com/</Program>
		<Program icon="${moka_d}/web/web-google-youtube.png" label="YouTube Kids">/usr/bin/x-www-browser --app=https://www.youtubekids.com/?source=youtube_web</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_ext_d}/AppsWebs_DistroURL.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${moka_d}/places/user-bookmarks.png" label="Distros">
		<Program icon="${moka_d}/places/distributor-logo-debian.png" label="Debian">/usr/bin/x-www-browser --app=https://www.debian.org/</Program>
		<Menu icon="${moka_d}/places/distributor-logo-debian.png" label="Basada Debian">
			<Program icon="" label="Loc-OS">/usr/bin/x-www-browser --app=https://loc-os.com/</Program>
			<Program icon="" label="Antix">/usr/bin/x-www-browser --app=https://antixlinux.com/</Program>
			<Program icon="" label="Slax">/usr/bin/x-www-browser --app=https://www.slax.org/</Program>
			<Program icon="" label="Bodhi">/usr/bin/x-www-browser --app=https://www.bodhilinux.com/</Program>
			<Program icon="" label="Q4OS">/usr/bin/x-www-browser --app=https://q4os.org/</Program>
			<Program icon="" label="MXLinux">/usr/bin/x-www-browser --app=https://mxlinux.org/</Program>
			<Program icon="" label="ZorinOS">/usr/bin/x-www-browser --app=https://zorin.com/</Program>
			<Program icon="" label="Devuan">/usr/bin/x-www-browser --app=https://www.devuan.org/</Program>
			<Program icon="" label="BunsenLabs">/usr/bin/x-www-browser --app=https://www.bunsenlabs.org/</Program>
			<Program icon="" label="Kali Linux">/usr/bin/x-www-browser --app=https://www.kali.org/</Program>
			<Program icon="" label="Tails">/usr/bin/x-www-browser --app=https://tails.net/</Program>
			<Program icon="" label="ParrotOS">/usr/bin/x-www-browser --app=https://www.parrotsec.org/</Program>
		</Menu>
		<Program icon="${moka_d}/places/distributor-logo-ubuntu.png" label="Ubuntu">/usr/bin/x-www-browser --app=https://ubuntu.com/</Program>
		<Menu icon="${moka_d}/places/distributor-logo-ubuntu.png" label="Basada Ubuntu"
			<Program icon="${moka_d}/places/distributor-logo-linuxmint.png" label="Linux Mint">/usr/bin/x-www-browser --app=https://www.linuxmint.com/</Program>
			<Program icon="" label="Lubuntu">/usr/bin/x-www-browser --app=https://lubuntu.me/</Program>
			<Program icon="${moka_d}/places/distributor-logo-kubuntu.png" label="Kubuntu">/usr/bin/x-www-browser --app=https://kubuntu.org/</Program>
			<Program icon="" label="Xubuntu">/usr/bin/x-www-browser --app=https://xubuntu.org/</Program>
		</Menu>
		<Program icon="${moka_d}/places/distributor-logo-archlinux.png" label="Arch Linux">/usr/bin/x-www-browser --app=https://archlinux.org/</Program>
		<Menu icon="${moka_d}/places/distributor-logo-archlinux.png" label="Basada Arch Linux">
			<Program icon="" label="Artix Linux">/usr/bin/x-www-browser --app=https://artixlinux.org/</Program>
			<Program icon="${moka_d}/places/distributor-logo-manjaro.png" label="Manjaro">/usr/bin/x-www-browser --app=https://manjaro.org/</Program>
		</Menu>
		<Program icon="${moka_d}/places/distributor-logo-slackware.png" label="Slackware">/usr/bin/x-www-browser --app=http://www.slackware.com/</Program>
		<Menu icon="${moka_d}/places/distributor-logo-slackware.png" label="Basada Slackware">
			<Program icon="" label="Porteus">/usr/bin/x-www-browser --app=http://www.porteus.org/</Program>
			<Program icon="" label="Absolute Linux">/usr/bin/x-www-browser --app=https://www.absolutelinux.org/</Program>
			<Program icon="" label="Slax">/usr/bin/x-www-browser --app=https://www.slax.org/</Program>
		</Menu>
		<Program icon="${moka_d}/places/distributor-logo-opensuse.png" label="OpenSUSE">/usr/bin/x-www-browser --app=https://www.opensuse.org/</Program>
		<Program icon="${moka_d}/places/distributor-logo-gentoo.png" label="Gentoo">/usr/bin/x-www-browser --app=https://www.gentoo.org/</Program>
		<Program icon="${moka_d}/places/distributor-logo-deepin.png" label="Deepin">/usr/bin/x-www-browser --app=https://www.deepin.org/</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_ext_d}/AppsWebs_CompraVenta.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${faba_d}/mimetypes/package-gift.svg" label="Compra y Venta">
		<Program icon="${icon_app_web_d}/icon_compraventa_alibaba.png" label="Alibaba">/usr/bin/x-www-browser --app=https://www.alibaba.com/</Program>
		<Program icon="${icon_app_web_d}/icon_compraventa_aliexpress.png" label="AliExpress">/usr/bin/x-www-browser --app=https://aliexpress.com/</Program>
		<Program icon="${icon_app_web_d}/icon_compraventa_amazon.png" label="Amazon">/usr/bin/x-www-browser --app=https://www.amazon.com/</Program>
		<Program icon="${icon_app_web_d}/icon_compraventa_banggood.png" label="Banggood ">/usr/bin/x-www-browser --app=https://www.banggood.com/</Program>
		<Program icon="${icon_app_web_d}/icon_compraventa_ebay.png" label="eBay">/usr/bin/x-www-browser --app=https://www.ebay.com/</Program>
		<Program icon="${icon_app_web_d}/icon_compraventa_mercadolibre.png" label="MercadoLibre">/usr/bin/x-www-browser --app=https://www.mercadolibre.com</Program>
		<Program icon="${icon_app_web_d}/icon_compraventa_wallapop.png" label="Wallapop">/usr/bin/x-www-browser --app=https://wallapop.com/</Program>
		<Program icon="${icon_app_web_d}/icon_compraventa_wish.png" label="Wish">/usr/bin/x-www-browser --app=https://www.wish.com/</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_ext_d}/AppsWebs_ServMusic.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${faba_d}/apps/multimedia-audio-player.svg" label="Streaming Música"
		<Program icon="${icon_app_web_d}/icon_streamingmusic_soundcloud.png" label="SoundCloud">/usr/bin/x-www-browser --app=https://soundcloud.com/</Program>
		<Program icon="${icon_app_web_d}/icon_streamingmusic_spotify.png" label="Spotify">/usr/bin/x-www-browser --app=https://open.spotify.com/</Program>
		<Program icon="${icon_app_web_d}/icon_streamingmusic_amazonmusic.png" label="Amazon Music">/usr/bin/x-www-browser --app=https://music.amazon.es/</Program>
		<Program icon="${icon_app_web_d}/icon_streamingmusic_ytmusic.png" label="YouTube Music">/usr/bin/x-www-browser --app=https://music.youtube.com/</Program>
		<Program icon="${icon_app_web_d}/icon_streamingmusic_applemusic.png" label="Apple Music">/usr/bin/x-www-browser --app=https://music.apple.com/</Program>
	</Menu>
</JWM>
EOF

cat << EOF > ${rm_mn_ext_d}/Include_AppsWebs_JWM.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${faba_d}/apps/internet-web-browser.svg" label="Aplicaciones Webs"
		<Include>${rm_mn_ext_d}/AppsWebs_Motores_de_Busqueda.txt</Include>
		<Include>${rm_mn_ext_d}/AppsWebs_RecursosDigitales.txt</Include>
		<Include>${rm_mn_ext_d}/AppsWebs_RRSS.txt</Include>
		<Include>${rm_mn_ext_d}/AppsWebs_Streaming.txt</Include>
		<Include>${rm_mn_ext_d}/AppsWebs_ServMusic.txt</Include>
		<Include>${rm_mn_ext_d}/AppsWebs_MSG.txt</Include>
		<Include>${rm_mn_ext_d}/AppsWebs_IA.txt</Include>
		<Include>${rm_mn_ext_d}/AppsWebs_YT.txt</Include>
		<Include>${rm_mn_ext_d}/AppsWebs_DistroURL.txt</Include>
		<Include>${rm_mn_ext_d}/AppsWebs_CompraVenta.txt</Include>
		<Include>${rm_mn_ext_d}/AppsWebs_Google_Office_Online.txt</Include>
		<Include>${rm_mn_ext_d}/AppsWebs_MS_Office_Online.txt</Include>
	</Menu>
EOF
#else
#	echo ""; rmdir "${rm_mn_ext_d}"
#fi

cat << EOF > ${rm_mn_d}/Internet.txt
<?xml version="1.0"?>
<JWM>
	<Menu icon="${faba_d}/categories/applications-internet.svg" label="Internet">
		<Include>${rm_red_d}/00_Root_Menu_NMTUI.txt</Include>
		<Program icon="${faba_d}/categories/applications-internet.svg" label="${browser_web_jwm_label} [Navegador Web]">${browser_web_jwm_path}</Program>
		<Include>${rm_mn_ext_d}/Include_AppsWebs_JWM.txt</Include>
	</Menu>
</JWM>
EOF

#mover a custom
#cat << EOF > ${rm_mn_d}/Oficina.txt
#<?xml version="1.0"?>
#<JWM>
#	<Menu icon="${moka_d}/categories/applications-office.png" label="Oficina">
#<!--		<Program icon="${moka_d}/apps/libreoffice-main.png="${office_center_distro_label} [Paquete Office]">${office_center_distro_path}</Program> -->
#		<Program icon="${moka_d}/apps/libreoffice-writer.png label="${office_writer_distro_label} [Procesador de Texto]">${office_writer_distro_path}</Program>
#		<Program icon="${moka_d}/apps/libreoffice-calc.png" label="${office_calc_distro_label} [Hoja de Cálculo]">${office_calc_distro_path}</Program>
#<!--		<Program icon="${moka_d}/apps/libreoffice-impress.png" label="${office_impress_distro_label} [Presentaciones]">${office_impress_distro_path}</Program> -->
#<!--		<Program icon="${moka_d}/apps/libreoffice-base.png" label="${office_draw_distro_label} [Gestion de BDR]">${office_draw_distro_path}</Program> -->
#<!--		<Program icon="${moka_d}/apps/libreoffice-draw.png" label="${office_base_distro_label} [Editor de Gráficos]">${office_base_distro_path}</Program> -->
#<!--		<Program icon="${moka_d}/apps/libreoffice-math.png" label="${office_math_distro_label} [Matemáticas]">${office_math_distro_path}</Program> -->
#		<Program icon="${moka_d}/apps/pdfshuffler.png" label="${pdf_reader_distro_label} [Lector de PDF]">${pdf_reader_distro_path}</Program>
#	</Menu>
#</JWM>
#EOF
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function file_script_default_jwm_funcion() {
cat << EOF > ${scp_base_d}/FEH_[SCRIPT].sh
#!/bin/bash
width="\$(xrandr | grep '*' | awk '{print \$1}' | cut -d 'x' -f1)" #largo
height="\$(xrandr | grep '*' | awk '{print \$1}' | cut -d 'x' -f2)" #alto
width_p="\$(( (width * 32) / 100 ))"; height_p="\$(( (height * 32) / 100 ))"
feh --image-bg "black" --scale-down --geometry "\${width_p}x\${height_p}"
EOF
chmod 755 "${scp_base_d}/FEH_[SCRIPT].sh"

cat << EOF > ${scp_base_d}/MPV_[SCRIPT].sh
#!/bin/bash
#if [ \$# -eq 1 ]; then
#	mpv --loop-file=inf --geometry=32%x32% --player-operation-mode=pseudo-gui
#else
	mpv --loop-playlist=inf --geometry=32%x32% --player-operation-mode=pseudo-gui
#fi
EOF
chmod 755 "${scp_base_d}/MPV_[SCRIPT].sh"

cat << EOF > /usr/share/applications/FEH_[SCRIPT]_[${distro_name}].desktop
[Desktop Entry]
Name=FEH_[SCRIPT]_[${distro_name}]
Exec=${scp_base_d}/FEH_[SCRIPT].sh %F
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop
EOF

cat << EOF > /usr/share/applications/MPV_[SCRIPT]_[${distro_name}].desktop
[Desktop Entry]
Name=MPV_[SCRIPT]_[${distro_name}]
Exec=${scp_base_d}/MPV_[SCRIPT].sh %U
Icon=${distro_logo}
Type=Application
Terminal=false
Categories=DistroDesktop
EOF

image_viewer_jwm_label="FEH"; image_viewer_jwm_path="${scp_base_d}/FEH_[SCRIPT].sh"
video_player_jwm_label="MPV"; video_player_jwm_path="${scp_base_d}/MPV_[SCRIPT].sh"
task_jwm_label="TOP (CLI)"; task_jwm_path="${scp_tool_d}/TOP_[CLI].sh"
}
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××┃
# ┃××××××××××××××××××××××××××××××××-DISTRO_FUNCIONES_PROGRAMAS-××××××××××××××××××××××××××××××××┃
# ┃××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
function programa_base_funcion() {
apt update; apt -y upgrade

install_packages_for_compiling_funcion
install_app_base_funcion
user_add_sudoers_funcion
generator_directory_personal_funcion
bg_distro_funcion
file_script_distro_base_funcion; file_desktop_distro_base_funcion
grub_distro_funcion
distro_rename_funcion
autostart_gui_funcion

appweb_scripts_funcion
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function programa_base_jwm_part_one_funcion() {
programa_base_funcion
install_jwm_funcion
generator_directory_jwm_funcion
cp ${jwm_d}/debian-menu ${bkp_d}/debian-menu_original.txt
install_icon_jwm_funcion
#file_debian_menu_funcion
file_system_jwmrc_funcion

#nmtui_jwm_funcion

file_directory_home_jwm_funcion
file_script_jwm_funcion; file_desktop_jwm_funcion
file_manual_jwm_funcion
file_theme_jwm_funcion
file_root_menu_light_jwm_funcion
file_root_menu_brightness_jwm_funcion
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function programa_base_jwm_part_two_funcion() {
file_root_menu_main_jwm_funcion
#file_permission_jwm_funcion
set_app_for_default_funcion

uninstall_packages_for_compiling_funcion
file_debian_menu_funcion

nmtui_jwm_funcion

file_permission_jwm_funcion
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function programa_default_jwm_funcion() {
if [ "${arch}" -eq "64" ]; then
	clear
	echo "Que navegador web quieres?"
	echo "a) Brave-Browser"
	echo "b) Chromium"
	echo ""
	read -p "Opcion: " var_tmp
fi

programa_base_jwm_part_one_funcion

install_app_default_funcion
install_st_funcion
install_browser_web_default_funcion
file_script_default_jwm_funcion

programa_base_jwm_part_two_funcion
file_menu_browser_web_default_jwm_funcion
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function programa_custom_jwm_funcion() {
echo ""
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
function finish_msg_funcion() {
#clear
#tput setaf 4; figlet "GRACIAS POR INSTALARME"; tput smul bold; sleep 3s; echo; read -p "\"ENTER\" para Reiniciar el dispositivo"
##clear; tput rmul; echo "Reiniciando dispositivo..."; sleep 2s
#clear; tput sgr0; echo "Reiniciando dispositivo..."; sleep 2s
#reboot

clear
tput setaf 1; figlet "GRACIAS"
tput setaf 2; figlet "< ${user_name} >"
tput setaf 3; figlet "POR"
tput setaf 4; figlet "INSTALARME"
tput smul bold; tput setaf 5; sleep 2s
echo; echo; echo; read -p "\"ENTER\" para Reiniciar el dispositivo"; clear; tput sgr0
tput setaf 6; figlet "Reiniciando"
tput setaf 7; figlet "dispositivo..."
sleep 2s; reboot
}
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
#================================================================================================================================================================================================================================================================256
# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××┃
# ┃××××××××××××××××××××××××××××××××-DISTRO_FRONTEND-××××××××××××××××××××××××××××××××┃
# ┃×××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××××┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
function frontend_funcion() {
readme_funcion; license_funcion
user_name_funcion
distro_data_funcion
check_requirement_funcion
clear
echo "a|A) Omitir intro e instalar distro"
echo "b|B) No omitir intro"
echo "exit|salir) Salir y no instalar nada"
echo ""
read -p "Opcion: " intro_op
#intro_op="B"
case ${intro_op} in
	a|A) 
	if [ "${state_reqs}" == "Verifica" ]; then
		programa_default_jwm_funcion; finish_msg_funcion
	else
		clear
		echo "No cumples con algun requisito."
		echo ""
		echo "Ya sea:"
		echo "	No lo ejecutaste como usuario root"
		echo "	No lo ejecutaste en debian"
		echo "	No lo ejecutaste en una arquitectura x86"
		echo ""
		echo "Solucionalo y vuelveme a ejecutar."
	fi
	;;

	b|B)
	clear
	echo "Recuerda los requisitos:"
	echo "-->Ejecutar el script como usuario root/superusuario"
	echo "-->Ejecutar el script en Debian"
	echo "-->Ejecutar el script en la arquitectura x86"
	echo ""
	echo "Presiona ENTER para continuar"; read
	screen_loading_funcion; check_requirement_msg_funcion
	if [ "${state_reqs}" = "Verifica" ]; then
		clear
		echo "Enhorabuena, cumples con los requisitos"; sleep 1; clear
		echo "Bienvenido: <${user_name}>. Al script de instalacion de ${distro_name} ${nro_version} ${code_name_distro}"
		echo "¿Comenzamos con la instalamos?"
		echo "Y|y|S|s) Si"
		echo "N|n) No"
		echo ""
		read -p "Opcion: " op
		clear
		case ${op} in
			Y|y|S|s|yes|Yes|YES|Si|SI|si) programa_default_jwm_funcion; finish_msg_funcion;;
			N|n) echo "Vale, instalacion cancelada, no se aplicaran los cambios"; read; clear;;
			*) echo "Opcion no valida, vuelva a ejecutar el script";;
		esac
	else
		echo ""
		echo ""
		echo "Che <${user_name}>, como que algun requisito no estas cumpliendo"
		echo "Soluciones a cada caso:"
		echo "	Si. No verificas los privilegios de usuario. Intenta: Iniciar sesion como usuario ROOT/SUPERUSUARIO"
		echo "	Si. No verificas el sistema operativo. Intenta: Volver a instalar una iso de debian, o descargar e instalar una nueva iso de debian"
		echo "	Si. No verificas la arquitectura. Intenta: Ejecutar el script en x86 [es decir, en un computador i386/i686 (32bits) o x86_64/amd64 (64 bits)]"
		echo ""
		echo "Prueba las soluciones necesarias y vuelveme a ejecutar."; read; clear
	fi
	;;

	exit|salir) echo "Cancelando instalacion..., no se aplicaran modificaciones"; read; clear; exit
	;;

	*) echo "Opcion no valida, ingrese una opcion valida"; frontend_funcion
	;;
esac
}
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------256
frontend_funcion
