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
   Requerido: Aureboard Versi�n>2.0

   - El programa configura el puerto Serie por USB.
   - Cada programa deber� ir en su carpeta al mismo nivel de la carpeta lib




   A.U.R.E. 2010
*/

#include <../lib/aurebot.h>
#include <../lib/ldr.h>
#include <../lib/cny70.h>
#include <../lib/bumper.h>
#include <../lib/flex_lcd.c>
#include <../lib/motores.h>
#include <../lib/sonido.h>
#include <../lib/2leds.h>

int prueba_pilas=0, enviar_ldr=0, enviar_cny=0, enviar_pulsadores=0, enviar_analog=0, enviar_dig=0;




// Rutina de gesti�n de pulsaciones serie
void aure_serie()
{
   output_toggle(LED);
   switch(keypress)
   {
//Control de sensores
         case '1':
            if (enviar_ldr==1) { enviar_ldr=0; } else{ enviar_ldr=1;}
            break;
         case '2':
            if (enviar_cny==1) { enviar_cny=0; } else{ enviar_cny=1;}
            break;
         case '3':
            if (enviar_pulsadores==1) { enviar_pulsadores=0; } else{ enviar_pulsadores=1;}
            break;
         case '4':
            if (enviar_analog==1) { enviar_analog=0; } else{ enviar_analog=1;}
            break;
         case '5':
            if (enviar_dig==1) { enviar_dig=0; } else{ enviar_dig=1;}
            break;
         case '6':
            if (prueba_pilas==1) { prueba_pilas=0; } else{ prueba_pilas=1;}
            break;
//Control de movimiento
            case 'w':
               motores_palante();
               break;
            case 's':
               motores_patras();
               break;
            case 'd':
               motores_paderecha();
               break;
            case 'a':
               motores_paizda();
               break;
            case 'q':
               motores_parar();
               break;
//Control de leds
            case 'n':
            output_toggle(LED_I);
            break;
            case 'm':
            output_toggle(LED_D);
            break;
// Funciones
         case 'z':
            //modo_buscaluz();
            break;
        case 'x':
            //navegacion_auto();
            break;
         case 'f':
            motores_cv_sum_velocidad(-5);
            break;
         case 'g':
            motores_cv_sum_velocidad(5);
            break;
         case 'k':
            motores_cv_palante(200);
            break;
         case 'l':
            motores_cv_parar();
            break;
         default:
            printf (usb_cdc_putc, "NR:%c\r\n", keypress);
            break;
   }
   //Vaciamos el buffer
   keypress=0;
}


void ldr_a_lcd()
{
   long lectura;
   int valor;
   int j, lec[13];
   ldr_configurar();
   while (input(PULSADOR)!=1)
   {
      lcd_gotoxy(1,1);
      valor=leeradc(LDR_I);
      lectura=valor;
      lectura=lectura/22;
      for (j=0; j<12; j++) if (j<=lectura) { lec[j]=219; } else {lec[j]='-';}
      lec[12]='\0';
      printf (lcd_putc, "%03u|%s\r", valor, lec);
      valor=leeradc(LDR_D);
      lectura=valor;
      lectura=lectura/22;
      for (j=0; j<12; j++) if (j<=lectura) { lec[j]=219; } else {lec[j]='-';}
      lec[12]='\0';
      printf (lcd_putc, "%03u|%s\r", valor, lec);
      delay_ms(40);
   }
}

void cny_a_lcd()
{
   long lectura;
   int valor;
   int j, lec[13];
   ldr_configurar();
   while (input(PULSADOR)!=1)
   {
      lcd_gotoxy(1,1);
      valor=leeradc(CNY_I);
      lectura=valor;
      lectura=lectura/22;
      for (j=0; j<12; j++) if (j<=lectura) { lec[j]=219; } else {lec[j]='-';}
      lec[12]='\0';
      printf (lcd_putc, "%03u|%s\r", valor, lec);
      valor=leeradc(CNY_D);
      lectura=valor;
      lectura=lectura/22;
      for (j=0; j<12; j++) if (j<=lectura) { lec[j]=219; } else {lec[j]='-';}
      lec[12]='\0';
      printf (lcd_putc, "%03u|%s\r", valor, lec);
      delay_ms(40);
   }
}


