package udistrital.module.bd.entities.serializable;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Data;

@Data
@Embeddable
public class MensajeKey implements Serializable{

    @Column(name = "usuario",length = 5)
    private String idUsuario;
    @Column(name = "idmensaje",length = 5)
    private String idMensaje;
    
}
