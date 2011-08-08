#include <../lib/aurebot.h>
#include <../lib/i2c.h>
#include <../lib/wiimotionplus.h>
int enviar_ldr=0, enviar_cny=0, enviar_pulsadores=0, enviar_analog=0, enviar_dig=0;

// Rutina de gestión de pulsaciones serie
void aure_serie()
{
   output_toggle(LED);
   switch(keypress)
   {
         default:
            printf (usb_cdc_putc, "NR:%c\r\n", keypress);
            break;
   }
   //Vaciamos el buffer
   keypress=0;
}

//Rutina principal
void main()
{
   int t;
   int datos[6];
   aure_configurar();
   wiimp_configurar();


   while(1)
   {
     aure_usb();
     /*
      for (j=0; j<2; j++)
      {
         printf(usb_cdc_putc, "<A%c:%c>", j+'0', 50+input(PIN_A0+j)*150);
      }
     }*/
     
     wiimp_pedir_datos();
     delay_ms(1);
     i2c_start();
     i2c_write(0xA5); 
        
     for (t=0;t<5;t++)  
         datos[t] = i2c_read();
     datos[5] = i2c_read(0);
     i2c_stop();

     //FALTA ORDENAR ADECUADAMENTE LOS BYTES! 
        
     yaw=((datos[3]>>2)<<2)+datos[0]-yaw0;
     roll=((datos[4]>>2)<<2)+datos[1]-roll0;
     pitch=((datos[5]>>2)<<2)+datos[2]-pitch0; 
     printf(usb_cdc_putc, "\r%Ld %Ld %Ld    ",yaw,roll,pitch);
   }
}
