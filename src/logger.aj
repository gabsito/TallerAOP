import java.io.File;
import java.io.FileWriter;
import java.util.Calendar;

public aspect logger {
    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    //Aspecto: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    pointcut success() : execution(* money*(..) );
    after() : success() {
    	try {
    		FileWriter writer = new FileWriter(file,true);
    		String mensaje = new String("Tipo de Transacción: " + thisJoinPointStaticPart.getSignature() + " Fecha: " + cal.getTime() + "\n");
    		writer.append(mensaje);
    		System.out.println(mensaje);
			writer.close();
			thisJoinPointStaticPart.getClass();
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Error de escritura");
		}
    	System.out.println("**** Transaccion realizada con exito ****");
    }
    

}

