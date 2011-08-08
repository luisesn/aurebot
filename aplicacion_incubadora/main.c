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
#include <../lib/i2c.h>
#include <../lib/ds1307.h>
#include <../lib/ds1624.h>
#include <../lib/reloj_c4.h>
#include <../lib/sonido.h>
#include <../lib/1-wire.h>
#include <../lib/ds18b20.h>
#include <../aplicacion_incubadora/incubadora.h>
#include <../lib/servos.h>

char comando[21];
int ah=0;
int am=0;
int alarma=0;
int buffer=0;
int j=0;
byte horas=0;
byte minutos=0;
byte segundos=0;
byte dia=0;
byte mes=0;
byte ano=0;
int temp;
int inter=0;
int dig[4];
float objetivo,temp2,tmp;
int tempt=0, calefaccion=0, ventilador=0, grados=30, direccion=1;

// Rutina de gestión de pulsaciones serie
void aure_serie()
{
   switch(keypress)
   {
      //Si recibimos 'U' o 'u'imprimimos "Hola mundo" por el puerto USB
      case 'U':
      case 'u':
         printf (usb_cdc_putc, "\r\n¡¡Hola mundo!!\r\n");
         break;
      case 'z':
      case 'Z':
         incubadora_ventilador(1);
         break;
      case 'x':
      case 'X':
         incubadora_ventilador(0);
         break;
      case 'c':
      case 'C':
         incubadora_calefaccion(1);
         break;
      case 'v':
      case 'V':
         incubadora_calefaccion(0);
         break;
      case 'b':
      case 'B':
         printf(usb_cdc_putc,"Leyendo...\r\n");
         printf(usb_cdc_putc,"Sensor:%2.1f\r\n", ds1820_read());
         break;
      case '+':
         grados=grados+10;
         servos_mover_a(grados, 2);
         break;
       case '-':
         grados=grados-10;
         servos_mover_a(grados, 2);
         break;  
      case 0x0D: printf(usb_cdc_putc, "[CR]\r\n"); // Si he pulsado la tecla [Intro]
         switch(comando[0])
         {
            case 'H':
               // 13:58:13|12/34/04
               horas=(comando[1]-'0')*10+comando[2]-'0';
               minutos=(comando[4]-'0')*10+comando[5]-'0';
               segundos=(comando[7]-'0')*10+comando[8]-'0'; printf("[HA]\r\n");
               dia=(comando[10]-'0')*10+comando[11]-'0';
               mes=(comando[13]-'0')*10+comando[14]-'0';
               ano=(comando[16]-'0')*10+comando[17]-'0'; printf("[FA]\r\n");
               ds1307_set_date_time(dia, mes, ano, 1, horas, minutos, segundos);
               printf(usb_cdc_putc, "[OK]\r\n");
               break;
            case 'A':
               alarma=1;
               // 13:58:13|12/34/04
               ah=(comando[1]-'0')*10+comando[2]-'0';
               am=(comando[4]-'0')*10+comando[5]-'0';
               printf(usb_cdc_putc, "Alarma conectada y configurada a las %02d:%02d.\r\n",ah,am);
               printf("[OK]\r\n");
               break;
            case 'T':
               printf (usb_cdc_putc, "Volcado de temperaturas:\r\n");
               for (j=0; j<235; j++)
               {
                  printf (usb_cdc_putc, "<BO:%04u-%04u>",j,read_eeprom(j));
               }
               printf(usb_cdc_putc, "[OK]\r\n");
            case 'a':
               alarma=0;
               printf("usb_cdc_putc, Alarma apagada.\r\n");
               printf("usb_cdc_putc, [OK]\r\n");
               break;
             case 'P':
               disable_interrupts(GLOBAL);
               printf(usb_cdc_putc, "Ejecutando prueba...\r\n");
               relojc4_enviar_comando(0x06);
               printf (usb_cdc_putc, "Prueba ejecutada.\r\n");
               printf(usb_cdc_putc, "[OK]\r\n");
               enable_interrupts(GLOBAL);
               break;
             case 'S':
               printf(usb_cdc_putc, "Ejecutando sirena...\r\n");
               relojc4_enviar_comando(0x05);
               printf (usb_cdc_putc, "Sirena ejecutada.\r\n");
               printf(usb_cdc_putc, "[OK]\r\n");
               break;
             default:
               comando[20]=0x00;
               printf (usb_cdc_putc, "Comando desconocido (%s)\r\n",comando);
             break;
         }
         comando[0]='0';
         buffer=0;
         break;
      case 0x1B:
         printf(usb_cdc_putc, "[Esc] Reset de cpu...\r\n"); // Si he pulsado la tecla [Escape]
         delay_ms(250);
         printf(usb_cdc_putc, "Reseteando...");
         reset_cpu();
         break;
      case 'º':
         printf(usb_cdc_putc, "Reset a bootloader\r\n");
         write_eeprom(0,'B');
         printf (".");
         disable_interrupts(GLOBAL);
         delay_ms(250);
         printf (".");
         delay_ms(250);
         printf (".");
         delay_ms(250);
         printf (".");
         delay_ms(250);
         reset_cpu();
         break;
      default:
         comando[20]=0x00;
         comando[buffer]=keypress;
         ++buffer;
         if (buffer>20) {printf("[BO]\r\n"); buffer=0;}
         printf (usb_cdc_putc, "Recibido: %c (Buffer: %s)\r\n",keypress,comando);     // Echo de cualquier otro carácter
         break;
    }   
   //Vaciamos el buffer
   keypress=0;
   output_toggle(LED);
}

