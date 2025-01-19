package udistrital.module.bd.service.tipoCopia;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import udistrital.module.bd.entities.TipoCopia;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TipoCopiaServiceImpl implements TipoCopiaService {

    private final EntityManager manager;


    @Override
    public List<TipoCopia> findAll() {
        TypedQuery<TipoCopia> query = manager.createQuery("select tc from TipoCopia tc", TipoCopia.class);
        return query.getResultList();
    }
}
