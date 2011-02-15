#define 2leds 1
#define LED_I PIN_D1
#define LED_D PIN_D0


void leds_configurar()
{
   printf("-Configurando leds\r\n");
   output_high(LED_I); printf ("-Led izquierdo\r\n");
   output_high(LED_D); printf ("-Led derecho\r\n");
}