void configurar_timer0_1seg()
{
   // Reloj a 48 Mhz.
   //    -> Objetivo: Interrupcion cada 1 S
   //    -> ciclo cada 48000000/4 -> 12.000.000 Hz
   //    -> Con 1/256 frec= 46875 Hz ...

   setup_timer_0 (RTCC_DIV_256|RTCC_INTERNAL);
   enable_interrupts(int_timer0);
   printf ("-TIMER0 Configurado\r\n");
}

void prueba ()
{
   while(true) {
   output_toggle(LED);
   relojc4_display(0x04, 8);
   delay_ms(1000);
   output_toggle(LED);
   relojc4_display(0x02, 8);
   delay_ms(1000);
   output_toggle(LED);
   relojc4_display(0x04, 1);
   delay_ms(1000);
   }
}

void escribir_temperatura()
{
   int direccion;
   
   int t;
   tmp=temp-15;
   tmp=tmp*9;
   t=tmp;
   printf (usb_cdc_putc, "<A1:%c>\r\n",t);
   sprintf(dig,"%02u",temp);

   
   direccion=segundos/10;
   direccion+=horas*10;
   write_eeprom(direccion,temp);
   
   relojc4_display(1,0);

   relojc4_display(2,0);
   
   relojc4_display(3,dig[0]-'0');

   relojc4_display(4,dig[1]-'0');
}

void escribir_temperatura_2()
{
   int t;
   tmp=temp2-15;
   tmp=tmp*9;
   t=tmp;
   printf(usb_cdc_putc,"<A0:%c>\r\n", t);
   

   sprintf(dig,"%3f",(temp2*10));
    
   relojc4_display(1,0);

   relojc4_display(2,dig[0]-'0');
   
   relojc4_display(3,dig[1]-'0');
   
   relojc4_display(4,dig[2]-'0');
}

void escribir_hora()
{
   char h[5];
   sprintf(h,"%02u%02u", horas,minutos);
   
   relojc4_display(1,h[0]-'0');
   
   relojc4_display(2,h[1]-'0');
   
   relojc4_display(3,h[2]-'0');
   
   relojc4_display(4,h[3]-'0');
   
   if (alarma==1)
   {
      if (ah==horas && am==minutos)
      {
         relojc4_enviar_comando(0x05);
      }
   }
   //printf(usb_cdc_putc, "<HO:%02d:%02d:%02d>\r\n",horas,minutos,segundos);
   //printf(usb_cdc_putc, "<FE:%02d/%02d/20%02d>\r\n",dia,mes,ano);
   
   
}



#int_timer0
void seg_int()
{
   inter=1; 
}



//Rutina principal
void main()
{
   aure_configurar();sonido_voipvoip();
   servos_configurar();

   ds1624_init(0);
   ds1307_init();
   
   configurar_timer0_1seg();
     
   while(1)
   {
    
     // Si usamos el USB
     //usb_task();
     // Comprobamos si tenemos algún caracter en el buffer serie/usb, si lo
     // tenemos llamamos a aure_usb_serie_int() que nos lo guardará en keypress
     //if (usb_cdc_kbhit()) aure_usb_serie_int();
      aure_usb();
     if (keypress!=0x00) aure_serie();
     if (inter==1) {
         objetivo=37.8;
         disable_interrupts(GLOBAL);
         temp2=ds1820_read();
         enable_interrupts(GLOBAL);
         output_toggle(LED);
         //printf(usb_cdc_putc, "%f a %f = %f\r\n", temp2, objetivo, (objetivo-temp2));
         if ((objetivo-temp2)>.5) {
            //if (calefaccion==0) sonido_sirena();
            calefaccion=1;
            ventilador=0;
            incubadora_calefaccion(1);
            incubadora_ventilador(0);
         } else {
            //if (calefaccion==1) sonido_beep();
            calefaccion=0;
            ventilador=1;
            incubadora_calefaccion(0);
            incubadora_ventilador(1);
         }
         
         grados=grados+direccion;
         servos_mover_a(grados, 2);
         if (grados>149) direccion=-1;
         if (grados<31) direccion=1;
         //set_timer0(32767);
         if (tempt==1)
         {
            ds1307_get_date(dia,mes,ano,j);
            ds1307_get_time(horas,minutos,segundos);
            escribir_hora();
            tempt=2;
         } else {
            if (tempt==2)
            {
               escribir_temperatura_2();
               tempt=0;
            } else {
               tempt=1;
               temp=ds1624_read_temp_c(0);
               escribir_temperatura();
            }
         }
         inter=0;
     }
   }
}
