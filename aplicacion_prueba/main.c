/*
          _____                    _____                    _____                    _____
         /\    \                  /\    \                  /\    \                  /\    \
        /::\    \                /::\____\                /::\    \                /::\    \
       /::::\    \              /:::/    /               /::::\    \              /::::\    \
      /::::::\    \            /:::/    /               /::::::\    \            /::::::\    \
     /:::/\:::\    \          /:::/    /               /:::/\:::\    \          /:::/\:::\    \
    /:::/__\:::\    \        /:::/    /               /:::/__\:::\    \        /:::/__\:::\    \
   /::::\   \:::\    \      /:::/    /               /::::\   \:::\    \      /::::\   \:::\    \
  /::::::\   \:::\    \    /:::/    /      _____    /::::::\   \:::\    \    /::::::\   \:::\    \
 /:::/\:::\   \:::\    \  /:::/____/      /\    \  /:::/\:::\   \:::\____\  /:::/\:::\   \:::\    \
/:::/  \:::\   \:::\____\|:::|    /      /::\____\/:::/  \:::\   \:::|    |/:::/__\:::\   \:::\____\
\::/    \:::\  /:::/    /|:::|____\     /:::/    /\::/   |::::\  /:::|____|\:::\   \:::\   \::/    /
 \/____/ \:::\/:::/    /  \:::\    \   /:::/    /  \/____|:::::\/:::/    /  \:::\   \:::\   \/____/
          \::::::/    /    \:::\    \ /:::/    /         |:::::::::/    /    \:::\   \:::\    \
           \::::/    /      \:::\    /:::/    /          |::|\::::/    /      \:::\   \:::\____\
           /:::/    /        \:::\__/:::/    /           |::| \::/____/        \:::\   \::/    /
          /:::/    /          \::::::::/    /            |::|  ~|               \:::\   \/____/
         /:::/    /            \::::::/    /             |::|   |                \:::\    \
        /:::/    /              \::::/    /              \::|   |                 \:::\____\
        \::/    /                \::/____/                \:|   |                  \::/    /
         \/____/                  ~~                       \|___|                   \/____/

   Programa de ejemplo para la AureBoard
   Requerido: Aureboard Versión>2.0

   - El programa configura el puerto Serie por USB.
      -Al cargar un programa hay que cerrar y volver a abrir el siow.exe
   - Cada programa deberá ir en su carpeta al mismo nivel de la carpeta lib




   A.U.R.E. 2010
*/

#include <../lib/aurebot.h>



// Rutina de gestión de pulsaciones serie
void aure_serie()
{
   switch(keypress)
   {
      //Si recibimos 'U' o 'u'imprimimos "Hola mundo" por el puerto USB
      case 'U':
      case 'u':
         printf (usb_cdc_putc, "¡¡Hola mundo!!\r\n");
         break;
//Control de movimiento
           case 'w':
           case 'W':
               palante();
               break;
            case 's':
            case 'S':
               patras();
               break;
            case 'd':
            case 'D':
               paderecha();
               break;
            case 'a':
            case 'A':
               paizda();
               break;
            case 'q':
            case 'Q':
               parar();
               break;         
   }
         printf (usb_cdc_putc, "%c", keypress);
   //Vaciamos el buffer
   keypress=0;
}



//Rutina principal
void main()
{
 aure_configurar();
   while(1)
   {
     // Si usamos el USB
     usb_task();
     // Comprobamos si tenemos algún caracter en el buffer serie/usb, si lo
     // tenemos llamamos a aure_usb_serie_int() que nos lo guardará en keypress
     if (usb_cdc_kbhit()) aure_usb_serie_int();

     if (keypress!=0x00) aure_serie();

      delay_ms(100);
      output_toggle(LED);
   }
}
