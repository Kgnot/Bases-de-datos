package udistrital.module.bd.launcher;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

import io.github.cdimascio.dotenv.Dotenv;

@SpringBootApplication
@EntityScan("udistrital.module.bd.entities")
public class ModuleBd2024Application {

	public static void main(String[] args) {
		//Antes de correr el programa debemos leer las variables de entorno
		Dotenv dotenv = Dotenv.configure().load();
		
		dotenv.entries().forEach( item -> 
		{
			System.setProperty(item.getKey(),item.getValue());
		});




		SpringApplication.run(ModuleBd2024Application.class, args);
	}

}
