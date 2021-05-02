#!/bin/bash
largeur_calc=25
hauteur_calc=20

#====================
# Redimensionne calc
#====================
lines=$(tput lines)
colonnes=$(tput cols)
((premier_modulo_lines=lines%2))
((lines=lines/2))
((premier_modulo_colonnes=colonnes%2))
((colonnes=colonnes/2))
((lines=lines-(hauteur_calc/2)))
((colonnes=colonnes-(largeur_calc/2)))

((deuxieme_modulo_lines=hauteur_calc%2))
((deuxieme_modulo_colonnes=largeur_calc%2))

((largeur_calc=largeur_calc+premier_modulo_colonnes-deuxieme_modulo_colonnes))
((hauteur_calc=hauteur_calc+premier_modulo_lines-deuxieme_modulo_lines))

#=====================
# variables de dessin
#=====================
Hdiv=14
Ldiv=10
taille_touche_L=$(((largeur_calc/Ldiv)))
bourrage_L=$(((largeur_calc%Ldiv)))
taille_touche_H=$(((hauteur_calc/Hdiv)))
bourrage_H=$(((hauteur_calc%Hdiv)))

((largeur_display=largeur_calc-(4*taille_touche_L)))
((hauteur_display=(3*taille_touche_H)))

((cadre_haut=taille_touche_H+(bourrage_H/2)))
((cadre_bas=taille_touche_H+(bourrage_H/2)+(bourrage_H%2)))

((position_plus=2*taille_touche_L))
((position_moins=2*taille_touche_L))
((position_fois=2*taille_touche_L))
((position_div=2*taille_touche_L))
((position_egual=5*taille_touche_L))

((position_1=5*taille_touche_L))
((position_2=7*taille_touche_L))
((position_3=9*taille_touche_L))

((position_4=5*taille_touche_L))
((position_5=7*taille_touche_L))
((position_6=9*taille_touche_L))

((position_7=5*taille_touche_L))
((position_8=7*taille_touche_L))
((position_9=9*taille_touche_L))

((position_0=7*taille_touche_L))

tput clear
tput civis

bg_black=$(tput setab 0)
bg_blue=$(tput setab 4)
bg_test=$(tput setab 6)
txt_result=$(tput setaf 1)
((position_display_line=lines+cadre_haut+(hauteur_display/2)))
((position_display_col=colonnes+(2*taille_touche_L)+largeur_display))
tput cup $lines 0
current_line=$lines

	for ((j=0;j<"$cadre_haut";j++))
	do
#CADRE HAUT
		((current_line=current_line+1))
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done
#DISPLAY
	for((j=0;j<"$hauteur_display";j++))
	do
		((current_line=current_line+1))
		display_line=$current_line
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' $((2*taille_touche_L))
		echo -n $bg_black
		printf '%*s' "$largeur_display"
		echo -n $bg_blue
		printf '%*s' $((2*taille_touche_L))
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done
# Dessous display
	for((j=0;j<taille_touche_H;j++))
	do
		((current_line=current_line+1))
		printf '%*s' "$colonnes" 
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done

# + 1 2 3

	((line_dessus=(taille_touche_H-1)/2))
	((line_dessous=((taille_touche_H-1)/2)+((taille_touche_H-1)%2)))

	for((j=0;j<line_dessus;j++))
	do
		((current_line=current_line+1))
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		tput cup $current_line $((position_plus+colonnes))
		echo "+"
		tput cup $current_line $((position_1+colonnes))
		echo "1"
		tput cup $current_line $((position_2+colonnes))
		echo "2"
		tput cup $current_line $((position_3+colonnes))
		echo "3"
		tput cup $((current_line=current_line+1)) 0

	for((j=0;j<line_dessous;j++))
	do
		((current_line=current_line+1))
		echo -n $bg_black
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done
#ligne separation
	for((j=0;j<taille_touche_H;j++))
	do
		((current_line=current_line+1))
		echo -n $bg_black
		printf '%*s' "$colonnes" 
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done
# - 4 5 6

	((line_dessus=(taille_touche_H-1)/2))
	((line_dessous=((taille_touche_H-1)/2)+((taille_touche_H-1)%2)))

	for((j=0;j<line_dessus;j++))
	do
		((current_line=current_line+1))
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		tput cup $current_line $((position_moins+colonnes))
		echo "-"
		tput cup $current_line $((position_4+colonnes))
		echo "4"
		tput cup $current_line $((position_5+colonnes))
		echo "5"
		tput cup $current_line $((position_6+colonnes))
		echo "6"
		tput cup $((current_line=current_line+1)) 0
	for((j=0;j<line_dessous;j++))
	do
		((current_line=current_line+1))
		echo -n $bg_black
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done
#ligne separation
	for((j=0;j<taille_touche_H;j++))
	do
		((current_line=current_line+1))
		echo -n $bg_black
		printf '%*s' "$colonnes" 
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done
# x 7 8 9

	((line_dessus=(taille_touche_H-1)/2))
	((line_dessous=((taille_touche_H-1)/2)+((taille_touche_H-1)%2)))

	for((j=0;j<line_dessus;j++))
	do
		((current_line=current_line+1))
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		tput cup $current_line $((position_fois+colonnes))
		echo "x"
		tput cup $current_line $((position_7+colonnes))
		echo "7"
		tput cup $current_line $((position_8+colonnes))
		echo "8"
		tput cup $current_line $((position_9+colonnes))
		echo "9"
		tput cup $((current_line=current_line+1)) 0
	for((j=0;j<line_dessous;j++))
	do
		((current_line=current_line+1))
		echo -n $bg_black
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done
#ligne separation
	for((j=0;j<taille_touche_H;j++))
	do
		((current_line=current_line+1))
		echo -n $bg_black
		printf '%*s' "$colonnes" 
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done

