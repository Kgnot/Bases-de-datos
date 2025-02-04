package udistrital.module.bd.service.estado;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import udistrital.module.bd.entities.Estado;

import java.util.List;

@Service
@RequiredArgsConstructor
public class EstadoServiceImpl implements EstadoService {

    private final EntityManager manager;

    @Override
    public List<Estado> findAll() {
        String query = "SELECT  * from ESTADO";
        Query createQuery = manager.createNativeQuery(query,Estado.class);
        return createQuery.getResultList();
    }
}
