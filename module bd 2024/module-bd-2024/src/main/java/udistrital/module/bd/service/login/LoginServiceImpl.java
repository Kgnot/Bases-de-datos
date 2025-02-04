package udistrital.module.bd.service.login;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Query;
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
            Query query =
                    manager.createNativeQuery(
                            "SELECT usu.usuario, usu.nombre, usu.apellido,usu.celular, c.correoContacto, usu.IDPAIS , usu.IDESTADO" +
                                    " FROM Usuario usu, Contacto c" +
                                    " WHERE usu.usuario = :usuario  and " +
                                    " c.USU_USUARIO =c.usuario and" +
                                    " c.usuario = usu.usuario",
                            Perfil.class);
            query.setParameter("usuario", usuario);
            return (Perfil) query.getSingleResult();

        } catch (NoResultException e) {
            return null;
        }
    }
}