#  / = 0

	((line_dessus=(taille_touche_H-1)/2))
	((line_dessous=((taille_touche_H-1)/2)+((taille_touche_H-1)%2)))

	for((j=0;j<line_dessus;j++))
	do
		((current_line=current_line+1))
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		tput cup $current_line $((position_div+colonnes))
		echo "/"
		tput cup $current_line $((position_egual+colonnes))
		tput bold
		echo "="
		tput sgr0
		echo -n $bg_blue
		tput cup $current_line $((position_0+colonnes))
		echo "0"
	for((j=0;j<line_dessous;j++))
	do
		((current_line=current_line+1))
		echo -n $bg_black
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done


	for ((j=0;j<"$cadre_bas";j++))
	do
#CADRE BAS
		((current_line=current_line+1))
		echo -n $bg_black
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' "$largeur_calc"
		echo -n $bg_black
		printf '%*s' "$colonnes"
	done

tput cup $(tput lines) 0

((pos_nbr=position_display_col-1))

OUT="nok"
limit_nbr=1
first_nbr=false
second_nbr=false
operator=false
nbr=false
check_if_numb="^[0-9]+$"

while [ "$OUT" == "nok" ]
do
#FIRST NOMBRE
	if [ "$first_nbr" == false ]
	then
		#echo $LINENO
		while [ "$OUT" == "nok" ]
		do
			read -rsn1 touche
			if [ "$limit_nbr" -lt "$largeur_display" ]
			then
				if [[ "$touche" =~ $check_if_numb ]]
				then
					((nbr=(nbr*10)+touche))
					((pos_nbr=pos_nbr-1))
					tput cup $position_display_line $pos_nbr
					echo $nbr
					((limit_nbr=limit_nbr+1))
				elif [[ ("$nbr" != false) && ("$touche" == "+" || "$touche" == "-" || "$touche" == "/" || "$touche" == "x") ]]
				then
					first_nbr=$nbr
					OUT="ok"
					operator=$touche
				fi
			else
				first_nbr=$nbr
				OUT="ok"
			fi
		done
		OUT="nok"
		nbr=false
		limit_nbr=1
	fi
#OPERATOR
	if [ "$operator" == false ]
	then
		while [ "$OUT" == "nok" ]
		do
			if [[ "$touche" != "+" && "$touche" != "-" && "$touche" != "/" && "$touche" != "x" ]]
			then
				read -rsn1 touche
			else
				OUT="ok"
				operator=$touche
			fi
		done
	OUT="nok"
	fi
#SECOND NUMBER
	if [ "$second_nbr" == false ]
	then
		#DISPLAY
		tput cup $position_display_line 0
		printf '%*s' "$colonnes"
		echo -n $bg_blue
		printf '%*s' $((2*taille_touche_L))
		echo -n $bg_black
		printf '%*s' "$largeur_display"
		echo -n $bg_blue
		printf '%*s' $((2*taille_touche_L))
		echo -n $bg_black
		printf '%*s' "$colonnes"
		((pos_nbr=position_display_col-1))
		#echo $LINENO
		while [ "$OUT" == "nok" ]
		do
			read -rsn1 touche
			if [ "$limit_nbr" -lt "$largeur_display" ]
			then
				if [[ "$touche" =~ $check_if_numb ]]
				then
					((nbr=(nbr*10)+touche))
					((pos_nbr=pos_nbr-1))
					tput cup $position_display_line $pos_nbr
					echo $nbr
					((limit_nbr=limit_nbr+1))
				elif [[ ("$nbr" != false) && ("$touche" == "=" || "$touche" == "") ]]
				then
					second_nbr=$nbr
					OUT="ok"
				fi
			else
				second_nbr=$nbr
				OUT="ok"
			fi
		done
		#OUT="nok"
	fi
#RESULT
	#DISPLAY
	echo -n $bg_black
	tput cup $position_display_line 0
	printf '%*s' "$colonnes"
	echo -n $bg_blue
	printf '%*s' $((2*taille_touche_L))
	echo -n $bg_black
	printf '%*s' "$largeur_display"
	echo -n $bg_blue
	printf '%*s' $((2*taille_touche_L))
	echo -n $bg_black
	printf '%*s' "$colonnes"
	((pos_nbr=position_display_col-1))
	OUT="ok"
	if [ "$operator" == "+" ]
	then
		let "result=$first_nbr + $second_nbr"
	elif [ "$operator" == "-" ]
	then
		let "result=$first_nbr - $second_nbr"
	elif [ "$operator" == "x" ]
	then
		let "result=$first_nbr * $second_nbr"
	elif [ "$operator" == "/" ]
	then
		let "result=$first_nbr / $second_nbr"
	else
		echo "issue"
	fi

	len_result=${#result}
	if [ "$len_result" -gt "$largeur_display" ]
	then
		result="To big result"
		len_result=${#result}
	fi
	tput cup $position_display_line $((pos_nbr-len_result))
	echo -n $txt_result
	tput bold
	echo $result
	tput sgr0
	tput cup $(tput lines) 0
done
