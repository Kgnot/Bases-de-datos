package udistrital.module.bd.service.mensajeUsuario;


import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import udistrital.module.bd.dto.entities.ArchivoDTO;
import udistrital.module.bd.dto.entities.DestinatarioDTO;
import udistrital.module.bd.dto.entities.MensajeDTO;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.*;


// TODO : Aqui el problema es de los commits, por ahora
@Service
@RequiredArgsConstructor
public class MensajeUsuarioServiceImpl implements MensajeUsuarioService {

    private final EntityManager manager;

    @Override
    public List<MensajeDTO> buscarMensajes(String usuario, String carpeta, String asunto, String categoria, Date fechaDesde, Date fechaHasta) {
        if (usuario.isEmpty())
            return new ArrayList<>();
        StringBuilder queryStr = new StringBuilder(
                "SELECT " +
                        "d.usuario, " + //quien lo mandó
                        "m.idMensaje, " +
                        "m.idTipoCarpeta, " + // antes descCarpeta
                        "p.nomPais, " +
                        "m.idPais, " +
                        "m.Men_idMensaje, " +
                        "m.idCategoria, " + // antes descCategoria
                        "m.asunto, " +
                        "m.cuerpoMensaje, " +
                        "m.fechaAccion," +
                        "m.horaAccion, " +
                        "c.usu_usuario, " + // destinatario
                        "d.idTipoCopia " + // tipo de copia
                        "FROM Mensaje m , " +
                        "Destinatario d, " +
                        "Contacto c ," +
                        "Pais p " + // Aqui debe haber un pedazo donde obtenga todos los enviados con CO.
                        "WHERE m.idMensaje = d.idMensaje " +
                        "AND p.idPais = m.idPais " +
                        "AND d.consecContacto = c.consecContacto " +
                        "AND m.usuario like :usuario ");

        if (carpeta != null)
            queryStr.append("AND m.idTipoCarpeta = :carpeta ");
        if (asunto != null)
            queryStr.append("AND m.asunto = :asunto ");
        if (categoria != null)
            queryStr.append("AND m.idCategoria = :categoria ");
        if (fechaDesde != null)
            queryStr.append("AND m.fechaAccion >= :fechaDesde ");
        if (fechaHasta != null)
            queryStr.append("AND m.fechaAccion <= :fechaHasta ");
        Query query = manager.createNativeQuery(queryStr.toString(), Object.class);
        query.setParameter("usuario", usuario);
        if (carpeta != null) query.setParameter("carpeta", carpeta);
        if (asunto != null) query.setParameter("asunto", asunto);
        if (categoria != null) query.setParameter("categoria", categoria);
        if (fechaDesde != null) query.setParameter("fechaDesde", fechaDesde);
        if (fechaHasta != null) query.setParameter("fechaHasta", fechaHasta);

        List<Object[]> queryPrincipalResult = query.getResultList();
        List<MensajeDTO> returnList = new ArrayList<>();
        for (Object[] fila : queryPrincipalResult) {
            MensajeDTO mensaje = MensajeDTO.builder()
                    .usuario((String) fila[0])
                    .idMensaje((String) fila[1])
                    .idCarpeta((String) fila[2])
                    .nomPais((String) fila[3])
                    .idPais((String) fila[4])
                    .idMensajePadre((String) fila[5])
                    .idCategoria((String) fila[6])
                    .asunto((String) fila[7])
                    .cuerpoMensaje((String) fila[8])
                    .fechaAccion((Timestamp) fila[9])
                    .horaAccion((Timestamp) fila[10])
                    .destinatario((String) fila[11])
                    .idTipoCopia((String) fila[12])
                    .listaDestinatariosCO(
                            buscarDestinatarios((String) fila[1])
                    )
                    .listaArchivos(
                            buscarArchivos((String) fila[1])
                    )
                    .build();
            returnList.add(mensaje);
        }

        return returnList;
    }

    private List<DestinatarioDTO> buscarDestinatarios(String idMensaje) {
        String queryDest =
                "select c.correoContacto as email " +
                        "from Contacto c " +
                        " Join Destinatario d On d.consecContacto = c.consecContacto " +
                        "where d.idMensaje = :idMensaje";

        Query query = manager.createNativeQuery(queryDest, DestinatarioDTO.class);
        query.setParameter("idMensaje", idMensaje);
        return (List<DestinatarioDTO>) query.getResultList();

    }

    private List<ArchivoDTO> buscarArchivos(String idMensaje) {
        String queryArchivo =
                " SELECT a.nomArchivo , a.idTipoArchivo " +
                        "from ARCHIVOADJUNTO a " +
                        "WHERE  a.IDMENSAJE = :idMensaje";

        Query query = manager.createNativeQuery(queryArchivo, ArchivoDTO.class);
        query.setParameter("idMensaje", idMensaje);

        return (List<ArchivoDTO>) query.getResultList();
    }

    @Override
    @Transactional
    public MensajeDTO enviarMensaje(MensajeDTO mensajeDTO) {
        String idMensaje = UUID.randomUUID().toString().substring(0, 5);
        mensajeDTO.setIdMensaje(idMensaje);
        insertarMensaje(mensajeDTO.getUsuario(), mensajeDTO.getIdCarpeta(), mensajeDTO);
        sendDestinatario(mensajeDTO, idMensaje);
        return mensajeDTO;
    }

    protected void sendDestinatario(MensajeDTO mensajeDTO, String mensajeId) {
        String queryDestinatario =
                "INSERT " +
                        "INTO Destinatario (consecdestinatario,idpais,conseccontacto,idtipocopia,usuario,idmensaje)" +
                        " VALUES" +
                        " ((select max(d.consecdestinatario) + 1 from Destinatario d)" +
                        ", :idPais " +
                        ", (select c.conseccontacto " +
                        "   from Contacto c " +
                        "   WHERE lower(c.USU_USUARIO) like :destinatario " +
                        "           and  lower(c.usuario) like :lowerUsuario ) " +
                        ", :tipoCopia " +
                        ", :usuario " +
                        ", :idMensaje )";

        Query query = manager.createNativeQuery(queryDestinatario);

        query.setParameter("idPais", mensajeDTO.getIdPais());
        query.setParameter("destinatario", mensajeDTO.getDestinatario().toLowerCase());
        query.setParameter("lowerUsuario", mensajeDTO.getUsuario().toLowerCase());
        query.setParameter("usuario", mensajeDTO.getUsuario());
        query.setParameter("tipoCopia", mensajeDTO.getIdTipoCopia());
        query.setParameter("idMensaje", mensajeId);

        query.executeUpdate();
        // Despues de eso:
        insertarMensaje(mensajeDTO.getDestinatario(), "rec", mensajeDTO);
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

