#!/bin/bash

#Revisa la cantidad de practicas que hay en el directorio de trabajo
num=`expr $(ls | wc -l)`
#Ingresa el nombre de la practica
echo "Ingrse el nombre de la practica"
read nom
#Solo realiza las acciones si se ingresa el nombre de la practica
if [ "$nom" != "" ];then
	#Se le asignan los valores anteriormente ingresados a una variabe que contendra el nombre completo de la practica
	c="practica $num - $nom"
	#Se crean los directorios escenciales
	mkdir "$c" "$c"/css "$c"/js
	#Se crean los archivos escenciales
	touch "$c"/css/styles.css "$c"/js/app.js "$c"/index.html
	#Se agrega contenido al archivo de estilos
	echo "* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

body {" > "$c"/css/styles.css
	#Se elige el ingreso de una imagen de fondo
	echo "Desea Agregar un fondo a la carpeta img/? [S/n]"
	read r
	#Se le asigna un valor a la variable que se usara para el siguiente bucle
	rein="s"
	#Se verifica la respuesta
	if [[ $r == "s" || $r == "S" ]];then
		#Se crea el directorio contenedor de las imagenes
		mkdir "$c"/img
		#Se le da valor vacio a la variable que contendra el nombre de la imagen
		img=""
		#El bucle controla si se ingeso el nombre de la iagen, si esta correctamente escrito o si desea cancelar el ingreso de la iagen
		while [[ $rein == "s" || $rein == "S" ]]
		do
			echo "Ingrese la ubicacion de un fondo /home/samuel/Imágenes/Fondos-web/..."
			ls -R -t /home/samuel/Imágenes/Fondos-web/
			read img
			if [[ $img == "" ]];then
				echo "No ingreso el nombre del archivo, quiere intentar nuevamente? [S/n]:"
				read rein
			else
				if [[ -e "/home/samuel/Imágenes/Fondos-web/$img" ]];then
					cp -r /home/samuel/Imágenes/Fondos-web/"$img" "$c"/img/
					#Se cambia de nombre al archivo que contiene la imagen dentro de la practica
					mv "$c"/img/*.jpg "$c"/img/bg.jpg
					echo "    background-image: url(../img/bg.jpg) ;" >> "$c"/css/styles.css
					echo "    background-repeat: no-repeat;
	background-size: cover;
	background-attachment: fixed;
" >> "$c"/css/styles.css
					break
				else
					echo "La imagen no Existe. Desea Ingresarla Nuevamente? [S/n]:"
					read rein
				fi
			fi
			#En caso de cancelar el ingreso de la imagen se elimina la carpeta contenedora de imagenes
			if [[ $rein != "s" && $rein != "S" ]];then
				rmdir "$c"/img/
			fi
		done
	fi
	#Se agrega el resto del contenido basico en el archivo de estilos
	echo "    width: 100%;
    min-height: 100vh;
    padding: 0;
    margin: 0;
}

a {
    text-decoration: none;
}" >> "$c"/css/styles.css
	#Se ingresa parte de la cabecera del atchivo html
	echo '<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset=UTF-8>
    <meta http-equiv=X-UA-Compatible content=IE=edge>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">' > "$c"/index.html
	echo "	<title>Practica $num - $nom</title>
    <link rel=stylesheet href=css/styles.css>" >> "$c"/index.html
	#Se ingresan logos en la practica si el usuario asi lo desea
	echo "Desea Integrar Logos al proyecto? [S/n]:"
	read r
	if [[ $r == "s" || $r == "S" ]];then
		mkdir "$c"/icons/
		cp -r ../Recursos/Logos/png/ "$c"/icons/ & cp -r ../Recursos/Logos/svg/ "$c"/icons/
		echo "Logos Integrados al Proyecto Exitosamente!!!"
	fi
	#Se ingresan iconos en la practica si el usuario asi lo desea
	echo "Desea integrar Font Awesome en este Proyecto? [S/n]:"
	read r
	if [[ $r == "s" || $r == "S" ]];then
		echo "	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">" >> "$c"/index.html
		echo "Font Awesome Integrado Exitosamente!!!"
	fi
	#Se intega IonIcon en el proyecto si el usuario asi lo desea
	echo "Desea integrar Ion-Icon en este Proyecto? [S/n]:"
	read r
	if [[ $r == "s" || $r == "S" ]];then
		echo "	<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>"
		echo "Ion-Icon Integrado Exitosamente!!!"
	fi
	#Se integra Bootstrap en el proyecto si el usuario asi lo desea
	echo "Desea inplementar Bootstrap en el proyecto? [S/n]:"
	read r
	if [[ $r == "s" || $r == "S" ]];then
		#Se selecciona la version con la cual trabajar
		echo "Seleccione la version que desee implementar:"
		echo "1. Bootstrap v4.6"
		echo "2. Bootstrap v5.0"
		read r
		bootstrap=$r
		#Se ingresan los links necesarios para insertar Bootstrap
		case $r in
			1)
				echo "	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">" >> "$c"/index.html
			;;
			2)
				echo "	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">" >> "$c"/index.html
			;;
		esac
	fi
	#Se integra Swiper JS en la practica si el usuario lo desea
	echo "Desea integrar SwiperJS en el Proyecto? [S/n]:"
	read r
	if [[ r == "s" || r == "S" ]];then
		echo "	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />" >> "$c"/index.html
		swiper=$r
	fi
	#Se cierra la cabecera y se inicia el cuerpo de la practica
	echo "</head>
" >> "$c"/index.html
	echo "<body>" >> "$c"/index.html
	#Se integran los scripts para trabajar con Bootstrap
	case $bootstrap in
			1)
			echo "	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>" >> "$c"/index.html
			echo "Bootstrap 4 Integrado Exitosamente!!!"
		;;
		2)
			echo "	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>" >> "$c"/index.html
			echo "Bootstrap 5 Integrado Exitosamente!!!"
		;;
	esac
	if [[ swiper == "s" || swiper == "S" ]];then
		echo "	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>" >> "$c"/index.html
	fi
	#Se agrega el archivo propio de javascript
	echo "    <script src=js/app.js></script>
</body>" >> "$c"/index.html
	echo "$c CREADA CORRECTAMENTE!!!"
else
	echo "No se podra crear el Proyecto $num - $nom, ingrese el nombre del archivo correctamente"
fi
