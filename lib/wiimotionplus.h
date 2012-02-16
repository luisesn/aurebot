int16 yaw=0,yaw0=0;
int16 pitch=0,pitch0=0;
int16 roll=0,roll0=0;
int16 yawt=0, pitcht=0,rollt=0;

void wiinunchuck_configurar()       //conexión desencriptada!
{
   i2c_start();
   i2c_write(0xA4);
   i2c_write(0xF0);
   i2c_write(0x55);
   i2c_stop();
   delay_ms(1);
   i2c_start();
   i2c_write(0xA4);
   i2c_write(0xFB);
   i2c_write(0x00);
   i2c_stop();
}

void wiimp_configurar()
{
   i2c_start();
   i2c_write(0xA6);
   i2c_write(0xFE);  
   i2c_write(0x04);
   i2c_stop();
}   

void wiimp_pedir_datos()
{  
   i2c_start(); 
   i2c_write(0xA4);
   i2c_write(0x00); //Se manda 0 antes de cada petición de datos
   i2c_stop();
}

void wiimp_calibrar_ceros()
{
int i,p;
int datos[6];

   for (i=0;i<10;i++){
      wiimp_pedir_datos();
      delay_ms(1);
      i2c_start();
      i2c_write(0xA5);
      for (p=0;p<5;p++){
         datos[i]=i2c_read();
      }
      datos[5]=i2c_read(0);
      i2c_stop();
      
      //FALTA ORDENAR ADECUADAMENTE LOS BYTES!
      
      yaw0+=(((datos[3]>>2)<<8)+datos[0])/10;  //La media de 10 mediciones
      roll0+=(((datos[4]>>2)<<8)+datos[1])/10;
      pitch0+=(((datos[5]>>2)<<8)+datos[2])/10; 
     
   }
}
