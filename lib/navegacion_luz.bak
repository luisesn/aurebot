#include <../lib/motores.h>
#include <../lib/ldr.h>

void navegacion_luz()
{
   int izq, der, ui, ud, j, lec[13];
   float lectura;
   //printf (usb_cdc_putc, "Buscador de luz\r\n Deje el robot en reposo y pulse el botón.\r\n");
   while(input(PULSADOR)==1)   {}
   ldr_configurar();

   while(input(PULSADOR)!=1)
   {
      usb_task();
      izq=leeradc(LDR_I);
      der=leeradc(LDR_D);
      //printf(usb_cdc_putc, "DER->%03u;  IZQ->%03u\r",izq*10,der*10);
      lcd_gotoxy(1,1);
      lectura=izq;
      lectura=lectura/22;
      for (j=0; j<12; j++) if (j<=lectura) { lec[j]=219; } else {lec[j]='-';}
      lec[12]='\0';
      printf (lcd_putc, "%03u|%s\r", izq, lec);
      lectura=der;
      lectura=lectura/22;
      for (j=0; j<12; j++) if (j<=lectura) { lec[j]=219; } else {lec[j]='-';}
      lec[12]='\0';
      printf (lcd_putc, "%03u|%s\r", der, lec);
 
      if (abs((izq)-(der))>25)
      {
         if ((izq)>(der))
         {
            encender(LED_I);
            motores_paderecha();
         } else {
            encender(LED_D);
            motores_paizda();

         }
      } else {
         apagar(LED_I);
         apagar(LED_D);
         motores_palante();
      }
   }
   motores_parar();
}
