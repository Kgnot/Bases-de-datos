package udistrital.module.bd.service.tipoCarpeta;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import udistrital.module.bd.entities.Estado;
import udistrital.module.bd.entities.TipoCarpeta;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TipoCarpetaImpl implements TipoCarpetaService {

    private final EntityManager manager;

    @Override
    public List<TipoCarpeta> findAll() {
        String query = "SELECT  * from TIPOCARPETA";
        Query createQuery = manager.createNativeQuery(query, TipoCarpeta.class);
        return createQuery.getResultList();
    }
}
