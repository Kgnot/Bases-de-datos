package udistrital.module.bd.service.login;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import udistrital.module.bd._PROFILE.Perfil;


@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {

    private final EntityManager manager;

    @Override
    public Perfil login(String usuario) {
        try {
            TypedQuery<Perfil> query =
                    manager.createQuery(
                            "SELECT usu.usuario, usu.nombre, usu.apellido,usu.celular, c.correoContacto" +
                                    " FROM Usuario usu, Contacto c" +
                                    " WHERE usu.usuario = :usuario  and " +
                                    " c.principalContact =c.usuario and" +
                                    " c.usuario.usuario = usu.usuario",
                            Perfil.class);
            query.setParameter("usuario", usuario);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
