#include <18F4550.h>
//Configuramos el pic para que trabaje a 48Mhz con un cristal de 4 Mhz.
#fuses XTPLL,MCLR,NOWDT,NOPROTECT,NOLVP,NODEBUG, VREGEN 
#fuses IESO,BROWNOUT,STVREN,NOWRT,FCMEN,USBDIV,PLL1,CPUDIV1
#device adc=8
#use delay(clock=48000000)


// Incluimos el descriptor del cargador
#include "..\lib\bootloader\usb_bootloader.h"
// Incluimos las rutinas de gesti�n del usb y del "Comunications Device Class"
#include "..\lib\bootloader\usb_cdc.h"

//Creamos el puerto serie (96008N1)
#use rs232 (baud=9600,XMIT=PIN_C6,RCV=PIN_C7,BITS=8)

#USE STANDARD_IO (e)


// Configuramos los dispositivos incluidos en la placa.
#define LED PIN_C2
#define PULSADOR PIN_A4

// Alias de funciones
#define ENCENDER  output_high
#define APAGAR    output_low
#define CONMUTAR  output_toggle

#define AUREUSB 1

// Para configurar el usb si esperar al host
void aure_configurar_usb_sinespera()
{
   usb_cdc_init();
   usb_init();
}


// Devuelve 1 si el dispositivo cdc est� conectado
int aure_configurar_usb_comprobar()
{
   if (usb_cdc_connected() && usb_enumerated()) return 1;
   return 0;
}

// Configura el usb y espera al host
void aure_configurar_usb()
{
   usb_cdc_init();
   usb_init();
   while(!usb_cdc_connected()) {
      delay_ms(250);
      conmutar(led);
   }
   printf(usb_cdc_putc, "\r\n\n-AureBoard �Lista!\r\n");
}


// Inicializa el PIC
void aure_configurar()
{
   int t=0;
   printf ("\r\nAUREBOT\r\n_______\r\n\r\nIniciando...\r\n");
   printf("[Delay 50 ms]\r\n");
   delay_ms(50);
   printf("[Ok]\r\n");


   /*
      Configuramos el usb-serie
      -aure_configurar_usb()
         Espera a que el host configure el dispositivo, la ejecuci�n del
         programa no comienza hasta ese momento.
      -aure_configurar_usb_sinespera()
         No espera a que el host configure el dispositivo. Se puede usar la 
         funci�n aure_configurar_usb_comprobar() para saber si el dispositivo
         esta conectado (f()==1 conectado, f()==0 desconectado)
   */
   #ifdef AUREUSB
      printf("-USB CDC\r\n");
      aure_configurar_usb();
   #endif
      //delay_ms(500);
   printf("-Led Verde\r\n");
   //Configuramos los registros TRIS
   //set_tris_a(0b00000111);
   //set_tris_b(0x00);
   //set_tris_c(0x00);
   //set_tris_d(0x00);
   //set_tris_e(0x00);      
   //printf("-Registros TRIS\r\n");

   //Configuramos las resistencias de pullup del puerto B
   port_b_pullups(FALSE);
  // printf(usb_cdc_putc, "-Pull up's         [OFF]\r\n");

   //Todos los puertos a nivel bajo
   //output_a (0x00);
   //output_b (0x00);
   //output_c (0xff);
   //output_d (0x00);
   //output_e (0x00);
   //printf("-Puertos a 0\r\n");


   //Configuramos el ADC
   //Todas las entradas analogicas activas y rango 0-Vdd
   //setup_adc_ports( ALL_ANALOG|VSS_VDD );
   setup_adc_ports(NO_ANALOGS);
   setup_adc(ADC_OFF);
   //Reloj interno
   //setup_adc(ADC_CLOCK_INTERNAL );
   //set_adc_channel(0);
   //printf("usb_cdc_putc, "-ADC      [ON]\r\n");
   //printf(usb_cdc_putc, "-ADC         [OFF]\r\n");

   disable_interrupts(global);


   setup_spi(FALSE);
   //   printf(usb_cdc_putc, "-SPI          [OFF]\r\n");
   setup_psp(PSP_DISABLED);
   //   printf(usb_cdc_putc, "-PSP          [OFF]\r\n");
   // Habilitamos el TIMER1
   //enable_interrupts(INT_TIMER1);
   setup_timer_0(RTCC_OFF);
   //   printf(usb_cdc_putc, "-Timer0       [OFF]\r\n");
   setup_timer_1(T1_DISABLED| T1_DIV_BY_1);
   //   printf(usb_cdc_putc, "-Timer1       [OFF]\r\n");
   setup_timer_2(T2_DISABLED,0,1);
   //   printf(usb_cdc_putc, "-Timer2       [OFF]\r\n");
   setup_timer_3(T3_DISABLED);
   //   printf(usb_cdc_putc, "-Timer3       [OFF]\r\n");
   setup_comparator(NC_NC_NC_NC);
   //   printf(usb_cdc_putc, "-Comparador   [OFF]\r\n");
   setup_vref(FALSE);

   //Habilitamos la interrupcion serie
   enable_interrupts(int_rda); 
   //   printf(usb_cdc_putc, "-Int SERIE   [ON]\r\n");

   // Habilitamos las interrupciones globales
   enable_interrupts(GLOBAL);
   //   printf (usb_cdc_putc, "-Int GLOB   [ON]\r\n");
   
   //printf (usb_cdc_putc, "�Lista!\r\n\r\n");
}


//Interrupci�n y gesti�n serie
int keypress=0;
void aure_serie();
void aure_usb_serie_int();

void aure_usb()
{
   // Si usamos el USB
   // usb_task();
   // Comprobamos si tenemos alg�n caracter en el buffer serie/usb, si lo
   // tenemos llamamos a aure_usb_serie_int() que nos lo guardar� en keypress
   if (usb_cdc_kbhit())
   {
      aure_usb_serie_int();
      if (keypress!=0x00) aure_serie();
   }
}

#int_rda
void aure_serie_int()
{
   int key;
   key=getc();
    if (key!=0x00 && key!=0xFF)
    {
      output_toggle(LED);
      keypress=key;
      //printf ("\rRX:%u->%c\r\n", key,key);
      if (key==27) reset_cpu();
    }
}


void aure_usb_serie_int()
{
   int key;
   key=usb_cdc_getc();
    if (key!=0x00 && key!=0xFF)
    {
      keypress=key;
      //printf ("\rUSB RX:%u->%c\r\n", key,key);
      if (key==27) reset_cpu();
    }
}

void barra(int valor)
{
   float lectura;
   int j, lec[25];
         lectura=valor;
         lectura=lectura/10;
         for (j=0; j<25; j++) if (j<=lectura) { lec[j]='O'; } else {lec[j]=' ';}
         lec[24]='\0';
         printf (usb_cdc_putc, "%s | (%u)\r\n", lec, valor);
}

#inline
int leeradc(int canal)
{
   set_adc_channel(canal);
   canal=read_adc();
   return canal;
}

