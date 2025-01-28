package udistrital.module.bd.service.mensajeUsuario;

import udistrital.module.bd.dto.entities.MensajeDTO;

import java.sql.Date;
import java.util.List;

public interface MensajeUsuarioService {
    List<MensajeDTO>buscarMensajes(String usuario,
                                   String carpeta,
                                   String asunto,
                                   String categoria,
                                   Date fechaDesde,
                                   Date fechaHasta);

    MensajeDTO enviarMensaje(MensajeDTO mensajeDTO);

}
