package udistrital.module.bd.service.tipoArchivo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import udistrital.module.bd.entities.Estado;
import udistrital.module.bd.entities.TipoArchivo;

import java.util.List;


@Service
@RequiredArgsConstructor
public class TipoArchivoServiceImpl implements TipoArchivoService {

    private final EntityManager manager;

    @Override
    public List<TipoArchivo> findAll() {
        String query = "SELECT  * from TIPOARCHIVO";
        Query createQuery = manager.createNativeQuery(query, TipoArchivo.class);
        return createQuery.getResultList();
    }
}