//Rutina principal
void main()
{
   int i, d, j;
   aure_configurar();
   leds_configurar();
   lcd_configurar();
   aure_configurar_usb();
   motores_cv_configurar();
   while(1)
   {
     // Si usamos el USB
     usb_task();
     // Comprobamos si tenemos alg�n caracter en el buffer serie/usb, si lo
     // tenemos llamamos a aure_usb_serie_int() que nos lo guardar� en keypress
     if (usb_cdc_kbhit())
     {
         aure_usb_serie_int();
         if (keypress!=0x00) aure_serie();
     }
     if (enviar_ldr==1)
     {
         i=leeradc(LDR_I);
         d=leeradc(LDR_D);
         printf (usb_cdc_putc, "<SI:%c><SD:%c>", i, d);
     }
     if (enviar_cny==1)
     {
         i=leeradc(CNY_I);
         d=leeradc(CNY_D);
         printf (usb_cdc_putc, "<CI:%c><CD:%c>", i, d);
     }
     if (enviar_pulsadores==1)
     {
         if (input(PULSADOR)) {   printf (usb_cdc_putc,"<PU:H>"); } else { printf (usb_cdc_putc,"<PU:L>");}
         if (input(BUMPER_I)) {   printf (usb_cdc_putc,"<BI:H>"); } else { printf (usb_cdc_putc,"<BI:L>");}
         if (input(BUMPER_D)) {   printf (usb_cdc_putc,"<BD:H>"); } else { printf (usb_cdc_putc,"<BD:L>");}
     }
     if (enviar_analog==1)
     {
        setup_adc_ports( ALL_ANALOG|VSS_VDD );
        setup_adc(ADC_CLOCK_INTERNAL);
         for (j=0; j<2; j++)
         {
            printf(usb_cdc_putc, "<A%c:%c>", j+'0', leeradc(j));
         }
         setup_adc_ports(NO_ANALOGS);
         setup_adc(ADC_OFF);
     }
     if (enviar_dig==1)
     {
      for (j=0; j<2; j++)
      {
         printf(usb_cdc_putc, "<A%c:%c>", j+'0', 50+input(PIN_A0+j)*150);
      }
     }
     if (prueba_pilas==1) {
      motores_palante();
      delay_ms(250);
      motores_parar();
      delay_ms(250);
     }
     if (input(PULSADOR)==1)
     {
         while(input(PULSADOR)==1) {}
         lcd_gotoxy(1,1);
         printf(lcd_putc, "______MENU______\r");
         printf(lcd_putc, " ldr a lcd      ");
         for (j=0; j<10; j++) { delay_ms(100); if (input(PULSADOR)==1) j=10;}
         if (input(PULSADOR)==1)
         {
            lcd_gotoxy(1,1);
            printf (lcd_putc, "OK LDR A LCD    ");
            while(input(PULSADOR)==1) {}
            ldr_a_lcd();
         }
         lcd_gotoxy(1,1);
         printf(lcd_putc, "______MENU______\r");
         printf(lcd_putc, " cny a lcd      ");
         delay_ms(1000);
         if (input(PULSADOR)==1)
         {
               lcd_gotoxy(1,1);
               printf (lcd_putc, "OK CNY A LCD    ");
               while(input(PULSADOR)==1) {}
               cny_a_lcd();
         }
         lcd_gotoxy(1,1);
         printf(lcd_putc, "______MENU______\r");
         printf(lcd_putc, " navegacion auto");
         delay_ms(1000);
         if (input(PULSADOR)==1)
         {
               lcd_gotoxy(1,1);
               printf (lcd_putc, "OK NAVEGACION   ");
               while(input(PULSADOR)==1) {}
               //navegacion_bumpers();
         }
         lcd_gotoxy(1,1);
         printf(lcd_putc, "______MENU______\r");
         printf(lcd_putc, " buscaluz       ");
         delay_ms(1000);
         if (input(PULSADOR)==1)
         {
               lcd_gotoxy(1,1);
               printf (lcd_putc, "OK BUSCALUZ     ");
               while(input(PULSADOR)==1) {}
               //navegacion_luz();

         }
         lcd_init();

      }
   //delay_ms(5);
   }
}
