package udistrital.module.bd.service.tipoCopia;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import udistrital.module.bd.entities.Estado;
import udistrital.module.bd.entities.TipoCopia;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TipoCopiaServiceImpl implements TipoCopiaService {

    private final EntityManager manager;


    @Override
    public List<TipoCopia> findAll() {
        String query = "SELECT  * from TIPOCOPIA";
        Query createQuery = manager.createNativeQuery(query, TipoCopia.class);
        return createQuery.getResultList();
    }
}
