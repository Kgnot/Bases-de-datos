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
    private String idMensajePadre; // Nombre más descriptivo
    private String idCategoria;
    private String asunto;
    private String cuerpoMensaje;
    private Date fechaAccion; // Usar LocalDate
    private Time horaAccion;  // Usar LocalTime
//   private List<DestinatarioDTO> destinatarios; // Lista de DestinatarioDTO
    private String idUsuario;
    private String idTipoCopia;
}