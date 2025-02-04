package udistrital.module.bd.dto.entities;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MensajeDTO {
    private String usuario;
    private String idMensaje;
    private String idCarpeta;
    private String nomPais;
    private String idPais;
    private String idMensajePadre; // Nombre más descriptivo
    private String idCategoria;
    private String asunto;
    private String cuerpoMensaje;
    private Timestamp fechaAccion; // Usar LocalDate
    private Timestamp horaAccion;  // Usar LocalTime
//   private List<DestinatarioDTO> destinatarios; // Lista de DestinatarioDTO
    private String destinatario;
    private String idTipoCopia;
    // Apartado del arrayList:
    private List<DestinatarioDTO> listaDestinatariosCO;
    private List<ArchivoDTO> listaArchivos;
}