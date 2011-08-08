#define VENT_1 PIN_D5
#define VENT_2 PIN_D4
#define CALEC_1 PIN_D7
#define CALEC_2 PIN_D6

void incubadora_ventilador(int1 encender)
{
   if (encender==1) {
      output_bit(VENT_1,0);
      output_bit(VENT_2,1);
   } else {
      output_bit(VENT_1,0);
      output_bit(VENT_2,0);
   }
}

void incubadora_calefaccion(int1 encender)
{
   if (encender==1) {
      output_bit(CALEC_1,0);
      output_bit(CALEC_2,1);
   } else {
      output_bit(CALEC_1,0);
      output_bit(CALEC_2,0);
   }
}
