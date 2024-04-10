# Generador-Reloj-Sincrono
En esta práctica se van a completar dos módulos independientes: un generador de reloj síncrono y un registro de desplazamiento parametrizable. En el contexto práctico se puede observar un caso en el que ambos módulos son utilizados en el diseño de una FPGA.  
  
Funcionamiento  
A partir del reloj de sistema (10 MHz), realizar un divisor de frecuencia que genere tres frecuencias síncronas inferiores. Para esto, usa un contador de ciclos de una estructura igual a la usada en la práctica anterior. El registro de desplazamiento parametrizable va a actuar como un registro de desplazamiento de entrada en serie o en paralelo a elegir, y salida simultánea en serie y paralelo. Ambos funcionamientos se explican en detalle más adelante.  
  
Esto quiere decir, el registro tomará una entrada de un bit en serie, y una entrada de un vector de tamaño g_N. De acuerdo a los bits de control (s0, s1) se cargará el bit de entrada rotando  
