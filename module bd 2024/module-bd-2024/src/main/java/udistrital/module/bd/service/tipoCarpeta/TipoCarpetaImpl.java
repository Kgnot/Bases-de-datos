package udistrital.module.bd.service.tipoCarpeta;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import udistrital.module.bd.entities.TipoCarpeta;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TipoCarpetaImpl implements TipoCarpetaService {

    private final EntityManager manager;

    @Override
    public List<TipoCarpeta> findAll() {
        TypedQuery<TipoCarpeta> query = manager.createQuery(
                "select tp from TipoCarpeta tp",
                TipoCarpeta.class
        );
        return query.getResultList();
    }
}
