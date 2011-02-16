#define 2leds 1
#define LED_I PIN_A5
#define LED_D PIN_E0


void leds_configurar()
{
   printf("-Configurando leds\r\n");
   set_tris_e(0xff);
   output_high(LED_I); printf ("-Led izquierdo\r\n");
   output_high(LED_D); printf ("-Led derecho\r\n");
}


