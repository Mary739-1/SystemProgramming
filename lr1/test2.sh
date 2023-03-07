#!/bin/sh

echo "Разработчик: Шуваркова Мария"
echo "Программа поиска информации о файле"
echo "С помощью данной программы вы можете просматривать временные метки файла"
filename=""
choice=""

while true
do
	echo "Введите имя файла:"
	read filename
	if [ -e $filename ] 
		then
			echo ""
			echo "Время последнего доступа: "; stat -c %x $filename
			echo "Время последнего изменения: "; stat -c %y $filename
			echo "Время изменения индексного дескриптора: "; stat -c %z $filename
			echo ""		
		else 
			echo "Ошибка! Файл не найден" >/dev/stderr
			echo ""
	fi
	while true
    	do
		echo "Хотите попробовать еще раз? (y/n)"
		read choice
		case "$choice" in
				"Y" | "y" | "yes" | "Yes") echo "";  break;;
				"N" | "n" | "no" | "No") echo ""; echo "Выход из программы..."; exit $?;;
				* ) echo "Ошибка. Нажмите y или n" >/dev/stderr;;
            	esac
    	done
done
