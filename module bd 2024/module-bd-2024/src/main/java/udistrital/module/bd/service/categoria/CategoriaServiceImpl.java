package udistrital.module.bd.service.categoria;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import udistrital.module.bd.entities.Categoria;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoriaServiceImpl implements CategoriaService {

    private final EntityManager manager;

    @Override
    public List<Categoria> findAll() {
        String query = "SELECT  * from CATEGORIA";
        Query createQuery = manager.createNativeQuery(query,Categoria.class);
        return createQuery.getResultList();
    }
}
