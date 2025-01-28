package udistrital.module.bd.dto.entities;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Time;
import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MensajeDTO {
    private String usuario;
    private String idMensaje;
    private String idCarpeta;
    private String nomPais;
    private String idMensajePadreM;
    private String idCategoria;
    private String asunto;
    private String cuerpoMensaje;
    private Date fechaAccion;
    private Time horaAccion;
    // Apartado para otras cosas
    private String destinatario;

    public MensajeDTO(String usuario,
                      String idMensaje,
                      String idCarpeta,
                      String nomPais,
                      String idMensajePadreM,
                      String idCategoria,
                      String asunto,
                      String cuerpoMensaje,
                      Date fechaAccion,
                      Time horaAccion) {

        this.usuario = usuario;
        this.idMensaje = idMensaje;
        this.idCarpeta = idCarpeta;
        this.nomPais = nomPais;
        this.idMensajePadreM = idMensajePadreM;
        this.idCategoria = idCategoria;
        this.asunto = asunto;
        this.cuerpoMensaje = cuerpoMensaje;
        this.fechaAccion = fechaAccion;
        this.horaAccion = horaAccion;
    }

}
