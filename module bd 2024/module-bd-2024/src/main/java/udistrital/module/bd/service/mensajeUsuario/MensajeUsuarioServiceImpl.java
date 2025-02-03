package udistrital.module.bd.service.mensajeUsuario;


import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import udistrital.module.bd.dto.entities.MensajeDTO;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class MensajeUsuarioServiceImpl implements MensajeUsuarioService {

    private final EntityManager manager;

    @Override
    public List<MensajeDTO> buscarMensajes(String usuario, String carpeta, String asunto, String categoria, Date fechaDesde, Date fechaHasta) {
        if (usuario.isEmpty())
            return new ArrayList<>();
        StringBuilder queryStr = new StringBuilder(
                "SELECT m.usuario.usuario, " +
                        "m.id.idMensaje, " +
                        "m.tipoCarpeta.descTipoCarpeta, " + // antes descCarpeta
                        "m.pais.nomPais, " +
                        "m.mensajePadre.id.idMensaje, " +
                        "m.categoria.descCategoria, " + // antes descCategoria
                        "m.asunto, " +
                        "m.cuerpoMensaje, " +
                        "m.fechaAccion," +
                        "m.horaAccion, " +
                        "d.mensaje.id.idUsuario, " +
                        "d.tipoCopia.idTipoCopia " +
                        "FROM Mensaje m , " +
                        "Destinatario d " +
                        "WHERE m.id.idMensaje = d.mensaje.id.idMensaje ");
        queryStr.append("AND m.usuario.usuario = :usuario ");
        if (carpeta != null)
            queryStr.append("AND m.tipoCarpeta.idTipoCarpeta = :carpeta ");
        if (asunto != null)
            queryStr.append("AND m.asunto = :asunto ");
        if (categoria != null)
            queryStr.append("AND m.categoria.idCategoria = :categoria ");
        if (fechaDesde != null)
            queryStr.append("AND m.fechaAccion >= :fechaDesde ");
        if (fechaHasta != null)
            queryStr.append("AND m.fechaAccion <= :fechaHasta ");
        TypedQuery<MensajeDTO> query = manager.createQuery(queryStr.toString(), MensajeDTO.class);
        query.setParameter("usuario", usuario);
        if (carpeta != null) query.setParameter("carpeta", carpeta);
        if (asunto != null) query.setParameter("asunto", asunto);
        if (categoria != null) query.setParameter("categoria", categoria);
        if (fechaDesde != null) query.setParameter("fechaDesde", fechaDesde);
        if (fechaHasta != null) query.setParameter("fechaHasta", fechaHasta);

        return query.getResultList();
    }

    @Override
    @Transactional
    public MensajeDTO enviarMensaje(MensajeDTO mensajeDTO) {
        String idMensaje = UUID.randomUUID().toString().substring(0, 5);
        System.out.println("idMensaje: " + idMensaje);
        mensajeDTO.setIdMensaje(idMensaje);

        insertarMensaje(mensajeDTO.getUsuario(), mensajeDTO.getIdCarpeta(), mensajeDTO);
//        mensajeDTO.getDestinatarios()
//                .forEach(e -> insertarMensaje(e, "env", mensajeDTO));
        insertarMensaje(mensajeDTO.getIdUsuario(), "env", mensajeDTO);
        return mensajeDTO;
    }

    private void insertarMensaje(String usuario, String tipoCarpeta, MensajeDTO mensajeDTO) {
        String sql = "insert into MENSAJE " +
                "(   USUARIO, " +
                "    IDMENSAJE, " +
                "    IDTIPOCARPETA, " +
                "    IDPAIS, " +
                "    MEN_USUARIO, " +
                "    MEN_IDMENSAJE," +
                "    IDCATEGORIA," +
                "    ASUNTO," +
                "    CUERPOMENSAJE," +
                "    FECHAACCION," +
                "    HORAACCION" +
                ") " +
                "VALUES" +
                "(   :usuario, " +
                "    :idMensaje, " +
                "    :idTipoCarpeta, " +
                "    (select u.IDPAIS from USUARIO u where u.USUARIO = :usuario)," +
                "    null , " +
                "    null," +
                "    :idCategoria," +
                "    :asunto," +
                "    :cuerpoMensaje, " +
                "    TRUNC(SYSDATE)," +
                "    TO_DATE(TO_CHAR(SYSDATE, 'HH24:MI:SS'), 'HH24:MI:SS')" +
                ")";

        Query query = manager.createNativeQuery(sql);
        query.setParameter("usuario", usuario);
        query.setParameter("idMensaje", mensajeDTO.getIdMensaje());
        query.setParameter("idTipoCarpeta", tipoCarpeta);
        query.setParameter("idCategoria", mensajeDTO.getIdCategoria());
        query.setParameter("asunto", mensajeDTO.getAsunto());
        query.setParameter("cuerpoMensaje", mensajeDTO.getCuerpoMensaje());

        query.executeUpdate();
    }
}

