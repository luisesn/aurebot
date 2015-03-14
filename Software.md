# Introducción #
El Aurebot se programa en C (específicamente C para pics de CCS), para facilitar la programación del robot se usan librerías que abstraen las funciones especificas del Pic a funciones fácilmente legibles para humanos, por ejemplo mover los motores hacia delante en C deberíamos usar:
```
output_bit(PIN_D6,0);
output_bit(PIN_D7,1);
output_bit(PIN_D5,0);
output_bit(PIN_D4,1);
```

mientras que si usáramos la librería [lib/motores.h](http://code.google.com/p/aurebot/source/browse/trunk/lib/motores.h) solo habríamos de hacer:

```
motores_palante();
```

# Librerias #
  * **[lib/aurebot.h](http://code.google.com/p/aurebot/source/browse/trunk/lib/aurebot.h)**: Contiene las funciones esenciales del AureBot, desde las rutinas de inicialización a la configuración del puerto USB y del reloj del microcontrolador
  * **[lib/2leds.h](http://code.google.com/p/aurebot/source/browse/trunk/lib/2leds.h):**
  * **[lib/ldr.h](http://code.google.com/p/aurebot/source/browse/trunk/lib/ldr.h):** Funciones para el uso simple de los sensores de luminosidad (Resistencias fotoeléctricas)
  * **[lib/flex\_lcd.c](http://code.google.com/p/aurebot/source/browse/trunk/lib/flex_lcd.c):** Contiene las funciones parar inicializar y usar la pantalla LCD de la que disponen los robots.
  * **[lib/motores.h](http://code.google.com/p/aurebot/source/browse/trunk/lib/motores.h):** Aquí se definen las funciones para hacer uso de los motores del robot.
    * **Funciones directas:**
      * `motores_palante():` El robot avanzará
      * `motores_patras():` El robot avanzará en sentido inverso
      * `motores_paderecha():` El robot girará hacia la derecha
      * `motores_paizquierda():` El robot girará hacia la izquierda
      * `motores_parar():` Detiene el robot
    * **Funciones con control de velocidad:** Estas funciones son para mover el robot controlando la velocidad, hacen uso de un parámetro (velocidad, un entero de 0, parado, a 255, máxima velocidad), es necesario activar antes explicitamente mediante la función _motores\_cv\_configurar()_
      * `motores_cv_configurar():` Configura el control de velocidad
      * `motores_cv_off():` Desactiva el control de velocidad
      * `motores_cv_palante(int velocidad):`
      * `motores_cv_patras(int velocidad):`
      * `motores_cv_paderecha(int velocidad):`
      * `motores_cv_paizquierda(int velocidad):`
      * `motores_cv_cambiar_velocidad(int velocidad):`
      * `motores_cv_sum_velocidad(int velocidad):`

# Código #
Todo el código esta disponible desde [aquí](http://code.google.com/p/aurebot/source/browse/#svn%2Ftrunk) y puede actualizarse facilmente haciendo uso de svn.