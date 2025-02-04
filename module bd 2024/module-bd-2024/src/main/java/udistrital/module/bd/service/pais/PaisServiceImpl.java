package udistrital.module.bd.service.pais;

import java.util.List;

import jakarta.persistence.Query;
import org.springframework.stereotype.Service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import lombok.RequiredArgsConstructor;
import udistrital.module.bd.entities.Estado;
import udistrital.module.bd.entities.Pais;

@RequiredArgsConstructor
@Service
public class PaisServiceImpl implements PaisService {

    private final EntityManager manager;

    @Override
    public List<Pais> findAll() {
        String query = "SELECT  * from PAIS";
        Query createQuery = manager.createNativeQuery(query, Pais.class);
        return createQuery.getResultList();
    }

}
