#include <../lib/bumper.h>
#include <../lib/motores.h>

void navegacion_bumpers()
{
   int j;
   lcd_gotoxy(1,1);
   printf (lcd_putc, "Navega. autonoma");
   for (j=0; j<10; j++)
   {
      sonido_beep();
      delay_ms(100);
   }
   while (input(pulsador)==1){}
   while (input(pulsador)!=1)
   {
      lcd_gotoxy(1,2);
      printf (lcd_putc, "***!Adelante!***");
      encender(LED_I);
      encender(LED_D);
      usb_task();
      motores_palante();
      if (input(bumper_i))
      {
         lcd_gotoxy(1,2);
         printf (lcd_putc, "!Ups!obstac.izda");
         apagar(LED_I);
         motores_parar();
         sonido_beep();
         delay_ms(100);
         sonido_beep();
         motores_patras();
         delay_ms(300);
         motores_paderecha();
         delay_ms(300);
      }
      if (input(bumper_d))
      {
         lcd_gotoxy(1,2);
         printf (lcd_putc, "!Ups!obstac.dcha");
         apagar(LED_D);
         motores_parar();
         sonido_beep();
         delay_ms(100);
         sonido_beep();         
         motores_patras();
         delay_ms(300);
         motores_paizda();
         delay_ms(300);
      }         
   }
   motores_parar();
    while (input(pulsador)==1){}
}
