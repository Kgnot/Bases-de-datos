package udistrital.module.bd.aspects;


import lombok.RequiredArgsConstructor;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import udistrital.module.bd._PROFILE.Perfil;

@Aspect
@Component
@RequiredArgsConstructor
public class ProfileValidationAspect {

    private final Perfil perfil;


    @Before("@annotation(udistrital.module.bd.annotation.RequiredProfile)")
    public void validateProfile() {
        if (perfil.getUsuario() == null) {
            throw new RuntimeException("Perfil no valido");
        }
    }
}
