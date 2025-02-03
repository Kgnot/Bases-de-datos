package udistrital.module.bd._PROFILE;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Perfil {
    private String usuario;
    private String nombre;
    private String apellido;
    private String celular;
    private String correoContacto;
    // demas que se me olvidaron:
    private String pais;
    private String estado;

}
