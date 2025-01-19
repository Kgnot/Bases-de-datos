package udistrital.module.bd.service.pais;

import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import lombok.RequiredArgsConstructor;
import udistrital.module.bd.entities.Pais;

@RequiredArgsConstructor
@Service
public class PaisServiceImpl implements PaisService {

    private final EntityManager manager;

    @Override
    public List<Pais> findAll() {
        TypedQuery<Pais> query = manager
                .createQuery(
                        "SELECT p FROM Pais p", // Select * from pais
                        Pais.class);

        return query.getResultList();
    }

}
