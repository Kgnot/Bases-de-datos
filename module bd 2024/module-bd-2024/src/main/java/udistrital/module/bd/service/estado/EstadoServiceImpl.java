package udistrital.module.bd.service.estado;

import jakarta.persistence.EntityManager;
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

        TypedQuery<Estado> query = manager.
                createQuery("select e from Estado e", Estado.class);


        return query.getResultList();
    }
}
