package udistrital.module.bd.service.categoria;

import jakarta.persistence.EntityManager;
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
        TypedQuery<Categoria> query = manager.createQuery("select c from Categoria c", Categoria.class);
        return query.getResultList();
    }
}
