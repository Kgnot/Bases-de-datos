package udistrital.module.bd.service.tipoArchivo;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import udistrital.module.bd.entities.TipoArchivo;

import java.util.List;


@Service
@RequiredArgsConstructor
public class TipoArchivoServiceImpl implements TipoArchivoService {

    private final EntityManager manager;

    @Override
    public List<TipoArchivo> findAll() {
        TypedQuery<TipoArchivo> query = manager.createQuery(
                "select ta from TipoArchivo ta",
                TipoArchivo.class
        );
        return query.getResultList();
    }
}
